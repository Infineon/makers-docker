#!/bin/sh

cd /opt


curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/opt/bin sh -s ${ARDUINO_CLI_VERSION}

#ln -s /opt/bin/arduino-cli /opt/bin/arduino-cli.exe
ln -s `which arduino-cli` /opt/bin/arduino-cli.exe


arduino-cli config init --config-file ${ARDUINO_CONFIG_FILE}  --overwrite
#arduino-cli config init --config-file /root/.arduino15/arduino-cli.yaml  --overwrite

arduino-cli core update-index --config-file ${ARDUINO_CONFIG_FILE}


# XMC
### install latest version
#arduino-cli core install --config-file ${ARDUINO_CONFIG_FILE} Infineon:xmc --additional-urls https://github.com/Infineon/XMC-for-Arduino/releases/latest/download/package_infineon_index.json
### install vx.y.z
#arduino-cli config set --config-file ${ARDUINO_CONFIG_FILE} board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V${XMC4ARDUINO_VERSION}/package_infineon_index.json

# PSoC
### install latest version
# arduino-cli config set --config-file ${ARDUINO_CONFIG_FILE} board_manager.additional_urls https://github.com/Infineon/arduino-core-psoc6/releases/latest/download/package_psoc6_index.json
### install vx.y.z
#arduino-cli config set --config-file ${ARDUINO_CONFIG_FILE} board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V${PSOC4ARDUINO_VERSION}/package_infineon_index.json


### install latest versions
arduino-cli core install --config-file ${ARDUINO_CONFIG_FILE} Infineon:xmc --additional-urls https://github.com/Infineon/XMC-for-Arduino/releases/latest/download/package_infineon_index.json
arduino-cli core install --config-file ${ARDUINO_CONFIG_FILE} infineon:psoc6 --additional-urls https://github.com/Infineon/arduino-core-psoc6/releases/latest/download/package_psoc6_index.json

### install a version for a core already installed
#arduino-cli core install --config-file ${ARDUINO_CONFIG_FILE} Infineon:xmc@${XMC4ARDUINO_VERSION}


# list cores
arduino-cli board listall --config-file ${ARDUINO_CONFIG_FILE} Infineon


# arduino-cli core search arduino
# arduino-cli core install arduino:avr@1.8.6
# arduino-cli core install arduino:renesas_uno@1.2.2
# ~/.arduino15/packages/arduino/hardware/renesas_uno/1.2.2/post_install.sh


# install Unity
cd /opt
git clone https://github.com/ThrowTheSwitch/Unity.git


