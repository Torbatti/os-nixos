#https://nix-community.github.io/home-manager/options.html
#https://nix-community.github.io/home-manager/index.html#sec-install-nixos-module
{ config, pkgs, ... }:

{
  imports =
  [
      ./packages/packages.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "torbatti";
  home.homeDirectory = "/home/torbatti";


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home.packages = with pkgs;[
    go
    nodejs
    gtk3
  ]; 

  # - Git
  programs.git = {
    enable = true;
    userName  = "torbatti";
    userEmail = "torbattii@gmail.com";
  };
  # - VSCODE
    nixpkgs.config.allowUnfree = true;
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [

      ];
    };


}
