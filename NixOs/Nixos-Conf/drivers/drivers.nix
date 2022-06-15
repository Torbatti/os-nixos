{ config, ... }:
{
    imports =
    [
        #./gpu/amd-drivers.nix    #AMD GPU DRIVERS
        #./gpu/nvidia-drivers.nix    #NVIDIA GPU DRIVERS
	    #./gpu/intel-drivers.nix    # INTEL GPU DRIVERS
    ];
}