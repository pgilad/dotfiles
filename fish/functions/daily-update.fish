# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.vrZaNX/daily-update.fish @ line 2
function daily-update --description 'Keep Mac up-to date'
    sudo softwareupdate --install --all
    echo "Updating Brew"
    brew update; brew upgrade; brew cleanup; brew doctor
    echo "Updating SDK"
    sdk install gradle && sdk install maven && sdk install groovy
    echo "Updating Node.js"
    nvm install node
    echo "Updating Fisher"
    fisher && fisher self-update
end
