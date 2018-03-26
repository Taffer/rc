# Make sure these are in the PATH.
for i in ~/bin /usr/local/bin /usr/local/sbin
    if not contains $i $PATH
        set -x PATH $PATH $i
    end
end

for i in ~/man /usr/local/man
    if not contains $i $MANPATH
        set -x MANPATH $MANPATH $i
    end
end

set COLOUR_LS "--color=auto"

set -x EDITOR vim

# Tell the terminal, etc. we're OK with UTF-8 output.
# This really depends on your terminal's support for UTF-8.
# Y NO en_CA?! :-P
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8

# Tell Python we're OK with UTF-8 output.
set -x PYTHONIOENCODING utf-8

# OS-specific bits.
switch (uname)
    case Darwin
        # The BSD ls on Mac doesn't support this.
        set --erase COLOUR_LS

        set -x EDITOR "/Users/chris.herborth/bin/edit --wait --stay"

        set -x ANDROID_SDK /usr/local/share/android-sdk
        set -x ANDROID_NDK /usr/local/Cellar/crystax-ndk/10.3.1_1

    case 'CYGWIN*'
        # Use Sublime if it's installed.
        if test -x '/cygdrive/c/Program Files/Sublime Text 2/sublime_text.exe'
            set -x EDITOR '/cygdrive/c/Program Files/Sublime Text 2/sublime_text.exe'
        end
end

set -x VISUAL $EDITOR
