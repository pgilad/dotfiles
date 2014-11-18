#!/bin/bash

PATH="/usr/local/bin:$PATH"

TAPS=(
    'caskroom/cask'
    'caskroom/versions'
    'homebrew/dupes'
    'homebrew/versions'
)

FORMULAS=(
    'ack'
    'ag'
    'autoconf'
    'automake'
    'bash'
    'bash-completion'
    'brew-cask'
    'cloc'
    'cmake'
    'coreutils'
    'ctags'
    'curl'
    'fasd'
    'findutils'
    'fping'
    'git'
    'git-extras'
    'git-flow'
    'gzip'
    'homebrew/dupes/grep'
    'hping'
    'htop-osx'
    'hub'
    'id3tool'
    'irssi'
    'jmeter'
    'jq'
    'lesspipe'
    'lua'
    'luajit'
    'man2html'
    'maven'
    'md5sha1sum'
    'mongo'
    'moreutils'
    'msmtp'
    'mysql'
    'ncurses'
    'nkf'
    'nmap'
    'node'
    'openssl'
    'python'
    'readline'
    'redis'
    'rename'
    'rbenv'
    'ruby-build'
    'sl'
    'ssh-copy-id'
    'tmux'
    'tree'
    'unzip'
    'watch'
    'webkit2png'
    'zsh'
    'docker'
    'boot2docker'
    'gnu-sed --default-names'
    'imagemagick --with-webp'
    'reattach-to-user-namespace --wrap-pbcopy-pbpaste'
    'wget --enable-iri'
    'vim --with-lua --with-luajit'
    'weechat --with-python --with-perl --with-ruby --with-lua'
)

# "macvim --with-cscope --with-lua --custom-icons --with-luajit --override-system-vim"

CASKS=(
    alfred
    dropbox
    evernote
    firefox
    cheatsheet
    google-chrome
    google-chrome-canary
    hipchat
    imagealpha
    imageoptim
    iterm2
    karabiner
    mou
    onyx
    opera
    silverlight
    skype
    the-unarchiver
    transmission
    vagrant
    virtualbox
    vlc
)

function install_brewfiles() {
    local tap
    local formula
    for tap in "${TAPS[@]}"; do
        brew tap $tap
    done

    # apply ugly hack because it doesn't work for me otherwise
    for formula in "${FORMULAS[@]}"; do
        package=$(echo $formula | cut -d ' ' -f 1)
        if ! brew list $package &> /dev/null; then
            params=$(echo $formula | cut -s -d ' ' -f 2-)
            brew install $package $params
        fi
    done
}

function install_caskfiles() {
    local cask
    for cask in "${CASKS[@]}"; do
        echo "installing cask $cask"
        brew cask install $cask 2> /dev/null
    done
}

function main() {
    iStep "running brew update"
    # brew update
    iStep "running brew upgrade"
    # brew upgrade

    iStep "installing brew formulas"
    install_brewfiles
    iStep "installing brew cask apps"
    # install_caskfiles

    iStep "Running brew cleanup"
    # brew cleanup
    # brew cask cleanup
    # brew cask alfred link
    # brew prune
    # brew linkapps
    # brew tap --repair
    iStep "Brew doctor"
    # brew doctor
}

main
