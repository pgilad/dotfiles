function update-asdf --description 'Update various asdf settings and versions'
    set --local global_python 3.11
    set --local global_java temurin-17
    set --local global_node 20

    echo "Updating plugins"
    asdf plugin update --all
    echo

    echo "Removing shims and re-shimming"
    # rm -rf ~/.asdf/shims && asdf reshim
    asdf reshim
    echo

    echo "Installing latest python versions"
    for python_version in 3.9 3.10 3.11 3.12
        asdf install python latest:"$python_version"
    end
    echo

    echo "Setting latest python $global_python as global"
    asdf global python latest:$global_python
    echo

    echo "Installing latest java versions"
    for java_version in 21 17 11
        asdf install java latest:"temurin-$java_version"
    end
    echo

    echo "Setting latest java $global_java global"
    asdf global java latest:$global_java
    echo

    echo "Setting latest node.js $global_node global"
    asdf global nodejs latest:$global_node
    echo

    for program in rust maven groovy scala gradle
        echo "Installing latest $program"
        asdf install $program latest
        echo "Setting $program global version to latest"
        asdf global $program latest
        echo
    end
end
