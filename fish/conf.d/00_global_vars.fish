set -gx EDITOR vim
set -gx VISUAL vim
set -gx SHELL /opt/homebrew/bin/fish

# Ensure XDG variables are set
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx APPLICATIONS_HISTORY_PATH "$XDG_DATA_HOME/history"

# Much faster than brew --prefix which depends on Ruby slow start time
set -gx BREW_PREFIX /opt/homebrew/opt

set -gx GPG_TTY (tty)
set -gx SSH_KEY_PATH "$HOME/.ssh"

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx OPENSSL_PATH "$BREW_PREFIX/openssl@3"

set -gx PAGER bat
set -gx LIBRARY_PATH "$OPENSSL_PATH/lib/"

# Yucky brew workaround for building apps
# for pkg in openssl curl readline gettext ncurses icu4c sqlite zlib mysql-client tcl-tk libxml2
    # set -gx CFLAGS "-I/usr/local/opt/$pkg/include" $CFLAGS
    # set -gx CPPFLAGS "-I/usr/local/opt/$pkg/include" $CPPFLAGS
    # set -gx LD_RUN_PATH "/usr/local/opt/$pkg/lib" $LD_RUN_PATH
    # set -gx LDFLAGS "-L/usr/local/opt/$pkg/lib" $LDFLAGS
    # set -gx PKG_CONFIG_PATH "/usr/local/opt/$pkg/lib/pkgconfig" $PKG_CONFIG_PATH
# end

# Required for tinker builds of pyenv's python
# set -gx PYTHON_CONFIGURE_OPTS "--with-tcltk-includes='-I$BREW_PREFIX/tcl-tk/include' --with-tcltk-libs='-L$BREW_PREFIX/tcl-tk/lib -ltcl8.6 -ltk8.6'"
# set -gx DYLD_FALLBACK_LIBRARY_PATH "$OPENSSL_PATH/lib"

set -gx GREP_COLOR "1;37;45"

# set -q JAVA_HOME; or set -gx JAVA_HOME "/Users/giladpeleg/.asdf/installs/java/adoptopenjdk-11.0.11+9"
set -q GRADLE_USER_HOME; or set -gx GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"

# Go settings
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx GOROOT "$BREW_PREFIX/go/libexec"

# Rust - cargo
set -gx CARGOBIN "$HOME/cargo/.bin"

set -gx LESSHISTFILE "$APPLICATIONS_HISTORY_PATH/less_history"
set -gx LESSKEY "$XDG_CONFIG_HOME/less/keys"

# A hack for https://github.com/gatsbyjs/gatsby/issues/6654
set -gx GATSBY_CONCURRENT_DOWNLOAD 25

set -gx POETRY_VIRTUALENVS_PATH "$HOME/.virtualenvs"

set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/.npmrc"
set -gx NPM_CONFIG_CACHE "$XDG_CACHE_HOME/npm"

# Opt out of brew analytics
set -gx HOMEBREW_NO_ANALYTICS 1

# Python
set -gx PIP_REQUIRE_VIRTUALENV true
set -gx PIP_DEFAULT_TIMEOUT 30
set -gx PIP_CACHE_DIR "$XDG_CACHE_HOME/pip"

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

set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_PATH --with-readline-dir=$BREW_PREFIX/readline --with-libyaml-dir=$BREW_PREFIX/libyaml"
# set -gx SDKROOT (xcrun --show-sdk-path)

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

set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"

set -gx PIPX_BIN_DIR "$HOME/.local/bin"
set -gx PATH $PATH $PIPX_BIN_DIR

# Clojure lein
set -gx LEIN_JVM_OPTS "-XX:+TieredCompilation -XX:TieredStopAtLevel=2"

set -gx ASDF_CONFIG_FILE "$XDG_CONFIG_HOME/asdf/.asdfrc"


fish_add_path --path \
    /usr/local/sbin \
    $PIPX_BIN_DIR \
    $OPENSSL_PATH/bin \
    $BREW_PREFIX/mysql@5.7/bin \
    $GEM_HOME/bin \
    $BREW_PREFIX/tcl-tk/bin \
    $GOBIN \
    $CARGOBIN
