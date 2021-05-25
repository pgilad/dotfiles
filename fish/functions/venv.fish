function venv --argument-names 'python_version' --description 'Create virtualenv named the same as current directory'
  set -l python_bin

  if not test -n "$python_version"
    # Use default python version set by asdf
    set python_version (asdf current python | awk '{ print $2 }')
  end

  set python_bin (asdf where python)"/bin/python"
  set -l venv_name (basename $PWD | tr . -)"-$python_version"

  if not test -e $python_bin
    echo "Python version `$python_version` is not installed."
    return 1
  end

  echo Creating virtualenv `$venv_name`
  $python_bin -m venv $HOME/.virtualenvs/$venv_name
  source $HOME/.virtualenvs/$venv_name/bin/activate.fish
end
