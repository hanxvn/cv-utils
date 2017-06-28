#!/usr/bin/env bash
###################################
# Install Nvidia CUDA v8.0 & cuDNN
###################################
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
chmod +x cuda_8.0.61_375.26_linux-run
mkdir nvidia_installers
./cuda_8.0.61_375.26_linux-run -silent -extract=`pwd`/nvidia_installers

sudo apt-get install -y --no-install-recommends linux-source
sudo apt-get install -y --no-install-recommends linux-headers-`uname -r`
sudo ./nvidia_installers/NVIDIA-Linux-x86_64-375.26.run -s

nvidia-smi
sudo apt-get install nvidia-modprobe
sudo modprobe nvidia
sudo apt-get install build-essential
sudo ./nvidia_installers/cuda-linux64-rel-8.0.61-21551265.run -noprompt
sudo ./nvidia_installers/cuda-samples-linux-8.0.61-21551265.run -noprompt -prefix="/usr/local/cuda-8.0/samples" -cudaprefix="/usr/local/cuda-8.0"

echo "export PATH=$PATH:/usr/local/cuda-8.0/bin" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=:/usr/local/cuda-8.0/lib64" >> ~/.bashrc
sudo -s source ~/.bashrc
sudo ldconfig

sudo rm -r -f nvidia_installers
sudo rm -f cuda_8.0.61_375.26_linux-run

wget https://www.dropbox.com/s/zagbwlqwsehssxc/cudnn-8.0-linux-x64-v6.0.tgz
tar -zxf cudnn-8.0-linux-x64-v6.0.tgz
sudo cp ./cuda/lib64/* /usr/local/cuda/lib64/
sudo cp ./cuda/include/cudnn.h /usr/local/cuda/include/
sudo rm -f cudnn-8.0-linux-x64-v6.0.tgz
sudo rm -r -f cuda


