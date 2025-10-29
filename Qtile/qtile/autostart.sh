#!/bin/bash
#Fondos de pantalla
feh --bg-scale /home/antsoftware21/.config/qtile/wallpapers-y-iconos/Wallpaper.png &
bash ~/.screenlayout/1.sh
#Icono de Bateria y Volumen
cbatticon &
volumeicon &
conky -c ~/.conkyrc &
#Tray de Wifi y Bluetooth
nm-applet &
#Gestor de Privilegios de Administrador
lxpolkit &