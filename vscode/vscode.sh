#if ! code -v; 
#then
#	yay -S visual-studio-code-bin;
#fi
#
#snap install code;
ln -sr ./settings.json $HOME/.config/Code/User/;
ln -sr ./keybindings.json $HOME/.config/Code/User/;
cat vscode-ext | xargs -L 1 code --install-extension

