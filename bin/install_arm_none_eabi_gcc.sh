#!/bin/sh

cd /opt


wget "https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz"
tar -Jxf arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz
rm arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz


# Put this into dockerfile !
# ENV PATH="/opt/bin:/opt/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin:$PATH"
