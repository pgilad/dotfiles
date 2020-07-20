# Make sure to always be in a tmux session
if command --search --quiet tmux
and status is-login
and not set --query TMUX
  # Create a new tmux session named default or join existing one
  tmux new-session -A -s default
end
