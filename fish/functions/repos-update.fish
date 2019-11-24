function repos-update --description 'Development projects update'
    pushd (pwd)
    if not test -d ~/dev
        echo "Cannot find ~/dev dir"
        return
    end
    cd ~/dev
    for i in */
        echo "Updating $i"
        cd $i
        git pull --quiet --recurse-submodules 2>/dev/null
        cd ..
    end
    popd
end
