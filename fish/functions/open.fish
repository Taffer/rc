# Mimic MacOS's "open" command.
function open
    xdg-open $argv > /dev/null 2>&1
end
