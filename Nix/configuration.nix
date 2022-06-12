# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.torbatti = {
    isNormalUser = true;
    description = "Torbatti";
    extraGroups = [ "networkmanager" "wheel"  "docker"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #Text Editors
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     emacs
    #Web-Browsers
     firefox
     chromium

    #
      wget

    #Git-Related
     git

    #Dev Tools
      #C compiler
       gcc
      #Rust
       rustup
      #Go
       go
      #Node
       nodejs

    #Curl
     curl

    #Rofi
    # rofi
     #Setting Rofi Theme:  https://www.reddit.com/r/NixOS/comments/nrp2es/setting_rofi_theme/

    #vscode
     vscode
  ];
  #UnFree Aplications


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  #Desktop Env || Window Manager
   services.xserver.enable = true;
   services.xserver.desktopManager.xfce.enable = true;
   services.xserver.displayManager.lightdm.enable = true;
  
  #Flatpak (Make Sure to add FlatHub)
   services.flatpak.enable = true;
   xdg.portal.enable = true;
   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
   
  #Nvidia Drivers
   #services.xserver.videoDrivers = [ "nvidia" ];
   #hardware.opengl.enable = true;
   #hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable; #<==Optional  

  #Docker
   virtualisation.docker.enable = true;
   #remember to remove ( users.users.torbatti.extraGroups = [ "docker" ];) if you dont want docker 

}