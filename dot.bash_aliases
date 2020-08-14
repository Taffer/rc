#!/usr/bin/bash

# Case-insensitive globbing; you need .inputrc as well.
shopt -s nocaseglob

# Golang installed?
if [ "$(command -v go)" != "" ] ; then
    GOPATH=$(go env GOPATH)
    export GOPATH
    if [ -d "${GOPATH}/bin" ] ; then
        export PATH=$GOPATH/bin:$PATH
    fi
fi

export PATH=~/bin:/home/chrish/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=~/man:$MANPATH

# Default prompt.
export PS1='\[\e]0;\h:\w\007\]\u@\h [\!]\$ '

# Make ls better.
COLOUR_LS="--color=auto"
if [ -e ~/.dircolors ] && [ -e /usr/bin/dircolors ] ; then
    # shellcheck source=/dev/null
    eval "$(/usr/bin/dircolors ~/.dircolors)"
fi

# Make git better.
#
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -e ~/bin/git-completion.bash ] ; then
    # shellcheck source=/dev/null
    source ~/bin/git-completion.bash
fi
if [ -e ~/bin/git-prompt.sh ] ; then
    # shellcheck source=/dev/null
    source ~/bin/git-prompt.sh
    export PS1='\[\e[34m\]\w\e[32m$(__git_ps1 " (%s)")\e[39m\n\[\e]0;\h:\w\007\]\u@\h [\!]\$ '
fi

# Platform-specific bits.
case "$(uname)" in
    Darwin)
        # Mac hates fun.
        COLOUR_LS=""

        # Make Library visible, since OS X updates always set it to hidden.
        if [ -x /usr/bin/chflags ] ; then
            chflags nohidden ~/Library
        fi

        # Mac 'brew' version of Python installed?
        if [ -d /usr/local/share/python ] ; then
            export PATH=/usr/local/share/python:$PATH
            export MANPATH=/usr/local/share/man:$MANPATH
        fi

        # Use Sublime Text if that's installed.
        if [ -x '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' ] ; then
            subl-w() {
                '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -w "$@";
            }
            export EDITOR="subl-w"
            alias subl='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
        else
            # Fallback to old faithful...
            export EDITOR=vim
        fi
        ;;

    Linux)
        export EDITOR=vim
        ;;

    *)
        ;;
esac

export VISUAL=$EDITOR
alias edit='$EDITOR'

# Tell the terminal, etc. we're OK with UTF-8 output.
# This really depends on your terminal's support for UTF-8.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Tell Python we're OK with UTF-8 output.
export PYTHONIOENCODING=utf-8

# Handy functions/aliases

lc() {
	ls -BCFG $COLOUR_LS "$@";
}

dir() {
	ls -BFGhl $COLOUR_LS "$@";
}

hd() {
	hexdump -C "$@";
}

# Words of wisdom, short/SFW version.
if [ "$(command -v fortune)" != "" ]; then
	fortune -s
fi

