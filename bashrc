# bashrc

# Config
shopt -s histappend
set bell-style visable
ulimit -c unlimited
export PATH=$HOME/bin:$PATH
export EDITOR=vim
export HISTIGNORE="&"
export HISTSIZE=500000
export HISTCONTROL=ignoredups

# Aliases
alias ll='ls -lh --color=tty'
alias ls='ls --color=tty'
alias gk='gitk --all'
alias gl='git log --all --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gs='git status -sb'
alias gd='git diff'
alias gc='git checkout'
alias ga='git add'
alias gcl='git clean'

# Get around delete problems when using "screen"
if [ $TERM = screen ]; then
  stty erase "^?"
fi

# No x server connection for Vim
alias vim="vim -X"
alias vimdiff="vimdiff -X"
alias beep="echo -en \"\\007\""
alias view="vim -R"

# Shell prompt
if [ -e ~/bin/git-prompt.sh ]; then
    source ~/bin/git-prompt.sh
    PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0;35m\]$(__git_ps1)\[\e[0m\]\n\$ '
else
    PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
fi

# Colorized grep output
export GREP_OPTIONS='--color=auto'

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

if [ -e ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
