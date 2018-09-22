unsetopt NOMATCH
export VIRTUAL_ENV_DISABLE_PROMPT=1
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
