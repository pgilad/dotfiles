# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

export PATH="/usr/local/sbin:$PATH"
export CACHE_DIR="$HOME/.cache"
export DOTFILES="$HOME/.dotfiles"

# Don't clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently
export EDITOR=vim
export VISUAL=vim

# set the correct term with TMUX
if [[ -n "$TMUX" ]]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

export SSH_KEY_PATH="~/.ssh"
export AWS_CONFIG_FILE="~/.aws/config"
export AWS_DEFAULT_PROFILE="default"
export ANDROID_HOME=/usr/local/opt/android-sdk

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NODE_REPL_HISTORY_FILE=~/.node_history;

export _FASD_DATA="$CACHE_DIR/.fasd" # set fasd data file location
export HISTSIZE=4096
export HISTCONTROL=ignoredups # ignore history duplicate of last command
export HISTFILE="$CACHE_DIR/.zsh_history"
export LESS_TERMCAP_md="${yellow}" # Highlight section titles in manual pages.
export ZPLUG_HOME="$HOME/.zplug"

[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"
[[ -d "$ZPLUG_HOME" ]] || {
    curl -sL git.io/zplug | zsh
    source "$ZPLUG_HOME/zplug"
    zplug update --self
}

fpath=($HOME/.dotfiles/zsh/completions $fpath)

[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init - zsh --no-rehash)"

source "$ZPLUG_HOME/zplug"

# Let zplug manage itself
zplug "b4b4r07/zplug"

zplug "creationix/nvm", from:github, as:plugin, use:nvm.sh
zplug "lib/directories", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $(uname) =~ ^Darwin ]]"
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh,  if:"(( $+commands[git] ))", nice:10
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
# zplug "themes/avit", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "$DOTFILES/zsh/custom/vonder.zsh-theme", from:local, nice:10

zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug check || zplug install
zplug load

autoload -U compinit && compinit

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
