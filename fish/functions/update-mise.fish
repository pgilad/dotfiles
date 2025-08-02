function update-mise --description 'Update various mise settings and versions'
    set --local global_python 3.12
    set --local global_java temurin-21
    set --local global_node 24

    echo "Updating plugins"
    mise plugins update
    echo

    echo "Refreshing mise"
    mise cache clear
    echo

    echo "Installing latest python versions"
    for python_version in 3.12 3.13
        mise install "python@$python_version"
    end
    echo

    echo "Setting latest python $global_python as global"
    mise use -g "python@$global_python"
    echo

    echo "Installing latest java versions"
    for java_version in 21 17 11
        mise install "java@temurin-$java_version"
    end
    echo

    echo "Setting latest java $global_java global"
    mise use -g java@$global_java
    echo

    echo "Setting latest node.js $global_node global"
    mise use -g "node@$global_node"
    echo

    for program in rust maven groovy scala gradle
        echo "Installing latest $program"
        mise install $program@latest
        echo "Setting $program global version to latest"
        mise use -g $program@latest
        echo
    end
end
