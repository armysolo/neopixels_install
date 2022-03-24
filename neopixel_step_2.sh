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
echo "installing ws281x library"
run sudo pip3 install rpi_ws281x adafruit-circuitpython-neopixel || exit 1
echo "re-installing raspi blinka"
run sudo python3 -m pip install --force-reinstall adafruit-blinka || exit 1
echo "success, now run neopixel_step3.sh"
exit 0