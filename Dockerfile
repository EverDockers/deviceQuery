# FROM defines the base image
FROM nvidia/cudia

# RUN executes a shell command
# You can chain multiple commands together with &&
# A \ is used to split long lines to help with readability
# This particular instruction installs the source files
# for deviceQuery by installing the CUDA samples via apt
RUN apt update && apt install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

# set the working directory
WORKDIR /usr/local/cuda/samples/1_Utilities/devceQuery

RUN make

# CMD defines the default command to be run in the container
# CMD is ovrridden by supplying a command + arguments to
# `docker run`, e.g. `nvcc --version` or `bash`
CMD ./deviceQuery