function update-mise --description 'Update various mise settings and versions'
    set --local global_python 3.11
    set --local global_java temurin-17
    set --local global_node 20

    echo "Updating plugins"
    mise plugins update
    echo

    echo "Refreshing mise"
    mise cache clear
    echo

    echo "Installing latest python versions"
    for python_version in 3.9 3.10 3.11 3.12
        mise install python@latest:"$python_version"
    end
    echo

    echo "Setting latest python $global_python as global"
    mise use -g python@latest:$global_python
    echo

    echo "Installing latest java versions"
    for java_version in 21 17 11
        mise install java@latest:"temurin-$java_version"
    end
    echo

    echo "Setting latest java $global_java global"
    mise use -g java@latest:$global_java
    echo

    echo "Setting latest node.js $global_node global"
    mise use -g node@latest:$global_node
    echo

    for program in rust maven groovy scala gradle
        echo "Installing latest $program"
        mise install $program@latest
        echo "Setting $program global version to latest"
        mise use -g $program@latest
        echo
    end
end
