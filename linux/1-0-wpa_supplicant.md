# `wpa_supplicant`

`wpa_supplicant` is a cross-platform supplicant with support for WEP, WPA and WPA2.
In other words for connecting to most Wi-Fi with password.

check: https://wiki.archlinux.org/index.php/wpa_supplicant


#### `wpa_passphrase`

for generate wpa psk: (drop the comment source password if you like to)
```shell script
wpa_passphrase "ACCESS-POINT-SSID" "THE-PASSWORD"
wpa_passphrase "ACCESS-POINT-SSID-BACKUP" "THE-PASSWORD-BACKUP"
## network={
## 	ssid="ACCESS-POINT-SSID"
## 	#psk="THE-PASSWORD"
## 	psk=ddcbf7bc2471580f02d4d6dc72caffd06939b4b2dbabdcee01cd10b2ed6b14b8
## }
```

#### config for `wpa_supplicant`

for auto switch between multiple SSID:
https://www.raspberrypi.org/forums/viewtopic.php?p=1088738&sid=71476bfada90462f0c818dc1d2fb78b7#p1088738

the result looks like:
```shell script
cat /etc/wpa_supplicant/wpa_supplicant*.conf
## network={
## 	ssid="ACCESS-POINT-SSID"
## 	#psk="THE-PASSWORD"
## 	psk=ddcbf7bc2471580f02d4d6dc72caffd06939b4b2dbabdcee01cd10b2ed6b14b8
## 	priority=80
## }
## 
## network={
## 	ssid="ACCESS-POINT-SSID-BACKUP"
## 	#psk="THE-PASSWORD-BACKUP"
## 	psk=a72cf09ad5824fc2cb1346c19cdb6a9853f88f978fd7cd05bb1a7216665d90ab
## 	priority=60
## }
```

for WiFi at boot with systemd, check: https://wiki.archlinux.org/index.php/wpa_supplicant#At_boot_(systemd)
and: https://ladvien.com/installing-arch-linux-raspberry-pi-zero-w/
a network file is needed like: `/etc/systemd/network/wlan0.network`
then enable the service:
```shell script
sudo systemctrl enable wpa_supplicant@wlan0.service
# or manual linking for headless setup
sudo ln -sfT /usr/lib/systemd/system/wpa_supplicant@.service \
  /etc/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
```

also check `systemd-networkd` and `systemd-resolved`
