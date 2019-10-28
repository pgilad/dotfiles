set -gx EDITOR vim
set -gx VISUAL vim

# Ensure XDG variables are set
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx ANDROID_HOME /usr/local/opt/android-sdk
set -gx GPG_TTY (tty)
set -gx SSH_KEY_PATH "$HOME/.ssh"

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Set openssl paths for compiles and pkg-config
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"

# AWS settings
set -gx AWS_CONFIG_FILE "$HOME/.aws/config"
set -gx AWS_PROFILE "default"

set -gx GREP_COLOR "1;37;45"

set -q JAVA_HOME; or set -gx JAVA_HOME "$HOME/.sdkman/candidates/java/current"

# Go settings
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx GOROOT "/usr/local/opt/go/libexec"

set -gx LESSHISTFILE "$XDG_CONFIG_HOME/less/history"
set -gx LESSKEY "$XDG_CONFIG_HOME/less/keys"

# A hack for https://github.com/gatsbyjs/gatsby/issues/6654
set -gx GATSBY_CONCURRENT_DOWNLOAD 25

# Poetry uses ~/Library/Caches/pypoetry/virtualenvs for Mac, let's be sane here
set -gx POETRY_VIRTUALENVS_PATH "$XDG_CACHE_HOME/pypoetry/virtualenvs"
