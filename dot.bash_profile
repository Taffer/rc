# I thought this would be cool for UTF-8 systems. Nope.
#export LC_ALL=en_US.UTF-8
#export LC_ALL=C

# Klocwork installed?
if [ -d /usr/local/kw/user/bin ] ; then
    export PATH=/usr/local/kw/user/bin:$PATH
fi

# Mac 'brew' version of Python installed?
if [ -d /usr/local/share/python ] ; then
    export PATH=/usr/local/share/python:$PATH
    export MANPATH=/usr/local/share/man:$MANPATH
fi

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=~/man:$MANPATH

export CDPATH=.:~

if [ "$(uname)" = "Darwin" ] ; then
    export EDITOR="/usr/bin/edit --wait --resume"
	COLOUR_LS=""
else
    export EDITOR=vi
	COLOUR_LS="--color=auto"
fi
export VISUAL=$EDITOR

if [ "$TERM" = "linux" ] ; then
    export PS1='\u@\h [\!]\$ '
else
    export PS1='\[\e]0;\h:\w\007\]\u@\h [\!]\$ '
fi

# Tell the terminal, etc. we're OK with UTF-8 output.
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

# Make Library visible, since OS X updates always set it to hidden.
if [ -x /usr/bin/chflags ] ; then chflags nohidden ~/Library ; fi

# Words of wisdom, short/SFW version.
if [ -x /usr/local/bin/fortune ] || [ -x /usr/bin/fortune ]; then fortune -s ; fi
