# Make sure to always be in a tmux session
if command --search --quiet tmux
and status is-login
and not set --query TMUX
  set -l TMUX_DEFAULT_SESSION_NAME default
  tmux attach-session -t $TMUX_DEFAULT_SESSION_NAME 2>/dev/null
  or tmux new-session -s $TMUX_DEFAULT_SESSION_NAME
end
