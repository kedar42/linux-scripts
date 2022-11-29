#!/bin/bash
# todo add yes as default option
read -p "Do you want to create storage on separate partition (Experimental probably will BREAK your pc) ? [Y/n]: " YN
case $YN in
    [Nn]* ) exit 0;;
    * ) echo "Prociding";;
esac

sudo mkdir /storage
lsblk
read -p "Please select which partition to mount: " PARTITION
sudo mount /dev/"$PARTITION" /storage
sudo mkdir /storage/kedar
sudo chown kedar /storage/kedar
ln -fsT /storage/kedar ~/Storage
sudo umount /storage
NUMBER=$(lsblk "/dev/$PARTITION" -nr -o UUID)
echo UUID="${NUMBER}" /storage ext4 defaults 0 2 | sudo tee -a /etc/fstab