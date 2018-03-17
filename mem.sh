#!/bin/bash
#
# Este script presenta 4 tamanos de disco y el usuario selecciona uno de ellos
#
dialog --backtitle "Tamano en RAM" --radiolist "Porcentaje" 0 0 0 1 "10%" on 2 "25%" off 3 "50%" off 4 "70%" off 2> salida
MEMSIZE=$(cat salida)
case ${MEMSIZE} in
1)
  MEMSIZE=10 
  ;;
2)
  MEMSIZE=25 
  ;;
3)
  MEMSIZE=50 
  ;;
4)
  MEMSIZE=70 
  ;;
esac
TMEM=$(free -m | grep Mem | awk '{print $2}')
MEMSIZE=$(( TMEM*MEMSIZE/100 ))
echo ${MEMSIZE} > salida
