unsetopt NOMATCH


export GPG_TTY=`tty`
alias emacs='emacsclient -nw -q -a ""'

for f in $HOME/.functions/*.sh; do; source "$f"; done;
for f in $HOME/.`uname`.zsh; do source "$f"; done;

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
autoload -U +X bashcompinit && bashcompinit

if [ $commands[vault] ]; then
    complete -o nospace -C /usr/local/bin/vault vault
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

if [ $commands[pandoc] ]; then
    source <(pandoc --bash-completion)
fi
