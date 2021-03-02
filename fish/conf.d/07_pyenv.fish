if status --is-interactive
and type --query pyenv
and not set --query VIRTUAL_ENV
    set -gx PYENV_ROOT "$HOME/.pyenv"
    set -gx PATH $PATH "$PYENV_ROOT/bin"
    set -gx PYENV_SHELL fish
    set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

    pyenv init - | source
    pyenv virtualenv-init - | source
end
