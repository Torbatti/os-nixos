{ config, ... }:
{
    # Enabling wayland Server
    #TODO
    
    imports =
    [
        ./window-manager.nix
        ./desktop-enviornments/desktop-enviornments.nix
    ];
}