# Make sure to always be in a tmux session
if command --search --query tmux
    and status is-login
    and not set --query TMUX
    and string match -r "Alacritty|ghostty" $TERM_PROGRAM
    # Create a new tmux session named default or join existing one
        tmux new-session -A -s default
end
