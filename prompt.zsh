# enable hook method
autoload add-zsh-hook

# enable and configure vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git cvs svn
zstyle ':vcs_info:*' formats ' %r[%B%F{6}%b%f%%b]:%S'

function myPrompt () {
    setopt prompt_subst

    local fail=%(?..〈%B%F{1}%?%f%b〉)

    local date='[%B%F{green}%D{%a %H:%M}%f%b]'

    local venv
    if [[ $VIRTUAL_ENV ]]; then
      venv="(%F{3}`basename $VIRTUAL_ENV`%f) "
    fi

    vcs_info
    local here
    if [[ $vcs_info_msg_0_ ]]; then
      here=$vcs_info_msg_0_
    else
      here=' %~'
    fi

    local sign=◯
    # other cool ones: ∇△ ∴
    sign="%B$sign%b "

    PS1="$fail$date$here $venv$sign"
}
add-zsh-hook precmd myPrompt

# this keeps the time up-to-date, but often crashes..
#TMOUT=2
#TRAPALRM() {
#    zle reset-prompt
#}
