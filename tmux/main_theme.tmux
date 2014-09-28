# ----------------------
# set some pretty colors
# ----------------------
# set pane colors - hilight the active pane
set -g pane-border-fg colour235 #base02
set -g pane-active-border-fg colour240 #base01

# colorize messages in the command line
set -g message-bg black #base02
set -g message-fg brightred #orange

# set color for status bar
set -g status-bg colour235 #base02
set -g status-fg yellow #yellow
set -g status-attr dim

setw -g window-status-current-format "#[fg=colour255, bg=colour24] #I | #W#[fg=yellow]* #[fg=colour24, bg=colour235] "
setw -g window-status-format "#[fg=colour250, bg=colour235] #I|#W "

# show host name and IP address on left side of status bar
set -g status-left-length 70
set -g status-left " #[fg=green]#h | #[fg=brightblue]#(curl icanhazip.com) | #[fg=yellow]#(ifconfig en0 | grep 'inet ' | awk '{print $2}') #(ifconfig en1 | grep 'inet ' | awk '{print \"en1 \" $2}') #[fg=red]#(ifconfig tun0 | grep 'inet ' | awk '{print \"vpn \" $2}') "

# show session name, window & pane number, date and time on right side of
# status bar
set -g status-right-length 60
set -g status-right "#[fg=blue]#S | #I:#P #[fg=yellow] | %a | %d-%M-%Y#[fg=white] | %H:%M "

# Highlight active window
setw -g window-status-current-bg blue
