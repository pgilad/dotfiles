function show-repo-branch --description 'Show repository branches'
    set dev_dir ~/dev
    set trunk_branches master develop

    if not test -d $dev_dir
        echo "Development directory: $dev_dir not found"
        return
    end

    for i in $dev_dir/*/
        set repo (basename $i)
        set full_path "$dev_dir/$repo"

        echo -n "$repo: "

        if not test -d "$full_path/.git"
            echo "Not a git directory"
            continue
        end

        set branch (git -C $full_path branch --show-current)
        if contains $branch $trunk_branches
            set_color green
            echo "$branch"
        else
            set_color red
            echo "$branch"
        end
        set_color normal
    end
end
