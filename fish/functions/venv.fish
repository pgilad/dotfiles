function venv --argument-names python_version venv_base_name --description 'Create virtualenv named the same as current directory'
  set -l python_bin

  if not test -n "$python_version"
    # Use default python version set by asdf
    set python_version (asdf current python | awk '{ print $2 }')
  end
  echo "Using python version of $python_version"

  if not test -n "$venv_base_name"
    set venv_base_name (basename $PWD | tr . -)
  end
  echo "Using venv base name of $venv_base_name"

  set python_bin (asdf where python)"/bin/python"
  if not test -e $python_bin
    echo "Python version `$python_version` is not installed."
    return 1
  end

  set -l venv_name "$venv_base_name"-"$python_version"

  echo Creating virtualenv `$venv_name`
  $python_bin -m venv $HOME/.virtualenvs/$venv_name
  source $HOME/.virtualenvs/$venv_name/bin/activate.fish

  asdf local python $venv_name
end
