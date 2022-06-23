#!/usr/bin/env bash
# Kali_Rice installation scripts
# by Chris Bingham
# License: GNU GPLv3
# This bash script installs a customized .vimrc, Vim plugins and a .zshrc with short cut aliases
# Read the following comments for more info if you want.
# To avoid node.js errors: https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
# I put the install bash script for that in this repo
# Dispite having done pip3 install isort, This error may likey be encountered:
# Error detected while processing /home/kali/.vim/plugged/vim-isort/plugin/python_vimisort.vim[17]../home/kali/.vim/plugged/vim-isort/plugin/python_vimisort.vim:
# line   17:
# E605: Exception not caught: No python support present, vim-isort will be disabled
# MatchTagAlways unavailable: requires python.
# And,other than throwing that error message when opening vim, it all works fine.

# Updates and stuff
sudo apt update; sudo apt upgrade
sudo apt install ripgrep # new kind of grep
sudo apt install neofetch
sudo apt install terminator
sudo apt install kwrite
sudo apt install git curl python3-pip exuberant-ctags ack-grep

# Pip requirements for the repos below & vim plugins
sudo pip3 install -r requirements.txt

# Give /opt directory ownership to non-root user 
sudo chown ${USER} * /opt

# Some hacking tools/repos.
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

# custom shortcuts for /usr/bin
# a git clone short cut, (to use: type g then enter the repo addy)
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/g -o  /opt/g
#increase cursor speed, (type f to increase cursor speed)
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/f -o  /opt/f 
# sortcut to create new files
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/file_create -o  /opt/file_create
# print awk fields $1,$2,$3,$4,$5 up to 20 (type printawk to echo 20 or so awk fields to the screen)
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/printawk -o  /opt/printawk 
# activate redshift to save your eyes (type red to activate)
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/UsrBin/red -o  /opt/red

# I'm sure there is a more concise way to do this
chmod +x /opt/g 
chmod +x /opt/f
chmod +x /opt/file_create
chmod +x /opt/printawk
chmod +x /opt/red

# But I just want to get this up and running right now, so move all the scripts to /usr/bin
sudo mv /opt/g  -t  /usr/bin
sudo mv /opt/f  -t  /usr/bin
sudo mv /opt/file_create  -t  /usr/bin
sudo mv /opt/printawk  -t  /usr/bin
sudo mv /opt/red  -t  /usr/bin

# Install Brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Install the .vimrc & Vim plugins
# This is a .vimrc for Kali that includes extra aliases and shortcuts
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_2022_vimrc -o  ~/.vimrc

# Vim plugin: Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Gruvbox color theme
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

# kali .zshrc at the time of writing, There are still some errors when opening vim, regadless, all works fine, and this script saves a lot of time.
curl -Ls https://raw.githubusercontent.com/LinuxUser255/BashAndLinux/main/Kali_Linux_Zshrc_2022 -o  ~/.zshrc


echo ""
echo " To finshi Vim plugins, open vim and do :PlugInstall " 
echo ""

