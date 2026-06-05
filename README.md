# edit-deb
Scripts to create Debian/Ubuntu deb packae for popular Microsoft edit

# Build and Install
To Build deb package simply run

`./build_edit_deb.sh`

This scrips will install rust compiler and its dependecies in local folder.

Scripts also download, builds and packs Microsoft Edit.


To install simply run

`sudo dpkg -i <deb_file>`

# Cross Cimpile

To compile and pack Microsft Edit for other processor architecture you need to fix env in build_edit_deb_cross.sh. 

To match requited architecture change bellow variables.

Exampe for armv7

`CROSS_GCC="/usr/bin/arm-linux-gnueabihf-gcc`

`CROSS_RUST_ARCH_TARGET="armv7-unknown-linux-gnueabihf`


It is also option to override cross compiler from commandline.

`./build_edit_deb_cross.sh USER_CROSS_GCC="/usr/bin/aarch64-linux-gnu-gcc" USER_CROSS_RUST_ARCH_TARGET="aarch64-unknown-linux-gnu"`


To build and pack cross compiled editor run.

`./build_edit_deb_cross.sh`

