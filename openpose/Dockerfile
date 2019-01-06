FROM nvidia/cuda:9.2-cudnn7-devel
MAINTAINER Micha Gorelick <@mynameisfiber>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y --no-install-recommends && \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      libatlas-*dev \
      libboost-all-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libhdf5-dev \
      libleveldb-dev \
      liblmdb-dev \
      libopencv-dev \
      libprotobuf-dev \
      libsnappy-dev \
      lsb-release \
      protobuf-compiler \
      python-dev \
      python-numpy \
      python-pip \
      python-setuptools \
      python-scipy \
      sudo \
      wget \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip

RUN git clone --recursive https://github.com/CMU-Perceptual-Computing-Lab/openpose.git /openpose
WORKDIR /openpose

RUN sed -i '21s/.*/ set(Caffe_known_gpu_archs "50 52 60 61 70")/' /openpose/cmake/Cuda.cmake && \
    sed -i '7s/.*/ set(Caffe_known_gpu_archs "50 52 60 61 70")/' /openpose/3rdparty/caffe/cmake/Cuda.cmake
RUN cd /openpose && mkdir -p build && cd build \
    && cmake -DCUDA_ARCH=All -DCMAKE_BUILD_TYPE=Release .. && make -j

RUN cd /openpose/models && ./getModels.sh


CMD ./build/openpose
