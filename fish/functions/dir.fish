# Like DOS, but useful.
function dir
    if test (uname) = 'Darwin'
        # Mac uses ancient BSD variants.
        ls -BFGhl $argv
    else
        ls --color=auto -BFGhl $argv
    end
end
