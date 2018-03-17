#!/bin/bash
# Este script toma el nombre que se le asigna a la maquina virtual
#
# Un ciclo infinito hasta que el usuario seleccione un nombre de maquina
# que no este definido en las maquinas asociadas al usuario
while [ 1 ]; do
  dialog --inputbox "Digite nombre de la maquina:" 8 40 2> salida
  VMNAME=$(cat salida)
  if [ "${VMNAME}" == "" ]; then
    break
  fi
  VBoxManage list vms | grep ${VMNAME} 
  if [ $? -eq 1 ]; then
    break
  fi
done
