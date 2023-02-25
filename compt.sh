#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./compt.sh 
# 
#   DESCRIPTION:  Sub-rutina de comptabilitat
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Gonçal Sallan i Baso (gsb), zonadart@autistici.org
#       COMPANY: Zona d_Art
#       CREATED: 03/07/18 11:49:04 CEST
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
echo "***** COMPTABILITAT *****"
echo "a) Esborrar copia de seguretat sobrant abanq"
echo "b) Restaurar copia de seguretat abanq"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Gestionar copia de seguretat Eneboo abanq
a)
echo
mv $HOME/*.sql $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/.
for i in $(ls -1 $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/*.sql)
do
echo $i
done
echo
echo -n "S'esborrarà fitxer ('q' per sortir): "
echo
read copy
if [ "$copy" = "q" ]; then
  exit
fi
fitxer=`ls $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/*.sql | head -1`
###
# check that file exists or exit
if [ ! -f $fitxer ]; then
    echo "No existeix cap fitxer"
    exit
fi
###
echo "El fitxer a esborrar es: $fitxer"
rm -i $fitxer
echo "Copia de Seguretat Esborrada Correctament"
echo
sh $adr/sortida.sh
;;

############### Restaurar copia de seguretat Eneboo abanq
b)
echo
echo -n "Procedir a restaurar còpia de seguretat ('q' per sortir):"
read seguretat
if [ "$seguretat" = "q" ]; then
  exit
fi
fitxer=`ls $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/*.sql | tail -1`
echo "La còpia de seguretat a restaurar es: $fitxer"
read copia
if [ "$copia" = "q" ]; then
  exit
fi
dropdb -i abanq -U zonadart
createdb abanq -U zonadart -E UNICODE
psql -d abanq -U zonadart -f $fitxer
echo
echo "Base Restaurada Correctament"
echo
sh $adr/sortida.sh
;;

############### Gestionar copia de seguretat Eneboo clotes
#b)
#echo
#mv $HOME/*.sql $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/clotes/.
#for i in $(ls -1 $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/clotes/*.sql)
#do
#echo $i
#done
#echo
#echo -n "S'esborrarà fitxer ('q' per sortir): "
#echo
#read copy
#if [ "$copy" = "q" ]; then
#  exit
#fi
#fitxer=`ls $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/clotes/*.sql | head -1`
#echo "El fitxer a esborrar es: $fitxer"
#rm -i $fitxer
#echo "Copia de Seguretat Esborrada Correctament"
#echo
#sh $adr/sortida.sh
#;;

############### Restaurar copia de seguretat Eneboo clotes
#d)
#echo
#echo -n "Procedir a restaurar còpia de seguretat ('q' per sortir):"
#read seguretat
#if [ "$seguretat" = "q" ]; then
#  exit
#fi
#fitxer=`ls $HOME/MEGA/MEGAsync/zonadart/documents/sec/comptabilitat/clotes/*.sql | tail -1`
#echo "La còpia de seguretat a restaurar es: $fitxer"
#read copia
#if [ "$copia" = "q" ]; then
#  exit
#fi
#dropdb -i clotes -U zonadart
#createdb clotes -U zonadart -E UNICODE
#psql -d clotes -U zonadart -f $fitxer
#echo
#echo "Base Restaurada Correctament"
#echo
#sh $adr/sortida.sh
#;;

################################################# Sortir
q)
sh $adr/sortida.sh
;;
########### Opció invàlida
*)
echo Opció invàlida
###########################################################
esac
#done
