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
    user = "torbatti";

    lib = nixpkgs.lib;

  in
    {
      homeManagerConfiguration = {
        ${user} = home-manager.lib.homeManagerConfiguration{
          # pkgs = nixpkgs.legacyPackages.${system};
          pkgs =  import nixpkgs {
            inherit system;
            config = {allowUnfree = true;};
          };
          modules = [
            ./NixOs/Home-Manager/home.nix
            {
              home = {
                username = "${user}";
                homeDirectory = "/home/${user}";
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
