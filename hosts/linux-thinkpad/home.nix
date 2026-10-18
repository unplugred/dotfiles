{ config, pkgs, inputs, ... }:
let
	extension = shortId: guid: {
		name = guid;
		value = {
			install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
			installation_mode = "normal_installed";
		};
	};
in {
	imports = [
		inputs.nixcord.homeModules.nixcord
		inputs.zen-browser.homeModules.beta
	];

	programs.zen-browser = {
		enable = true;
		setAsDefaultBrowser = true;
		policies = {
			AutofillAddressEnabled = false;
			AutofillCreditCardEnabled = false;
			DisableFeedbackCommands = true;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DontCheckDefaultBrowser = true;
			NoDefaultBookmarks = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
			ExtensionSettings = builtins.listToAttrs [
				(extension "betterttv" "firefox@betterttv.net")
				(extension "lastpass-password-manager" "support@lastpass.com")
				(extension "open-graph-preview-and-debug" "{6e262423-d612-4f29-be6e-e83aa641645d}")
				(extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}")
				(extension "untrap-for-youtube" "{2662ff67-b302-4363-95f3-b050218bd72c}")
				(extension "ublock-origin" "uBlock0@raymondhill.net")
			];
		};
		profiles.default = {
			search = {
				force = true;
				default = "ddg";
			};
			settings = {
				"zen.welcome-screen.seen" = true;
				"browser.preferences.config_warning.warningPasswordManager.dismissed" = true;
				"browser.preferences.config_warning.warningSafeBrowsing.dismissed" = true;
				"signon.autofillForms" = false;
				"signon.rememberSignons" = false;
				"services.sync.declinedEngines" = "passwords";
				"services.sync.engine.passwords" = false;
				"browser.translations.automaticallyPopup" = false;

				"zen.theme.accent-color" = "#9a7372";
				"zen.view.window.scheme" = 0;
				"zen.theme.gradient.show-custom-colors" = true;
				"zen.widget.linux.transparency" = true;
				"zen.view.grey-out-inactive-windows" = false;
				"browser.tabs.allow_transparent_browser" = true;

				"sidebar.visibility" = "hide-sidebar";
				"zen.theme.content-element-separation" = 0;
				"zen.theme.border-radius" = 0;
				"zen.view.compact.enable-at-startup" = true;
				"zen.view.compact.hide-tabbar" = true;
				"zen.view.compact.hide-toolbar" = true;
				"zen.view.sidebar-expanded" = false;

				"font.name.monospace.x-western" = "IBM 3270 Nerd Font";
				"font.name.sans-serif.x-western" = "IBM 3270 Nerd Font";
				"font.name.serif.x-western" = "IBM 3270 Nerd Font";
				"media.videocontrols.picture-in-picture.display-text-tracks.size" = "small";
				"font.minimum-size.x-western" = 16;
				"font.size.variable.x-western" = 16;
				"font.size.monospace.x-western" = 16;

				#TODO stylus theme
			};
			spacesForce = true;
			spaces = {
				"mel" = {
					id = "c6de089c-410d-4206-961d-ab11f988d40a";
					position = 1000;
					theme = {
						type = "gradient";
						colors = [{
							red = 0;
							green = 0;
							blue = 0;
							algorithm = "floating";
							type = "explicit-lightness";
							lightness = 0;
						}];
						opacity = 0.9;
						texture = 0.0;
					};
				};
			};
			pinsForce = true;
			pins = {
				"WhatsApp" = {
					id = "5e8db6a4-92c7-4f31-8a60-1b9f3ce47d28";
					url = "https://web.whatsapp.com/";
					position = 100;
					isEssential = true;
				};
				"Keep" = {
					id = "cdd10fab-4fc5-494b-9041-325e5759195b";
					url = "https://keep.google.com/";
					position = 200;
					isEssential = true;
				};
				"Mail" = {
					id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
					url = "https://mail.proton.me/u/0/";
					position = 300;
					isEssential = true;
				};
				"Calendar" = {
					id = "d85a9026-1458-4db6-b115-346746bcc692";
					url = "https://calendar.proton.me/u/0/";
					position = 400;
					isEssential = true;
				};
				"Metrics" = {
					id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
					url = "https://vst.unplug.red/metrics";
					position = 500;
					isEssential = true;
				};
			};
			extensionButtons = {
				"nav-bar" = [ "support@lastpass.com" ];
			};
		};
	};

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
				icon_theme = "Suru++-Aspr\\xf3mauros";
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
				icon_theme = "Suru++-Aspr\\xf3mauros";
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
		theme.name = "arc-mod";
		iconTheme.name = "Suru++-Aspr\\xf3mauros";
		colorScheme = "dark";
		cursorTheme = {
			name = "Bibata-Original-Classic";
			size = 16;
		};
	};
	dconf = {
		enable = true;
		settings."org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
			font-name = "IBM 3270 Nerd Font 12";
			gtk-theme = "arc-mod";
		};
	};
	home.pointerCursor = {
		enable = true;
		gtk.enable = true;
		x11.enable = true;
		name = "Bibata-Original-Classic";
		size = 16;
		package = pkgs.bibata-cursors;
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

	wayland.windowManager.sway.systemd.enable = true;
	services.cliphist = {
		enable = true;
		systemdTargets = ["sway-session.target"];
		extraOptions = [
			"-max-dedupe-search"
			"10"
			"-max-items"
			"500"
		];
		allowImages = true;
	};

	programs.vscode = {
		enable = true;
		package = pkgs.vscode.fhsWithPackages(ps: with ps; [
			pkg-config
			gcc
		]);
		profiles.default = {
			extensions = with pkgs.vscode-extensions; [
				vscodevim.vim
				ms-vscode.cmake-tools
				ms-vscode.cpptools
			];
			userSettings = {
				chat.disableAIFeatures = true;
				vim.enableNeovim = true;
				editor.fontFamily = "IBM 3270 Nerd Font";
				debug.console.fontSize = 16;
				editor.fontSize = 16;
				editor.minimap.sectionHeaderFontSize = 16;
				terminal.integrated.fontSize = 16;
				workbench.sideBar.experimental.fontSize = 16;
				workbench.statusBar.experimental.fontSize = 16;
				workbench.tabs.experimental.fontSize = 16;
				workbench.experimental.fontSize = 16;
				debug.console.lineHeight = 1;
				editor.lineHeight = 1;
				terminal.integrated.lineHeight = 1;
				editor.fontLigatures = true;
				terminal.integrated.fontLigatures.enabled = true;
				editor.renderWhitespace = "all";
				editor.cursorSmoothCaretAnimation = "on";
				editor.smoothScrolling = true;
				terminal.integrated.smoothScrolling = true;
				workbench.shadows = false;
				editor.roundedSelection = false;
			};
		};
	};

	home.file = {
		".config/sway/config".source = /home/mel/repos/dotfiles/dotfiles/sway-config;
		".local/share/nvim/plugged/vim-airline/autoload/airline/themes/meltheme.vim".source = /home/mel/repos/dotfiles/dotfiles/airline-theme.vim;
		".config/dunst/dunstrc".source = /home/mel/repos/dotfiles/dotfiles/dunstrc;
		".config/waybar/config.jsonc".source = /home/mel/repos/dotfiles/dotfiles/waybar-config.jsonc;
		".config/waybar/style.css".source = /home/mel/repos/dotfiles/dotfiles/waybar-style.css;
		".config/kitty/kitty.conf".source = /home/mel/repos/dotfiles/dotfiles/kitty.conf;
		".config/Kvantum/KvFlatMod".source = /home/mel/repos/dotfiles/KvFlatMod;
		".config/dolphinrc".source = /home/mel/repos/dotfiles/dotfiles/dolphinrc;
		".config/vmpk.sourceforge.net/VMPK.conf".source = /home/mel/repos/dotfiles/dotfiles/vmpk.conf;
		".config/Electron/theme.css".source = /home/mel/repos/dotfiles/dotfiles/calque.css;
		".config/vlc/vlcrc".source = /home/mel/repos/dotfiles/dotfiles/vlcrc;
		".config/vlc/vlc-qt-interface.conf".source = /home/mel/repos/dotfiles/dotfiles/vlc-qt-interface.conf;
		".config/btop/btop.conf".source = /home/mel/repos/dotfiles/dotfiles/btop.conf;
		".config/kristall/styles/kristall.kthm".source = /home/mel/repos/dotfiles/dotfiles/kristall.kthm;
		".local/share/sonic-visualiser/Sonic Visualiser/templates/melody.svt".source = /home/mel/repos/dotfiles/dotfiles/sonic-visualiser.svt;
		".xscreensaver".source = /home/mel/repos/dotfiles/dotfiles/.xscreensaver;
		".config/xdg-desktop-portal-wlr/config".source = /home/mel/repos/dotfiles/dotfiles/xdg-desktop-portal-wlr;

		".local/share/fonts".source = config.lib.file.mkOutOfStoreSymlink /home/mel/MEGA/fonts;

		".config/REAPER/UserPlugins/reaper_reapack-x86_64.so".source = "${pkgs.reaper-reapack-extension}/UserPlugins/reaper_reapack-x86_64.so";
		".config/REAPER/UserPlugins/reaper_sws-x86_64.so".source = "${pkgs.reaper-sws-extension}/UserPlugins/reaper_sws-x86_64.so";
		".config/REAPER/Scripts/sws_python.py".source = "${pkgs.reaper-sws-extension}/Scripts/sws_python.py";
		".config/REAPER/Scripts/sws_python64.py".source = "${pkgs.reaper-sws-extension}/Scripts/sws_python64.py";
		".config/REAPER/Data/Grooves".source = "${pkgs.reaper-sws-extension}/Data/Grooves";
	};

	programs.home-manager.enable = true;
	home.stateVersion = "26.05";
}
