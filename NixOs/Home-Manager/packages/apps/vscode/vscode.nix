{ config,pkgs,home-manager, ... }:
{    
  nixpkgs.config.allowUnfree = true;

  #VSCODE
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [

    ];
  };

  #TODO
  imports =
  [ 



  ];
}