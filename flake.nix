{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs :let 
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
    homeConfigurations = {
      "${user}" = home-manager.lib.homeManagerConfiguration{
        inherit pkgs;
        extraSpecialArgs = {inherit inputs allowed-unfree-packages user;};
        modules = [
          ./home.nix
          stylix.homeManagerModules.stylix
        ];
      };
    };
  };
}
