{ config, ... }:
{
    #Docker
    virtualisation.docker.enable = true;
    users.users.torbatti.extraGroups = [ "docker" ]; # replace it with users.users.<Your_User>.***
}