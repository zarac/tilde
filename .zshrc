# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
## KHL
#ZSH_THEME="kafeitu"
ZSH_THEME="jreese"
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Function to aid getting info. about npm packages.
npmb() { w3m https://npmjs.org/package/$1; }

# HKL : Aliases
# ls
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias L='ls -lah --color=auto'
alias lar='ls -lahR --color=auto' # all recursively
alias lat='ls -lAhtr --color=auto' # all list by time
alias ll='ls -lh --color=auto'
alias lal='ls -lAhL --color=auto'
# http://www.commandlinefu.com/commands/view/11852/advanced-ls-using-find-to-show-much-more-detail-than-ls-ever-could
alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'
alias LSR='find -mount -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'

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
#alias gs='git status -s'
alias gs='git branch -avv; echo '.'; git status -s'
alias gl='git log'
alias glnr='git log --branches --not --remotes=origin'
alias glnb='git log --remotes=origin --not --branches'
alias gls='git ls-files'
alias glv="git log -p -40 | vim - -R -c 'set foldmethod=syntax'"
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
alias stan='sshfs stan.compmode.se: ~/stan -o idmap=user'
alias stanoff='fusermount -u ~/stan'

# pacman
alias pmq='pacman -Qs'
alias pmqi='pacman -Qi'
alias pmql='pacman -Ql'
alias pmqo='pacman -Qo'
alias pms='pacman -Ss'
alias pma='pacman -Si'

# paste bin
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/home/zarac/.gem/ruby/1.9.1/bin:~/scripts
