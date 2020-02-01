# macOS 10.15 "Catalina" has *issues*
# Temp workaround until https://github.com/fish-shell/fish-shell/issues/6270
# if test (uname) = Darwin
    # if command -sq defaults
        # set -l darwin_version (uname -r | string split .)
        # if test "$darwin_version[1]" = 19 -a "$darwin_version[2]" -le 3
            # function __fish_describe_command; end
            # exit
        # end
    # end
# end
function __fish_describe_command; end
exit
