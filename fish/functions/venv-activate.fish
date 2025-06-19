function venv-activate --argument-names venv_base_name --description 'Enable virtualenv'
  set -l python_version (mise current python)
  set -l python_bin (mise where python)"/bin/python"

  if not test -n "$venv_base_name"
    set venv_base_name (basename $PWD | tr . -)
  end

  set -l venv_name "$venv_base_name"-"$python_version"

  if test -d $HOME/.virtualenvs/$venv_name
    echo Activating virtualenv `$venv_name`
    source $HOME/.virtualenvs/$venv_name/bin/activate.fish
  else
    echo Not a virtualenv `$venv_name`
  end
end
