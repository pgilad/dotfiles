function daily-update --description 'Keep everything up to date'
    if not type -q cowsay
        echo "Please install cowsay"
        return 1
    end
    if not type -q lolcat
        echo "Please install lolcat"
        return 1
    end

    function __echo-phase
        cowsay $argv[1] | lolcat
    end

    echo "Starting daily update routine 😄"

    __echo-phase "Updating OSX"
    sudo softwareupdate --install --all

    __echo-phase "Updating Brew"
    brew update; brew upgrade; brew cleanup; brew update-reset; brew doctor

    __echo-phase "Updating SDK"
    sdk install gradle < /dev/null
    sdk install maven < /dev/null
    sdk install groovy < /dev/null

    __echo-phase "Updating Node.js"
    nvm install node

    __echo-phase "Updating Fisher"
    fisher; fisher self-update

    __echo-phase "Making sure Brewfile is up-to-date"
    brew bundle check --verbose --file="$XDG_CONFIG_HOME/brew/Brewfile"

    __echo-phase "Updating Fish Completions"
    fish_update_completions

    __echo-phase "Updating projects"
    repos-update

    __echo-phase "Install dotfiles"
    install-dotfiles

    echo "Finished daily update routine 😄"
end
