#!/bin/sh


# Install additional packages
apt-get install -y apt-utils cmake curl git gnupg make lsb-release software-properties-common

# apt-get install -y clang-format clang-tidy clang-tools clang cppcheck gcc-arm-none-eabi binutils-arm-none-eabi
# libffi-dev pkg-config


apt purge clang-format
apt purge clang-tidy
apt purge clang-tools
apt purge clang
apt purge cppcheck


# if [ -f /.dockerenv ]; then
#     echo "Running inside a docker container !";
# else
#     echo "NOT running inside a docker container !";
# fi


cd /opt
mkdir bin
