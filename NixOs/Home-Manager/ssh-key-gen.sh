ssh-keygen -t ed25519 -C "torabttii@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519