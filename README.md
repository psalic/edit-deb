# edit-deb
Scripts to create Debian/Ubuntu deb packae for popular Microsoft edit

# Build and Install
To Build deb package  for host architecture simply run

`./build_edit_deb.sh`

This scrips will install rust compiler and its dependecies in local folder.

Scripts also download, builds and packs Microsoft Edit.


To install simply run

`sudo dpkg -i <deb_file>`

# Cross Cimpile

To compile and pack Microsft Edit for other processor architecture you need to pass arguments in script (check example bellow).


`./build_edit_deb_cross.sh USER_CROSS_GCC="/usr/bin/aarch64-linux-gnu-gcc" USER_CROSS_RUST_ARCH_TARGET="aarch64-unknown-linux-gnu"`


# Run Microsoft Edit

`/usr/bin/msedit`
