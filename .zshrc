# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

## can be set to "random"
#ZSH_THEME="kafeitu"
ZSH_THEME="jreese"
#ZSH_THEME="agnoster"
#ZSH_THEME="bureau"
#ZSH_THEME="amuse"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="frisk"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

## plugins can be found in ~/.oh-my-zsh/plugins/*
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

## vi ftw
export EDITOR='vim'
set -o vi

## Disable auto correct
unsetopt correct_all

## Function to aid getting info about npm packages.
npmb() { w3m https://npmjs.org/package/$1; }

alias l='ls --color=auto'
alias la='ls -A --color=auto'
alias lc='ls --color=auto'
alias L='ls -lah --color=auto'
alias lar='ls -lahR --color=auto' # all recursively
alias lat='ls -lAhtr --color=auto' # all list by time
alias ll='ls -lh --color=auto'
alias lal='ls -lAh --color=auto'
alias T='transmission-remote-cli'

# windows grep doesn't have colors?
if [ -x /usr/bin/dircolors ]; then
  alias cgrep='grep --color=auto'
  alias grepc='grep -a5 -b5 --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias fr='find . -regex'

# http://www.commandlinefu.com/commands/view/11852/advanced-ls-using-find-to-show-much-more-detail-than-ls-ever-could
alias LS='find -mount -maxdepth 1 -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'
alias LSR='find -mount -printf "%.5m %10M %#9u:%-9g %#5U:%-5G %TF_%TR %CF_%CR %AF_%AR %#15s [%Y] %p\n" 2>/dev/null'

alias gs='git remote -v; git branch -avv; echo \~; git status -s'
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
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git stash show --patience' # might be a better way it does the job

alias pmq='pacman -Qs'
alias pmqi='pacman -Qi'
alias pmql='pacman -Ql'
alias pmqo='pacman -Qo'
alias pms='pacman -Ss'
alias pma='pacman -Si'

# paste bin
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

# task warrior
alias t=task

# remote fs mount
alias stan='sshfs stan.compmode.se: ~/stan -o idmap=user'
alias stanoff='fusermount -u ~/stan'

# systemd
alias sc='systemctl'
alias jc='journalctl'

# ffmpeg
alias ffrecord='ffmpeg -f x11grab -r 30 -s 1366x768 -i :0.0 -q:v'
alias ffrecorda='ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s 1366x768 -i :0.0 -q:v'

# Customize to your needs...
export PATH=~/bin:$PATH

# source local .zshrc file if there is one
if [ -f ~/.zshrc-local ]; then source ~/.zshrc-local; fi
