# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.aG4vvM/daily-update.fish @ line 2
function daily-update --description 'Keep Mac up-to date'
	cowsay "Updating OSX"
    sudo softwareupdate --install --all
    cowsay "Updating Brew"
    brew update; brew upgrade; brew cleanup; brew doctor
    cowsay "Updating SDK"
    sdk install gradle; and sdk install maven; and sdk install groovy
    cowsay "Updating Node.js"
    nvm install node
    cowsay "Updating Fisher"
    fisher; and fisher self-update
end
