{
  description = "user0 NixOS system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  {
    nixosConfigurations.user0 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

modules = [
 ./hosts/user0/configuration.nix
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
  };
}

