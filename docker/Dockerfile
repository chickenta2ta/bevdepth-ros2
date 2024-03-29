FROM nvidia/cuda:11.1.1-devel

WORKDIR /tmp

# Resolve NO_PUBKEY issues
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub

# Prevent being prompted for timezone configuration
ENV DEBIAN_FRONTEND=noninteractive

# Install Python
RUN apt update && apt install -y build-essential libbz2-dev libdb-dev \
  libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
  libncursesw5-dev libsqlite3-dev libssl-dev \
  zlib1g-dev uuid-dev tk-dev
RUN apt-get update && apt-get install -y wget
RUN wget https://www.python.org/ftp/python/3.8.16/Python-3.8.16.tar.xz
RUN tar xJf Python-3.8.16.tar.xz
WORKDIR /tmp/Python-3.8.16
RUN ./configure
RUN make
RUN make install

# Start bash
ENTRYPOINT ["/bin/bash"]
