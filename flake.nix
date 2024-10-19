{
  description = "A very basic flake";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    xremap-flake.url = "github:xremap/nix-flake";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
  };

  outputs = { nixpkgs, home-manager, nixvim, catppuccin, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        defaultNixos = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./configuration.nix ];
        };
      };

      #devShells
      devShells.${system} = {
        #pg2
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            gcc
            gnumake
            cgdb
            gdb
            pngpp
            valgrind
          ];

          shellHook = ''
            if [ -z "$IN_NIX_SHELL_ZSH" ]; then
              export IN_NIX_SHELL_ZSH=1
              exec zsh
            fi
          '';

        };

        #julia
        julia = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ julia-bin ];

          shellHook = ''
            if [ -z "$IN_NIX_SHELL_ZSH" ]; then
              export IN_NIX_SHELL_ZSH=1
              exec zsh
            fi
          '';

        };
      };
    };
}
