{
  description = "Nixos Conf + Home Manager";

  # - NIXPKGS
    inputs.unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  # - HOME-MANAGER
    inputs.home-manager.url = "github:nix-community/home-manager";
    inputs.home-manager.inputs.nixpkgs.follows = "unstable";
    
  outputs = {nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    username = "torbatti";

    pkgs = import nixpkgs {
       config = {allowUnfree = true;};
     };

    lib = nixpkgs.lib;

  in
    {
      homeManagerConfiguration = {
        torbatti = home-manager.lib.homeManagerConfiguration{
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./NixOs/Home-Manager/home.nix
            {
              home = {
                username = "torbatti";
                homeDirectory = "/home/torbatti";
                stateVersion = "22.05";
              };
            }
          ];
        };
          
      };
      nixosConfigurations = {
        nixos = lib.nixosSystem{
          inherit system;
          modules = [
            ./NixOs/Nixos-Conf/configuration.nix
          ];
        };
      };
      
    };
    
}
