#source ~/repos/dotfiles/.zshrc

HYPHEN_INSENSITIVE="true"
plugins=(svn git)
export EDITOR='neovide'
export VISUAL='neovide'
GCC_PATH=~/.local/opt/gcc-arm-none-eabi-10-2020-q4-major/bin
export PATH=$GCC_PATH:$PATH
