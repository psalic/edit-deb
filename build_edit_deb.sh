#!/bin/bash
export SCRIPT_DIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

export RUSTUP_HOME=$SCRIPT_DIR/rustup.msedit
export CARGO_HOME=$SCRIPT_DIR/cargo.msedit
export PATH=$CARGO_HOME/bin:$PATH
export RUSTUP_INIT_SKIP_PATH_CHECK="yes"
export RUST_VERSION=1.93
#export RUST_VERSION=stable
#export RUST_VERSION=nightly

EDIT_TAR_GZ="https://github.com/microsoft/edit/archive/refs/tags/v2.0.0.tar.gz"
EDIT_DIR="edit"

if [ ! -d "$RUSTUP_HOME" ] || [ ! -d "$CARGO_HOME" ]; then
    rm -rf $RUSTUP_HOME
    rm -rf $CARGO_HOME

    wget https://static.rust-lang.org/rustup/archive/1.28.2/$(uname -m)-unknown-linux-gnu/rustup-init
    chmod +x rustup-init

    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host $(uname -m)-unknown-linux-gnu
    rm rustup-init
    cargo install cargo-deb@3.7.0
fi

#download edit source code
echo "Download and extract edit source code"
if [ -d "$SCRIPT_DIR/$EDIT_DIR" ]; then
    rm -rf $SCRIPT_DIR/$EDIT_DIR
fi

mkdir $SCRIPT_DIR/$EDIT_DIR
curl -L -s $EDIT_TAR_GZ | tar -xzf - -C $SCRIPT_DIR/$EDIT_DIR --strip-components=1

# rename /usr/bin/edit in /usr/bin/msedit, /usr/bin/edit exist in debian package mailcap
# need to change source
echo "Change source code (edit) to rename /usr/bin/edit in /usr/bin/msedit"
cp $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml.bak
cat << 'EOF' >> $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml

[package.metadata.deb]
assets = [
    ["target/release/edit", "usr/bin/msedit", "755"]
]
EOF

# to avoid cargo-deb warning add description in Cargo.toml
sed -i '/\[package\]/a description = "A simple editor for simple needs"' $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml

# build edit
echo "Build edit"
cd $SCRIPT_DIR/$EDIT_DIR && cargo build --release

# pack debian package
echo "Pack edit in debian package"
cd $SCRIPT_DIR/$EDIT_DIR && cargo-deb --maintainer $(id -un) --no-build  -o $SCRIPT_DIR

# cleanup source
mv $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml.bak $SCRIPT_DIR/$EDIT_DIR/crates/edit/Cargo.toml
