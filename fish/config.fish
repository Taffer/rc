# Fish config.

# Paths
set -x PATH ~/bin /home/chrish/.local/bin /usr/local/bin /usr/local/sbin $PATH
if test -d ~/man
    set -x MANPATH ~/man $MANPATH
end

# Newer brew installs are in /opt/homebrew instead of /usr/local.
if test -d /opt/homebrew/bin
    set -x PATH /opt/homebrew/bin $PATH
end

# Make the prompt less cryptic.
set -g fish_prompt_pwd_dir_length 78

# Editors
if command -qs subl
    set -x EDITOR subl --wait
    set -x VISUAL subl --wait
else
    set -x EDITOR vim
    set -x VISUAL vim
end

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
