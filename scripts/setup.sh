CURRENT=$(pwd)

# ------------------------------------------------------------------------------
#  Apps
# ------------------------------------------------------------------------------

sudo apt update
sudo apt install python3-pip -y
sudo apt install git -y
sudo apt install atom -y
sudo apt install gnome-tweaks -y
sudo apt-get install screenfetch -y

sudo apt install vim -y
sudo apt install openjdk-14-jdk -y
sudo apt install net-tools -y
sudo apt install gcc -y
sudo apt install docker -y

sudo apt install dconf-editor -y
sudo apt install python2 -y
sudo apt install python3-pip -y

sudo apt install curl -y
sudo apt install zsh -y

# ------------------------------------------------------------------------------
#  Unpack ZSH config files
# ------------------------------------------------------------------------------
sudo cp -rp zsh /usr/share/

cp .zshrc ~/
cp .zhistory ~/
cp .zsh_history ~/

cp .inputrc ~/

# ------------------------------------------------------------------------------
#  get deb applications
# ------------------------------------------------------------------------------
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# wget https://atom.io/download/deb
sudo dpkg -i google-chrome-stable_current_amd64.deb


# ------------------------------------------------------------------------------
#  Extensions
# ------------------------------------------------------------------------------
sudo apt install gnome-shell-extensions -y
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
sudo apt install bash-completion -y

# ------------------------------------------------------------------------------
#  Git setup
# ------------------------------------------------------------------------------
git config --global user.name "Anton Freeman"
git config --global user.email asfreeman12@gmail.com


# ------------------------------------------------------------------------------
#  Aliases and functions
# ------------------------------------------------------------------------------

python set_bashrc.py


# ------------------------------------------------------------------------------
#  Desktop Background
# ------------------------------------------------------------------------------
if [ ! -d "/home/$(whoami)/Pictures/Wallpapers" ]
then
    mkdir "/home/$(whoami)/Pictures/Wallpapers"
fi

cp ../wallpapers/wallpaper.png ~/Pictures/Wallpapers/

# gsettings set org.gnome.desktop.background picture-uri "file://home/$(whoami)/Pictures/wallpaper.jpg"
# gsettings set org.gnome.desktop.screensaver picture-uri "file://$(pwd)/wallpaper2.png"


cd ../scripts


# ------------------------------------------------------------------------------
#  Themes and Fonts
# ------------------------------------------------------------------------------

cp ../fonts/*/*.ttf ~/.local/share/fonts/

mkdir ~/temp_files

cd ~/temp_files
git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme
./install.sh -a

# gsettings set org.gnome.desktop.interface icon-theme 'Tela-red-dark'


cd ~/temp_files
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd Layan-gtk-theme
./install.sh

# gsettings set org.gnome.shell.extensions.user-theme name 'Layan'


cd ~/temp_files
git clone https://github.com/vinceliuice/Canvas-theme.git
cd Canvas-theme
./Install

# gsettings set org.gnome.desktop.interface gtk-theme 'Canvas-dark'

cd ~/temp_files
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -a

cd ~/temp_files
git clone https://github.com/daniruiz/flat-remix-gnome.git
cd flat-remix-gnome
make
sudo make install

cd ~/temp_files
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
./install.sh

cd ~/temp_files
git clone https://github.com/abertsch/Menlo-for-Powerline.git
cd Menlo-for-Powerline
cp *.ttf ~/.local/share/fonts/

cd ~/temp_files
git clone https://github.com/vinceliuice/Vimix-cursors.git
cd Vimix-cursors
sudo ./install.sh

# gsettings set org.gnome.desktop.interface cursor-theme 'Vimix-white-cursors'
rm -rf ~/temp_files


# ------------------------------------------------------------------------------
#  Load final config
# ------------------------------------------------------------------------------
cd $CURRENT
dconf reset -f /
dconf load / <  dconf-settings.ini
