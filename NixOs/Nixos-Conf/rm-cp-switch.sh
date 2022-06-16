#Making BackUp Of The Current Configs
mkdir ~/nixos/$(date +%s)/
sudo cp -r /etc/nixos/* ~/nixos/$(date +%s)/

#Replacing Latest Configs With Older Ones
sudo rm -r /etc/nixos/*
sudo cp -r ./* /etc/nixos/

#Rebuilding Nixos
sudo nixos-rebuild switch 