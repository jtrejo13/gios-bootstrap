#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

curl -s --compressed "https://gt-cs6200.github.io/ppa/KEY.gpg"|apt-key add -
curl -s --compressed -o /etc/apt/sources.list.d/gt-cs6200.list "https://gt-cs6200.github.io/ppa/gt-cs6200.list"

apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    libgmp-dev \
    gcc-multilib \
    valgrind \
    portmap \
    rpcbind \
    libcurl4-openssl-dev \
    bzip2 \
    imagemagick \
    libmagickcore-dev \
    libssl-dev \
    llvm \
    net-tools \
    libtool \
    pkg-config \
    grpc-cs6200 \
    protobuf-cs6200

python3 -m pip install --upgrade pip

python3 -m pip install --upgrade \
    future \
    cryptography \
    pyopenssl \
    ndg-httpsclient \
    pyasn1

mkdir -p /cs6200/source

# below lines (recommended but can be skipped esp. if you use other mechanisms to pull source)
# - grant access to your git repo 
# - pull project source from your git repo
if [ -f "deploykey" ]; then
    # feel free to use the internet to setup deploy keys
    mkdir -p /root/.ssh
    cp ssh_config /root/.ssh/config
    cp deploykey /root/.ssh/deploykey
    chmod 0600 /root/.ssh/deploykey
    ssh-add deploykey
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts

    cd /cs6200/source
    # update commented line below to pull files from your git repo
    # git clone git@github.com:gt-cs6200/your-cs6200-repo.git

    # Add a non-sudo user and switch to it
    adduser --disabled-password --gecos "" gradeuser
    su gradeuser

    # At this point you are ready to start up the tests (or use the
    # container)
fi