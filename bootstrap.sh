sudo pacman -S neovim
sudo pacman -S git
ln -sr ./git/.gitconfig ~/
sudo pacman -S nvm
if nvm -v; then
	nvm install 14.18.1
else
	echo "fail to bootstrap nvm"
	exit 1
fi
# sudo pacman -S docker
# sudo systemctl start docker.service
# sudo groupadd docker
# sudo usermod -aG docker $usermod
# newgrp docker
