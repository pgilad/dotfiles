function fssh --description 'Forter SSH shortcut' --argument-names target_ip --wraps ssh
    command ssh -F ~/.ssh/gozer-new "gilad.peleg@$target_ip"
end
