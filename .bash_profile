if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

## Ignore commands beginning with space.
export HISTCONTROL=ignorespace

## Vim as default text editor.
export EDITOR=vim
