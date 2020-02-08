# Pyenv
if status --is-interactive; and type --quiet pyenv; and not set --query VIRTUAL_ENV
    source (pyenv init - | psub)
    source (pyenv virtualenv-init - | psub)
end
