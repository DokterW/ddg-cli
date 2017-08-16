#!/bin/bash
# ddg-cli v0.1
# Made by Dr. Waldijk
# DuckDuckGo cli.
# Read the README.md for more info, but you will find more info here below.
# By running this script you agree to the license terms.
# -----------------------------------------------------------------------------------
read -p "> " DDGSRCH
echo ""
DDGSRCH=$(echo $DDGSRCH | sed -r 's/ /+/')
DDGRSLT=$(lynx -dump -nolist "https://duckduckgo.com/?q=$DDGSRCH" | tail -n +13 | sed -r 's/^ +//g' | sed -r 's/(^.*\/)/https:\/\/\1/g' | tr '\n' ' ' | sed -r 's/([0-9]\.  )/\n\1/g' | sed -r 's/(https:.*)/\n\1/g' | tail -n +2 | sed -n '1,10p')
echo "$DDGRSLT"
echo ""
read -p "> " -s -n1 DDGKEY
case "$DDGKEY" in
    1)
        DDGURL=$(echo "$DDGRSLT" | sed -n '2p')
        xdg-open $DDGURL
        echo ""
    ;;
    2)
        DDGURL=$(echo "$DDGRSLT" | sed -n '4p')
        xdg-open $DDGURL
        echo ""
    ;;
    3)
        DDGURL=$(echo "$DDGRSLT" | sed -n '6p')
        xdg-open $DDGURL
        echo ""
    ;;
    4)
        DDGURL=$(echo "$DDGRSLT" | sed -n '8p')
        xdg-open $DDGURL
        echo ""
    ;;
    5)
        DDGURL=$(echo "$DDGRSLT" | sed -n '10p')
        xdg-open $DDGURL
        echo ""
    ;;
    *)
        echo "Wrong option!"
    ;;
esac
