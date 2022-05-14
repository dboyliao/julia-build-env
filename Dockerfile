FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Taipei

WORKDIR /workspace
RUN apt update -y && \
    apt install -y tzdata \
    build-essential libatomic1 \
    python gfortran \
    llvm lldb \
    perl wget m4 cmake pkg-config git;
RUN git clone https://github.com/JuliaLang/julia && \
    cd julia; \
    make BUILD_LLDB=1 USE_SYSTEM_LLVM=0 debug install
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
ENV PATH=$PATH:/julia/usr/bin

WORKDIR /root
CMD ["/bin/bash"]
