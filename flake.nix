{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    matugen.url = "github:InioX/matugen?ref=v2.2.0";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    astal.url = "github:Aylur/astal";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      user = "rodrigo";
      pkgs = nixpkgs.legacyPackages.${system};
      allowed-unfree-packages = [
        "obsidian"
        "postman"
        "netbeans"
      ];
    in
    {
      homeConfigurations = {
        "${user}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs allowed-unfree-packages user; };
          modules = [
            ./home.nix
            stylix.homeManagerModules.stylix
          ];
        };
      };
    };
}
