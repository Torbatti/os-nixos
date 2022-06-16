{ config, pkgs,home-manager, ... }:

{
    # RUST NEED A C COMPILER
    home.packages = with pkgs;[
        rustup
    ];
    
}