{
  description = "Nixos Conf + Home Manager + Flakes";

  inputs ={
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager.url  = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };

    lib = nixpkgs.lib;

  in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem{
          inherit system;
          modules = [
            ./Nixos/Nixos-Conf/configuration.nix
          ];
        };
      };



      #packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
      #defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
    };
}
