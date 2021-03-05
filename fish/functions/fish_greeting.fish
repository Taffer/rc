# Words of wisdom, short/SFW version.
function fish_greeting --description "Words of wisdom, short/SFW version."
    if command -qs fortune
        fortune -s
    end
end
