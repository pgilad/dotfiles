# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

export PATH="/usr/local/sbin:$PATH"
export CACHE_DIR="$HOME/.cache"
export DOTFILES="$HOME/.dotfiles"

fpath=($HOME/.dotfiles/zsh/completions $fpath)

[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

# Don't clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';

export _FASD_DATA="$CACHE_DIR/.fasd" # set fasd data file location
export HISTSIZE=4096
export HISTCONTROL=ignoredups # ignore history duplicate of last command
export HISTFILE="$CACHE_DIR/.zsh_history"
export LESS_TERMCAP_md="${yellow}" # Highlight section titles in manual pages.

export ZSH_CUSTOM="$DOTFILES/zsh/custom"
export ZSH_THEME="vonder"
export DISABLE_AUTO_UPDATE=true
export DISABLE_AUTO_TITLE=true

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

[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init - zsh --no-rehash)"

source "$HOME/.zplug/zplug"
# Let zplug manage itself
zplug "b4b4r07/zplug"

zplug "creationix/nvm", from:github, at:v0.29.0, as:plugin, of:nvm.sh
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $(uname) =~ ^Darwin ]]"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

autoload -U compinit && compinit

[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"
