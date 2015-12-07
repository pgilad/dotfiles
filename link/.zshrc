# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

[[ -f "$HOME/.exports" ]] && source "$HOME/.exports"
[[ ! -d "$CACHE_DIR" ]] && mkdir -p "$CACHE_DIR"

source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/vagrant", from:oh-my-zsh

zplug "plugins/brew", if: "[[ $(uname) =~ ^Darwin ]]", from:oh-my-zsh
zplug "plugins/tmuxinator", if: "[[ -x $(command -v tmuxinator) ]]", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# plugins=(zsh-syntax-highlighting git-extras git vagrant)
if [[ "$(uname)" =~ ^Darwin ]]; then
    source $(brew --prefix nvm)/nvm.sh
fi
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -f "$HOME/.completions" ]] && source "$HOME/.completions"
[[ -f "$HOME/.extra" ]] && source "$HOME/.extra"

[[ -x "$(command -v rbenv)" ]] && eval "$(rbenv init - --no-rehash)"

# Then, source plugins and add commands to $PATH
zplug load --verbose
