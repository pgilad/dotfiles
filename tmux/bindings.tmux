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
bind-key -T copy-mode-vi v send-keys -X begin-selection
# copy selection to osx clipboard
bind-key -T copy-mode-vi v send-keys -X copy-pipe "reattach-to-user-namespace pbcopy"
# copy till end of line to tmux clipboard
bind-key -T copy-mode-vi v send-keys -X copy-end-of-line

# hjkl pane traversal
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind r source-file ~/.tmux.conf

# redisplay ^L
unbind ^L
bind ^L refresh-client

unbind-key -T copy-mode-vi Space     ;   bind-key -T copy-mode-vi v send-keys -X begin-selection
unbind-key -T copy-mode-vi Enter     ;   bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
unbind-key -T copy-mode-vi C-v       ;   bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
unbind-key -T copy-mode-vi [         ;   bind-key -T copy-mode-vi [ send-keys -X begin-selection
unbind-key -T copy-mode-vi ]         ;   bind-key -T copy-mode-vi ] send-keys -X copy-selection
