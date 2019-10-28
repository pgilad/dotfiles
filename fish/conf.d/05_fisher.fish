# make sure fisher is installed
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
    fish -c fisher
end
