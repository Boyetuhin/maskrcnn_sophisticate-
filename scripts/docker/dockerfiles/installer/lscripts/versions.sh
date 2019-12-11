#!/bin/bash

##----------------------------------------------------------
### version - version variables for the installed softwares
## Tested on Ubuntu 16.04 LTS, Ubuntu 18.04 LTS, Kali Linux 2019.1
##----------------------------------------------------------
#
## NOTE: Last one is what is used if not commented#
#
##----------------------------------------------------------


##----------------------------------------------------------
## Nvidia GPU Driver
##----------------------------------------------------------
NVIDIA_DRIVER_VER="387.22"
NVIDIA_DRIVER_VER="390.42"
NVIDIA_DRIVER_VER="390"

## default value for Ubuntu-18.04 LTS, CUDA 10 and tf 1.14 works with this version
## driver version 430  is not avaiable in apt repo by default, if required install it separately

## For CUDA 10.0 minimum nvidia driver requirement
NVIDIA_DRIVER_VER="410"


##----------------------------------------------------------
## CUDA
##----------------------------------------------------------

# ## DO NOT Install CUDA 9.1 or 9.2 because CUDA 9.0 has better support in softwares using CUDA like tensorflow
# CUDA_VER="9.1"
# CUDA_REL="9-1" # echo $CUDA_VER | tr . -
# CUDA_OS_REL="1604"
# CUDA_RELEASE="local_${CUDA_VER}.85-1_amd64"
# # CUDA_PCKG="cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64.deb"
# CUDA_PCKG="cuda-repo-ubuntu${CUDA_OS_REL}-${CUDA_REL}-${CUDA_RELEASE}.deb"
# # CUDA_REPO_KEY="${CUDA_REL}-local"
# CUDA_URL="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_PCKG}"
# CUDA_VERSION=${CUDA_VER}

# CUDA_VER="9.2"
# CUDA_REL="9-2" # echo $CUDA_VER | tr . -
# CUDA_OS_REL="1710"
# CUDA_RELEASE="local_${CUDA_VER}.148-1_amd64"
# CUDA_PCKG="cuda-repo-ubuntu${CUDA_OS_REL}-${CUDA_REL}-${CUDA_RELEASE}.deb"
# # CUDA_REPO_KEY="9-1-local"
# CUDA_REPO_KEY="${CUDA_REL}-local"
# CUDA_URL="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_PCKG}"
# CUDA_VERSION=${CUDA_VER}

## CUDA 9.0
CUDA_VER="9.0"
CUDA_REL="9-0" # echo $CUDA_VER | tr . -
CUDA_OS_REL="1604"
CUDA_RELEASE="local_${CUDA_VER}.176-1_amd64"
# CUDA_PCKG="cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb"
CUDA_PCKG="cuda-repo-ubuntu${CUDA_OS_REL}-${CUDA_REL}-${CUDA_RELEASE}.deb"
# CUDA_REPO_KEY="${CUDA_REL}-local"
CUDA_URL="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu${CUDA_OS_REL}/x86_64/${CUDA_PCKG}"
CUDA_VERSION=${CUDA_VER}

## CUDA 10.0
CUDA_VER="10.0"
CUDA_REL="10-0" # echo $CUDA_VER | tr . -
CUDA_OS_REL="1804"
CUDA_RELEASE="local-${CUDA_VER}.130-410.48_1.0-1_amd64"
#CUDA_PCKG="cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb"
CUDA_PCKG="cuda-repo-ubuntu${CUDA_OS_REL}-${CUDA_REL}-${CUDA_RELEASE}.deb"
# CUDA_REPO_KEY="10-0-local-10.0.130-410.48"
CUDA_REPO_KEY="${CUDA_REL}-local-${CUDA_VER}.130-410.48"
CUDA_URL="https://developer.download.nvidia.com/compute/cuda/${CUDA_VER}/secure/Prod/local_installers/${CUDA_PCKG}"
CUDA_VERSION=${CUDA_VER}

### CUDA Run Installer
## CUDA_PCKG_INSTALLER="cuda_10.0.130_410.48_linux.run"
## CUDA_URL_INSTALLER="https://developer.download.nvidia.com/compute/cuda/10.0/secure/Prod/local_installers/cuda_10.0.130_410.48_linux.run"
## CUDA_URL_INSTALLER="https://developer.download.nvidia.com/compute/cuda/${CUDA_VER}/secure/Prod/local_installers/${CUDA_PCKG_INSTALLER}"

#echo $CUDA_PCKG
#echo $CUDA_REPO_KEY


##----------------------------------------------------------
## cuDNN
##----------------------------------------------------------
# https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.5.0.56/prod/10.0_20190219/Ubuntu18_04-x64/libcudnn7-dev_7.5.0.56-1%2Bcuda10.0_amd64.deb
# https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.5.0.56/prod/10.0_20190219/Ubuntu18_04-x64/libcudnn7-doc_7.5.0.56-1%2Bcuda10.0_amd64.deb
# https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.5.0.56/prod/10.0_20190219/Ubuntu18_04-x64/libcudnn7_7.5.0.56-1%2Bcuda10.0_amd64.deb
# https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.5.0.56/prod/10.0_20190219/cudnn-10.0-linux-x64-v7.5.0.56.tgz

## depends on the CUDA_VER

## cuDNN for CUDA 9.0
# cuDNN_VER="7"
# cuDNN_RELEASE="7.1.4.18-1"
# cuDNN_LIB="libcudnn${cuDNN_VER}_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
# cuDNN_DEV_LIB="libcudnn${cuDNN_VER}-dev_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
# cuDNN_USR_GUIDE="libcudnn${cuDNN_VER}-doc_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
# CUDNN_MAJOR_VERSION=${cuDNN_VER}

cuDNN_VER="7"
cuDNN_RELEASE="7.6.0.64-1"
cuDNN_LIB="libcudnn${cuDNN_VER}_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
cuDNN_DEV_LIB="libcudnn${cuDNN_VER}-dev_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
cuDNN_USR_GUIDE="libcudnn${cuDNN_VER}-doc_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
CUDNN_MAJOR_VERSION=${cuDNN_VER}

##----------------------------------------------------------
## TensorRT
## https://docs.nvidia.com/deeplearning/sdk/tensorrt-install-guide/index.html
## https://devtalk.nvidia.com/default/topic/1050672/how-to-install-tensort-in-docker-on-a-cuda-10-1-host-/?offset=4
##----------------------------------------------------------

## TensorRT for CUDA 9.0
TENSORRT_VER=4
TENSORRT_VERSION=${TENSORRT_VER}
TENSORRT_RELEASE="rc-trt4.0.0.3-20180329_1-1_amd64"
TENSORRT_OS_REL="1604"
# tensorRTFILE="nv-tensorrt-repo-ubuntu1604-cuda9.0-rc-trt4.0.0.3-20180329_1-1_amd64.deb"
tensorRTFILE="nv-tensorrt-repo-ubuntu${TENSORRT_OS_REL}-cuda${CUDA_VER}-${TENSORRT_RELEASE}.deb"
TENSORRT_PCKG=${tensorRTFILE}
## based on already installed system with cuda 9.0
## 4.1.0-1+cuda9.0
LIBNVINFER_VER=4.1.0-1+cuda${CUDA_VER}

## TensorRT for CUDA 10.0
TENSORRT_VER=5
TENSORRT_VERSION=${TENSORRT_VER}
TENSORRT_RELEASE="trt5.1.5.0-ga-20190427_1-1_amd64"
TENSORRT_OS_REL="1804"
# tensorRTFILE="nv-tensorrt-repo-ubuntu1804-cuda10.0-trt5.1.5.0-ga-20190427_1-1_amd64.deb"
tensorRTFILE="nv-tensorrt-repo-ubuntu${TENSORRT_OS_REL}-cuda${CUDA_VER}-${TENSORRT_RELEASE}.deb"
TENSORRT_PCKG=${tensorRTFILE}
## https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/devel-gpu.Dockerfile
## 5.1.5-1+cuda10.0
LIBNVINFER_VER=5.1.5-1+cuda${CUDA_VER}


##----------------------------------------------------------
## AI Frameworks: Tensorflow, Keras, PyTorch
##-------
##  DNN Arch Compatibilities
##----------------------------------------------------------
#
## matterport/mask_rcnn:
## a) CUDA 10.0, TF 1.13.1, Keras 2.2.3
## b) CUDA 9.0, TF 1.9.0, Keras 2.2.2 -> best
#
## maybeshewill/lanenet:
## a) CUDA 10.0, TF 1.13.1, Keras 2.2.3
#
## facebookairesearch/detectron2:
## a) CUDA 10.0, PYTORCH 1.1.0
#
##----------------------------------------------------------

##-------
## CUDA 9.0
##-------
TF_VER="1.9.0"
TF_BAZEL_VER="0.5.0" ## TODO

KERAS_VER="2.2.2"

PYTORCH_VER="0.4.0"

##-------
## CUDA 10.0
##-------

## for tensorflow till 1.13.1 release
TF_VER="1.13.1"
TF_RELEASE="v${TF_VER}"
TF_BAZEL_VER="0.21.0"

## compatible with TF 1.13.1
KERAS_VER="2.2.3"
##-------

## for tensorflow till 1.15 release
TF_VER="1.15.0"
TF_RELEASE="v${TF_VER}"
TF_BAZEL_VER="0.24.1" ## min
TF_BAZEL_VER="0.26.1" ## max
##-------

PYTORCH_VER="1.1.0"

##-------

BAZEL_VER="1.1.0"
BAZEL_VER=${TF_BAZEL_VER}
BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VER}/bazel-${BAZEL_VER}-installer-linux-x86_64.sh"


##----------------------------------------------------------
## Docker version
##----------------------------------------------------------
## for Nvidia container runtime for GPU docker
DOCKER_VERSION="19.03.1"


##----------------------------------------------------------
## PHP version
##----------------------------------------------------------
PHP_VER="7.0"
PHP_VER="7.1"
PHP_VER="7.2"
#
##----------------------------------------------------------
## Node JS version
##----------------------------------------------------------
NODEJS_VER=7
NODEJS_VER=8
NODEJS_VER=9
#
##----------------------------------------------------------
## JAVA JDK version
##----------------------------------------------------------
JAVA_JDK_VER="8"
#JAVA_JDK_VER="9"
#
##----------------------------------------------------------
SUITE_PARSE_VER="5.3.0"
#
##----------------------------------------------------------
CERES_SOLVER_REL="-1.10.0"
CERES_SOLVER_REL_TAG="1.10.0"
#---
CERES_SOLVER_REL="-1.14.0"
CERES_SOLVER_REL_TAG="1.14.0"
#
##----------------------------------------------------------
## GIS, Computer Graphics - 2D/3D, Computer Vision
##----------------------------------------------------------
PROJ_VER="4.9.3"
TIFF_VER="4.0.8"
# TIFF_VER="4.0.9"
GEOTIFF_VER="1.4.2"
#
GEOS_VER="3.6.1"
GEOS_VER="3.6.3"
#
BOOST_VER="1.64.0"
#BOOST_VER="1.67.0"
#
EIGEN_REL_TAG="3.3.5"
#
MPIR_REL_TAG="mpir-3.0.0"
#
LAZ_PERF_REL_TAG="1.3.0"
# git clone is working now and that is used in script
LIBKML_VER="1.2.0"
LIBKML_VER="1.3.0"
#
# git clone is used, mentioned here as alternative
LASZIP_VER="2.2.0"
LASZIP_VER="3.2.2"
#
GEOWAVE_REL_TAG="v0.9.7"
#
GDAL_VER="2.2.4"
#
PDAL_VER="1.7"
PDAL_BUILD="1"
PDAL_RELEASE="${PDAL_VER}.${PDAL_BUILD}"
##
VTK_VER="7.1"
VTK_BUILD="1"
VTK_RELEASE="${VTK_VER}.${VTK_BUILD}"

VTK_VER="8.1"
VTK_BUILD="0"
VTK_RELEASE="${VTK_VER}.${VTK_BUILD}"
#
OpenCV_VER_CHECKOUT="3.3.0"
OpenCV_VER_CHECKOUT="3.4.1"
OpenCV_VER_CHECKOUT="3.4.2"
#
HAROOPAD_VER="0.13.1"
#
MAGMA_VER="2.5.0-rc1"

