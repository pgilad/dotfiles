function fssh --description 'Forter SSH shortcut' --argument-names target_ip username --wraps ssh
    if test -z "$username"
        set username "gilad.peleg"
    end
    command ssh -F ~/.ssh/gozer-new "$username@$target_ip"
end
