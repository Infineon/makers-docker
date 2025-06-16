#!/bin/sh


apt-get update && apt-get upgrade -y


# Install additional packages
apt-get install -y --fix-missing apt-utils cmake curl expect-dev git gnupg make lsb-release psmisc software-properties-common sudo udev usbutils vim

# expect-dev to install unbuffer
# lsof to install lsof
# psmisc to install fuser
# udev to install udevadm
# usbutils to install lsusb 

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


git config --global --add safe.directory $WORKING_DIR
# check with : git config --list --show-origin --show-scope
