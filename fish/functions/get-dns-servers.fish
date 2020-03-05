function get-dns-servers --description 'Show dns servers for devices'
    networksetup -listallnetworkservices | grep -v denotes | tr '\n' '\0' | xargs -0 -n 1 networksetup -getdnsservers
end
