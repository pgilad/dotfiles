function c --description "Open in VSCode" --wraps "open" --argument-names target
    if test -z "$target"
        set target "."
    end
    open $target -a "Visual Studio Code"
end
