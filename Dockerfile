FROM mullinix/nvidia-cuda-devel-gcc-gsl

USER root

# update repository information
RUN apt-get update --fix-missing

# install git 
RUN apt-get install -y --no-install-recommends \
    git

# cleanup install cache
RUN rm -rf /var/lib/apt/lists/*

# download linboot source, compile, move executable
RUN mkdir -p /tmp/linboot && \
    mkdir -p /usr/local/sbin && \
    cd /tmp/linboot && \
    git clone https://github.com/mullinix/cuda_linear_model_mc_bs.git && \
    cd cuda_linear_model_mc_bs && \
    make && \
    mv linboot /usr/local/bin/

# cleanup linboot source
RUN rm -rf /tmp/linboot

USER developer

CMD [ "linboot" ]
