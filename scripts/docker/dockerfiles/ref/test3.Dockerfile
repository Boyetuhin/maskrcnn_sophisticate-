## References:
## https://raw.githubusercontent.com/tensorflow/tensorflow/master/tensorflow/tools/dockerfiles/bashrc
## https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/devel-gpu-jupyter.Dockerfile
## https://blog.hasura.io/how-to-write-dockerfiles-for-python-web-apps-6d173842ae1d/
## https://stackoverflow.com/questions/34213837/dockerfile-output-of-run-instruction-into-a-variable
## https://stackoverflow.com/questions/20635472/using-the-run-instruction-in-a-dockerfile-with-source-does-not-work
## https://stackoverflow.com/questions/34911622/dockerfile-set-env-to-result-of-command
## https://unix.stackexchange.com/questions/117467/how-to-permanently-set-environmental-variables
## https://github.com/moby/moby/issues/29110

ARG BASE_IMAGE_NAME=${BASE_IMAGE_NAME}
FROM ${BASE_IMAGE_NAME}
LABEL maintainer "mangalbhaskar <mangalbhaskar@gmail.com>"

## See http://bugs.python.org/issue19846
## format changes required for asammdf v3.4.0
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ARG CUDA_VERSION=${CUDA_VERSION}
ARG CUDNN_MAJOR_VERSION=${CUDNN_MAJOR_VERSION}

ARG pyVer
ARG PYTHON=python${pyVer}
ARG PIP=pip${pyVer}

ARG PY_VENV_PATH=${PY_VENV_PATH}

ARG duser
ENV DUSER $duser

ARG duser_id
ENV DUSER_ID $duser_id

ARG duser_grp
ENV DUSER_GRP $duser_grp

ARG duser_grp_id
ENV DUSER_GRP_ID $duser_grp_id

## Needed for string substitution
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
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
      libnvinfer5=5.1.5-1+cuda${CUDA_VERSION} \
      libnvinfer-dev=5.1.5-1+cuda${CUDA_VERSION} \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

## Tensorflow specific configuration
## https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/devel-gpu-jupyter.Dockerfile
# Configure the build for our CUDA configuration.

ENV CI_BUILD_PYTHON ${PYTHON}
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
ENV TF_NEED_CUDA 1
ENV TF_NEED_TENSORRT 1
ENV TF_CUDA_COMPUTE_CAPABILITIES=3.5,5.2,6.0,6.1,7.0
ENV TF_CUDA_VERSION=${CUDA_VERSION}
ENV TF_CUDNN_VERSION=${CUDNN_MAJOR_VERSION}

# Link the libcuda stub to the location where tensorflow is searching for it and reconfigure
# dynamic linker run-time bindings
# Some TF tools expect a "python" binary
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1 && \
    /bin/echo "/usr/local/cuda/lib64/stubs" > /etc/ld.so.conf.d/z-cuda-stubs.conf && \
    ln -s $(which ${PYTHON}) /usr/local/bin/python && \
    ln -s $(which ${PIP}) /usr/bin/pip && \
    ldconfig

RUN ${PIP} --no-cache-dir install --upgrade \
    pip \
    setuptools

RUN ${PIP} --no-cache-dir install \
      virtualenv \
      virtualenvwrapper

## add docker group and user as same as host group and user ids and names
RUN addgroup --gid ${DUSER_GRP_ID} ${DUSER_GRP} && \
    useradd -ms /bin/bash ${DUSER} --uid ${DUSER_ID} --gid ${DUSER_GRP_ID} && \
    adduser ${DUSER} sudo

# RUN /bin/echo "${DUSER}:${DUSER}" | chpasswd

#set main entry point as working directory
WORKDIR /
COPY ./installer ./installer

# ARG BASH_FILE=/etc/bash.bashrc
ARG BASH_FILE=/home/${DUSER}/.bashrc

ARG PY_VENV_NAME=${PY_VENV_NAME}

RUN chmod a+rwx ${BASH_FILE} && \
      mkdir -p ${PY_VENV_PATH} && \
      venvline="source /usr/local/bin/virtualenvwrapper.sh" && \
      grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}" && \
      venvline="export WORKON_HOME=${PY_VENV_PATH}" && \
      grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}" && \
      venvline="export PY_VENV_NAME=${PY_VENV_NAME}" && \
      grep -qF "${venvline}" "${BASH_FILE}" || echo "${venvline}" >> "${BASH_FILE}"

## Install python packages inside virtual environment
RUN mkdir -p ${PY_VENV_PATH} && \
      export WORKON_HOME=${PY_VENV_PATH} && \
      source /usr/local/bin/virtualenvwrapper.sh && \
      mkvirtualenv -p $(which ${PYTHON}) ${PY_VENV_NAME} && \
      workon ${PY_VENV_NAME} && \
      ${PIP} --no-cache-dir install -r installer/python.requirements.txt && \
      ${PIP} --no-cache-dir install -r installer/python.requirements-extras.txt

# Install bazel
ARG BASEDIR="softwares"
ARG BASEPATH="/${BASEDIR}"

ARG BAZEL_VERSION=1.1.0
ARG BAZEL_URL="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"

RUN mkdir -p ${BASEPATH}/bazel \
    && wget -O ${BASEPATH}/bazel/installer.sh ${BAZEL_URL} \
    && wget -O ${BASEPATH}/bazel/LICENSE.txt "https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE" \
    && chmod +x ${BASEPATH}/bazel/installer.sh \
    && ${BASEPATH}/bazel/installer.sh \
    && rm -f ${BASEPATH}/bazel/installer.sh

USER ${DUSER}
