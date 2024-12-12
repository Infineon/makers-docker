#!/bin/sh


# Install additional packages
apt-get install -y apt-utils cmake curl git gnupg make perl python3 lsb-release software-properties-common

# apt-get install -y clang-format clang-tidy clang-tools clang cppcheck gcc-arm-none-eabi binutils-arm-none-eabi
# libffi-dev pkg-config


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
