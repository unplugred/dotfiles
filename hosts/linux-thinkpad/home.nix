{ config, pkgs, inputs, ... }:
{
	imports = [
		inputs.nixcord.homeModules.nixcord
	];

	home.packages = [ ];
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowUnfreePredicate = _: true;

	home.username = "mel";
	home.homeDirectory = "/home/mel";

	qt = {
		enable = true;
		platformTheme.name = "qtct";
		style.name = "kvantum";
		qt5ctSettings = {
			Appearance = {
				icon_theme = "\"breeze-dark\"";
				custom_palette = true;
				color_scheme_path = "/home/mel/.config/qt5ct/style-colors.conf";
				style = "kvantum-dark";
			};
			Fonts = {
				fixed = "\"IBM 3270 Nerd Font,12,-1,5,57,0,0,0,0,0,Narrow\"";
				general = "\"IBM 3270 Nerd Font,12,-1,5,57,0,0,0,0,0,Narrow\"";
			};
		};
		qt6ctSettings = {
			Appearance = {
				icon_theme = "breeze-dark";
				custom_palette = true;
				color_scheme_path = "/home/mel/.config/qt6ct/style-colors.conf";
				style = "kvantum-dark";
			};
			Fonts = {
				fixed = "\"IBM 3270 Nerd Font,12,-1,5,500,0,0,0,0,0,0,0,0,0,0,1,Narrow,0,0\"";
				general = "\"IBM 3270 Nerd Font,12,-1,5,500,0,0,0,0,0,0,0,0,0,0,1,Narrow,0,0\"";
			};
		};
		kvantum = {
			enable = true;
			settings = {
				General.theme = "KvFlatMod";
			};
		};
	};
	gtk = {
		enable = true;
		font = {
			name = "IBM 3270 Nerd Font";
			size = 12;
		};
		colorScheme = "dark";
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
	};
	dconf = {
		enable = true;
		settings."org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			font-name = "IBM 3270 Nerd Font 12";
			gtk-theme = "Adwaita-dark";
		};
	};

	programs.nixcord = {
		enable = true;
		vesktop.enable = true;
		config = {
			themeLinks = [
				"https://raw.githubusercontent.com/unplugred/dotfiles/refs/heads/main/dotfiles/discord.css"
			];
			frameless = true;
			transparent = true;
			plugins = {
				noF1.enable = true;
				noTypingAnimation.enable = true;
			};
		};
	};

	home.file = {
		".config/sway/config".source = ./../../dotfiles/sway-config;
		".local/share/nvim/plugged/vim-airline/autoload/airline/themes/meltheme.vim".source = ./../../dotfiles/airline-theme.vim;
		".config/dunst/dunstrc".source = ./../../dotfiles/dunstrc;
		".config/waybar/config.jsonc".source = ./../../dotfiles/waybar-config.jsonc;
		".config/waybar/style.css".source = ./../../dotfiles/waybar-style.css;
		".config/flameshot/flameshot.ini".source = ./../../dotfiles/flameshot.ini;
		".config/kitty/kitty.conf".source = ./../../dotfiles/kitty.conf;
		".config/Kvantum/KvFlatMod".source = ./../../KvFlatMod;
		".config/dolphinrc".source = ./../../dotfiles/dolphinrc;
		".config/vmpk.sourceforge.net/VMPK.conf".source = ./../../dotfiles/vmpk.conf;
		".config/Electron/theme.css".source = ./../../dotfiles/calque.css;
		".config/vlc/vlcrc".source = ./../../dotfiles/vlcrc;
		".config/vlc/vlc-qt-interface.conf".source = ./../../dotfiles/vlc-qt-interface.conf;
		".xscreensaver".source = ./../../dotfiles/.xscreensaver;
		".local/share/fonts".source = /home/mel/MEGA/fonts;
	};

	programs.home-manager.enable = true;
	home.stateVersion = "26.05";
}
