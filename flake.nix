{
  description = "user0 abyss";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, home-manager, sops-nix }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    # =========================
    # NixOS Configuration
    # =========================
    nixosConfigurations.user0 = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/user0/configuration.nix

        # Secrets layer
        sops-nix.nixosModules.sops

        # Home Manager
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";

          home-manager.users.batman = import ./home/batman;
          home-manager.users.ironman = import ./home/ironman.nix;
          home-manager.users.omniman = import ./home/omniman.nix;
        }
      ];
    };

    # =========================
    # Dev Shells
    # =========================
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        nodejs
        python3
        go
        rustc
        cargo
      ];

      shellHook = ''
        echo "Dev shell activated"
      '';
    };
  };
}
