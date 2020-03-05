set -l paths_to_add \
    /usr/local/sbin \
    $PIPX_BIN_DIR \
    /usr/local/opt/openssl/bin \
    # /usr/local/opt/ruby/bin \
    $GEM_HOME/bin \
    $HOME/.sdkman/candidates/*/current/bin \
    $GOBIN \
    $CARGOBIN

for path_to_add in $paths_to_add
    test -d $path_to_add; and set -gx PATH $path_to_add (string match -v $path_to_add $PATH)
end
