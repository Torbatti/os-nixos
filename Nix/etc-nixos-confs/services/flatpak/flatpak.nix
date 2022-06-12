{ config,pkgs, ... }:
{
    #Flatpak (Make Sure to add FlatHub)
    services.flatpak.enable = true;
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Make Sure to Enable FlatHub
}