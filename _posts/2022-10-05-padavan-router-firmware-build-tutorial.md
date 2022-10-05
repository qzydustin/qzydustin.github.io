---
layout: post
title: Padavan Router Firmware Build Tutorial
date: 2022-10-05 10:03:05 -0700
categories: technology
---

[Padavan](https://bitbucket.org/padavan/rt-n56u/src/master/) is great router firmware project for almost MTK chip router. It's open source, stable, extensible, and has a strong wireless signal. In official, this firmware only support several ASUS routers. However, after editing config file and board folder, most MTK chip(Ralink RT3883/MT7620/MT7621/MT7628) router can be supported.

This tutorial is about how to build MI-NANO router's Padavan firmware. MI NANO is a great and cute router, but its official firmware is no longer updated and does not support IPv6. Therefore, I decide to flash its firmware to Padavan.

1. Install tools and clone the source to Linux system
   After my testing, the latest version of Debian could not compile the firmware successfully. I choose to use Debian jessie version, because Debian jessie released in 2018 and the Padavan's last update data is also in 2018. This is a useful tip. To do this, run the following commands.

   ```shell
   apt install build-essential gawk pkg-config gettext automake autogen texinfo autoconf libtool bison flex zlib1g-dev libgmp3-dev libmpfr-dev libmpc-dev git sudo vim module-init-tools
   
   git clone https://bitbucket.org/padavan/rt-n56u.git /opt/rt-n56u
   ```

2. Make toolchain
   The router is MIPS architecture and our PC is usually x86_64 or Arm architecture. Therefore, we need to use tools to cross compile. To do this, run the following commands.

   ```shell
   bash /opt/rt-n56u/toolchain-mipsel/build_toolchain
   ```

3. Edit config file
   The config file locates in /opt/rt-n56u/trunk/.config. The original file is ASUS's config, and more ASUS configs are provides in /opt/rt-n56u/trunk/configs/templates.
   [Padavan-ng](https://gitlab.com/padavan-ng/padavan-ng) is a fork of official Padavan, and provides lots of other brands [config](https://gitlab.com/padavan-ng/padavan-ng/-/tree/master/trunk/configs/templates). I recommend to reference Padavan-ng's configs to make own configs to build official Padavan.
   After this step, the /opt/rt-n56u/trunk/.config should be edited and /opt/rt-n56u/trunk/board folder should include new brands' board config files.
4. Clean and build
   To do this, run the following commands.

   ```shell
   bash /opt/rt-n56u/trunk/clear_tree
   bash /opt/rt-n56u/trunk/build_firmware
   ```

   Then, the firmware will be available in /opt/rt-n56u/trunk/images folder.
