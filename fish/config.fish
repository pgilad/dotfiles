# Read env secrets (Must be git-ignored)
if test -e "$XDG_CONFIG_HOME/env/env.fish"
    source "$XDG_CONFIG_HOME/env/env.fish"
end

starship init fish | source
