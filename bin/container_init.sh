#!/bin/sh


# # Update the package list and install any available updates
# apt update && apt full-upgrade -y

apt-get install -y apt-utils cmake curl git gnupg make perl python3 lsb-release software-properties-common

#wget 

# apt-get install -y clang-format clang-tidy clang-tools clang cppcheck
# libffi-dev pkg-config

# apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi


apt purge clang-format
apt purge clang-tidy
apt purge clang-tools
apt purge clang
apt purge cppcheck


# if [ -f /.dockerenv ]; then
#     echo "I'm inside matrix ;(";
# else
#     echo "I'm living in real world!";
# fi


cd /opt
mkdir bin
