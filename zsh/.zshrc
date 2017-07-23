# Oh my zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal"
plugins=(git mvn)
source $ZSH/oh-my-zsh.sh

# Zsh options
unsetopt NOMATCH
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Common environment variables
export EDITOR='emacs -nw'

# Source all the function scripts
for f in $HOME/.functions/*.sh; do; source "$f"; done;
for f in $HOME/.`uname`.zsh; do source "$f"; done;

# Aliases
alias emacs='emacs -nw'
alias mvnq='mvn -Pquick'
alias jdebug='export JAVA_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006'
