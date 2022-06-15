{ config,... }:
{
    imports =
    [
        ./unfree/unfree.nix
        ./free/free.nix
    ];
}