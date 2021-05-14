function setup-pyenv-virtualenv
    if not type -q pyenv
        echo "Please install pyenv"
        return 1
    end

    if not type -q pyenv-virtualenv
        echo "Please install pyenv-virtualenv"
        return 1
    end

    set -l venv_version $argv[1]
    set -l local_dir (basename (pwd))
    if test -z "$local_dir"
        echo "Could not detect dir name"
        return 1
    end

    set -l venv_name "$local_dir"-"$venv_version"
    echo "Setting up virtualenv $venv_name"

    if pyenv versions --bare | grep -q "$venv_name"
        echo "Virtualenv is already setup in pyenv, quitting.."
        return 1
    end

    command pyenv virtualenv $venv_version $venv_name
    echo "$venv_name" > .python-version
end
