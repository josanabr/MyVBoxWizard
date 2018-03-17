#!/bin/bash
#
# Este script presenta 4 tamanos de disco y el usuario selecciona uno de ellos
#
dialog --backtitle "Tamano disco" --radiolist "Tamanos" 0 0 0 1 512 on 2 2048 off 3 4096 off 4 8192 off 2> salida
HDSIZE=$(cat salida)
case ${HDSIZE} in
1)
  HDSIZE=512 
  ;;
2)
  HDSIZE=2048 
  ;;
3)
  HDSIZE=4096 
  ;;
4)
  HDSIZE=8192 
  ;;
esac
echo ${HDSIZE} > salida
