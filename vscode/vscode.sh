#if ! code -v; 
#then
#	yay -S visual-studio-code-bin;
#fi
#
#snap install code;
ln -sr ./settings.json $HOME/.config/Code/User/;
ln -sr ./keybindings.json $HOME/.config/Code/User/;
#	
#EXT=vscode-ext.sh
#echo $EXT
#if ! ./$EXT
#then
#	chmod +x $EXT
#fi
#./$EXT
