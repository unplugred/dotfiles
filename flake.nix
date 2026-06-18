{
	description = "Nixos config flake";

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
	};

	outputs = { self, nixpkgs, ... }@inputs: {
		nixosConfigurations.laptop-linux = nixpkgs.lib.nixosSystem {
			specialArgs = {inherit inputs;};
			modules = [
				./hosts/default/configuration.nix
				inputs.home-manager.nixosModules.default
			];
		};
	};
}
