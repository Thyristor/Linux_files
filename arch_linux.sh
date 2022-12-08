loadkeys es
ping -c 1 google.es
cfdisk
lsblk
mkfs.vfat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mkswap /dev/sda3
swapon
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel
genfstab -U /mnt > /mnt/etc/fstab
cat !$
arch-chroot /mnt
passwd
ls /home
useradd -m arch
ls /home -l
passwd $USER
usermod -aG wheel $USER
groups $USER
pacman -S --noconfirm sudo
pacman -S --noconfirm vim nano
vim /etc/sudoers
su $USER
whoami
id
sudo su
whoami
id
exit
exit
whoami
id
vim /etc/locale.gen
locale-gen
vim /etc/vconsole.conf # KEYMAP=es
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
cat /etc/hostname
echo archost > /etc/hostname
cat !$
vim /etc/hosts # 127.0.0.1 localhost
pacman -S --noconfirm neofetch
neofetch
exit
reboot

ping -c 1 google.es
sudo systemctl start NetworkManager.service
sudo su
systemctl enable NetworkManager
ping -c 1 google.es
systemctl start wpa_supplicant.service
systemctl enable wpa_supplicant.service
pacman -S --noconfirm git
pwd
exit
whoami
pwd
mkdir -p Desktop/arch/repos
cd !$
pwd
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin/
ls
makepkg -si
mkdir blackarch
cd blackarch
curl -O https://blackarch.org/strap.sh
ls -l
chmod +x strap.sh
ls -l
sudo su
./strap.sh
pacman -Sy
pacman -Sgg | grep blackarch
pacman -Sgg | grep blackarch | awk '{print $1}'
pacman -Sgg | grep blackarch | awk '{print $1}' | sort -u | less
pacman -S --noconfirm xorg xorg-server
pacman -Syu
pacman -Syyu
pacman -S --noconfirm xorg xorg-server
# Instalación de escritorio Gnome
# Instalación de gestor de inicio de sesión GDM
pacman -S --noconfirm gnome
systemctl start gdm.service
sudo su
systemctl enable gdm.service
pacman -S --noconfirm kitty
reboot now

sudo su
pacman -S --noconfirm gtkmm open-vm-tools xf86-video-vmware xf86-input-vmmouse
systemctl enable vmtoolsd
reboot now
sudo su
pacman -S --noconfirm firefox
exit
firefox &

# From https://github.com/rxyhn/dotfiles
paru -S awesome-git picom-git alacritty rofi todo-bin acpi acpid \
    wireless_tools jq inotify-tools polkit-gnome xdotool xclip maim \
    brightnessctl alsa-utils alsa-tools pulseaudio lm_sensors \
    mpd mpc mpdris2 ncmpcpp playerctl --needed
paru -Sy

# For automatically launching mpd on login
systemctl --user enable mpd.service
mkdir ~/.config/mpd
cp /usr/share/doc/mpd/mpdconf.example ~/.config/mpd/mpd.conf
systemctl --user start mpd.service

# For charger plug/unplug events (if you have a battery)
sudo systemctl enable acpid.service
sudo systemctl start acpid.service 

# Download fonts from Iosevka, Icomoon y Material
sudo su
pacman -S --noconfirm wget p7zip
# Donwload Iosevka and unzip
# https://youtu.be/fshLf6u8B-w?t=2343
# wget http://fontlot.com/downfile/5baeb08d06494fc84dbe36210f6f0ad5.105610
# https://fontlot.com/105610/iosevka-font-family
cd ~/Downloads
unzip iosevka-font-family-1670059901-0.zip
mv *.ttf /usr/share/fonts
rm iosevka-font-family-1670059901-0.zip
cd /usr/share/fonts
ls

# Install Icomoon
# https://youtu.be/fshLf6u8B-w?t=2513
# https://dropbox.com/s/hrkub2yo9iapljz/icomoon.zip?dl=0
mv ~/Downloads/icomoon.zip .
unzip icomoon.zip 
mv icomoon/*.ttf .
rm -rf icomoon
exit

# Install other fonts
paru -S --noconfirm nerd-fonts-jetbrains-mono ttf-font-awesome ttf-font-awesome-4 ttf-material-design-icons
cd Desktop/arch/repos
git clone https://github.com/rxyhn/dotfiles.git
cd dotfiles
mkdir ~/.local/bin
cp -r config/* ~/.config
cp -r bin/* ~/.local/bin
cp -r misc/. ~/
sudo reboot now

# Awesome
cd ~/Desktop/arch/repos/dotfiles
git log | grep commit | grep "c1" | awk 'NR==3' | awk 'NF{print $NF}'
git checkout $(git log | grep commit | grep "c1" | awk 'NR==3' | awk 'NF{print $NF}')
ls
cp -r config/* ~/.config/
cp -r bin/* ~/.local/bin/
cp -r misc/ ~/
sudo reboot now

# https://youtu.be/fshLf6u8B-w?t=2846
sudo vim /etc/xdg/awesome/rc.lua
sudo pacman -S --noconfirm zsh
echo $SHELL
sudo usermod --shell  /usr/bin/zsh $USER
exit

# Set keymap to Spanish on zsh
localectl set-x11-keymap es
# Copy .zshrc from S4vitar blog
#https://youtu.be/fshLf6u8B-w?t=3176

# ZSH syntax highlighting and autosuggestions
paru -S --noconfirm zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete
sudo pacmans -S --noconfirm locate
sudo updatedb
# Edit ~/.zshrc
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Download sudo.plugin.zsh para que con ESC ESC meta sudo al principio
cd /usr/share
sudo mkdir zsh-sudo
sudo chown $USER:$USER zsh-sudo
cd zsh-sudo
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Install lsd (ls) y bat (cat) on steroids
sudo pacman -S --noconfirm lsd bat
# Para borrar archivos sin dejar rastro, tecnicas forense
paru -S --noconfirm scrub
which rmk
cd Desktop
touch file.txt
echo "hola" > file.txt
rmk file.txt

# Configurar fuente HackNerdFonts para la kitty
# Go to: https://www.nerdfonts.com/font-downloads
cd /usr/share/fonts
sudo mv ~/Downloads/Hack.zip .
sudo unzip Hack.zip
sudo rm Hack.zip

# Configurar las fuentes de kitty
cd ~/.config/kitty/
wget https://raw.githubusercontent.com/rxyhn/bspdots/main/config/kitty/kitty.conf
wget https://raw.githubusercontent.com/rxyhn/bspdots/main/config/kitty/color.ini
vim kitty.conf
# Cambiar fuente a HackNerdFont
# Cambiar tamaño fuente a 16
# url_color #61afef
# map ctrl+left neighboring_window left
# map ctrl+right neighboring_window right
# map ctrl+up neighboring_window up
# map ctrl+down neighboring_window down
#
# map f1 copy_to_buffer a
# map f2 paste_from_buffer a
# map f3 copy_to_buffer b
# map f4 paste_from_buffer b
# https://youtu.be/fshLf6u8B-w?t=3898

# Configurar el picom.conf
# Configurar fondo de pantalla con feh

# Configurar Power Level 10k
# https://youtu.be/fshLf6u8B-w?t=4674
firefox &> /dev/null &
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
zsh
nvim ~/.p10k.zsh
# Configure power line 10k
# Add to POWERLEVEL9K_LEFT_PROMTPT_ELEMENTS
# add: command_execution_time
# add: context
# add: status

# Configure root user
sudo ln -s -f $HOME/.zshrc /root/.zshrc
sudo su
# Configure zsh for root
usermod --shell /usr/bin/zsh root
# Download again power line 10k for root and configure
nvim ~/.p10k.zsh
# To reconfigure Power Line 10k use this: p10k configure
# ROOT_TEMPLATE
# CONTEXT_PREFIX

# Configure FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# Repeat for root
cd /
cat
# press CTRL+t
# press CTRL+r

# Install neovim
sudo pacman -S neovim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

# Configurar imágenes personalizadas en la barra
cd ~/.config/awsome/theme/assets/icons
kitty +kitten icat arch.jpg

# Configurar shortcuts teclado
nvim ~/.zshrc
# add: bindkey "^[[H" beggining-of-line
# add: bindkey "^[[F" end-of-line
# add: bindkey "^[[3~" delete-char
# add: bindkey "^[[1;3C" forward-word
# add: bindkey "^[[1;3D" backward-word

# Install more packets
# mdcat to open README files with beautiful syntax
sudo pacman -S mdcat

# Configure time zone
sudo timedatectl set-timezone Europe/Madrid

# Install and configure Qtile
# Instalación de escritorio Qtile
# Instalación de inicio de sesión lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo nvim /etc/lightdm/lightdm.conf
# uncomment: greeter-session=example-gtk-gnome
# change: greeter-session=lightdm-gtk-greeter
sudo systemctl enable lightdm.service
# Configure lightdm with glorious theme
sudo pacman -S lightdm-webkit2-greeter
paru -Syu lightdm-webkit2-theme-glorious
sudo nvim /etc/lightdm/lightdm.conf
# change: greeter-session = lightdm-webkit2-greeter
sudo nvim /etc/lightdm/lightdm-webkit2-greeter.conf
# edit: debug_mode = true
# edit: webkit_theme = glorious

# Install Qtile and other programs
sudo pacman -S qtile rofi which nitrogen ranger #code firefox xterm 
sudo pacman -S ttf-dejavu ttf-liberation noto-fonts
sudo pacman -S pulseaudio pavucontrol pamixer
sudo pacman -S arandr udiskie ntfs-3g network-manager-applet
sudo pacman -S volumeicon cbatticon xorg-xinit base-devel git thunar glib2 gvfs lxappearance geeqie vlc
# Super + Enter to open a terminal
arandr # Configure resolution
nvim .config/qtile/config.py # Configure default console kitty or alacritty
# Change lazy.spawn(terminal) for lazy.spawn("kitty")
# add in a new line: Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Open menu"),
# Super + Ctrl + r to reload config

sudo pacman -S screenkey # Instala un programa que muestra por pantalla las teclas pulsadas

# Instalar slim y slimlock en lugar de lightdm o gdm
#sudo pacman -S slim # libpam0g-dev libxrandr-dev libfreetype6-dev libimlib2-dev libxft-dev
#sudo nvim /etc/rc.conf
# edit: moused_enabled="yes"
# edit: slim_enabled="yes"
#sudo systemctl enable slim.service -f
# cd ~/Downloads/
# git clone https://github.com/joelburget/slimlock.git
# cd slimlock
# sudo make

# Install and configure grub-customizer
pacman -S grub-customizer


# Cambiar Qtile por bspwm (tiling window manager), sxhkd (X hotkey daemon) y picom (transparency, blur and rounded corners), polybar (barra de tareas)
# https://youtu.be/CivY-yfRBeY
# https://terminalroot.com.br/2021/06/como-instalar-e-configurar-o-bspwm-com-temas-para-polybar.html
# https://youtu.be/mHLwfI1nHHY
# https://youtu.be/mRY5qisOBhk
# https://www.youtube.com/watch?v=qXKM5K95WIc
# sudo apt install sxhkd # Execute programs using Keybindings
pacman -S bspwm sxhkd polybar rofi feh
paru -S picom-ibhagwan-git
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/polybar
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
cp /usr/share/doc/polybar/examples/config.ini ~/.config/polybar/
