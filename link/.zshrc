setopt glob_dots # glob for dotfiles as well (hidden)
setopt no_beep # Disable sound

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

unsetopt menu_complete
unsetopt flowcontrol

setopt always_to_end
setopt auto_menu
setopt complete_in_word

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

bindkey '^r' history-incremental-search-backward

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias lsa='ls -lah'
alias ll='ls -lh'

export DOTFILES="${HOME}/.dotfiles"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export CACHE_DIR="${HOME}/.cache"
[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"

# set fasd cache dir
export _FASD_DATA="${CACHE_DIR}/.fasd" # set fasd data file location
export ZPLUG_HOME="${HOME}/.zplug"
export NODE_REPL_HISTORY_FILE="${HOME}/.node_history"

export MANPAGER='less -X'; # Don't clear the screen after quitting a manual page.
export LESS_TERMCAP_md="${yellow}" # Highlight section titles in manual pages.

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently
export EDITOR=vim
export VISUAL=vim

export SSH_KEY_PATH="${HOME}/.ssh"
export AWS_CONFIG_FILE="${HOME}/.aws/config"
export AWS_DEFAULT_PROFILE="default"
export ANDROID_HOME=/usr/local/opt/android-sdk

# history settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTFILE="${CACHE_DIR}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# set the correct term with TMUX
if [[ -n "${TMUX}" ]]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

# language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

zstyle ':zplug:tag' depth 42

if [[ ! -d "${ZPLUG_HOME}" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://zplug.sh/installer | zsh
    source "${ZPLUG_HOME}/init.zsh"
    zplug update
else
    source "${ZPLUG_HOME}/init.zsh"
fi

fpath=(${DOTFILES}/zsh/completions $fpath)

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "creationix/nvm", use:nvm.sh
zplug "tj/git-extras", use:"etc/git-extras-completion.zsh", defer:3
zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh", defer:3, if:"[[ command -v tmuxinator ]]"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mafredri/zsh-async", on:sindresorhus/pure
zplug "sindresorhus/pure", use:pure.zsh, defer:3

zplug check || zplug install
zplug load

if zplug check "creationix/nvm" && [[ $(nvm current) == "none" ]]; then
    nvm install node
    nvm alias default node
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

if which rbenv &> /dev/null; then
    eval "$(rbenv init - zsh --no-rehash)"
fi

[[ -f "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -f "${HOME}/.completions" ]] && source "${HOME}/.completions"
[[ -f "${HOME}/.extra" ]] && source "${HOME}/.extra"

export PATH="$PATH:$HOME/.yarn/bin"
