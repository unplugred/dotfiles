#source /media/unplugred/Data/repos/vimrc/.zshrc

export ZSH="$HOME/.oh-my-zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
HYPHEN_INSENSITIVE="true"
plugins=(svn git)
source $ZSH/oh-my-zsh.sh
export EDITOR='neovide'
export VISUAL='neovide'
export PATH="$PATH:/home/unplugred/.spicetify"
export PATH="/home/unplugred/.cargo/bin:$PATH"
export NEOVIDE_MULTIGRID="true"
