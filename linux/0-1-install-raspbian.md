# install Raspbian (Raspberry Pi OS)

Mainly follow the guide: https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up

Raspberry Pi Imager for bootable SD card: https://www.raspberrypi.org/downloads/
Raspberry Pi OS image direct download: https://www.raspberrypi.org/downloads/raspberry-pi-os/

the device is Raspberry Pi 4B with 2GiB memory

my main tweak to `/boot/config.txt`: (check: https://www.raspberrypi.org/documentation/configuration/config-txt/)
```
#uncomment to overclock the arm. 700 MHz is the default.
# https://www.raspberrypi.org/forums/viewtopic.php?t=270898#p1643857
# https://www.raspberrypi.org/forums/viewtopic.php?t=250167#p1527606
arm_freq=1600
arm_freq_min=400
over_voltage=-4
```

before first boot, check `./1-0-wpa_supplicant.md` for headless WiFi setup

with no extra USB device connected, 5V2A charger is enough for the basic server need

consider attach fan or heatsink to reduce SPU temperature (~55°C with heatsink, ~53°C after `/boot/config.txt` tweak)
