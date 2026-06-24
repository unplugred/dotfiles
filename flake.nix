{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixcord = {
			url = "github:FlameFlag/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		plover-flake = {
			url = "github:openstenoproject/plover-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		calque = {
			url = "github:unplugred/calque-desktop";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		borderless = {
			url = "github:unplugred/borderless";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, ... } @ inputs: {
		nixosConfigurations.linux-thinkpad = nixpkgs.lib.nixosSystem {
			specialArgs = {
				inherit inputs;
			};
			modules = [
				./hosts/linux-thinkpad/configuration.nix
				inputs.home-manager.nixosModules.default
			];
		};
	};
}
