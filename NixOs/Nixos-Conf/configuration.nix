# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./drivers/drivers.nix
      ./services/services.nix
      ./hardware-configuration.nix  # Include the results of the hardware scan.
    ];

  # - BOOT (START)
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # - BOOT (END)

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

  # Enable CUPS to print documents.
  #services.printing.enable = true;



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


  # - SERVICES (START)
    # - AUDIO (START)
      # Enable sound with pipewire.
      sound.enable = true;
      hardware.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };
    # - AUDIO (END)
  # - SERVICES (END)

  # - PACKAGES
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    nixpkgs.config.allowUnfree = true; # Allow unfree packages
    environment.systemPackages = with pkgs; [
        wget
        firefox
        pavucontrol
    ];


  # - USERS (START)
      # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.torbatti = {
        isNormalUser = true;
        description = "Torbatti";
        extraGroups = [ "networkmanager" "wheel"];
    };
    nix.settings.allowed-users =[
        "torbatti"
    ];
  # - USERS (END)

  # - GROUPS (START)
  # - GROUPS (END)



  # - STATE VERSION (START)
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.05"; # Did you read the comment?
  # - STATE VERSION (END)

}
