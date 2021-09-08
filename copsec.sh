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
echo "a) Còpia de seguretat de 'MEGA'"
echo "b) Còpia de seguretat incremental de 'MEGA'"
echo "c) Recupera 'MEGA'"
echo
echo "***** THUNDERBIRD *****"
echo "d) Còpia de seguretat de 'THUNDERBIRD'"
echo "e) Còpia de seguretat incremental de 'THUNDERBIRD'"
echo "f) Recupera 'THUNDERBIRD'"
echo
echo "**** ZONADART ****"
echo "g) Còpia de seguretat de 'ZONADART'"
echo "h) Còpia de seguretat incremental de 'ZONADART'"
echo "i) Recupera 'ZONADART'"
echo
echo "***** ARDOUR *****"
echo "j) Còpia de seguretat de 'ARDOUR'"
echo "k) Còpia de seguretat incremental de 'ARDOUR'"
echo "l) Recupera 'ARDOUR'"
echo
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### MEGA 
a)
duplicity ~/MEGA file:///media/zonadart/EXTERN/mega_bak

sh $adr/sortida.sh
;;

############### MEGA incremental
b)
duplicity incremental ~/MEGA file:///media/zonadart/EXTERN/mega_bak

sh $adr/sortida.sh
;;

############### MEGA recupera
c)
duplicity file:///media/zonadart/EXTERN/mega_bak recupera

sh $adr/sortida.sh
;;

############### THUNDERBIRD
d)
duplicity ~/.thunderbird file:///media/zonadart/EXTERN/thunderbird_bak

sh $adr/sortida.sh
;;

############### THUNDERBIRD incremental
e)
duplicity incremental ~/.thunderbird file:///media/zonadart/EXTERN/thunderbird_bak

sh $adr/sortida.sh
;;

############### THUNDERBIRD recupera
f)
duplicity file:///media/zonadart/EXTERN/thunderbird_bak recupera

sh $adr/sortida.sh
;;

############### ZONADART
g)
duplicity /home/zonadart file:///media/zonadart/EXTERN/zonadart_bak --exclude ~/MEGA --exclude ~/.thunderbird

sh $adr/sortida.sh
;;

############### ZONADART incremental
h)
duplicity incremental /home/zonadart file:///media/zonadart/EXTERN/zonadart_bak --exclude ~/MEGA --exclude ~/.thunderbird --exclude ~/Ardour

sh $adr/sortida.sh
;;

############### ZONADART recupera
i)
duplicity file:///media/zonadart/EXTERN/zonadart_bak recupera

sh $adr/sortida.sh
;;

############### ARDOUR
j)
duplicity /home/zonadart/Ardour file:///media/zonadart/EXTERN/ardour_bak

sh $adr/sortida.sh
;;

############### ARDOUR incremental
k)
duplicity incremental /home/zonadart/Ardour file:///media/zonadart/EXTERN/ardour_bak

sh $adr/sortida.sh
;;

############### ARDOUR recupera
l)
duplicity file:///media/zonadart/EXTERN/ardour_bak recupera

sh $adr/sortida.sh
;;

################################################# Sortir
q)
sh $adr/sortida.sh
;;

########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
