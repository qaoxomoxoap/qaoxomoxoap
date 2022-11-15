#!/bin/bash - 
#===============================================================================
#
#          FILE:  compt.sh
# 
#         USAGE:  ./sec.sh 
# 
#   DESCRIPTION:  Sub-rutina de seguretat
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
echo "***** SEGURETAT *****"
echo "a) Còpia de seguretat dels fitxers de sistema"
echo "b) Desencriptar fitxer"
echo "c) Ecriptar fitxer"
echo "d) Còpia de seguretat de KeePassXC - MEGA"
echo "e) Còpia de seguretat de MEGA - KeePassXC"
echo "f) Esborrar fitxer o carpeta de forma segura"
echo "g) Executar hBlock"
echo "h) Còpia de seguretat de Films"
echo "i) Actualitzar la base de dades de ClamAV"
echo "**********"
echo
echo "q) Sortir"
echo
echo "**********"

read opcio

case $opcio in

############### Còpia de seguretat dels fitxers de sistema 
a)
cp /etc/fstab $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/minidlna.conf $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp -R /etc/apache2/sites-available $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp -R /etc/apache2/mods-available $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/default/grub $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/hosts $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
cp /etc/prelink.conf $HOME/MEGA/MEGAsync/zonadart/documents/configuracions/debian/system/.
sh $adr/sortida.sh
;;

############### Desencriptar fitxer
b)
ls -1 $PWD/*.gpg
echo -n "Introdueïx nom del fitxer a desencriptar ('q' per sortir): "
read filori
if [ "$filori" = "q" ]; then
  exit
fi
filenc=${filori%%.*}
gpg --output $filenc --decrypt $filori
sh $adr/sortida.sh
;;

############### Encriptar fitxer
c)
ls -1 $PWD
echo -n "Introdueïx nom del fitxer a encriptar ('q' per sortir): "
read filenc
if [ "$filenc" = "q" ]; then
  exit
fi
readonly filenca=$filenc".gpg"
#echo -n "E-Mail: "
#read mail
readonly correu="zonadart@autistici.org"
#read filori
gpg --output $filenca --encrypt --recipient $correu $filenc
#shred -u $filori
sh $adr/sortida.sh
;;

############### Còpia de seguretat de Keepassxc - MEGA
d)
rsync -vazh $HOME/.config/keepassxc/zonadart.kdbx $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
rsync -vazh $HOME/.config/keepassxc/keepassxc.ini $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
rsync -vazh $HOME/.config/keepassxc/zonadart.kdbx /media/zonadart/EXTERNW/keepassxc/
sh $adr/sortida.sh
;;

############### Còpia de seguretat de MEGA - Keepassxc
e)
#rsync -vazh $HOME/.config/keepassxc/angels_db.kdbx $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
#rsync -vazh $HOME/.config/keepassxc/keepassxc.ini $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/
#rsync -vazh $HOME/.config/keepassxc/angels_db.kdbx /media/zonadart/EXTERNW/keepassxc/
#mega-login angelsgomro@gmail.com MVNyvUC20v6S
#mega-cd documents/keepassxc/
#mega-rm angels_db.kdbx
#mega-put -c '/home/zonadart/.config/keepassxc/angels_db.kdbx'
#mega-ls
#mega-logout
rsync -vazh $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/zonadart.kdbx $HOME/.config/keepassxc/
rsync -vazh $HOME/MEGA/MEGAsync/$USER/documents/configuracions/keepassxc/keepassxc.ini $HOME/.config/keepassxc/
sh $adr/sortida.sh
;;

############### Esbmt=single-columnrrar fitxer de forma segura
f)
ls -1 $PWD
echo -n "Introdueïx nom del fitxer a esborrar ('q' per sortir): "
read caput
if [ "$caput" = "q" ]; then
  exit
fi
#shred -n 10 -uvz $caput
wipe -rfi $caput
sh $adr/sortida.sh
;;

############### Executar hBlock
g)
npx hblock
sh $adr/sortida.sh
;;

############### Copia seguretat de Films
h)
sh $adr/copsec.sh
#sh $adr/sortida.sh
;;

############### Actualitzar bases de dades de ClamAV
i)
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
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
