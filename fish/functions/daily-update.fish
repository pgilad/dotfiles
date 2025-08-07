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
        echo
        cowsay $argv[1] | lolcat
        echo
    end

    echo "Starting daily update routine 😄"

    __echo-phase "Updating osx"
    softwareupdate --install --all

    __echo-phase "Updating brew"
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
    brew update-reset
    brew doctor

    __echo-phase "Updating fish completions"
    fish_update_completions

    __echo-phase "Updating Mise"
    pushd $(pwd)
    cd ~
    mise upgrade
    mise plugins update
    mise doctor
    popd

    echo "Finished daily update routine 😄"
end
