function repos-update --description 'Development projects update'
    pushd (pwd)
    cd ~/dev
    for i in */
        echo "Updating $i"
        cd $i
        git pull --quiet --recurse-submodules 2>/dev/null
        cd ..
    end
    popd
end
