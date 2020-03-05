function ncdu --description "ncdu" --wraps ncdu
    command ncdu --color dark -rr -x --exclude .git --exclude node_modules $argv
end
