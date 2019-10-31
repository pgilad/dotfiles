# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.7jdKyY/daily-update.fish @ line 2
function daily-update --description 'Keep Mac up-to date'
	if not type -q cowsay
        echo "Please install cowsay"
        return 1
    end
	if not type -q lolcat
        echo "Please install lolcat"
        return 1
    end
    __daily-update-echo "Updating OSX"
    sudo softwareupdate --install --all
    __daily-update-echo "Updating Brew"
    brew update; brew upgrade; brew cleanup; brew doctor
    __daily-update-echo "Updating SDK"
    sdk install gradle; and sdk install maven; and sdk install groovy
    __daily-update-echo "Updating Node.js"
    nvm install node
    __daily-update-echo "Updating Fisher"
    fisher; and fisher self-update
end
