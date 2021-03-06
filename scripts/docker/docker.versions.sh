## CUDA
local CUDA_VER="9.0"
local CUDA_REL="9-0" # echo $CUDA_VER | tr . -
local CUDA_OS_REL="1604"
# local CUDA_PCKG="cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb"
local CUDA_PCKG="cuda-repo-ubuntu$CUDA_OS_REL-$CUDA_REL-local_$CUDA_VER.176-1_amd64.deb"
local CUDA_URL="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/$CUDA_PCKG"


## cuDNN
local cuDNN_VER="7"
local cuDNN_RELEASE="7.1.4.18-1"
local cuDNN_LIB="libcudnn${cuDNN_VER}_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
local cuDNN_DEV_LIB="libcudnn${cuDNN_VER}-dev_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"
local cuDNN_USR_GUIDE="libcudnn${cuDNN_VER}-doc_${cuDNN_RELEASE}+cuda${CUDA_VER}_amd64.deb"

## TensorRT for CUDA 9.0
local tensorRTFILE="nv-tensorrt-repo-ubuntu1604-cuda9.0-rc-trt4.0.0.3-20180329_1-1_amd64.deb"
