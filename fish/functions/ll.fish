function ll --description 'List contents of directory using long format' --wraps exa
    command exa --all --long --icons --group-directories-first --time-style=long-iso $argv
    # command lsd --all --human-readable --long $argv
end
