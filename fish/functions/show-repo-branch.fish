function show-repo-branch --description 'Show repository branches'
    set dev_dir ~/code/forter
    set trunk_branches master develop main

    if not test -d $dev_dir
        echo "Development directory: $dev_dir not found"
        return
    end

    for i in $dev_dir/*/
        set repo (basename $i)
        set full_path "$dev_dir/$repo"

        if not test -d "$full_path/.git"
            # Not a git directory. Skipping
            continue
        end

        echo -n "$repo: "

        set branch (git -C $full_path branch --show-current)
        if contains $branch $trunk_branches
            set_color green
            echo -n "$branch"
        else
            set_color red
            echo -n "$branch"
        end
        set_color normal
        if git -C $full_path diff --quiet
            echo ""
        else
            # dirty
            set_color blue
            echo " [*]"
        end
        set_color normal
    end
end
