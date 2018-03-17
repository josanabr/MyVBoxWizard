#!/bin/bash
#
# Este script permite la seleccion del numero de nucleos que quiero asignar a
# mi maquina virtual
#
NUMCORES=$(cat /proc/cpuinfo | grep Processor | wc -l) 
NUMCORES=$(( NUMCORES/2 ))
NCORE="dialog --backtitle \"Num CPU\" --radiolist \"Seleccion num cpus:\" 10 40 4" 
for i in $(seq 1 1 ${NUMCORES}); do
	NCORE="${NCORE} ${i} ${i} off"
done
NCORE="${NCORE} 2> salida"
eval ${NCORE}
