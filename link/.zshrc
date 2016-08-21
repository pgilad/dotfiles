setopt no_beep # Disable sound
setopt glob_dots # glob for dotfiles as well (hidden)
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups
setopt extended_history
setopt hist_ignore_space

export DOTFILES="$HOME/.dotfiles"
export PATH="/usr/local/sbin:$PATH"
export CACHE_DIR="$HOME/.cache"
[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# set fasd cache dir
export _FASD_DATA="$CACHE_DIR/.fasd" # set fasd data file location
export ZPLUG_HOME="$HOME/.zplug"
export NODE_REPL_HISTORY_FILE="$HOME/.node_history"

export MANPAGER='less -X'; # Don't clear the screen after quitting a manual page.
export LESS_TERMCAP_md="${yellow}" # Highlight section titles in manual pages.

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently
export EDITOR=vim
export VISUAL=vim

export SSH_KEY_PATH="$HOME/.ssh"
export AWS_CONFIG_FILE="$HOME/.aws/config"
export AWS_DEFAULT_PROFILE="default"
export ANDROID_HOME=/usr/local/opt/android-sdk

# history settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTCONTROL=ignoredups
export HISTFILE="$CACHE_DIR/.zsh_history"

# set the correct term with TMUX
if [[ -n "$TMUX" ]]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

# language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[[ -d "$ZPLUG_HOME" ]] || {
    curl -sL git.io/zplug | zsh
    source "$ZPLUG_HOME/zplug"
    zplug update --self
}

fpath=($HOME/.dotfiles/zsh/completions $fpath)

source "$ZPLUG_HOME/zplug"

zplug "zplug/zplug"
# Don't forget to run `nvm install node && nvm alias default node`
zplug "creationix/nvm", from:github, as:plugin, use:nvm.sh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $(uname) =~ ^Darwin ]]"
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))", nice:10
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "$DOTFILES/zsh/custom/vonder.zsh-theme", from:local, nice:10

zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug check || zplug install
zplug load

if zplug check "creationix/nvm" && [[ $(nvm current) == "none" ]]; then
    nvm install node
    nvm alias default node
fi

autoload -U compinit && compinit

[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init - zsh --no-rehash)"
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
