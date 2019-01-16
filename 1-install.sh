#!/bin/bash

###############################################################################

### Installing Arch Linux By: ###

### Erik Sundquist ###

###############################################################################

### Review and edit before using ###

###############################################################################



set -e

clear



echo "################################################################################"

echo "### Setting makepkg to use all cores ###"

echo "################################################################################"



sleep 2



nc=$(grep -c ^processor /proc/cpuinfo)





case $nc in



16)

echo "You have " $nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j16"/g' /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 16 -z -)/g' /etc/makepkg.conf

;;

8)

echo "You have " $nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j8"/g' /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 8 -z -)/g' /etc/makepkg.conf

;;

6)

echo "You have " $nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j6"/g' /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 6 -z -)/g' /etc/makepkg.conf

;;

4)

echo "You have " $nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j4"/g' /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 4 -z -)/g' /etc/makepkg.conf

;;

2)

echo "You have " $nc" cores."

echo "Changing the makeflags for "$nc" cores."

sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j2"/g' /etc/makepkg.conf

echo "Changing the compression settings for "$nc" cores."

sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 2 -z -)/g' /etc/makepkg.conf

;;

*)

echo "We do not know how many cores you have."

echo "Do it manually."

;;



esac

sleep 2

clear



echo "################################################################################"

echo "### Installing the fastest repos, this could take a while ###"

echo "################################################################################"



sleep 2



sudo pacman -S reflector --noconfirm --needed --asdeps

sudo reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

clear



echo "##########################################################################"

echo "### Installing needed packages ###"

echo "##########################################################################"



sleep 2



sudo pacman -Syyu --noconfirm --needed --asdeps

clear



echo "##########################################################################"

echo "1. Refresh repo keys"

echo "2. Do not refresh repo keys"

echo "##########################################################################"



read case;

case $case in

1)

echo "Refreshing software repo keys, this will take a while (recommended)"

sudo pacman-key --refresh-keys

;;

2)

echo "No key update performed"

;;

esac

sudo pacman -S --noconfirm --needed --asdeps neofetch git wget linux-headers rsync go htop

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si --noconfirm --needed --asdeps

cd ..

rm yay -R -f

clear



echo "##########################################################################"

echo "### Installing and setting up sound ###"

echo "##########################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pulseaudio pulseaudio-alsa pavucontrol alsa-utils alsa-plugins alsa-lib alsa-firmware lib32-alsa-lib lib32-alsa-oss lib32-alsa-plugins gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly volumeicon playerctl

clear



echo "################################################################################"

echo "### Installing and setting up bluetooth ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps pulseaudio-bluetooth bluez bluez-libs bluez-utils bluez-firmware blueberry

sudo systemctl enable bluetooth.service

sudo systemctl start bluetooth.service

sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

clear



echo "################################################################################"

echo "### Installing and setting up printers ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups hplip system-config-printer

yay -S --noconfirm --needed --asdeps epson-inkjet-printer-201211w

sudo systemctl enable org.cups.cupsd.service

clear



echo "################################################################################"

echo "### Installing Samba and network sharing ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps samba

sudo wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf

sudo sed -i -r 's/MYGROUP/WORKGROUP/' /etc/samba/smb.conf

sudo sed -i -r "s/Samba Server/$(hostname)/" /etc/samba/smb.conf

sudo systemctl enable smb.service

sudo systemctl start smb.service

sudo systemctl enable nmb.service

sudo systemctl start nmb.service



#Change your username here

sudo smbpasswd -a $(whoami)

sleep 2

#Access samba share windows

sudo pacman -S --noconfirm --needed --asdeps gvfs-smb avahi

sudo systemctl enable avahi-daemon.service

sudo systemctl start avahi-daemon.service

sudo pacman -S --noconfirm --needed --asdeps nss-mdns

sudo sed -i 's/dns/mdns dns wins/g' /etc/nsswitch.conf

#Set-up user sharing (disable this section if you dont want user shares)

sudo mkdir -p /var/lib/samba/usershares

sudo groupadd -r sambashare

sudo chown root:sambashare /var/lib/samba/usershares

sudo chmod 1770 /var/lib/samba/usershares

sudo sed -i -r '/\[global\]/a\username path = /var/lib/samba/usershares\nusershare max shares = 100\nusershare allow guests = yes\nusershare owner only = yes' /etc/samba/smb.conf

sudo gpasswd sambashare -a $(whoami)



clear



echo "################################################################################"

echo "### Installing extra fonts ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps adobe-source-sans-pro-fonts cantarell-fonts noto-fonts terminus-font ttf-bitstream-vera ttf-dejavu ttf-droid ttf-inconsolata ttf-liberation ttf-roboto ttf-ubuntu-font-family tamsyn-font

yay -S --noconfirm --needed --asdeps ttf-ms-fonts

clear



echo "################################################################################"

echo "### Installing fix the unicode problem ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps intel-ucode amd-ucode

clear



echo "################################################################################"

echo "### Install and setup display manager and desktop ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps xorg xorg-drivers xorg-xinit xterm



clear

echo "################################################################################"

echo "What is your preferred desktop environment"

echo "1) Deepin"

echo "2) Gnome"

echo "3) KDE Plasma"

echo "4) Mate"

echo "5) XFCE4"

echo "6) Budgie"

echo "7) Cinnamon"

echo "8) LXDE"

echo "9) LXQT"

echo "10) i3"

echo "11) None"

echo "################################################################################"

read case;



case $case in

1)

echo "You selected Deepin"

sudo pacman -S --noconfirm --needed --asdeps lightdm deepin deepin-extra gnome-disk-utility lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

2)

echo "You selected Gnome"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter gdm gnome gnome-extra jre8-openjdk jre8-openjdk-headless lightdm-gtk-greeter-settings nautilus-share

yay -S --noconfirm --needed --asdeps meow-bin

#sudo systemctl enable lightdm.service -f

#sudo systemctl set-default graphical.target

sudo systemctl enable gdm

;;

3)

echo "You selected KDE Plasma"

sudo pacman -S --noconfirm --needed --asdeps sddm lightdm lightdm-gtk-greeter plasma kde-applications gnome-disk-utility lightdm-gtk-greeter-settings redshift kvantum-qt5 kvantum-theme-adapta kvantum-theme-arc kvantum-theme-materia

#sudo systemctl enable lightdm.service -f

#sudo systemctl set-default graphical.target

sudo systemctl enable sddm

;;

4)

echo "You selected Mate"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter mate mate-extra gnome-disk-utility lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

5)

echo "You selected XFCE4"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter xfce4 xfce4-goodies gnome-disk-utility galculator lightdm-gtk-greeter-settings ark cairo-dock cairo-dock-plug-ins alacarte

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

6)

echo "You selected Budgie"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter budgie-desktop budgie-extras sakura gnome-system-monitor nemo gnome-disk-utility galculator gnome-control-center gnome-backgrounds lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

7)

echo "You selected Cinnamon"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter cinnamon sakura gnome-disk-utility lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

8)

echo "You selected LXDE"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter lxde gnome-disk-utility lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

9)

echo "You selected LXQT"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter lxqt gnome-disk-utility lightdm-gtk-greeter-settings compton

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

10)

echo "You selected i3"

sudo pacman -S --noconfirm --needed --asdeps lightdm lightdm-gtk-greeter i3 gnome-disk-utility lightdm-gtk-greeter-settings

sudo systemctl enable lightdm.service -f

sudo systemctl set-default graphical.target

;;

11)

echo "You selected none"

;;

esac



clear



echo "################################################################################"

echo "### Installing software center ###"

echo "################################################################################"



sleep 2



yay -S --noconfirm --needed --asdeps pamac



clear

echo "################################################################################"

echo "Do you have a nVidia graphics card"

echo "1) Yes"

echo "2) No"

echo "################################################################################"

read case;



case $case in

1)

echo "You selected Yes"

sudo pacman -S --noconfirm --needed --asdeps nvidia nvidia-cg-toolkit nvidia-settings nvidia-utils lib32-nvidia-cg-toolkit lib32-nvidia-utils lib32-opencl-nvidia opencl-nvidia cuda ffnvcodec-headers lib32-libvdpau libxnvctrl pycuda-headers python-pycuda python2-pycuda

sudo pacman -R --noconfirm xf86-video-nouveau

;;

2)

echo "You selected no"

;;

esac



clear



echo "################################################################################"

echo "### Installation completed, please reboot when ready ###"

echo "################################################################################"



sleep 2
