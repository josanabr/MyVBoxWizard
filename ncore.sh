#!/bin/bash
NCORE="dialog --backtitle \"Num CPU\" --radiolist \"Seleccion num cpus:\" 10 40 4"
for i in $(seq 1 1 2); do
NCORE="${NCORE} ${i} ${i} off"
done
NCORE="${NCORE} 2> salida"
eval ${NCORE}
