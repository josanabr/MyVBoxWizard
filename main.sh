#!/bin/bash
# Este script es mi wizard
#
# Colectar los datos de la maquina virtual
./vmnombre.sh
VMNAME=$(cat salida)
./ncore.sh 
NUMCORES=$(cat salida)
./ostype.sh
OSTYPE=$(cat salida)
./hd.sh
HDSIZE=$(cat salida)
./mem.sh
MEMSIZE=$(cat salida)
# Lineas que ejecutaran los comandos de VBoxManage para crear la maquina virtual
VBoxManage createvm --name ${VMNAME} --ostype ${OSTYPE} --register
VBoxManage modifyvm ${VMNAME} --memory ${MEMSIZE}
VBoxManage modifyvm ${VMNAME} --cpus ${NUMCORES}
VBoxManage createhd --filename VirtualBox\ VMs/${VMNAME}/${VMNAME}.vdi --size ${HDSIZE} --format VDI
VBoxManage storagectl ${VMNAME} --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach ${VMNAME} --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium VirtualBox\ VMs/${VMNAME}/${VMNAME}.vdi
