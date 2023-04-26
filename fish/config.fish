# Read env secrets (Must be git-ignored)
if test -e "$XDG_CONFIG_HOME/env/env.fish"
    source "$XDG_CONFIG_HOME/env/env.fish"
end

# Try to improve startup time
# starship init fish | source
/opt/homebrew/bin/starship init fish --print-full-init | source
