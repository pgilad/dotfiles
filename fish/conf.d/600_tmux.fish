# Make sure I'm always inside a tmux session
if status --is-login
  test -z "$TMUX"; and tmux attach -t default || tmux new -s default
end
