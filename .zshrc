#source ~/repos/dotfiles/.zshrc

export ZSH="$HOME/.oh-my-zsh"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
HYPHEN_INSENSITIVE="true"
plugins=(svn git)
source $ZSH/oh-my-zsh.sh
export EDITOR='neovide'
export VISUAL='neovide'
GCC_PATH=~/.local/opt/gcc-arm-none-eabi-10-2020-q4-major/bin
export PATH=$GCC_PATH:$PATH
