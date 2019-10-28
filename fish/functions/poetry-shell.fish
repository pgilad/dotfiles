# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.1Yl3uo/poetry-shell.fish @ line 2
function poetry-shell --description 'Enter poetry virtualenv'
	pushd $PWD
    set -q argv[1]; and cd $argv[1]
    source (dirname (poetry run which python))/activate.fish
    popd
end
