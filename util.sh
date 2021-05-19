#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./util.sh 
# 
#   DESCRIPTION:  Sub-rutina de utilitats
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
set -eu

clear
#while :
#do
echo "M E N U :"
echo "========="
echo
echo "***** UTILITATS *****"
echo "a) Mostrar almanaq"
echo "b) Muntar imatge encriptada dades"
echo "c) Desmuntar imatge encriptada dades"
echo "d) Optimitzar pdf"
echo "e) Calcular número pi"
echo "f) youtube-dl - Descàrrega de videos de Youtube"
echo "g) Pel·lícula per MPV"
echo "h) Generar còdig QR"
echo "i) Generar música pel DACIA"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

i)
echo -n "Introdueïx nom del mp3 ('q' per sortir): "
read disc
if [ "$disc" = "q" ]; then
  exit
fi
cat *.mp3 > $disc.mp3
mp3val $disc.mp3 -f -nb
echo
sh $adr/sortida.sh
;;

############### Generar codi QR
h)
echo -n "Introdueix missatge a generar QR ('q' per sortir): "
read qr
if [ "$qr" = "q" ]; then
  exit
fi
curl qrenco.de/$qr
echo
echo "Missatge QR generat"
sh $adr/sortida.sh
;;
############### Pel·lícula per MPV
g)
ls -1 *
echo -n "Introdueïx la pel·licula a veure ('q' per sortir): "
read peli
if [ "$peli" = "q" ]; then
  exit
fi
mpv $peli
echo
sh $adr/sortida.sh
;;

############### Pi
e)
echo -n "Introdueïx número de decimals ('q' per sortir): "
read num
if [ "$num" = "q" ]; then
    exit
  fi
time echo "scale=$num; a(1)*4" | bc -l
sh $adr/sortida.sh
;;

############### Desmuntar cryptical
c)
#7z a -mhe=on -p /home/zonadart/crypt/dades.7z /home/zonadart/crypt/dades
#chown zonadart:zonadart /home/zonadart/crypt/dades.7z
#rm /home/zonadart/Nextcloud/Documents/dades.7z
#mv /home/zonadart/crypt/dades.7z /home/zonadart/Nextcloud/Documents/.
sudo cryptmount -u tutankamon
sh $adr/sortida.sh
;;

############### Muntar cryptical. Paquet crypmount
b)
sudo cryptmount -m tutankamon
echo -n "$HOME/tutankamon"
sh $adr/sortida.sh
;;

###############  youtube-dl
f)
echo -n "Introdueïx l'adreça del youtube ('q' per sortir): "
read video
if [ "$video" = "q" ]; then
  exit
fi
youtube-dl $video
echo
echo "Vídeo descarregat correctament"
sh $adr/sortida.sh
;;

############### Optimitzar pdf
d)
ls -1 *.pdf
echo -n "Introdueïx nom del pdf a optimitzar ('q' per sortir): "
read fitxer
if [ "$fitxer" = "q" ]; then
  exit
fi
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=optimizado.pdf $fitxer
echo
echo "Fitxer pdf optimitzat correctament"
sh $adr/sortida.sh
;;

############### ALMANAQ
a)
ncal -3
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
#done
