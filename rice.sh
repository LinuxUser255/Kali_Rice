#!/usr/bin/env bash

# Updates and stuff
sudo apt update; sudo apt upgrade
sudo apt install rip-grep
sudo apt install terminator
sudo apt install kwrite
sudo apt install git curl python3-pip exuberant-ctags ack-grep

# Pip requirements for the repos below & vim plugins
sudo pip3 install -r requirements.txt

# Give /opt directory ownership to non-root user 
sudo chown ${USER} * /opt

# Should I create a root user? give user kali, root privs/ add to wheel group?
# Some hacking tools/repos. More will probably added later on
# Send them all to /opt directory
git clone https://github.com/aboul3la/Sublist3r.git  /opt/Sublist3r
git clone https://github.com/secureauthcorp/impacket.git  /opt/impacket 
git clone https://github.com/LinuxUser255/BashAndLinux.git  /opt/BashAndLinux
git clone https://github.com/danielmiessler/SecLists.git  /opt/Seclists 
git clone https://github.com/defparam/smuggler.git  /opt/smuggler 
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git  /opt/Pay-Loads-All-The-Things
git clone https://github.com/LinuxUser255/RandoHackingStuff.git  /opt/HackingStuff
git clone https://github.com/smicallef/spiderfoot.git  /opt/spiderfoot

# Install Obsidian, the markdown note taking app
curl -Ls https://obsidian.md/Obsidian-0.14.6.AppImage -o  /opt/Obsidian-0.14.6.AppImage
chmod +x /opt/Obsidian-0.14.6.AppImage
mv /opt/Obsidian-0.14.6.AppImage -t  /usr/bin

# my custom shortcuts for /usr/bin
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/g -o  /opt/g
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/f -o  /opt/f 
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/file_create -o  /opt/file_create
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/printawk -o  /opt/printawk 
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/red -o  /opt/red

# I'm sure there is a more concise way to do this
chmod +x /opt/g 
chmod +x /opt/f
chmod +x /opt/file_create
chmod +x /opt/printawk
chmod +x /opt/red

# But I just want to get this up and running right now
mv /opt/g  -t  /usr/bin
mv /opt/f  -t  /usr/bin
mv /opt/file_create  -t  /usr/bin
mv /opt/printawk  -t  /usr/bin
mv /opt/red  -t  /usr/bin

# Install Brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Install your .vimrc & Vim plugins

# My custom .vimrc
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_2022_vimrc -o  ~/.vimrc

# Vim plugin: Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

# Gruvbox
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

# kali .zshrc .. There are still some errors when opening vim, regardless rice script saves a lot of time.
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_Zshrc_2022 -o  ~/.zshrc

echo ""
echo " To finshi Vim plugins, open vim and do :PlugInstall " 
echo ""

