function gptc --description 'Git pull, trim and cleanup'
    set main_branch (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
    echo "Detected that primary trunk branch is $main_branch"
    git checkout $main_branch
    git pull
    git trim --no-confirm --protected 'develop,master,main,prod'
    git gc --prune=now
end
