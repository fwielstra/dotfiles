# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fix 'HEAD^' not working (https://github.com/robbyrussell/oh-my-zsh/issues/449)# 
setopt NO_NOMATCH

# Git aliases
alias g="git"
alias gz="git cz"
alias gnp="git --no-pager"
alias gs="git s"
alias gap="git add -p"
alias gcm="git commit -m"
alias gco="git checkout"
alias gam="git commit --amend --no-edit"
alias gampf="gam && gpf"
alias gamm="git commit --amend"
alias gpf="git push --force-with-lease"
alias gpsup="git push --set-upstream origin \$(git branch | grep \* | cut -d ' ' -f2)"
alias grb="git rebase"
# fuckups
alias gigit="git"
alias gitgit="git"
alias ggit="git"
alias qgit="git"
alias ght="git"
alias got="git"
alias cleear="clear"
alias gits="git s"

# Add a .metadata_never_index file to node_modules folders so that spotlight will not try to index them,
# reducing CPU load (indexing) and disk i/o.
alias fix-spotlight='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \;'

# Kill ZScaler
alias kill-zscaler="find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;"

# todo.txt
alias todo=todo.sh

# fnm
export PATH="$PATH:/Users/freekwielstra/fnm"
eval "$(fnm env --use-on-cd --shell zsh)"

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
  
# show PWD in iterm2 tab title
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

# Maestro
export PATH=$PATH:$HOME/.maestro/bin

# Sublime Text
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
ulimit -n 524280

# ruby rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init - zsh)"

# ccache for react native; see https://reactnative.dev/docs/build-speed 

export PATH="$PATH:/opt/homebrew/opt/ccache/libexec"


# pnpm
export PNPM_HOME="/Users/freekwielstra/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

