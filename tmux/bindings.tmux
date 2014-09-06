# Open man page in new window
bind / command-prompt "split-window 'exec man %%'"
bind y run-shell "tmux show-buffer | xclip -sel clip -i" \; display-message "Copied tmux buffer to system clipboard"

# split windows like vim
# vim's definition of a horizontal/vertical split is reversed from tmux's
bind s split-window -v
bind v split-window -h

bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy y copy-pipe 'xclip -in -selection clipboard'
# move x clipboard into tmux paste buffer
bind C-p run "tmux set-buffer \"$(/usr/bin/xclip -sel clip -o)\"; tmux paste-buffer"
# move tmux copy buffer into x clipboard
bind C-y run "tmux show-buffer | /usr/bin/xclip -sel clip -i"
# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -n C-Left select-pane -L
bind -n C-Up select-pane -U
bind -n C-Down select-pane -D
bind -n C-Right select-pane -R

# url view
bind-key u capture-pane \; save-buffer /tmp/tmux-buffer \; run-shell "$TERMINAL -e 'cat /tmp/tmux-buffer | urlview'"
