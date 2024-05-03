# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  git
  tmux
)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias python="python3"

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/Users/andresarias/.local/bin:$PATH"
export PATH="$PATH:$HOME/dotnet"
export PATH="$PATH:/Users/andresarias/.dotnet/tools"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Perl exports
PATH="/Users/andresarias/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/andresarias/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/andresarias/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/andresarias/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/andresarias/perl5"; export PERL_MM_OPT;

export DOTNET_ROOT=$HOME/dotnet 
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
