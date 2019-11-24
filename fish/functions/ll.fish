function ll --description 'List contents of directory using long format' --wraps lsd
    command lsd --all --human-readable --long $argv
end
