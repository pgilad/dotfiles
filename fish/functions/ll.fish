function ll --description 'List contents of directory using long format' --wraps eza
    command eza --all --long --icons --group-directories-first --time-style=long-iso --octal-permissions $argv
    # command lsd --all --human-readable --long $argv
end
