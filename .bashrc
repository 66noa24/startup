# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias btns='brightnessctl -d "intel_backlight" set '

# PS1='[\u@\h \W]\$ '
PS1='\n°º¤ø,¸¸,ø¤º°\`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°\`°º¤ø,¸\n\d, \T \n\w\nEDIT-BASHRC \$ '

alias ZZZ='ZZZ'
alias zzz='sudo zzz'
alias resolve='/opt/resolve/bin/resolve %u'
alias trmdwn='termdown -bB'
alias nm='nmtui'
alias ms='sudo chronyc makestep'
alias track='chronyc tracking'
alias runvnc='./.runvnc'
