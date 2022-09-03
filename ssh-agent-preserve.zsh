#!/bin/bash
# Inspired by https://superuser.com/questions/141044/sharing-the-same-ssh-agent-among-multiple-login-sessions

SSH_AUTH_SOCK=$HOME/.config/ssh-agent-socket

if [ ! $SSH_AGENT_PID ]
then
  SSH_AGENT_PID=`pgrep -f "ssh-agent -s -a $SSH_AUTH_SOCK"`
  if [[ $SSH_AGENT_PID =~ [0-9]+ ]]
  then
    #echo SSH_AGENT_PID=$SSH_AGENT_PID SSH_AUTH_SOCK=$SSH_AUTH_SOCK
    export SSH_AGENT_PID
    export SSH_AUTH_SOCK
  else
    rm -f $SSH_AUTH_SOCK
    echo "First shell since boot? Setting up ssh-agent.."
    eval `ssh-agent -s -a $SSH_AUTH_SOCK` >/dev/null
    ssh-add
  fi
fi
