---
title: Tutorial for Xiaomi Router Nano Bootloader Flash
date: 2022-09-28 14:43:27 -0700
category: Technology
---

Xiaomi router nano is such a cute router with MTK 7628. This tutorial is about how to get root access and flash its bootloader.

## Get root access

In Xiaomi's official firmware, two conditions need to be met to turn on SSH.

1. The firmware is the development version. [Official Download](https://www1.miwifi.com/miwifi_download.html)
2. nvram set ssh_en=1. The nano does not have a USB interface, so the default ssh_en of it is 1.

After turning on SSH, we need to get the root password. An algorithm calculates all Xiaomi routers' root passwords by their S/N.

```python
import sys
import hashlib

# Xiaomi router r1d is different from others
salt = {'r1d': 'A2E371B0-B34B-48A5-8C40-A7133F3B5D88',
        'others': 'd44fb0960aa0-a5e6-4a30-250f-6d2df50a'}


def get_salt(sn):
    if "/" not in sn:
        return salt["r1d"]

    return "-".join(reversed(salt["others"].split("-")))


def calc_passwd(sn):
    passwd = sn + get_salt(sn)
    m = hashlib.md5(passwd.encode())
    return m.hexdigest()[:8]


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <S/N>")
        sys.exit(1)

    serial = sys.argv[1]
    print(calc_passwd(serial))

```

## Flash bootloader

### Backup

It is better to back up the firmware before flashing anything.

```shell
dd if=/dev/mtd0 of=/tmp/all.bin
```

Remember to use the SCP protocol to transfer the file to the computer.

### Flash Breed

Compared with other bootloaders, the [breed](https://breed.hackpascal.net) is the best one. First, download the [breed-mt7688-reset38.bin](https://breed.hackpascal.net/breed-mt7688-reset38.bin) version and transfer it to router /tmp.

```shell
mtd -r write /tmp/breed-mt7688-reset38.bin Bootloader
```

Breed will protect routers, even flash the wrong firmware into them. So if the router cannot boot up, enter breed to try to fix it, such as flash another firmware.

### Enter breed

1. Connect the PC to the router with a network cable.
2. Connect to the LAN port of the router, not the blue WAN!
3. Unplug the power, press and hold Reset.
4. Plug the power, wait for the yellow light to blink (or wait about 5s), and then release Reset.
5. Enter 192.168.1.1 to enter the breed interface.
