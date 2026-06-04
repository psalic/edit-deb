# edit-deb
Scripts to create Debian/Ubuntu deb packae for popular microsoft edit

# Build and Install
To Build deb package simply run
./build_edit_deb.sh

This scrips will install rust compiler and its dependecies. It will also build Microsoft Edit and pack in deb format.

To install simply run
sudo dpkg -i <deb_file>

# Cross Cimpile

To compile and pack Microsft Edit for other processor architecture you need to fix env in build_edit_deb_cross.sh to match requited architecture
exampe for armv7
CROSS_GCC="/usr/bin/arm-linux-gnueabihf-gcc"
CROSS_RUST_ARCH_TARGET="armv7-unknown-linux-gnueabihf"

To build and pack arhitectures run.
./build_edit_deb_cross.sh

