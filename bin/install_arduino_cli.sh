#!/bin/sh

cd /opt


curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/opt/bin sh -s ${ARDUINO_CLI_VERSION}

#ln -s /opt/bin/arduino-cli /opt/bin/arduino-cli.exe
ln -s `which arduino-cli` /opt/bin/arduino-cli.exe

arduino-cli config init --config-file /root/.arduino15/arduino-cli.yaml --overwrite

### latest
arduino-cli config set --config-file /root/.arduino15/arduino-cli.yaml board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/latest/download/package_infineon_index.json
### Vx.y.z
#arduino-cli config set --config-file /root/.arduino15/arduino-cli.yaml board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V${XMC4ARDUINO_VERSION}/package_infineon_index.json

arduino-cli core update-index --config-file /root/.arduino15/arduino-cli.yaml

### latest version
arduino-cli core install --config-file /root/.arduino15/arduino-cli.yaml Infineon:xmc
### a version already downloaded
#arduino-cli core install --config-file /root/.arduino15/arduino-cli.yaml Infineon:xmc@${XMC4ARDUINO_VERSION}

arduino-cli board listall --config-file /root/.arduino15/arduino-cli.yaml Infineon:xmc


# arduino-cli config set board_manager.additional_urls https://github.com/Infineon/arduino-core-psoc/releases/download/V${PSOC4ARDUINO_VERSION}/package_psoc_index.json
# arduino-cli board listall Infineon:psoc

# arduino-cli core search arduino
# arduino-cli core install arduino:avr@1.8.6
# arduino-cli core install arduino:renesas_uno@1.2.2
# ~/.arduino15/packages/arduino/hardware/renesas_uno/1.2.2/post_install.sh

# arduino-cli board listall Infineon
# arduino-cli board listall



# arduino-cli config init --config-file /home/jensb/.arduino15/arduino-cli.yaml --overwrite

# arduino-cli config set --config-file /home/jensb/.arduino15/arduino-cli.yaml board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/latest/download/package_infineon_index.json
# #arduino-cli config set --config-file /home/jensb/.arduino15/arduino-cli.yaml board_manager.additional_urls https://github.com/Infineon/XMC-for-Arduino/releases/download/V3.4.1/package_infineon_index.json

# arduino-cli core update-index --config-file /home/jensb/.arduino15/arduino-cli.yaml

# #arduino-cli core install --config-file /home/jensb/.arduino15/arduino-cli.yaml Infineon:xmc@3.5.1
# #@${XMC4ARDUINO_VERSION}
# arduino-cli core install --config-file /home/jensb/.arduino15/arduino-cli.yaml Infineon:xmc

# arduino-cli board listall --config-file /home/jensb/.arduino15/arduino-cli.yaml Infineon:xmc
