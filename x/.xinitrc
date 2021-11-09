#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresourecs=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [[ -f $sysresourecs ]]
then
    xrdb -merge $sysresourecs
fi

if [[ -f $userresources ]]
then
    xrdb -merge $userresources
fi

if [[ -f $usermodmap ]]
then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [[ -d /etc/X11/xinit/xinitrc.d ]]
then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh 
    do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

nitrogen --restore &
picom -f &
qtile start
