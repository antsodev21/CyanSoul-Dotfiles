#!/bin/bash
dialog --menu "Que distribucion estas usando ?" 15 50 4 \
1 "Debian" \
2 "Void Linux" \
3 "Arch" \
4 "Salir del Script" 2>Distros.txt

# Esto lee las opciones seleccionadas
opcion=$(cat Distros.txt)

case $opcion in
1)
    echo "Instalando Dependencias de Debian...."
    sudo apt install playerctl conky-all papirus-icon-theme blueman network-manager-applet rofi dunst scrot cbatticon volumeicon-alsa feh alacritty nemo lxappearance pavucontrol xarchiver python3-psutil arandr lxpolkit pamixer zip unzip
    echo "Dependencias Instaladas !!"
    ;;
2)
    echo "Instalando Dependencias de Void...."
    sudo xbps-install playerctl conky papirus-icon-theme blueman network-manager-applet rofi dunst scrot cbatticon volumeicon feh alacritty nemo lxappearance pavucontrol xarchiver python3-psutil arandr pamixer zip unzip lxsession
    echo "Dependencias Instaladas !!"
    ;;
3)
    echo "Instalando Dependencias de Arch...."
    sudo pacman -S playerctl conky papirus-icon-theme blueman network-manager-applet rofi dunst scrot cbatticon volumeicon feh alacritty nemo lxappearance pavucontrol xarchiver python-psutil arandr pamixer zip unzip lxsession
    echo "Dependencias Instaladas !!"
    ;;
4)
    echo "Saliendo...."
    exit 0
    ;;
*)
    exit 0
    ;;

esac

echo "Copiando archivos a ~/.config"
sudo rm-rf ~/.config/alacritty
cp -r alacritty/ ~/.config
sudo rm -rf ~/.config/qtile
cp -r qtile/ ~/.config
sudo rm -rf ~/.config/rofi
cp -r rofi/ ~/.config
sudo chmod +x ~/.config/qtile/autostart.sh
cp .conkyrc ~/
echo "Listo!!"

echo "Instalando Fuentes"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip
mkdir fonts
unzip JetBrainsMono.zip -d fonts/
unzip NerdFontsSymbolsOnly.zip -d fonts/
cd fonts/

case $opcion in
1)
    echo "Instalando Fuentes...."
    sudo cp *.ttf /usr/share/fonts/truetype/
    ;;
2)
    echo "Instalando Fuentes...."
    sudo cp *.ttf /usr/share/fonts/TTF/
    ;;
3)  echo "Instalando Fuentes...."
    sudo pacman -Syu nerd-fonts
    ;;

esac

echo "Todo Listo :DDD"

