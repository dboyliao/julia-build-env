FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Taipei

WORKDIR /workspace
RUN apt update -y && \
    apt install -y tzdata \
    build-essential libatomic1 \
    python gfortran \
    lldb \
    perl wget m4 cmake pkg-config git;
RUN git clone https://github.com/JuliaLang/julia && \
    cd julia; \
    mkdir /julia; \
    make BUILD_LLDB=1 VERBOSE=1 BUNDLE_DEBUG_LIBS=1 prefix=/julia install; \
    make cleanall;
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
ENV PATH=$PATH:/julia/bin

WORKDIR /root
CMD ["/bin/bash"]
