# ~/.bashrc

modprobe psmouse

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"
# export LS_COLORS="$(vivid generate molokai)"
export EDITOR=vim
#export EDITOR=emacs

#export LS_COLORS="/home/victor-emmanuel.provost/afs/.ls_colors"

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

alias gpm='git pull && git merge'
alias ls='ls --color=auto'
alias grep='grep --color -n'
alias i3l="i3lock -i $HOME/afs/ternier.png"
alias gccf="gcc -Wextra -Wall -Werror -std=c99 -pedantic"
alias cf="find . -iname "*.hh" -o -iname "*.cc" -o -iname "*.hxx" | xargs clang-format -i"
export PROMPT_DIRTRIM=1
PS1='\[\e[0;38;5;81m\]verdy\[\e[0;38;5;69m\]@\[\e[0;38;5;117m\]\W \[\e[0;38;5;69m\]> \n\[\e[0m\]$ \[\e[0m\]'
export PS1
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
alias gpt='git push && git push --tags'
alias branch='git status | head -n 1'
alias rescan='sudo iwlist wlp3s0 scan'

export JAVA_HOME='/home/verdy/jdk-17.0.3+7'
export Path=$JAVA_HOME/bin:$PATH

alias gs="git status"
alias gap="git add -p"
alias gsu="git status -uno"
