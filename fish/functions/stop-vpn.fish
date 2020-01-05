function stop-vpn
    sudo pkill openvpn
    sudo killall -HUP mDNSResponder
    env script_type=down dev=0 $XDG_CONFIG_HOME/openvpn/update-resolv-conf.sh
    sudo killall -HUP mDNSResponder
end
