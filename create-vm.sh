#!/usr/bin/env bash
 

#########
# Script to create image-builder vm via virt-install
#########


## Define variables
MEM_SIZE=4096       # Memory setting in MiB
VCPUS=2             # CPU Cores count
OS_VARIANT="rhel9.1" # List with osinfo-query  os
ISO_FILE="/home/atos/rhel-baseos-9.1-x86_64-dvd.iso" # Path to ISO file

echo -en "Enter vm name: "
read VM_NAME
OS_TYPE="linux"
echo -en "Enter virtual disk size : "
read DISK_SIZE
 
chmod -R +x /home/atos

sudo virt-install \
     --name ${VM_NAME} \
     --memory=${MEM_SIZE} \
     --vcpus=${VCPUS} \
     --location ${ISO_FILE} \
     --disk size=${DISK_SIZE}  \
     --network bridge=virbr0 \
     --graphics=none \
     --os-variant=${OS_VARIANT} \
     --console pty,target_type=serial \
     --initrd-inject ks.cfg --extra-args "inst.ks=file:/ks.cfg console=tty0 console=ttyS0,115200n8"
     #--extra-args="ks=http://192.168.122.1/ks.cfg console=tty0 console=ttyS0,115200n8"