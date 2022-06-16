{
  description = "Nixos Conf + Home Manager + Flakes";

  inputs ={
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager.url  = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    username = "torbatti";

    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };

    lib = nixpkgs.lib;

  in
    {
      homeManagerConfiguration = {
        torbatti = home-manager.lib.homeManagerConfiguration{
          inherit system username pkgs;

          homeDirectory = "/home/${username}";

          configuration = {
            imports = [
              ./NixOs/Home-Manager/home.nix
            ];
          };
          
          stateVersion = "22.05";

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
