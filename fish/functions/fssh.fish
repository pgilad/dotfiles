function fssh --description 'Forter SSH shortcut' --argument-names target_connection
    set -l connection $target_connection
    if not string match -q "*@*" -- $connection
        set connection "gilad.peleg@$connection"
    end
    command ssh -F ~/.ssh/gozer-new $connection
end
