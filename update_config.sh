# Copy config files to home directory
cp -R config/nvim/ ~/.config/
cp -R config/tmux/ ~/.config/
cp -R config/ghostty/ ~/.config/
cp -R config/yazi/ ~/.config

mkdir ~/.config/zsh/
cp config/zsh/zshrc ~/.config/zsh/.zshrc
cp config/zsh/zshenv ~/.zshenv
