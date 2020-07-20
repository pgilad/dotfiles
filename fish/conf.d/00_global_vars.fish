set -gx EDITOR vim
set -gx VISUAL vim

# Ensure XDG variables are set
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx APPLICATIONS_HISTORY_PATH "$XDG_DATA_HOME/history"

set -gx ANDROID_HOME /usr/local/opt/android-sdk
set -gx GPG_TTY (tty)
set -gx SSH_KEY_PATH "$HOME/.ssh"

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx LIBRARY_PATH "/usr/local/opt/openssl/lib/"

# Yucky brew workaround for building apps
for pkg in openssl curl readline gettext ncurses icu4c sqlite zlib mysql-client tcl-tk
    set -gx CFLAGS "-I/usr/local/opt/$pkg/include" $CFLAGS
    set -gx CPPFLAGS "-I/usr/local/opt/$pkg/include" $CPPFLAGS
    set -gx LD_RUN_PATH "/usr/local/opt/$pkg/lib" $LD_RUN_PATH
    set -gx LDFLAGS "-L/usr/local/opt/$pkg/lib" $LDFLAGS
    set -gx PKG_CONFIG_PATH "/usr/local/opt/$pkg/lib/pkgconfig" $PKG_CONFIG_PATH
end

# Required for tinker builds of pyenv's python
set -gx PYTHON_CONFIGURE_OPTS "--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"
set -gx DYLD_FALLBACK_LIBRARY_PATH /usr/local/opt/openssl/lib

set -gx GREP_COLOR "1;37;45"

set -q JAVA_HOME; or set -gx JAVA_HOME "$HOME/.sdkman/candidates/java/current"
set -q GRADLE_USER_HOME; or set -gx GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"

# Go settings
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx GOROOT "/usr/local/opt/go/libexec"

# Rust - cargo
set -gx CARGOBIN "$HOME/cargo/.bin"

# Pipx
set -gx PIPX_BIN_DIR "$HOME/.local/bin"

set -gx LESSHISTFILE "$APPLICATIONS_HISTORY_PATH/less_history"
set -gx LESSKEY "$XDG_CONFIG_HOME/less/keys"

# A hack for https://github.com/gatsbyjs/gatsby/issues/6654
set -gx GATSBY_CONCURRENT_DOWNLOAD 25

# Poetry uses ~/Library/Caches/pypoetry/virtualenvs for Mac, let's be sane here
# set -gx POETRY_VIRTUALENVS_PATH "$XDG_CACHE_HOME/pypoetry/virtualenvs"

set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/.npmrc"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"

# Opt out of brew analytics
set -gx HOMEBREW_NO_ANALYTICS 1

# Set AWS config file locations:
# https://github.com/aws/aws-cli/issues/243

# set -gx AWS_CREDENTIAL_FILE "$XDG_CONFIG_HOME/aws/credentials"
# set -gx AWS_WEB_IDENTITY_TOKEN_FILE "$XDG_CONFIG_HOME/aws/token"
# The world isn't ready for dotfiles free home dir :(
# https://github.com/boto/boto/issues/3819
set -gx AWS_CLI_HISTORY_FILE "$APPLICATIONS_HISTORY_PATH/aws_history"
set -gx AWS_CONFIG_FILE "$HOME/.aws/config"
set -gx AWS_CREDENTIAL_PROFILES_FILE "$HOME/.aws/credentials" # Version 1.x
set -gx AWS_PROFILE "default"
set -gx AWS_SHARED_CREDENTIALS_FILE "$HOME/.aws/credentials" # Version 2.x

# Python
set -gx PIP_REQUIRE_VIRTUALENV true
set -gx PIP_DEFAULT_TIMEOUT 30
set -gx PIP_CACHE_DIR "$XDG_CACHE_HOME/pip"
set -gx PYENV_ROOT "$HOME/.pyenv"

# Set pass password store location
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"

# GPG Suite doesn't support a different home for gnupg :(
# set -gx GNUPGHOME "$XDG_CONFIG_HOME/gnupg"

# Ruby bundler
set -gx BUNDLE_USER_CACHE "$XDG_CACHE_HOME/bundle"
set -gx BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME/bundle"
set -gx BUNDLE_USER_PLUGIN "$XDG_DATA_HOME/bundle"

# Ruby GEM
set -gx GEM_HOME "$XDG_DATA_HOME/gem"
set -gx GEM_SPEC_CACHE "$XDG_CACHE_HOME/gem"

set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=/usr/local/opt/openssl@1.1"

# Docker - doesn't seem to work yet
# set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# Set iPython and Jupyter paths
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -gx JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"

# Set NVM dir
set -gx NVM_DIR "$XDG_DATA_HOME/nvm"
set -gx NODE_REPL_HISTORY "$APPLICATIONS_HISTORY_PATH/node_repl_history"

# Set Haskell stack dir
set -gx STACK_ROOT "$XDG_DATA_HOME/stack"

# Httpie
set -gx HTTPIE_CONFIG_DIR "$XDG_CONFIG_HOME/httpie"

# Use build enhancement for Docker
set -gx DOCKER_BUILDKIT 1

set -gx REDISCLI_HISTFILE "$APPLICATIONS_HISTORY_PATH/redis_history"
set -gx SQLITE_HISTORY "$APPLICATIONS_HISTORY_PATH/sqlite_history"

set -gx BABEL_CACHE_PATH "$XDG_CACHE_HOME/babel/babel.json"
