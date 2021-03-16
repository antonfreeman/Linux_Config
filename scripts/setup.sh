# ------------------------------------------------------------------------------
#  Install Variables
# ------------------------------------------------------------------------------

current_dir=$(pwd)

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


# ------------------------------------------------------------------------------
#  Aliases and functions
# ------------------------------------------------------------------------------

python set_bashrc.py

# ------------------------------------------------------------------------------
#  Extensions
# ------------------------------------------------------------------------------
sudo apt install gnome-shell-extensions -y
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com


sudo apt install bash-completion -y
echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

# ------------------------------------------------------------------------------
#  Desktop Background
# ------------------------------------------------------------------------------

cd ../wallpapers
gsettings set org.gnome.desktop.background picture-uri "file://$(pwd)/wallpaper.jpg"
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

cd ~/temp_files
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd Layan-gtk-theme
./install.sh


cd ~/temp_files
git clone https://github.com/vinceliuice/Canvas-theme.git
cd Canvas-theme
./Install


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
cp *.ttf ~/.local/share/fonts/

cd ~
rm -rf ~/temp_files
cd current_dir