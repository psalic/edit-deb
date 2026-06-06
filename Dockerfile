from ubuntu:18.04
maintainer psalic

# install ubuntu packages
run dpkg --add-architecture i386
run apt-get update && apt-get install -y \
    libc6:i386 \
    gcc-i686-linux-gnu \
    gcc-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    gcc \
    curl \
    wget \
    dpkg-dev
