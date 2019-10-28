set -l paths_to_add \
    $HOME/bin \
    /usr/local/sbin \
    /usr/local/opt/openssl/bin \
    /usr/local/opt/ruby/bin \
    $HOME/.poetry/bin \
    $HOME/.nvm/versions/node/v13.0.1/bin \
    $HOME/.sdkman/candidates/*/current/bin

for path_to_add in $paths_to_add
    test -d $path_to_add; and set -gx PATH $path_to_add (string match -v $path_to_add $PATH)
end
