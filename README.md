# edit-deb
Scripts to create Debian/Ubuntu deb packages for popular [Microsoft edit](https://github.com/microsoft/edit)


# Requirements
Debian/Ubuntu system on PC or RaspberryPi.


# Build and Install
To Build deb package  for host architecture simply run

`./build_edit_deb.sh`

This scrips will install rust compiler and its dependecies in local folder.  
Scripts also download, builds and packs Microsoft Edit.


To install simply run

`sudo dpkg -i <dist/deb_file>`

# Cross Compile

To compile and pack Microsft Edit for different processor architecture you need to pass arguments in script.


`./build_edit_deb.sh USER_CROSS_GCC="/usr/bin/aarch64-linux-gnu-gcc" USER_CROSS_RUST_ARCH_TARGET="aarch64-unknown-linux-gnu"`


# Run Microsoft Edit

`msedit`
 or
`/usr/bin/msedit`

# Released images

Deb files in Relases are built with ubuntu:14.04 in docker.  
They work on Ubuntu 14.04 and newer Debian/Ubuntu systems.
In releases there also binary files of Microsoft edit with architecture in name.


# Recomended
To have full experience of Microsoft editor install package bellow in Debian/Ubuntu.  
It works for Ubuntu 18.04 and above.

`libicu-dev`
