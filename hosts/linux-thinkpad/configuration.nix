{ config, lib, pkgs, inputs, ... }:
let
	extension = shortId: guid: {
		name = guid;
		value = {
			install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
			installation_mode = "normal_installed";
		};
	};
	zen-browser = pkgs.wrapFirefox inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped {
			extraPrefs = lib.concatLines(
				lib.mapAttrsToList(
					name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
				){
					"zen.welcome-screen.seen" = true;
					"browser.preferences.config_warning.warningPasswordManager.dismissed" = true;
					"browser.preferences.config_warning.warningSafeBrowsing.dismissed" = true;
					"browser.translations.automaticallyPopup" = false;

					"zen.theme.accent-color" = "#9a7372";
					"zen.theme.gradient.show-custom-colors" = true;
					"zen.widget.linux.transparency" = true;
					"zen.view.grey-out-inactive-windows" = false;
					"browser.tabs.allow_transparent_browser" = true;
					#TODO set theme color to #191819f2

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

					#TODO add mail, calendar, whatsapp, keep, stats
					#TODO stylus theme
				}
			);

			extraPolicies = {
				DisableTelemetry = true;
				ExtensionSettings = builtins.listToAttrs [
					(extension "lastpass-password-manager" "support@lastpass.com")
					(extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}")
				];
				SearchEngines.Default = "ddg";
			};
	};
in {
	imports = [
		./hardware-configuration.nix
		inputs.home-manager.nixosModules.default
	];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowUnfreePredicate = _: true;
	environment.systemPackages = with pkgs; [

		# --- RICE ---
		sway
		swayidle
		waybar
		tofi
		dunst
		xscreensaver
		kdePackages.qtsvg
		kdePackages.breeze-icons
		libsForQt5.qt5ct
		libsForQt5.qtstyleplugin-kvantum
		qt5.qtwayland
		qt6.qtwayland
		qt6Packages.qt6ct
		adwaita-icon-theme

		# --- IO ---
		brightnessctl
		wdisplays
		bluetui
		playerctl
		pamixer
		pavucontrol
		qpwgraph
		#apex-tux #TODO

		# --- CLI TOOLS ---
		zsh
		zsh-powerlevel10k
		btop
		killall
		tree
		fastfetch
		wget

		# --- DEVELOPMENT ---
		kitty
		github-desktop
		git
		git-lfs
		neovide
		inputs.calque.packages.${pkgs.stdenv.hostPlatform.system}.default
		pm2
		filezilla
		putty
		chromium

		# --- CREATION ---
		blender
		gimp
		inkscape
		naps2
		grim
		flameshot
		inputs.borderless.packages.${pkgs.stdenv.hostPlatform.system}.default
		reaper
		orca-c
		vmpk
		fontforge-gtk
		imagemagick_light
		libwebp
		ffmpeg
		exiftool

		# --- MEDIA ---
		strawberry #TODO store config
		sonic-visualiser #TODO !!! store config
		nicotine-plus
		vlc
		deluge
		mixxx
		dolphin-emu
		stremio-linux-shell

		# --- OTHER ---
		zoom-us
		wineWow64Packages.staging
		zen-browser
		kdePackages.dolphin
		kdePackages.ark
		megasync

	];

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		configure.customRC = "source /home/mel/repos/dotfiles/dotfiles/.vimrc";
	};

	programs.steam = {
		enable = true;
		#remotePlay.openFirewall = true;
		#dedicatedServer.openFirewall = true;
		#localNetworkGameTransfers.openFirewall = true;
	};

	programs.obs-studio = {
		enable = true;
		enableVirtualCamera = true;
	};

	systemd.services.pm2 = {
		enable = true;
		unitConfig.Type = "simple";
		wantedBy = [ "multi-user.target" ];
		serviceConfig = { #TODO !!! on startup
			#ExecStart = "${pkgs.pm2}/bin/pm2 startOrRestart /home/mel/repos/unplug/ecosystem.config.js";
			ExecStart = "${pkgs.pm2}/bin/pm2 resurrect";
			ExecReload = "${pkgs.pm2}/bin/pm2 reload all";
			ExecStop = "${pkgs.pm2}/bin/pm2 kill";
		};
	};
	services.nginx = {
		enable = true;
		httpConfig = builtins.readFile "/home/mel/repos/unplug/nginx";
	};

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	networking.hostName = "laptop-linux";
	time.timeZone = "Turkey";

	environment.etc."ly/custom-sessions/sway.desktop".text = ''
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Sway
Comment=Sway WM
Exec=sway'';
	services.displayManager.ly = {
		enable = true;
		package = pkgs.ly;
		settings = {
			allow_empty_password = true;
			asterisk = "*";
			auth_fails = 10;
			bigclock = false;
			animation = "none";
			box_title = "null";
			initial_info_text = "Melody Vivienne";
			start_cmd = "${pkgs.kbd}/bin/setfont sun12x22";
		};
	};
	security.pam.services.ly.enableGnomeKeyring = true;
	services.gnome.gnome-keyring.enable = true;
	security.pam.loginLimits = [{
		domain = "@users";
		item = "rtprio";
		type = "-";
		value = 1;
	}];
	security.polkit.enable = true;
	users.users.mel = {
		isNormalUser = true;
		extraGroups = [
			"wheel" # sudo
			"input" # plover
		];
		packages = with pkgs; [ ];
	};
	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			"mel" = import ./home.nix;
		};
	};

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};
	services.udev.packages = [ pkgs.dolphin-emu ];

	#services.printing.enable = true;

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	networking.networkmanager = {
		enable = true;
		dns = "none";
		wifi.powersave = true;
	};
	networking.useDHCP = false;
	networking.dhcpcd.enable = false;
	networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];
	services.openssh.enable = true;

	services.udev.extraRules = ''
		KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
	''; # plover fix

	services.udisks2.enable = true;
	fileSystems."/mnt/nvme0n1p3".options = [ "uid=1000" ]; #TODO not working

	hardware.spacenavd.enable = true;
	# blender config: #TODO find a way to do this declaratively
	# | set theme
	# + input
	#   + ndof
	#     | pan sensitivity:   8
	#     | orbit sensitivity: 4
	#     | invert pan:        x y z
	#     | invert rotate:     x y
	# + navigation
	#   + orbit & pan
	#     | orbit around selection
	#   + zoom
	#     | zoom to mouse position
	# + keymap
	#   | set 3d cursor: disable
	# + file paths
	#   + data
	#     | fonts: ~/.local/share/fonts

	programs.dconf.enable = true;
	qt = {
		enable = true;
		platformTheme = "qt5ct";
		style = "kvantum";
	};
	environment.variables = {
		QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
		QT_PLATFORMTHEME = "qt6ct";
		QT_PLATFORM_PLUGIN = "qt6ct";
		QT_STYLE_OVERRIDE = "kvantum";
		QT_QPA_PLATFORM = "wayland";
		XDG_CURRENT_DESKTOP = "sway";
		EDITOR = "nvim";
		VISUAL = "neovide";
	};
	fonts.fontconfig = {
		enable = true;
		includeUserConf = false;
		defaultFonts = {
			monospace = [ "IBM 3270 Nerd Font" ];
			sansSerif = [ "IBM 3270 Nerd Font" ];
			serif = [ "IBM 3270 Nerd Font" ];
		};
		hinting = {
			enable = true;
			autohint = false;
			style = "slight";
		};
		subpixel = {
			lcdfilter = "none";
			rgba = "none";
		};
		antialias = true;
	};

	console = {
		earlySetup = true;
		font = "sun12x22";
		keyMap = "us";
		colors = [
			"333233"
			"d68787"
			"5f865f"
			"d8af5f"
			"85add4"
			"d7afaf"
			"87afaf"
			"d0d0d0"
			"626262"
			"d75f87"
			"87af87"
			"ffd787"
			"add4fb"
			"ffafaf"
			"87d7d7"
			"e4e4e4"
		];
	};
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;

		shellAliases = { };

		ohMyZsh = {
			enable = true;
			plugins = [ "git" ];
		};

		histSize = 10000;
		histFile = "$HOME/.zsh_history";
		setOptions = [
			"HIST_IGNORE_ALL_DUPS"
		];
		promptInit = ''
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
			source ~/.p10k.zsh

			if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
				source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
			fi
		'';
	};
	environment.shellAliases.nshell = "nix-shell --run $SHELL";
	environment.shells = [ pkgs.zsh ];
	users.defaultUserShell = pkgs.zsh;
	system.userActivationScripts.zshrc = "touch .zshrc";
	environment.localBinInPath = true;

	environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu"; #TODO temporary workaround

	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than +3";
	};
	nix.settings.auto-optimise-store = true;

	system.stateVersion = "26.05";
}
