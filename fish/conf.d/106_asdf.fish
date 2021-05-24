set -l asdf_path $BREW_PREFIX/asdf/asdf.fish

if test -e "$asdf_path"
    source "$asdf_path"
end
