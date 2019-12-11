## References:
## https://raw.githubusercontent.com/tensorflow/tensorflow/master/tensorflow/tools/dockerfiles/bashrc
## https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/devel-gpu-jupyter.Dockerfile
## https://blog.hasura.io/how-to-write-dockerfiles-for-python-web-apps-6d173842ae1d/
## https://stackoverflow.com/questions/34213837/dockerfile-output-of-run-instruction-into-a-variable
## https://stackoverflow.com/questions/20635472/using-the-run-instruction-in-a-dockerfile-with-source-does-not-work
## https://stackoverflow.com/questions/34911622/dockerfile-set-env-to-result-of-command
## https://unix.stackexchange.com/questions/117467/how-to-permanently-set-environmental-variables
## https://github.com/moby/moby/issues/29110
## https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b

## aidev minimum development docker enviroment with python virtualenv and virtualwrapper

ARG BASE_IMAGE_NAME=${BASE_IMAGE_NAME}
# FROM nvidia/cuda:10.0-cudnn-7.6.4.38-devel-ubuntu18.04
FROM ${BASE_IMAGE_NAME}

LABEL maintainer "mangalbhaskar <mangalbhaskar@gmail.com>"

## See http://bugs.python.org/issue19846
## format changes required for asammdf v3.4.0
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ARG CUDA_VERSION=${BUILD_FOR_CUDA_VER}

ARG BUILD_FOR_CUDA_VER="${BUILD_FOR_CUDA_VER}"
ENV BUILD_FOR_CUDA_VER $BUILD_FOR_CUDA_VER

ARG CUDNN_MAJOR_VERSION=${CUDNN_MAJOR_VERSION}
ARG TENSORRT_VER=${TENSORRT_VER}
ARG LIBNVINFER_VER=${LIBNVINFER_VER}
# ARG LIB_DIR_PREFIX=x86_64
ARG pyVer
ARG PYTHON=python${pyVer}
ARG PIP=pip${pyVer}

ARG PY_VENV_PATH=${PY_VENV_PATH}

ARG DUSER
ENV DUSER $DUSER

ARG DUSER_ID
ENV DUSER_ID $DUSER_ID

ARG DUSER_GRP
ENV DUSER_GRP $DUSER_GRP

ARG DUSER_GRP_ID
ENV DUSER_GRP_ID $DUSER_GRP_ID

ARG DOCKER_BASEPATH="${DOCKER_BASEPATH}"
ARG DOCKER_SETUP_PATH="${DOCKER_SETUP_PATH}"

## Needed for string substitution
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      gnupg2 \
      libcurl3-dev \
      libfreetype6-dev \
      libhdf5-serial-dev \
      libzmq3-dev \
      software-properties-common \
      pkg-config \
      rsync \
      unzip \
      zip \
      zlib1g-dev \
      wget \
      curl \
      git \
      openjdk-8-jdk \
      ${PYTHON} \
      ${PYTHON}-dev \
      ${PYTHON}-pip \
      swig \
      grep \
      vim \
      sudo \
      libpng-dev \
      libjpeg-dev \
      automake \
      libtool

# Link the libcuda stub to the location where tensorflow is searching for it and reconfigure
# dynamic linker run-time bindings
# Some TF tools expect a "python" binary
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1 && \
    /bin/echo "/usr/local/cuda/lib64/stubs" > /etc/ld.so.conf.d/z-cuda-stubs.conf && \
    ln -s $(which ${PYTHON}) /usr/local/bin/python && \
    ln -s $(which ${PIP}) /usr/bin/pip && \
    ldconfig

RUN apt-get install -y --no-install-recommends \
      libnvinfer${TENSORRT_VER}=${LIBNVINFER_VER} \
      libnvinfer-dev=${LIBNVINFER_VER} \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN ${PIP} --no-cache-dir install --upgrade \
    pip \
    setuptools

RUN ${PIP} --no-cache-dir install \
      virtualenv \
      virtualenvwrapper

## add docker group and user as same as host group and user ids and names
RUN addgroup --gid ${DUSER_GRP_ID} ${DUSER_GRP} && \
    useradd -ms /bin/bash ${DUSER} --uid ${DUSER_ID} --gid ${DUSER_GRP_ID} && \
    /bin/echo "${DUSER}:${DUSER}" | chpasswd && \
    adduser ${DUSER} sudo && \
    /bin/echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    /bin/echo "%sudo ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

RUN mkdir -p ${PY_VENV_PATH} \
      ${DOCKER_BASEPATH} \
      ${DOCKER_SETUP_PATH}/installer \
      ${DOCKER_SETUP_PATH}/config

## ARG BASH_FILE=/etc/bash.bashrc
ARG BASH_FILE=/home/${DUSER}/.bashrc

COPY ./installer ${DOCKER_SETUP_PATH}/installer
COPY ./config ${DOCKER_SETUP_PATH}/config

RUN chown -R ${DUSER}:${DUSER} ${PY_VENV_PATH} \
      ${DOCKER_BASEPATH} \
      ${DOCKER_SETUP_PATH}

## Run processes as non-root user
USER ${DUSER}

ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH

ARG PY_VENV_NAME=${PY_VENV_NAME}
RUN chmod a+rwx ${BASH_FILE} && \
    venvline="source /usr/local/bin/virtualenvwrapper.sh" && \
    grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}" && \
    venvline="export WORKON_HOME=${PY_VENV_PATH}" && \
    grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}" && \
    venvline="export PY_VENV_NAME=${PY_VENV_NAME}" && \
    grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}" && \
    venvline="alias lt='ls -lrth'" && \
    grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}"

## Create python virtual environment
RUN export WORKON_HOME=${PY_VENV_PATH} && \
    source /usr/local/bin/virtualenvwrapper.sh && \
    mkvirtualenv -p $(which ${PYTHON}) ${PY_VENV_NAME}

## raise to root user so developer can execute userid fixes
USER root
