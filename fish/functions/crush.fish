function crush --description "Use pngcrush -brute to find the smallest possible size for a given PNG file, replacing the original with the smaller version."
    set -l t 0
    for f in $argv
        pngcrush -brute $f $f.crushed > /dev/null 2>&1
        if test ! -e $f.crushed
            echo "$f is not a PNG file."
        else
            set -l ns (stat -c '%s' $f.crushed)
            set -l os (stat -c '%s' $f)
            if test $ns -lt $os
                set -l ds (math $os - $ns)
                echo "$f - Saved: $ds bytes"
                mv $f $f.orig && mv $f.crushed $f && rm $f.orig

                set t (math $t + $ds)
            else
                echo "$f - Already crushed!"
                rm $f.crushed
            end
        end
    end

    echo "Total saved: $t bytes"
end
