function sdk -d "SDKMAN"
    set sdk_init_path "$HOME/.sdkman/bin/sdkman-init.sh"
    if not test -e $sdk_init_path
        return
    end
    bash -c "source $sdk_init_path && sdk $argv"
end
