#!/usr/bin/env bash
###################################
# Install Nvidia CUDA v8.0 & cuDNN
###################################

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends build-essential


echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "blacklist lbm-nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "alias nouveau off" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "alias lbm-nouveau off" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
sudo update-initramfs -u

sudo reboot


