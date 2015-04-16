# Case-insensitive globbing; you need .inputrc as well.
shopt -s nocaseglob 

# Mac 'brew' version of Python installed?
if [ -d /usr/local/share/python ] ; then
    export PATH=/usr/local/share/python:$PATH
    export MANPATH=/usr/local/share/man:$MANPATH
fi

export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=~/man:$MANPATH

export CDPATH=.:~

# Default prompt.
export PS1='\[\e]0;\h:\w\007\]\u@\h [\!]\$ '

export EDITOR=vi
COLOUR_LS="--color=auto"

# Platform-specific bits.
case "$(uname)" in
    Darwin)
        export EDITOR="/usr/bin/edit --wait --resume"
        COLOUR_LS=""

        # Make Library visible, since OS X updates always set it to hidden.
        if [ -x /usr/bin/chflags ] ; then chflags nohidden ~/Library ; fi
        ;;

    CYGWIN*)
        if [ -x '/cygdrive/c/Program Files (x86)/Notepad++/notepad++.exe' ] ; then
            npp() {
                '/cygdrive/c/Program Files (x86)/Notepad++/notepad++.exe' $@;
            }
            export EDITOR=npp
        fi

        # If Sublime Text 2 is installed, use that instead.
        if [ -x '/cygdrive/c/Program Files/Sublime Text 2/sublime_text.exe' ] ; then
            subl() {
                '/cygdrive/c/Program Files/Sublime Text 2/sublime_text.exe' $@;
            }
            export EDITOR=subl
        fi
        ;;

    Linux)
        export PS1='\u@\h [\!]\$ '
        ;;

    *)
        ;;
esac

export VISUAL=$EDITOR

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

if [ -e ~/.bashrc ] ; then
	source ~/.bashrc
fi

# Words of wisdom, short/SFW version.
if [ -x /usr/local/bin/fortune ] || [ -x /usr/bin/fortune ]; then fortune -s ; fi
