{ config, ... }:
{
    imports =
    [
        #./gpu/amd-drivers.nix    #AMD GPU DRIVERS
        #./gpu/nvidia-drivers.nix    #NVIDIA GPU DRIVERS
    ];
}