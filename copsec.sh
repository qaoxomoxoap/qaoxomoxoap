#!/bin/bash - 
#===============================================================================
#
#          FILE:  copsec.sh
# 
#         USAGE:  ./copsec.sh 
# 
#   DESCRIPTION:  Sub-rutina de còpies de seguretat
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 17/08/21 11:49:04 CEST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
set -e
set -u

clear
#while :
#do
echo "M E N U :"
echo "========="
echo
echo "***** MEGA *****"
echo "a1) Còpia de seguretat de 'MEGA'"
echo "a2) Còpia de seguretat incremental de 'MEGA'"
echo "a3) Recupera 'MEGA'"
echo
echo "***** THUNDERBIRD *****"
echo "b1) Còpia de seguretat de 'THUNDERBIRD'"
echo "b2) Còpia de seguretat incremental de 'THUNDERBIRD'"
echo "b3) Recupera 'THUNDERBIRD'"
echo
echo "**** ZONADART ****"
echo "c1) Còpia de seguretat de 'ZONADART'"
echo "c2) Còpia de seguretat incremental de 'ZONADART'"
echo "c3) Recupera 'ZONADART'"
echo
echo "***** ARDOUR *****"
echo "d1) Còpia de seguretat de 'ARDOUR'"
echo "d2) Còpia de seguretat incremental de 'ARDOUR'"
echo "d3) Recupera 'ARDOUR'"
echo
echo "***** DOCUMENTS *****"
echo "e1) Còpia de seguretat de 'DOCUMENTS'"
echo "e2) Còpia de seguretat incremental de 'DOCUMENTS'"
echo "e3) Recupera 'DOCUMENTS'"
echo
echo "***** FILMS *****"
echo "f1) Còpia de seguretat de 'FILMS'"
echo "f2) Còpia de seguretat incremental de 'FILMS'"
echo "f3) Recupera 'FILMS'"
echo
echo "***** CONFIG *****"
echo "g1) Còpia de seguretat de 'CONFIG'"
echo "g2) Còpia de seguretat incremental de 'CONFIG'"
echo "g3) Recupera 'CONFIG'"
echo
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### MEGA 
a1)
duplicity ~/MEGA file:///media/zonadart/EXTERN/mega_bak

sh $adr/sortida.sh
;;

############### MEGA incremental
a2)
duplicity incremental ~/MEGA file:///media/zonadart/EXTERN/mega_bak

sh $adr/sortida.sh
;;

############### MEGA recupera
a3)
duplicity file:///media/zonadart/EXTERN/mega_bak recupera_mega

sh $adr/sortida.sh
;;

############### THUNDERBIRD
b1)
duplicity ~/.thunderbird file:///media/zonadart/EXTERN/thunderbird_bak

sh $adr/sortida.sh
;;

############### THUNDERBIRD incremental
b2)
duplicity incremental ~/.thunderbird file:///media/zonadart/EXTERN/thunderbird_bak

sh $adr/sortida.sh
;;

############### THUNDERBIRD recupera
b3)
duplicity file:///media/zonadart/EXTERN/thunderbird_bak recupera_thunderbird

sh $adr/sortida.sh
;;

############### ZONADART
c1)
duplicity /home/zonadart file:///media/zonadart/EXTERN/zonadart_bak --exclude ~/MEGA --exclude ~/.thunderbird --exclude ~/Ardour --exclude ~/Documents

sh $adr/sortida.sh
;;

############### ZONADART incremental
c2)
duplicity incremental /home/zonadart file:///media/zonadart/EXTERN/zonadart_bak --exclude ~/MEGA --exclude ~/.thunderbird --exclude ~/Ardour --exclude ~/Documents

sh $adr/sortida.sh
;;

############### ZONADART recupera
c3)
duplicity file:///media/zonadart/EXTERN/zonadart_bak recupera_zonadart

sh $adr/sortida.sh
;;

############### ARDOUR
d1)
duplicity /home/zonadart/Ardour file:///media/zonadart/EXTERN/ardour_bak

sh $adr/sortida.sh
;;

############### ARDOUR incremental
d2)
duplicity incremental /home/zonadart/Ardour file:///media/zonadart/EXTERN/ardour_bak

sh $adr/sortida.sh
;;

############### ARDOUR recupera
d3)
duplicity file:///media/zonadart/EXTERN/ardour_bak recupera_ardour

sh $adr/sortida.sh
;;

############### DOCUMENTS
e1)
duplicity /home/zonadart/Documents file:///media/zonadart/EXTERN/documents_bak

sh $adr/sortida.sh
;;

############### DOCUMENTS incremental
e2)
duplicity incremental /home/zonadart/Documents file:///media/zonadart/EXTERN/documents_bak

sh $adr/sortida.sh
;;

############### DOCUMENTS recupera
e3)
duplicity file:///media/zonadart/EXTERN/documents_bak recupera_documents

sh $adr/sortida.sh
;;

############## FILMS
f1)
duplicity /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS incremental
f2)
duplicity incremental /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS recupera
f3)
duplicity file:///media/zonadart/EXTERN/films_bak recupera_films

sh $adr/sortida.sh
;;

############## CONFIG
g1)
duplicity /home/zonadart/.config file:///media/zonadart/EXTERN/config_bak

sh $adr/sortida.sh
;;

############### CONFIG incremental
g2)
duplicity incremental /home/zonadart/.config file:///media/zonadart/EXTERN/config_bak

sh $adr/sortida.sh
;;

############### CONFIG recupera
g3)
duplicity file:///media/zonadart/EXTERN/config_bak recupera_films

sh $adr/sortida.sh
;;

################################################# Sortir
q)
sh $adr/sortida.sh
;;
########### Opció invàlida
############## FILMS
f1)
duplicity /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS incremental
f2)
duplicity incremental /home/Films file:///media/zonadart/EXTERN/films_bak

sh $adr/sortida.sh
;;

############### FILMS recupera
f3)
duplicity file:///media/zonadart/EXTERN/films_bak recupera_films

sh $adr/sortida.sh
;;*)
echo Opció invàlida
###########################################################
esac
