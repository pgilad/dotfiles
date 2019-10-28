# Defined in /var/folders/l6/_mg_k92s79d880pkdx6b7kxccs_jx_/T//fish.ncslJb/devs.fish @ line 2
function devs -d "Run Webpack Dev Server"
	command npm run dev-server -- --cert=$HOME/.localhost-ssl/private.crt --key=$HOME/.localhost-ssl/private.key
end
