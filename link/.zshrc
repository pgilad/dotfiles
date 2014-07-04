# Disable sound
setopt NO_BEEP
# glob for dotfiles as well (hidden)
setopt GLOB_DOTS

# set default dir for dotfiles
DOTFILES="$HOME/.dotfiles"

# set dir for oh my zsh
ZSH="$HOME/.oh-my-zsh"

# set dir for zsh custom stuff
ZSH_CUSTOM="$DOTFILES/zsh/custom"

# set oh my zsh theme
ZSH_THEME="vonder"

# set zsh history file to be in .cache
HISTFILE="$HOME/.cache/.zsh_history"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# set oh my zsh plugins
plugins=(git zsh-syntax-highlighting git-extras)

# OS specific settings
if [[ "$(uname)" =~ ^Darwin ]]; then
    export EDITOR=$(which mvim)
    plugins+=brew
else
    export EDITOR=$(which gvim)
fi

# set default editor
export VISUAL="$EDITOR"

# User configuration
export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# ssh
export SSH_KEY_PATH="~/.ssh"

# aws config
export AWS_CONFIG_FILE="~/.aws-config"

### Added by the Heroku Toolbelt
export PATH="$PATH:/usr/local/heroku/bin"

# create cache dir if it doesn't exist
[[ ! -d "$HOME/.cache" ]] && mkdir "$HOME/.cache"

# Source oh my zsh
[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# list all files in directory not alerting about no match
for file in $DOTFILES/source/*(-.N); do
    source $file
done

# list all files in ~/local/*.local
for file in $HOME/local/*.local(-.N); do
    source $file
done
unset file

# Add npm completion
eval "$(npm completion 2> /dev/null)" || echo "Please install NPM."

# grunt completion
eval "$(grunt --completion=zsh 2> /dev/null)" || echo "Please install Grunt Cli: npm i -g grunt-cli"

# gulp completion
eval "$(gulp --completion=zsh 2> /dev/null)" || echo "Please install gulp: npm i -g gulp"

# set fasd data file location
export _FASD_DATA="$HOME/.cache/.fasd"
# Fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install 2> /dev/null)" || echo "Please install fasd"
