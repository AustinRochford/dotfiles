#tab completion
autoload -U compinit
compinit

#colored prompt
autoload -U colors
colors

#command correction
setopt correctall

#vi key bindings
bindkey -v

#Add various directories to PATH
export PATH=$PATH:/usr/texbin:/Users/austin/Library/Python/2.7/bin:/usr/local/lib/python2.7/site-packages

#virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

#default editor
export EDITOR="vim"

#aliases
#directory stuff
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ls="ls -hF"
alias mkdir="mkdir -p"
alias rm="rm -rf"

#system stats
alias df="df -h"

#privelege escalation
alias svim="sudo vim"

#editors
alias vi="vim"

#tmux
alias attach="tmux attach -t"
alias tls='tmux ls'

function tl () {
    name=$1

    tmuxp load ${name}.yaml
}

# Haskell
# Add GHC 7.8.2 to the PATH, via http://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.8.2.app"
if [ -d "$GHC_DOT_APP" ]; then
    export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

#if this is a work machine, load work-specific config
if [[ -e ~/.monetate/config/.zshrc_monetate ]]
then
    source ~/.monetate/config/.zshrc_monetate
fi

#powerline
. /Library/Python/2.7/site-packages/Powerline-beta-py2.7.egg/powerline/bindings/zsh/powerline.zsh
