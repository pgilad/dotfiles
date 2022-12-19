function update-asdf --description 'Update various asdf settings and versions'
    echo "Updating plugins"
    asdf plugin update --all
    echo

    echo "Removing shims and re-shimming"
    rm -rf ~/.asdf/shims && asdf reshim
    echo

    echo "Installing latest python versions"
    for python_version in 3.9 3.10 3.11
        asdf install python latest:"$python_version"
    end
    echo

    echo "Setting latest python 3.9 as global"
    asdf global python latest:3.9
    echo

    echo "Installing latest java versions"
    for java_version in 19 17 11 8
        asdf install java latest:"temurin-$java_version"
    end
    echo

    echo "Setting latest java 17 global"
    asdf global java latest:temurin-17
    echo

    for program in rust nodejs maven groovy scala gradle
        echo "Installing latest $program"
        asdf install $program latest
        echo "Setting $program global version to latest"
        asdf global $program latest
        echo
    end
end
