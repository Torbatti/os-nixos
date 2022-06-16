{ config, ... }:
{
    # Enabling X11 Server
    services.xserver.enable = true;
    
    imports =
    [
        ./window-managers/window-managers.nix
        ./display-managers/display-managers.nix
        ./desktop-enviornments/desktop-enviornments.nix
    ];

    # Configure keymap in X11
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

}