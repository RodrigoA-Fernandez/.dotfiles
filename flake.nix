{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs :let 
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    user = "rodrigo";
    pkgs = nixpkgs.legacyPackages.${system};
    allowed-unfree-packages = [
      "obsidian"
      "postman"
      "netbeans"
    ];
  in{
    nixosConfigurations = {
      "nixos" = lib.nixosSystem {
        inherit system;
	modules = [ ./configuration.nix ];
      };
      specialArgs = {inherit allowed-unfree-packages user;};
    };
    
    homeConfigurations = {
      "${user}@nixos" = home-manager.lib.homeManagerConfiguration{
        inherit pkgs;
	extraSpecialArgs = {inherit inputs allowed-unfree-packages user;};
        modules = [
          ./home.nix
	];
      };
    };
  };
}
