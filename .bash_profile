###
#
#  This .bashrc belonging to Hannes Landstedt.
#
#  http://github.com/zarac/dotfiles
#
# TODO : lsc, ls-files with colors of ps1
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
## HKL: Trying to get UTF-8!
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8


# Prompt
#if test "$TERM" = "xterm" -o \
        #"$TERM" = "xterm-color" -o \
        #"$TERM" = "xterm-256color" -o \
        #"$TERM" = "rxvt" -o \
        #"$TERM" = "rxvt-unicode" -o \
        #"$TERM" = "xterm-xfree86"; then

# COLORS
CLEAR="\033[0m"
WHITE="\033[0m" # TODO: is this white?
WHITE_BOLD="\033[0;37m"
RED="\033[0;31m"
RED_BOLD="\033[1;31m"
YELLOW="\033[0;33m"
YELLOW_BOLD="\033[1;33m"
GREEN="\033[0;32m"
GREEN_BOLD="\033[1;32m"
PURPLE="\033[0;35m"
TEAL="\033[0;36m" # or whatever it's called
TEAL_BOLD="\033[1;36m"

git_branch()
{
    #http://asemanfar.com/Current-Git-Branch-in-Bash-Prompt
    #http://wiki.archlinux.org/index.php/Color_Bash_Prompt

    #git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' 
    #git branch 2>/dev/null|cut -f2 -d\* -s
    #git branch 2>/dev/null | tr -d \*\
    #git branch | awk '\''// { print $2 }'\'' 2>/dev/null
    git status 2>/dev/null | awk '/n branch/{printf" "$4}'
    # : awk 'BEGIN {a = "abc def"; b = gensub(/(.+) (.+)/, "\\2 \\1", "g", a); print b }'
}
git_changes()
{
    git status -s 2>/dev/null | awk '
    BEGIN{OFS=" ";ORC=" "}
    /^ D/{deleted++}
    /^ M/{modified++}
    /^M[ MD]/{indexModified++}
    /^A[ MD]/{indexAdded++}
    /^D[ M]/{indexDeleted++}
    /^R[ MD]/{indexRenamed++}
    /^C[ MD]/{indexCopied++}
    /^[MARC] /{matches++}
    /^[ MARC]M/{workTreeChanged++}
    /^[ MARC]D/{deletedInWorkTree++}
    /'\\?\\?'/{indexUntracked++}
    END{
    if(indexAdded>0)printf"'$GREEN_BOLD' "indexAdded;
    if(indexModified>0)printf"'$YELLOW_BOLD' "indexModified;
    if(indexDeleted>0)printf"'$RED_BOLD' "indexDeleted;
    if(indexRenamed>0)printf"'$WHITE_BOLD' mv"indexRenamed;
    if(indexCopied>0)printf"'$TEAL_BOLD' cp"indexCopied;
    if(deleted>0)printf"'$RED' "deleted;
    if(modified>0)printf"'$YELLOW' "modified;
    if(deletedInWorkTree>0)printf"'$WHITE' -cwd"deletedInWorkTree;
    if(indexUntracked>0)printf"'$WHITE' "indexUntracked;
    printf"'$CLEAR'"}'
    # not used...
    #if(matches>0)printf"'$WHITE' ="matches;
    #if(workTreeChanged>0)printf"'$WHITE_BOLD' !="workTreeChanged;
}

# found this in vimfiles/colors/.bashrc (was only line).. haven't tested 'cause the prompt right now is awesome ; )
# PS1="\n\[\e[30;1m\]\[\017\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])-(\[\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed s: ::g) files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed s/total //)b\[\e[30;1m\])\n \[\e[0m\]"

# Prompt format (see: git status --help for branch notation) '
#
#   user@host [git, branch +N ^M -D ??] cwd
#   '
PS1="\n  "
PS1+="$TEAL\u"
PS1+="$CLEAR@"
PS1+="$GREEN\h"
PS1+="$PURPLE"'$(git_branch)'
PS1+='$(git_changes)'
PS1+=" $TEAL\w"
PS1+="$CLEAR"
PS1+="\n  "
PS2='> '
PS3='> '
PS4='+ '
export PS1 PS2 PS3 PS4

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
export PROMPT_COMMAND
# fi

# Aliases
# ls
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias L='ls -lah --color=auto'
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

## Ignore commands beginning with space.
export HISTCONTROL=ignorespace

## Vim as default text editor.
export EDITOR=vim

# find
alias fr='find . -regex'

# screen
alias jao='screen -r jao'
alias jaoo='screen -d -r jao'
alias jaom='screen -S jao'

# git
alias gs='git status -s'
alias gl='git log'
alias glnr='git log --branches --not --remotes=origin'
alias glnb='git log --remotes=origin --not --branches'
alias gls='git ls-files'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gc='git commit -m'
alias gac='git commit -a -m'
alias gcm='git commit'
alias gp='git push'
alias gu='git pull'
alias gpom='git push origin master'
alias guom='git pull origin master'
alias gb='git branch -v'
alias gr='git remote -v'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git stash show --patience' # might be a better way it does the job)
alias mahmysql='mysql -h195.178.232.7 -uDA211T10C4062119 -p -DDA211T10C4062119'


# Other
# -stan
[ -r /etc/bash_completion   ] && . /etc/bash_completion
[ -r /etc/bash.bashrc.local ] && . /etc/bash.bashrc.local
