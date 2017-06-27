#!/usr/bin/env bash
###############################
# Set up all the neccessary libraries to run dlib
###############################
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y --no-install-recommends build-essential
sudo apt-get install zip

sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev

sudo apt-get install libatlas-base-dev

sudo apt-get install python-dev python-pip python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose

sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

sudo apt-get install libopencv-dev python-opencv

sudo apt-get install cmake

sudo apt-get install python-skimage

sudo apt-get install python-protobuf

cd ..
wget http://dlib.net/files/dlib-19.4.tar.bz2
tar xvf dlib-19.4.tar.bz2
cd dlib-19.4/
mkdir build
cd build
cmake ..
cmake --build . --config Release
sudo make install
sudo ldconfig
cd ..
sudo python setup.py install
