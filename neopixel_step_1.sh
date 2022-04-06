#!/bin/bash

run() {
  $*
  if [ $? -ne 0 ]
  then
    echo "$* failed with exit code $?"
    return 1
  else
    return 0
  fi
}

cd ~/ || exit 1
echo "installing python"
run sudo apt-get install python3-pip -y || exit 1
echo "installing setuptools"
run sudo pip3 install --upgrade setuptools || exit 1
echo "installing adafruit libraries"
run sudo pip3 install --upgrade adafruit-python-shell || exit 1
echo "installing RPI libraries"
run wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/raspi-blinka.py || exit 1
echo "installing raspi blinka"
run sudo python3 raspi-blinka.py -y || exit 1
echo "success, you should reboot"
exit 0
