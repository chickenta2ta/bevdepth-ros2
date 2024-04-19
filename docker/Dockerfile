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

# Install ROS 2
RUN apt update && apt install locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN apt install -y software-properties-common
RUN add-apt-repository universe

RUN apt update && apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update
RUN apt install -y python3-colcon-common-extensions
RUN apt install -y ros-rolling-ros-base
RUN echo "source /opt/ros/rolling/setup.bash" >> ~/.bashrc

# Start bash
ENTRYPOINT ["/bin/bash"]
