###
#
#  .bashrc belonging to Hannes Landstedt
#  http://github.com/zarac/dotfiles
#
# * configured for gitbash
#
###


# PROMPT
PS1="\n  \[\033[0;32m\]\u\[\033[0m\]@\[\033[0;32m\]\h \[\033[0;36m\]\w $(__git_ps1 "\[\e[0;35m\][%s]")\[\033[0m\]\n "


# Aliases
alias lc='ls --color=auto'
alias la='ls -lah --color=auto'
alias ll='ls -lh --color=auto'

alias cgrep='grep --color=auto'
alias grepc='grep -a5 -b5 --color=auto'

alias gs='git status'
alias gl='git log'
alias ga='git add'
alias gc='git commit -m'
alias gb='git branch -v'
alias gr='git remote -v'


# Nice 'motd'
echo -e '\n\n';lc;echo -e '\n\n';git status
