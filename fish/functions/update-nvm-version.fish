function update-nvm-version
    pushd "$NVM_DIR"
    git fetch --tags origin
    git checkout (git describe --abbrev=0 --tags --match "v[0-9]*" (git rev-list --tags --max-count=1))
    popd
end
