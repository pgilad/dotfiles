function show-repo-branch --description 'Show repository branches'
    pushd (pwd)
    cd ~/dev
    set -l master_branches master develop
    for i in */
        cd $i
        set branch (git branch --show-current)
        set repo (string trim -c / $i)
        echo -n "$repo: "
        if contains $branch $master_branches
            set_color green
            echo "$branch"
            set_color normal
        else
            echo "$branch"
        end
        cd ..
    end
    popd
end
