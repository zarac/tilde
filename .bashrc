###
#
#  This .bashrc belonging to Hannes Landstedt.
#
#  http://github.com/zarac/dotfiles
#
# TODO
#   o lsc, ls-files with colors of ps1
#
###
#
# /etc/bash.bashrc
#
# This file is the systemwide bashrc file. While most of the
# environment is preserved when running an interactive shell
# the PS[1-4] variables, aliases and functions are reset.
#
# When running a non-login shell, apply the following settings:
# - Prompt defaults (PS[1-4], PROMPT_COMMAND)
# - bash_completion if it exists
# - source /etc/bash.bashrc.local
#
###


# Prompt
#if test "$TERM" = "xterm" -o \
        #"$TERM" = "xterm-color" -o \
        #"$TERM" = "xterm-256color" -o \
        #"$TERM" = "rxvt" -o \
        #"$TERM" = "rxvt-unicode" -o \
        #"$TERM" = "xterm-xfree86"; then

#http://asemanfar.com/Current-Git-Branch-in-Bash-Prompt
#http://wiki.archlinux.org/index.php/Color_Bash_Prompt
git_branch()
{
    #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' 
    #git branch 2>/dev/null|cut -f2 -d\* -s
    #git branch 2>/dev/null | tr -d \*\
    #git branch | awk '\''// { print $2 }'\'' 2>/dev/null
    git status | awk '/n branch/{printf" "$4}'
    # : awk 'BEGIN {a = "abc def"; b = gensub(/(.+) (.+)/, "\\2 \\1", "g", a); print b }'
}

git_status_new()
{
    #A*
    git status -s | awk 'BEGIN{OFS=" "; ORC=" "} \
        /A./{n++} \
        END{if(n>0)printf" +"n};'
}

git_status_modified()
{
    #*M
    git status -s | awk 'BEGIN{OFS=" "; ORC=" "} \
        /.M/{n++} \
        END{if(n>0)printf" ^"n};'
}

git_status_deleted()
{
    #*D
    git status -s | awk 'BEGIN{OFS=" "; ORC=" "} \
        /.D/{n++} \
        END{if(n>0)printf" -"n};'
}

git_status_untracked()
{
    #??
    git status -s | awk 'BEGIN{OFS=" "; ORC=" "} \
        /'\\?\\?'/{n++} \
        END{if(n>0)printf" ?"n};'
}

colortest()
{
    # ??? set colors in a good way
    echo '\e[32;40m\] hi'
}

# 'user@host [git, branch N M D ??] pwd'
# see: git status -s
PS1='\n  \[\033[0;32m\]\u\[\033[0m\]@\[\033[0;32m\]\h\[\033[0;33m\]$(git_branch)\[\033[1;31m\]$(git_status_deleted)\[\033[1;33m\]$(git_status_modified)\[\033[1;32m\]$(git_status_new)\[\033[0;37m\]$(git_status_untracked) \[\033[0;36m\]\w\[\033[0m\]\n    '
#PS1='\[\e[0;32m\][\u\[\e[0;34m\]@\[\e[0;32m\]\h\[\e[0;34m\]:\[\e[0;32m\]\w]\[\e[0m\] '
PS2='> '
PS3='> '
PS4='+ '
export PS1 PS2 PS3 PS4

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
export PROMPT_COMMAND
# fi

# Aliases
# ls
alias lc='ls --color=auto'
alias la='ls -lah --color=auto'
alias lar='ls -lahR --color=auto' # all recursively
alias lat='ls -lAhtr --color=auto' # all list by time
alias ll='ls -lh --color=auto'
alias lal='ls -lAhL --color=auto'

# grep
# windows grep doesn't have colors?
if [ -x /usr/bin/dircolors ]; then
    alias cgrep='grep --color=auto'
    alias grepc='grep -a5 -b5 --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# find
alias fr='find . -regex'

# screen
alias jao='screen -r jao'
alias jaoo='screen -d -r jao'
alias jaom='screen -S jao'

# git
alias gs='git status'
alias gl='git log'
alias gls='git ls-files'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gc='git commit -m'
alias gac='git commit -a -m'
alias gcm='git commit'
alias gp='git push'
alias gpom='git push origin master'
alias guom='git pull origin master'
alias gb='git branch -v'
alias gr='git remote -v'
alias gd='git diff'
alias gdc='git diff --cached'


# Other
# nice 'motd'
echo -e '\n\n';lc;echo -e '\n\n';git status

# perhaps this should be at bottom
# -stan
[ -r /etc/bash_completion   ] && . /etc/bash_completion
[ -r /etc/bash.bashrc.local ] && . /etc/bash.bashrc.local
