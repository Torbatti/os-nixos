{ config, ... }:
{
  #VSCODE
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      Torbatti.GLN
    ];
  };

  #TODO
  imports =
  [ 



  ];
}