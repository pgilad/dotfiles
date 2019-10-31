# Defined in /Users/giladpeleg/.config/fish/functions/daily-update.fish @ line 2
function daily-update --description 'Keep Mac up-to date'
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
    __echo-phase "Updating OSX"
    sudo softwareupdate --install --all
    __echo-phase "Updating Brew"
    brew update; brew upgrade; brew cleanup; brew doctor
    __echo-phase "Updating SDK"
    sdk install gradle; and sdk install maven; and sdk install groovy
    __echo-phase "Updating Node.js"
    nvm install node
    __echo-phase "Updating Fisher"
    fisher; and fisher self-update
end
