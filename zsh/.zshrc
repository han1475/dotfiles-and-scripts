home=/home/han

# Antigen: https://github.com/zsh-users/antigen
source $home/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply

# This load nvm
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
source $home/.nvm/nvm.sh

# load deno
export DENO_INSTALL="/home/han/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# system
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias update='sudo pacman -Syu'
alias remove='sudo pacman -Rcn'
alias poweroff='sudo shutdown -h now'
alias reboot='sudo reboot'

# yay
alias yinstall='yay -S'
alias ysearch='yay -Ss'

# emacs
alias em='emacs'
alias emc="emacsclient -a '' -t"
# only load basic text package to startup quickly.
alias emq='emacs -Q --eval "(setq startup-now t)" -l "~/.emacs.d/init.el"'

# git
alias gs='git status'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -d'
alias gbdf='git branch -D'
alias ga='git add'
alias gaa='git add .'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
# keep commit history,do not keep branch history
alias gm='git merge'
# do not keep commit and branch history, just keep changes.need commit again.
alias gms='git merge --squash'
# keep branch and commit history.
alias gmf='git merge --no-ff'
alias gcm='git commit -m'
alias gp='git push'
alias gpf='git push --force'
alias gr='git reset --hard'
alias grh='git reset --hard HEAD'
alias gr1='git reset --hard HEAD^'
alias gr2='git reset --hard HEAD^^'

# cd
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."