{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "torbatti";
    userEmail = "torbattii@gmail.com";
  };
}