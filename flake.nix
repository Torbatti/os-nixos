{
  # description = "Nixos Conf + Home Manager";

  # - NIX
    inputs.nix.url = "github:nixos/nix"; 
  #

  # - NIXPKGS
    inputs.nixpkgs-2205.url = "github:nixos/nixpkgs/nixos-22.05";
    inputs.nixpkgs-2211.url = "github:nixos/nixpkgs/nixos-22.11";

    inputs.unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    inputs.master.url = "github:nixos/nixpkgs/master";

    inputs.nixpkgs.follows = "unstable";
  #

  # - HOME-MANAGER
    inputs.home-manager.url = "github:nix-community/home-manager";

    inputs.home-manager.inputs.nixpkgs.follows = "unstable";
  #

  # - Other Inputs
    #inputs.parts.url = "github:hercules-ci/flake-parts";
    #inputs.nil.url = "github:oxalica/nil";
    #inputs.flake-utils.url = "github:numtide/flake-utils";
    #inputs.programsdb.url = "github:wamserma/flake-programs-sqlite";
    #inputs.nixos-vscode-server.url = "github:mudrii/nixos-vscode-ssh-fix/main";
    #inputs.statix.url = "github:nerdypepper/statix";
    #inputs.alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  #


  # CHECK OUT NOBZ REPO for latest updates
  # https://github.com/NobbZ/nixos-config
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
