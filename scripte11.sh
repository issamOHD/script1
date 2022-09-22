#!/bin/bash



if [ $# -lt 1 ]
then
  echo "Il faut au moins un argument : $0 file..."
  exit 1
fi
# verification si il y a bien au moins 1 argument $#=nombre d'argument ; exit 1 appel systeme

count_lines () {
  local f=$1  
  l=`wc -l $f | sed 's/^\([0-9]*\).*$/\1/'`
}
# compte le nombre de ligne dans le fichier f 
# | redirection redirige la sortie de gauche a l'entrer de droit 


l=0
        count_lines $1
        echo "$1: $l"
echo "$l lignes au total"
#compte les lignes dans le fichier 


echo "PID du processus courant : $$"
trap 'echo coucou SIGALRM' SIGALRM
sleep 5
kill -SIGALRM $$
# PID: processus ID $$ permet d'avoir ID du processus id processus = script
#trap associe une action a un signal
#kill permet d'envoyer un signal a un processus
#Permet de gérer la réception d'un signal SIGALRM

function ajouterfichier {
	echo "Combien de lignes souhaitez-vous ajouter au fichier ?"
	read NOMBRE

	lignes=()

	for i in $(seq 1 $NOMBRE)
	do
		echo "Veuillez entrer la ligne numéro $i"
		read VARIABLE
		lignes+=("$VARIABLE")
	done
	
	echo ${lignes[@]} >> file
}
#
ajouterfichier

exit 0

#Fonction permettant d'ajouter du contenu à un fichier en CLI à l'aide d'un tableau
