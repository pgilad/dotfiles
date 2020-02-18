function fish_generate_completions
    set -l complete_path ~/.dotfiles/fish/completions

    # Update poetry completions
    poetry completions fish > $complete_path/poetry.fish

    # Update docker completions
    curl -s https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish > $complete_path/docker.fish

    # Update pipx completions
    register-python-argcomplete --shell fish pipx > $complete_path/pipx.fish

    # Update forter-dev-cli completions
    # _FORTER_COMPLETE=source-fish forter > $complete_path/forter.fish
end
