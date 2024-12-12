#!/bin/sh

cd /opt


# To install a specific version of LLVM:
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh && \
./llvm.sh ${LLVM_VERSION} all


### LLVM
# For convenience there is an automatic installation script available that installs LLVM for you.
# To install the latest stable version:
# bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# To install all apt.llvm.org packages at once:
# wget https://apt.llvm.org/llvm.sh
# chmod +x llvm.sh
# sudo ./llvm.sh <version number> all
# or
# sudo ./llvm.sh all


ln -s `which clang-${LLVM_VERSION}` /opt/bin/clang
ln -s `which clang++-${LLVM_VERSION}` /opt/bin/clang++
ln -s `which clang-format-${LLVM_VERSION}` /opt/bin/clang-format
ln -s `which clang-tidy-${LLVM_VERSION}` /opt/bin/clang-tidy
ln -s `which scan-build-${LLVM_VERSION}` /opt/bin/scan-build

# export CXX=clang++
# export CC=clang 
env CXX=clang++ CC=clang 