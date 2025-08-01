# Use an official Ubuntu 24.04 image as the base
FROM ubuntu:24.04


# Set the working directory to /myLocalWorkingDir
WORKDIR /myLocalWorkingDir
ENV WORKING_DIR=/myLocalWorkingDir

# Set environment variable to avoid dialog prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV UDEV=1


# Arduino related vars
ENV ARDUINO_CLI_VERSION=1.2.2
# ENV XMC4ARDUINO_VERSION=3.4.1
# ENV PSOC4ARDUINO_VERSION=0.5.0

ENV ARDUINO_CONFIG_FILE=/root/.arduino15/arduino-cli.yaml
ENV ARDUINO_DIRECTORIES_DATA=/root/.arduino15


# Tool related version vars
# ENV CPPCHECK_VERSION=
ENV LLVM_VERSION=20


#ARG BRANCH=none
ARG BRANCH=main


ENV PATH="/opt/bin:extras/makers-devops/bin:$PATH"
# ENV PATH="/opt/bin:/opt/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin:$PATH"


SHELL ["/bin/bash", "-c"]

COPY bin .
COPY local .

# Update the package list and install any available updates
RUN apt update && apt full-upgrade -y
RUN apt-get install -y wget


# init container
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/container_init.sh)"


# install Segger JLink
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_segger.sh)"


# basic dependencies to Python
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_python.sh)"


# install arduino-cli
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_arduino_cli.sh)"


# install arm-non-eabi-gcc
# RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_arm_none_eabi_gcc.sh)"


# install LLVM tool suite
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_llvm.sh)"
ENV CXX=clang++
ENV CC=clang
 

# install cppcheck after LLVM as LLVM is used for compiling cppcheck !
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/install_cppcheck.sh)"


# print used tool related vars
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/print_tool_versions.sh)"


# cleanup container
RUN bash -c "$(wget -O - https://raw.githubusercontent.com/Infineon/makers-docker/refs/heads/${BRANCH}/bin/container_cleanup.sh)"


# Create cmd script on-the-fly to be executed in CMD below to avoid docker warnings 
# COPY --chmod=755 <<EOT /dockerCMD.sh
# #!/usr/bin/env bash
# cd /myLocalWorkingDir
# bash
# EOT

## 
#CMD ["/dockerCMD.sh"]

CMD ["/bin/bash"]
