#source ~/repos/dotfiles/.bashrc

export EDITOR='neovide'
export VISUAL='neovide'
GCC_PATH=~/.local/opt/gcc-arm-none-eabi-10-2020-q4-major/bin
export PATH=$GCC_PATH:$PATH

if [ "$TERM" = "linux" ]; then
	echo -en "\e]P0333233" #black
	echo -en "\e]P8626262" #darkgrey
	echo -en "\e]P1d68787" #darkred
	echo -en "\e]P9d75f87" #red
	echo -en "\e]P25f865f" #darkgreen
	echo -en "\e]PA87af87" #green
	echo -en "\e]P3d8af5f" #brown
	echo -en "\e]PBffd787" #yellow
	echo -en "\e]P485add4" #darkblue
	echo -en "\e]PCadd4fb" #blue
	echo -en "\e]P5d7afaf" #darkmagenta
	echo -en "\e]PDffafaf" #magenta
	echo -en "\e]P687afaf" #darkcyan
	echo -en "\e]PE87d7d7" #cyan
	echo -en "\e]P7d0d0d0" #lightgrey
	echo -en "\e]PFe4e4e4" #white
	clear
fi
