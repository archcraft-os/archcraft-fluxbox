#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

## Rofi #############################################
DIR="$HOME/.fluxbox/rofi/themes"

# Get user confirmation 
get_confirmation() {
	rofi -dmenu -i \
		 -no-fixed-num-lines \
		 -p "Are You Sure? : " \
		 -theme "$DIR"/confirm.rasi
}

# Show message
show_msg() {
	rofi -theme "$DIR"/askpass.rasi -e "Options  -  yes / y / no / n"
}

## Options #############################################
if  [[ $1 = "--logout" ]]; then
	ans=$(get_confirmation &)
	if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        killall fluxbox
	elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
    else
		show_msg
    fi

elif  [[ $1 = "--suspend" ]]; then
	ans=$(get_confirmation &)
	if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
		mpc -q pause
		amixer set Master mute
		betterlockscreen --suspend
	elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
		exit
    else
		show_msg
    fi

elif  [[ $1 = "--reboot" ]]; then
	ans=$(get_confirmation &)
	if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        systemctl reboot
	elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
    else
		show_msg
    fi

elif  [[ $1 = "--shutdown" ]]; then
	ans=$(get_confirmation &)
	if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        systemctl poweroff
	elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
    else
		show_msg
    fi

## Help Menu #############################################
else
echo "
Powermenu For Openbox Menu
Developed By - Aditya Shakya (@adi1090x)

Available options:
--logout	--suspend	--reboot	--shutdown
"
fi
