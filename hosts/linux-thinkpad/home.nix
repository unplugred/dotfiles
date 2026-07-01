{ config, pkgs, inputs, ... }:
{
	imports = [
		inputs.nixcord.homeModules.nixcord
		inputs.plover-flake.homeManagerModules.plover
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
				icon_theme = "YAMIS";
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
				icon_theme = "YAMIS";
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

	programs.plover = {
		enable = true;
		package = inputs.plover-flake.packages.${pkgs.stdenv.hostPlatform.system}.plover.withPlugins (
			ps: with ps; [
				plover-lapwing-aio
				plover-console-ui
			]
		);

		settings = {
			"Machine Configuration" = {
				machine_type = "Keyboard";
				auto_start = true;
			};
			"System".name = "Lapwing";
		};
	};

	programs.vscodium = {
		enable = true;
		package = pkgs.vscodium.fhs;
		profiles.default = {
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
			];
			userSettings = {
				chat.disableAIFeatures = true;
				vim.enableNeovim = true;
				editor.fontSize = 16;
				workbench.sideBar.experimental.fontSize = 16;
				workbench.statusBar.experimental.fontSize = 16;
				workbench.tabs.experimental.fontSize = 16;
				workbench.experimental.fontSize = 16;
				debug.console.fontSize = 16;
				terminal.integrated.fontSize = 16;
				editor.lineHeight = 1;
				debug.console.lineHeight = 1;
				terminal.integrated.lineHeight = 1;
				terminal.integrated.fontLigatures.enabled = true;
				editor.renderWhitespace = "all";
				editor.cursorSmoothCaretAnimation = true;
				editor.smoothScrolling = true;
				terminal.integrated.smoothScrolling = true;
				editor.roundedSelection = false;
				workbench.shadows = false;
			};
		};
	};

	home.file = {
		".config/sway/config".source = /home/mel/repos/dotfiles/dotfiles/sway-config;
		".local/share/nvim/plugged/vim-airline/autoload/airline/themes/meltheme.vim".source = /home/mel/repos/dotfiles/dotfiles/airline-theme.vim;
		".config/dunst/dunstrc".source = /home/mel/repos/dotfiles/dotfiles/dunstrc;
		".config/waybar/config.jsonc".source = /home/mel/repos/dotfiles/dotfiles/waybar-config.jsonc;
		".config/waybar/style.css".source = /home/mel/repos/dotfiles/dotfiles/waybar-style.css;
		".config/flameshot/flameshot.ini".source = /home/mel/repos/dotfiles/dotfiles/flameshot.ini;
		".config/kitty/kitty.conf".source = /home/mel/repos/dotfiles/dotfiles/kitty.conf;
		".config/Kvantum/KvFlatMod".source = /home/mel/repos/dotfiles/KvFlatMod;
		".config/dolphinrc".source = /home/mel/repos/dotfiles/dotfiles/dolphinrc;
		".config/vmpk.sourceforge.net/VMPK.conf".source = /home/mel/repos/dotfiles/dotfiles/vmpk.conf;
		".config/Electron/theme.css".source = /home/mel/repos/dotfiles/dotfiles/calque.css;
		".config/vlc/vlcrc".source = /home/mel/repos/dotfiles/dotfiles/vlcrc;
		".config/vlc/vlc-qt-interface.conf".source = /home/mel/repos/dotfiles/dotfiles/vlc-qt-interface.conf;
		".config/btop/btop.conf".source = /home/mel/repos/dotfiles/dotfiles/btop.conf;
		".local/share/sonic-visualiser/Sonic Visualiser/templates/melody.svt".source = /home/mel/repos/dotfiles/dotfiles/sonic-visualiser.svt;
		".xscreensaver".source = /home/mel/repos/dotfiles/dotfiles/.xscreensaver;

		".local/share/fonts".source = /home/mel/MEGA/fonts;
		".local/bin/gitfourchette".source = /var/lib/flatpak/app/org.gitfourchette.gitfourchette/current/active/export/bin/org.gitfourchette.gitfourchette;
	};

	programs.home-manager.enable = true;
	home.stateVersion = "26.05";
}
