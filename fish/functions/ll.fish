function ll --description 'List contents of directory using long format' --wraps ls
    command ls -lhaG $argv
end
