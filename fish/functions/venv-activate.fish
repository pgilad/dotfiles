function venv-activate --description 'Enable virtualenv'
  set -l python_version (asdf current python | awk '{ print $2 }')
  set -l python_bin (asdf where python)"/bin/python"
  set -l venv_name (basename $PWD | tr . -)"-$python_version"

  if test -d $HOME/.virtualenvs/$venv_name
    echo Activating virtualenv `$venv_name`
    source $HOME/.virtualenvs/$venv_name/bin/activate.fish
  else
    echo Not virtualenv `$venv_name`
  end
end
