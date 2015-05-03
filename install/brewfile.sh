#!/bin/bash

export PATH="/usr/local/bin:$PATH"

TAPS=(
    'caskroom/cask'
    'caskroom/versions'
    'homebrew/dupes'
    'homebrew/versions'
)

FORMULAS=(
    'ack'
    'autoconf'
    'automake'
    'awscli'
    'bash'
    'gpg'
    'bash-completion'
    'boot2docker'
    'brew-cask'
    'cheat'
    'coreutils'
    'ctags'
    'curl'
    'docker'
    'fasd'
    'findutils'
    'freetype'
    'gettext'
    'git'
    'git-extras'
    'git-flow'
    'gzip'
    'htop-osx'
    'hub'
    'irssi'
    'jq'
    'lesspipe'
    'lua'
    'luajit'
    'man2html'
    'maven'
    'md5sha1sum'
    'mongodb'
    'moreutils'
    'mysql'
    'nettle'
    'node'
    'objective-caml'
    'openssl'
    'pcre'
    'pkg-config'
    'python'
    'rbenv'
    'redis'
    'rename'
    'ruby'
    'ruby-build'
    'ssh-copy-id'
    'the_silver_searcher'
    'tidy'
    'tmux'
    'tree'
    'unrar'
    'unzip'
    'urlview'
    'watch'
    'webkit2png'
    'webp'
    'zlib'
    'zsh'
    'homebrew/dupes/grep'
    'gnu-sed --default-names'
    'imagemagick --with-webp'
    'reattach-to-user-namespace --wrap-pbcopy-pbpaste'
    'wget --enable-iri'
    'vim --with-lua --with-luajit'
    'weechat --with-python --with-perl --with-ruby --with-lua'
)

# "macvim --with-cscope --with-lua --custom-icons --with-luajit --override-system-vim"
# 'php56'
# 'jmeter'
# 'phpmd'

CASKS=(
    betterzipql
    chromium
    dropbox
    evernote
    firefox
    firefoxdeveloperedition
    gimp
    google-chrome
    google-chrome-canary
    hipchat
    imagealpha
    imageoptim
    iterm2
    java
    karabiner
    kismac
    lightpaper
    mou
    opera
    qlcolorcode
    qlmarkdown
    quicklook-csv
    quicklook-json
    seil
    sequel-pro
    silverlight
    sizeup
    skype
    sublime-text
    the-unarchiver
    torbrowser
    transmission
    vagrant
    vagrant-manager
    vienna
    virtualbox
    vlc
    xquartz
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
    brew update

    iStep "running brew upgrade"
    brew upgrade --all

    iStep "installing brew formulas"
    install_brewfiles
    iStep "installing brew cask apps"
    install_caskfiles

    iStep "Running brew cleanup"
    brew cleanup
    brew cask cleanup
    brew prune
    brew linkapps
    brew tap --repair

    iStep "Brew doctor"
    brew doctor
}

main
