#!/bin/sh

cd /opt


curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/opt/bin sh -s ${ARDUINO_CLI_VERSION}

arduino-cli config init
arduino-cli config set board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V${XMC4ARDUINO_VERSION}/package_infineon_index.json
arduino-cli core update-index
arduino-cli core install Infineon:xmc@${XMC4ARDUINO_VERSION}

arduino-cli board listall Infineon:xmc


#  arduino-cli config set board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V${XMC4ARDUINO_VERSION}/package_infineon_index.json https://github.com/Infineon/arduino-core-psoc/releases/download/V${PSOC4ARDUINO_VERSION}/package_psoc_index.json && \

# arduino-cli core search arduino \
# arduino-cli core install arduino:avr@1.8.6 \
# \
# arduino-cli core install arduino:renesas_uno@1.2.2 \
# ~/.arduino15/packages/arduino/hardware/renesas_uno/1.2.2/post_install.sh \

# arduino-cli board listall Infineon:psoc \
# arduino-cli board listall Infineon \
# arduino-cli board listall
