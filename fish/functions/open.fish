# Mimic MacOS's "open" command.
function open
    if test (uname) = 'Darwin'
        # On a Mac you don't need to mimic it.
        /usr/bin/open $argv > /dev/null 2>&1
    else
        xdg-open $argv > /dev/null 2>&1
    end
end
