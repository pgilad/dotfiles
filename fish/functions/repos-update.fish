function repos-update --description 'Development projects update'
    pushd (pwd)
    if not test -d ~/dev
        echo "Cannot find ~/dev dir\n"
        return
    end
    cd ~/dev
    for project in */
        echo "Updating project $project"
        pushd $project
        if not test -d .git
            echo "Not a git directory, skipping\n"
            popd
            continue
        end
        echo "Running git pull\n"
        git pull --quiet --recurse-submodules 2>/dev/null
        echo "Trimming dead branches\n"
        git-trim --no-confirm
        echo "Done\n"
        popd
    end
    popd
end
