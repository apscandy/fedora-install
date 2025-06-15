source install_docker.sh
source install_flatpak.sh
source install_vscode.sh

mkdir -p ~/Notes/01-Projects
mkdir -p ~/Notes/02-Area
mkdir -p ~/Notes/03-Resources
mkdir -p ~/Notes/04-Archive
mkdir -p ~/Projects/Forks
mkdir -p ~/Projects/Work
mkdir -p ~/Projects/University 
mkdir -p ~/Projects/Playground
mkdir -p ~/Projects/Repos

ln -s ~/.fonts ~/.local/share/fonts

dconf load /org/gnome/terminal/ < gnome_terminal_settings.txt
