{ config, ... }:
{
    #Desktop Env 
    services.xserver.desktopManager.xfce.enable = true;
    services.xserver.displayManager.lightdm.enable = true;
}