# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.HPevI2/start-vpn.fish @ line 2
function start-vpn
    if pgrep -x openvpn > /dev/null
        echo "Openvpn already running"
        return
    end

    set WORKDIR "$XDG_CONFIG_HOME/openvpn"

    pushd .
    cd "$WORKDIR"

    echo "Running Openvpn"
    # Make sure we have sudo
    sudo -v
    sudo openvpn --config "$WORKDIR/sgw2.ovpn" \
        --auth-user-pass "$WORKDIR/auth.txt" \
        --up "$WORKDIR/update-resolv-conf.sh" \
        --down "$WORKDIR/update-resolv-conf.sh" \
        --auth-nocache \
        --script-security 2 \
        --daemon
    popd

    sudo killall -HUP mDNSResponder
end
