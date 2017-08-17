#!/bin/bash
# ddg-cli v0.2
# Made by Dr. Waldijk
# DuckDuckGo cli.
# Read the README.md for more info, but you will find more info here below.
# By running this script you agree to the license terms.
# Config ----------------------------------------------------------------------------
DDGNAM="ddg-cli"
DDGVER="0.2"
# Install dependencies --------------------------------------------------------------
if [ ! -e /usr/bin/lynx ]; then
    DDGOSD=$(cat /etc/system-release | grep -oE '^[A-Z][a-z]+\s' | sed '1s/\s//')
    if [ "$DDGOSD" = "Fedora" ]; then
        sudo dnf -y install lynx
    else
        echo "You need to install lynx."
        exit
    fi
fi
# -----------------------------------------------------------------------------------
read -p "> " DDGSRCH
echo ""
DDGSRCH=$(echo $DDGSRCH | sed -r 's/ /+/')
DDGRSLT=$(lynx -dump -nolist "https://duckduckgo.com/?q=$DDGSRCH" | tail -n +13 | sed -r 's/^ +//g' | sed -r 's/(^.*\/)/https:\/\/\1/g' | tr '\n' ' ' | sed -r 's/([0-9]\.  )/\n\1/g' | sed -r 's/(https:.*)/\n\1/g' | tail -n +2 | sed -n '1,10p')
echo "$DDGRSLT"
echo ""
read -p "> " -s -n1 DDGKEY
if [[ "$DDGKEY" -ge "1" && "$DDGKEY" -le "5" ]]; then
    DDGLIN=$(echo "2*$DDGKEY" | bc)
    DDGURL=$(echo "$DDGRSLT" | sed -n "$DDGLIN p")
    xdg-open $DDGURL
    echo ""
else
    echo "Wrong option!"
fi
