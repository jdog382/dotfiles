# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# aliases
alias update='doas pacman -Syyu && doas pacman -Rns $(pacman -Qtdq)'
alias install='doas pacman -S'
alias ls='exa -l -g'
alias sudo='doas'
alias doas='doas --'
alias sync='doas pacman -Syy'
alias remove='doas pacman -Rns'
alias search='doas pacman -Ss'
alias reboot='doas reboot'
alias poweroff='doas poweroff'
alias aurbuild='makepkg -si'
alias weather='curl wttr.in'
alias hisgrep='history | grep --color=auto'
alias df='df -h'
alias free='free -m'
alias find='doas find'
alias ..='cd ..'
alias ...='cd ../..'
alias brs='br --sizes'
alias brd='br -dhp'
alias audio='alsamixer'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias kp='killall pcmanfm' 
alias or='openbox --replace && exit'
alias linfo='inxi -Fxxxrza'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# set vim to default editor if it isn't already
[ -z "$EDITOR" ] && EDITOR=vim

# exports
export VISUAL=vim
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize