###
#
#  .bashrc belonging to Hannes Landstedt
#  http://github.com/zarac/dotfiles
#
# * configured for gitbash
#
###


# Prompt
PS1='\n  \[\033[0;32m\]\u\[\033[0m\]@\[\033[0;32m\]\h $(__git_ps1 "\[\e[1;35m\]%s") \[\033[0;36m\]\w\[\033[0m\]\n '


# Aliases
# ls
alias lc='ls --color=auto'
alias la='ls -lah --color=auto'
alias lar='ls -lahR --color=auto' # all recursively
alias lat='ls -lAhtr --color=auto' # all list by time
alias ll='ls -lh --color=auto'

# grep
alias cgrep='grep --color=auto'
alias grepc='grep -a5 -b5 --color=auto'

# find
alias fr='find . -regex'

# git
alias gs='git status'
alias gl='git log'
alias gls='git ls-files'
alias ga='git add'
alias gmv='git mv'
alias grm='git rm'
alias gc='git commit -m'
alias gcm='git commit'
alias gp='git push'
alias gpgm='git push github master'
alias gb='git branch -v'
alias gr='git remote -v'
alias gd='git diff'
alias gdc='git diff --cached'


# Nice 'motd'
echo -e '\n\n';lc;echo -e '\n\n';git status
