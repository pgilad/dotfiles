# Make sure to always be in a tmux session
if command --search --query tmux
and status is-login
and not set --query TMUX
and test $TERM_PROGRAM = "Alacritty"
  # Create a new tmux session named default or join existing one
  # Only set tmux to work on Alacritty
  tmux new-session -A -s default
end
