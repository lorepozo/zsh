# vi
if command -v nvim >/dev/null
then
  alias v=nvim
  alias vi=nvim
  alias vim=nvim
else
  alias v=vim
  alias vi=vim
fi

# git
alias g=git
alias lol='git lol'

# cd
alias cd=' cd'
alias ..=' cd ..'
alias ...=' cd ../..'
alias ....=' cd ../../..'

# basics
if command -v exa >/dev/null # in case stuff isn't installed
then
  alias find=fd
  alias l=' exa -l'
  alias ls=' exa'
  alias tree=' exa -lT'
  alias grep='rg --color=auto'
  alias cat='bat'
  alias z=zellij
fi
local less=`command -v less`
alias less="$less -RFX"
alias lesss="$less -Rr"

# py
alias py='ptipython'
alias activate="source $HOME/.py/bin/activate"

# ssh
alias web="ssh web"
alias vpn="ssh vpn"

# misc
alias muttweb="mutt -F ~/.mutt/web"
