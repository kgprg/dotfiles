[[ -f ~/.Xresources ]] && xrdb  ~/.Xresources

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/custom/limey
xset +fp /usr/share/fonts/custom/lemon
xset +fp /usr/share/fonts/custom/uushi
xset +fp /usr/share/fonts/custom/suxus
xset +fp /usr/share/fonts/custom/tewi
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/yrmtmodded
xset fp rehash
wmname LG3D
#xcalib /home/kg/x230.icm &
xsetroot -cursor_name left_ptr &
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
unclutter -grab -noevents -root &
compton &
urxvtd &

if [[ -z `xrandr | grep " connected" | grep 'VGA'` ]]; then
        echo "No monitor found"
else
        xrandr --output VGA1 --auto --above LVDS1
        nitrogen --restore
fi

exec $1
