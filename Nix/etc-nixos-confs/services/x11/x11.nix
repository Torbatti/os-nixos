{ config, ... }:
{
    # Enabling X11 Server
    services.xserver.enable = true;
    
    imports =
    [
        ./window-manager.nix
        ./desktop-enviornment.nix
    ];
}