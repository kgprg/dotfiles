#!/bin/sh

# ensure ~/.fonts exists
if [ ! -d ~/.fonts ]; then
	mkdir ~/.fonts
fi

tar xzf gohufont-2.0.tar.gz
tar xzf artwiz-latin1-1.1.tgz

# create the pcf files
bdftopcf -o ~/.fonts/lemon.pcf ~/.fonts/lemon.bdf
bdftopcf -o ~/.fonts/uushi.pcf ~/.fonts/uushi.bdf
bdftopcf -o ~/.fonts/tewi/Tewi-bold-11.pcf ~/.fonts/tewi/Tewi-bold-11.bdf
bdftopcf -o ~/.fonts/tewi/Tewi-bold-11.pcf ~/.fonts/tewi/Tewi-normal-11.bdf

# install the fonts
#mkfontdir ~/.fonts
#mkfontdir ~/.fonts/gohufont-2.0
mkfontdir ~/.fonts/artwiz-latin1
#mkfontscale ~/.fonts
#mkfontscale ~/.fonts/gohufont-2.0
mkfontscale ~/.fonts/artwiz-latin1
#xset +fp ~/.fonts
#xset +fp ~/.fonts/gohufont-2.0
xset +fp ~/.fonts/artwiz-latin1
xset fp rehash
fc-cache -fv
#fc-cache -fv ~/.fonts/gohufont-2.0
fc-cache -fv ~/.fonts/artwiz-latin1

sudo dpkg-reconfigure fontconfig
sudo apt-get install unclutter  rxvt-unicode  compton ttf-dejavu-core

#Fixed the problem, had to edit xorg.conf to include the 
#artwiz-latin1-fonts folder. Works fine now, thanks for the help.
