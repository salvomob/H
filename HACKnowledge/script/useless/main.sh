#!/bin/sh
#	AUTORE : Salvatore Maria Mobilia (Salvux)
#	DATA : 16/03/2021
#	TITOLO : main.sh
#	FUNZIONALITA' : main.sh richiama diversi altri script, tutti inseriti dentro la cartella script. Una volta finita l'esecuzione di tutti i sottoscript elimina 
#	la history e cancella tutto il superfluo
#	FILE CREATI: scriptlog.txt(Scrivania)--->> in esso saranno inseriti attraverso dei comandi echo e date tutti i diversi log dei vari script richiamato nel main.sh
#	FILE MODIFICATI : scriptlog.txt
my_path="/home/salvatore/Scrivania/script"
start=$SECONDS
cd ..
touch scriptlog.txt
echo "Script main avviato in data: " >> scriptlog.txt
date >> scriptlog.txt
sleep 5
cd ${my_path}
sleep 2
clear 
sleep 2
echo "Avviato main"
sleep 2
chmod +x script1.sh
./script1.sh
sleep 5
chmod +x script2.sh
./script2.sh
sleep 5
chmod +x script3.sh
./script3.sh
sleep 5
chmod +x script4.sh
./script4.sh
sleep 5
chmod +x script5.sh
./script5.sh
sleep 5
chmod +x script6.sh
./script6.sh
sleep 5
cd ${my_path}
cd ..
cd /home/salvatore/Scrivania
echo "Script main terminato in data: " >> scriptlog.txt
date >> scriptlog.txt
duration=$(( SECONDS - start ))
echo "totale secondi impiegati dall'inizio dello script:">>
echo $duration >>scriptlog.txt
sleep 5
cd /home/salvatore/Scrivania
#rm -r script
cat /dev/null > ~/.bash_history && history -c && exit
