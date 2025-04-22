#!/bin/sh


apt-get update

# Install additional packages
apt-get install -y apt-utils cmake curl expect-dev git gnupg make lsb-release software-properties-common udev

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


# Create dummy repo in order to be able to create link.
# On the Lab-PC the full repo is available and will be used as the mounted directory from the Lab-PC has precedence.
mkdir -p /opt/makers-hil/src/python/hil
touch /opt/makers-hil/src/python/hil/runQuery.py
chmod uog+rx /opt/makers-hil/src/python/hil/runQuery.py
ln -s /opt/makers-hil/src/python/hil/runQuery.py /opt/bin/
