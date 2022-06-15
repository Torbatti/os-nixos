{ config, ... }:
{
    imports =
    [
        ./apps-stores/apps-stores.nix
        #./audio/audio.nix
        ./flakes/flakes.nix
        ./networking/networking.nix
        ./virtualisation/virtualisation.nix
        ./window-systems/window-systems.nix
    ];
}