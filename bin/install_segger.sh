# apt-get update
# apt-get install -y --fix-missing udev

mkdir -p /opt/bin
mkdir -p /opt/SEGGER

SEGGER_VERSION=V824

cd /myLocalWorkingDir

cp JLink_Linux_${SEGGER_VERSION}_x86_64.tgz /opt/SEGGER
cd /opt/SEGGER


tar zxvf JLink_Linux_${SEGGER_VERSION}_x86_64.tgz
chmod a-w JLink_Linux_${SEGGER_VERSION}_x86_64

ln -s /opt/SEGGER/JLink_Linux_${SEGGER_VERSION}_x86_64/ /opt/SEGGER/JLink
ln -s /opt/SEGGER/JLink_Linux_${SEGGER_VERSION}_x86_64/JLink*Exe /opt/bin

mkdir -p /etc/udev/rules.d/
cp JLink_Linux_${SEGGER_VERSION}_x86_64/99-jlink.rules /etc/udev/rules.d/


# if [ -e "/lib/systemd/systemd-udevd" ]; then
#     sudo /lib/systemd/systemd-udevd --daemon
# else
#     sudo service udev restart
# fi


# sudo udevadm control --reload
# udevadm trigger --action=remove --attr-match=idVendor=1366 --subsystem-match=usb
# udevadm trigger --action=add    --attr-match=idVendor=1366 --subsystem-match=usb
# #sudo udevadm monitor &
