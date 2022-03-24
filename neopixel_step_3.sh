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

cd ~/
echo "Cloning repository"
run git clone https://github.com/dreamerwise/NeopixelsKlipper.git || exit 1
mv ./NeopixelsKlipper/* ./
rm -rf NeopixelsKlipper
cd neopixels
echo "Setting up service"
run sudo mv ./klipper_monitor.service /etc/systemd/system/klipper_monitor.service || exit 1
run systemctl enable klipper_monitor || exit 1
run systemctl start klipper_monitor || exit 1
echo "success"
exit 0
