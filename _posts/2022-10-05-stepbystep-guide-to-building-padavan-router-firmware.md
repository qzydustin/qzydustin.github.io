---
title: Step-by-Step Guide to Building Padavan Router Firmware
date: 2022-10-05 10:03:05 -0700
category: Technology
---

[Padavan](https://bitbucket.org/padavan/rt-n56u/src/master/) is a notable open-source firmware project, ideal for routers with MTK chips. While it's officially designed for certain ASUS routers, it can be adapted for most MTK chip routers (Ralink RT3883, MT7620, MT7621, MT7628) through configuration adjustments. This tutorial focuses on building Padavan firmware for the MI-NANO router, a device that, despite its impressive design, suffers from outdated official firmware and lack of IPv6 support.

## Build Firmware Process

1. **Install Tools and Clone Source to Linux System:**  
   It's essential to use a compatible Debian version for compiling the firmware. Debian Jessie is recommended due to its compatibility with Padavan's last update in 2018. Install the necessary tools and clone the Padavan repository with the following commands:

   ```shell
   apt install build-essential gawk pkg-config gettext automake autogen texinfo autoconf libtool bison flex zlib1g-dev libgmp3-dev libmpfr-dev libmpc-dev git sudo vim module-init-tools
   git clone https://bitbucket.org/padavan/rt-n56u.git /opt/rt-n56u
   ```

2. **Build the Toolchain:**  
   Since routers typically use MIPS architecture, and PCs are mostly x86_64 or Arm, cross-compilation tools are required. This step involves building a MIPS architecture toolchain:

   ```shell
   bash /opt/rt-n56u/toolchain-mipsel/build_toolchain
   ```

3. **Edit Config File:**  
   Located at `/opt/rt-n56u/trunk/.config`, the default config file is for ASUS routers. Additional ASUS configs can be found in `/opt/rt-n56u/trunk/configs/templates`. For non-ASUS routers, refer to [Padavan-ng](https://gitlab.com/padavan-ng/padavan-ng), a fork of Padavan, for more brand-specific configurations. Ensure your `/opt/rt-n56u/trunk/.config` is modified accordingly, and the `/opt/rt-n56u/trunk/board` folder contains the necessary board config files for your router model.

4. **Clean and Build Firmware:**  
   Execute the following commands to clean the build environment and then build the firmware:

   ```shell
   bash /opt/rt-n56u/trunk/clear_tree
   bash /opt/rt-n56u/trunk/build_firmware
   ```

   The newly built firmware will be located in the `/opt/rt-n56u/trunk/images` folder.

This guide aims to demystify the process of building custom Padavan firmware for your MI-NANO router, enabling you to enhance its functionality and support modern features like IPv6.
