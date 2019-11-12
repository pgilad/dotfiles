function repos-update --description 'Development projects update'
    echo "Starting development repos update"
    pushd (pwd)
    cd ~/dev
    for i in */
        echo "Updating $i"
        cd $i
        git pull --quiet --recurse-submodules 2>/dev/null
        cd ..
    end
    popd
    echo "😄"
end
