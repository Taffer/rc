# I think this originally came from ancient *BSD systems, but it's muscle
# memory now...
function lc
    if test (uname) = 'Darwin'
        # Mac uses ancient BSD variants.
        ls -BCFG $argv
    else
        ls --color=auto -BCFG $argv
    end
end
