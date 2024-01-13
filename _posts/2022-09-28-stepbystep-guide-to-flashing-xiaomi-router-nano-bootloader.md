---
title: Step-by-Step Guide to Flashing Xiaomi Router Nano Bootloader
date: 2022-09-28 14:43:27 -0700
category: Technology
---

The Xiaomi router nano, with its MTK 7628 chipset, is a compact yet powerful device. This tutorial will guide you through gaining root access and flashing its bootloader, enhancing its capabilities and performance.

## Gaining Root Access

To enable SSH on Xiaomi's official firmware, two prerequisites must be met:

1. The firmware must be the development version, available for [download here](https://www1.miwifi.com/miwifi_download.html).
2. The `nvram set ssh_en=1` setting needs to be enabled. Since the nano lacks a USB interface, its default `ssh_en` is 1.

Once SSH is enabled, the root password can be obtained through an algorithm that calculates it based on the router's S/N.

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

## Flashing the Bootloader

### Backup Process

It's advisable to backup the firmware before proceeding with any flashing:

```shell
dd if=/dev/mtd0 of=/tmp/all.bin
```

Ensure to transfer the backup file to your computer using the SCP protocol.

### Flashing Breed Bootloader

[Breed](https://breed.hackpascal.net) is a highly recommended bootloader. Start by downloading the [breed-mt7688-reset38.bin](https://breed.hackpascal.net/breed-mt7688-reset38.bin) and transfer it to the router's /tmp directory.

```shell
mtd -r write /tmp/breed-mt7688-reset38.bin Bootloader
```

Breed provides a safety net by allowing recovery even if incorrect firmware is flashed.

### Entering Breed

To access the breed interface:

1. Connect your PC to the router using a network cable.
2. Use the LAN port, not the blue WAN port.
3. Disconnect power, hold the Reset button, then reconnect power. Wait for the yellow light to blink (about 5 seconds) before releasing Reset.
4. Access the breed interface by navigating to 192.168.1.1 in a browser.

This guide aims to simplify the process of flashing the bootloader on your Xiaomi Router Nano, unlocking its full potential and ensuring a smooth, trouble-free experience.
