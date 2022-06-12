{ config, ... }:
{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.torbatti = {
        isNormalUser = true;
        description = "Torbatti";
        extraGroups = [ "networkmanager" "wheel"];
    };
    
    nix.settings.allowed-users =[
        "torbatti"
    ];
}