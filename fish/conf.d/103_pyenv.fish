# Pyenv
if status --is-interactive; and type -q pyenv
    source (pyenv init - | psub)
    source (pyenv virtualenv-init - | psub)
end
