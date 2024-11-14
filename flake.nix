{
  description = "My sexy OS ;>";

  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    }; 
    home-manager = {
      url = "github:nix-community/home-manager";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    ruxy-nvim = {
      url = "github:OriginalOrangeXD/ruxy.nvim";
    };
  };

  outputs = { flake-parts,self, nixpkgs, ... } @inputs:
    let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in 
    flake-parts.lib.mkFlake { inherit inputs; } {
	systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];
	flake = {
        nixosConfigurations = {
            acdc = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/acdc/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
            frame = nixpkgs.lib.nixosSystem {
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/frame/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
        };
    };
};
}
