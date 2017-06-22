export DOTFILES="${HOME}/.dotfiles"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export CACHE_DIR="${HOME}/.cache"

[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"

# history settings
export HISTSIZE=1024
export SAVEHIST=1024
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTFILE="${CACHE_DIR}/.zsh_history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias lsa='ls -lah'
alias ll='ls -lh'

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

# set the correct term with TMUX
if [[ -n "${TMUX}" ]]; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

# language settings
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

setopt append_history
setopt bang_hist                # !keyword
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
setopt no_beep # Disable sound
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt clobber                # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'

unsetopt menu_complete
unsetopt flowcontrol

setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt auto_menu
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

bindkey -e "use emacs key bindings"
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^r' history-incremental-search-backward

# shift-tab : go backward in menu (invert of tab)
bindkey '^[[Z' reverse-menu-complete

zstyle ':zplug:tag' depth 42

if [[ ! -d "${ZPLUG_HOME}" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    # zplug.sh domain has expired
    # curl -sL --proto-redir -all,https https://zplug.sh/installer | zsh
    source "${ZPLUG_HOME}/init.zsh"
    zplug update
else
    source "${ZPLUG_HOME}/init.zsh"
fi

fpath=(${DOTFILES}/zsh/completions $fpath)

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "creationix/nvm", use:nvm.sh
zplug "tj/git-extras", use:"etc/git-extras-completion.zsh", defer:3, if:"[[ $(command -v git) ]]"
zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh", defer:3, if:"[[ $(command -v tmuxinator) ]]"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "djui/alias-tips"
zplug "paulirish/git-open", as:plugin, if:"[[ $(command -v git) ]]"

zplug "mafredri/zsh-async", on:sindresorhus/pure
zplug "sindresorhus/pure", use:pure.zsh, defer:3

zplug check || zplug install
zplug load

if zplug check "creationix/nvm" && [[ $(nvm current) == "system" ]]; then
    echo "Installting nvm latest node.js verion"
    nvm install node
    nvm alias default node
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

if command -v rbenv &> /dev/null; then
    eval "$(rbenv init - zsh --no-rehash)"
fi

[[ -f "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -f "${HOME}/.completions" ]] && source "${HOME}/.completions"
[[ -f "${HOME}/.extra" ]] && source "${HOME}/.extra"

export PATH="$PATH:$HOME/.yarn/bin"
