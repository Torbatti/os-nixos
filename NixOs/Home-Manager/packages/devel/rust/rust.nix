{ config, pkgs, ... }:

{
    # RUST NEED A C COMPILER
    home.packages.pkgs = [
        rustup
    ];
    
}