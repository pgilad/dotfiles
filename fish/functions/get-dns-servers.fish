# Defined in /var/folders/0c/_14xdpfn3b9dw81ndwyx9zjm0000gn/T//fish.coyHGw/get-dns-servers.fish @ line 1
function get-dns-servers --description 'Show dns servers for devices'
	networksetup -listallnetworkservices | grep -v denotes | tr '\n' '\0' | xargs -0 -n 1 networksetup -getdnsservers
end
