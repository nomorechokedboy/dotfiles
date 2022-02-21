if ! kitty -v;
then
    sudo pacman -S kitty
fi

ln -sr ./kitty.conf ~/.config/kitty/
