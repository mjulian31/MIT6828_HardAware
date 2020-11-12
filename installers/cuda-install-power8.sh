#!/bin/bash

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/ppc64el/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/ppc64el/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/ppc64el/ /"
sudo apt-get update
sudo apt-get -y install cuda
