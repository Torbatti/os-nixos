{ config, ... }:
{
    imports =
    [
        ./flatpak/flatpak.nix
        ./virtualisation/virtualisation.nix
        ./x11/x11.nix
    ];
}