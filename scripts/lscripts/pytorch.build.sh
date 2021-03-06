#!/bin/bash

##----------------------------------------------------------
### Developer: Saqib Mobin
##----------------------------------------------------------

## Download and install anaconda

user=$(whoami)
dir="/home/${user}/Downloads"
url="https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh"
filename=$(echo ${url} | cut -d "/" -f 5)
lscripts="/codehub/scripts/lscripts"
pytorch_dir="/codehub/external/pytorch"

echo wget ${url} -P ${dir}
wget ${url} -P ${dir}

echo chmod +x ${dir}/${filename}
chmod +x ${dir}/${filename}

echo ${dir}/${filename}
${dir}/${filename}

source ~/.bashrc

##PyTorch dependencies

conda install numpy ninja pyyaml mkl mkl-include setuptools cmake cffi
conda install -c pytorch magma-cuda100 # or [magma-cuda92 | magma-cuda90 | magma-cuda101 ] depending on your cuda version

git clone --recursive https://github.com/pytorch/pytorch ${pytorch_dir}

cd ${pytorch_dir}

## if you are updating an existing checkout
# git submodule sync
# git submodule update --init --recursive

##Run this if installation fails
# python setup.py clean

##Build PyTorch

export CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"}

# Specify TORCH_CUDA_ARCH_LIST based on compute capability of GPU. Can be found in deviceQuery in cuda samples.
TORCH_CUDA_ARCH_LIST="3.5" python setup.py install

cd /
source ~/.bashrc

##Torchvision build from source

source ${lscripts}/torchvision.install.sh