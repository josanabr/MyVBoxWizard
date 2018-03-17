#!/bin/bash
#
# Este script permite la seleccion del tipo de sistema operativo para 
# la maquina virtual
#
dialog --backtitle "Tipo de Linux" --radiolist "Seleccione un tipo de sist. Linux:" 10 40 4 1 Linux24_64 on 2 Linux26 off 3 ArchLinux off 4 ArchLinux_64 off 2>salida
SELECTED=$(cat salida)
if [ ${SELECTED} -eq 1 ]; then
  echo "Linux24_64" > salida
elif [ ${SELECTED} -eq 2 ]; then
  echo "Linux26" > salida
elif [ ${SELECTED} -eq 3 ]; then
  echo "ArchLinux" > salida
else 
  echo "ArchLinux_64" > salida
fi
