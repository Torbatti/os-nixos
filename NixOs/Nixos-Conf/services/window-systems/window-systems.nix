{ config, ... }:
{
    imports =
    [
        #./wayland/wayland.nix
        ./x11/x11.nix
    ];
}