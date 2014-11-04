############
#  prefix  #
############
unbind -n C-b
unbind -n C-a
set -g prefix C-a
bind a send-prefix

# Open man page in new window
bind / command-prompt "split-window 'exec man %%'"
bind y run-shell "tmux show-buffer | pbcopy"

# split windows like vim
bind s split-window -v
bind v split-window -h
# vi mode begin selection
bind-key -t vi-copy v begin-selection
# copy selection to osx clipboard
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
# copy till end of line to tmux clipboard
bind-key -t vi-copy Y copy-end-of-line

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind r source-file ~/.tmux.conf

# redisplay ^L
unbind ^L
bind ^L refresh-client
