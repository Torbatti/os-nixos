sudo cp -r ~/.config/nixpkgs/home.nix ~/backups/
sudo rm -r  ~/.config/nixpkgs/home.nix
sudo cp -r ./home.nix ~/.config/nixpkgs/home.nix
sudo home-manager switch