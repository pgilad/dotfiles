function exp --description 'Create and navigate to a personal code project'
    # Check if argument is provided
    if test (count $argv) -lt 1
        echo "Error: Project name is required"
        return 1
    end

    set name $argv[1]

    # Validate input - only allow alphanumeric, hyphen and underscore
    if not string match -qr '^[a-zA-Z0-9_-]+$' $name
        echo "Error: Project name can only contain alphanumeric characters, hyphens, and underscores"
        return 1
    end

    # Define directory path
    set target_dir ~/code/personal/$name

    # Check if directory already exists
    if test -d $target_dir
        echo "Warning: Directory $target_dir already exists"
    else
        echo "Creating directory $target_dir"
        mkdir -p $target_dir
    end

    # Change to the directory
    cd $target_dir
end
