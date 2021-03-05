# Fish config.

# Paths
set -x PATH ~/bin /home/chrish/.local/bin /usr/local/bin /usr/local/sbin $PATH
if test -d ~/man
    set -x MANPATH ~/man $MANPATH
end

# Make the prompt less cryptic.
set -g fish_prompt_pwd_dir_length 78

# Editors
set -x EDITOR vim
set -x VISUAL vim

# Wine
set -x WINEPREFIX /home/chrish/.wine
set -x WINEARCH win64

# Golang installed?
if command -qs go
    set -x GOPATH (go env GOPATH)
    if test -d $GOPATH/bin
        set -x PATH $GOPATH/bin $PATH
    end
end
