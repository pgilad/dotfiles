function repos-update --description 'Development projects update'
    pushd (pwd)
    if not test -d ~/dev
        echo "Cannot find ~/dev dir"
        return
    end
    cd ~/dev
    set -l trunk_branches master develop main
    for project in */
        echo "Updating project $project"
        pushd $project
        if not test -d .git
            echo "Not a git directory, skipping"
            popd
            continue
        end
        set -l local_branch (git branch --show-current)
        if ! contains $local_branch $trunk_branches
            echo "Not a $trunk_branches branch"
            popd
            continue
        end
        git update-index --refresh
        if test $status -ne 0
            echo "Repository has unstaged changes"
            popd
            continue
        end

        echo "Running git pull"
        git pull --quiet --recurse-submodules 2>/dev/null
        echo "Trimming dead branches"
        git-trim --no-confirm
        echo "Done"
        popd
    end
    popd
end
