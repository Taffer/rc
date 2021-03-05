# Defined in /usr/share/fish/functions/fish_title.fish @ line 1
function fish_title
    # emacs is basically the only term that can't handle it.
    if not set -q INSIDE_EMACS
        echo (status current-command) (__fish_pwd)
    end
end
