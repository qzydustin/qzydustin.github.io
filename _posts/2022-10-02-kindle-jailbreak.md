---
layout: post
title: Kindle Jailbreak
date: 2022-10-02 12:17:25 -0700
categories: technology
---

## Jailbreak

The vulnerability exploited by the jailbreak method is fixed in firmware version 5.14.3. Therefore, the best version to jailbreak is 5.14.2.

1. Upgrade firmware to **5.14.2**
   Download the official firmware to the root of the Kindle storage, then click Menu → Settings → Device Options → Advanced Options → Update Your Kindle.

2. Reset Kindle
   Click Menu → Settings → Device Options →Reset.

3. Set Kindle
   Language choose English→**United Kingdom**.
   Ignore WiFi setting.

4. Enter demo mode
   Run **;demo** in Kindle's search box.

5. Restart
   Click Menu → Settings → Device Options →Restart.

6. [Katadelos's Jailbreak](https://www.mobileread.com/forums/showthread.php?t=346037)

   1. Download [watchthis-jailbreak-r03.zip](https://mega.nz/file/2ahlQKZS#jXyYLEp9rvRQCOzv7LNYBF-9fOfPhpigaLZMHZkN7fg), and get the corresponding files:

      - [device name]-[5.14.2].zip

      - demo.json

      - Update_hotfix_watchthis_custom.bin

   2. Create the directory **.demo** at the root of the Kindle storage.
      Copy **[device name]-[5.14.2].zip** and **demo.json** to .demo folder.
      Create an empty folder at **.demo/goodreads**.

   3. Click **Done** to install the jailbreak script.
      If an application error occurs, hard reboot the device by holding the power button, enter the demo menu again and click Sideload Content → Done once more **without** connecting to USB.

   4. Click **Exit** to exit the demo menu.

   5. Run **;dsts** in Kindle's search box.
      Click Help & User Guides → Get started to reboot.

   6. After the device has rebooted, run **;uzb** in Kindle's search box to turn on usb access.

   7. Copy Update_hotfix_watchthis_custom.bin to the root of the Kindle storage.
      Run **;dsts** in Kindle's search box.
      Click Device Options → Advanced Options → Update Your Kindle.

7. Install [Jailbreak Hotfix](https://www.mobileread.com/forums/showpost.php?p=3004892&postcount=1597) to prevent jailbreak lost after firmware update
   Copy bin file to the root of the Kindle storage, then click Menu → Settings → Device Options → Advanced Options → Update Your Kindle.

## Install extension

- [MobileRead Package Installer](https://www.mobileread.com/forums/showthread.php?t=251143)
  Since the Kindle firmware does not support direct installation of the plugin files by swiping them into the bin, you need to install them with this KUAL plugin MRPI. To install it, copy the **extensions** and **mrpackages** folder to the root of the Kindle storage. When need to install other extensions, copy extension's bin file to **mrpackages** folder, then run **;log mrpi** in Kindle's seach box.

- [KUAL](https://www.mobileread.com/forums/showthread.php?t=203326) or [KUAL(coplate)](https://www.mobileread.com/forums/showpost.php?p=3699392&postcount=304)
  KUAL (Kindle Unified Application Launcher), is a plug-in launcher. After installing KUAL, you can download or write your own plugins and launch them with KUAL. It has two versions, original and coplate. In most case, new device need to use coplate version.

- [GNU Awk Installer](https://www.mobileread.com/forums/showpost.php?p=2636883&postcount=50)
  It provides an install button for gawk in the KUAL menu. gawk will then be used by KUAL, instead of busybox awk. Long story short: it'll make KUAL parse your extensions faster, which is good.

- [Helper](https://www.mobileread.com/forums/showthread.php?t=203326)
  It provides several tools. Two of the more useful ones are "PREVENT ScreenSaver" and "ALLOW ScreenSaver".

- [KUAL+](https://www.mobileread.com/forums/showpost.php?p=2591705&postcount=1014)
  It extends the KUAL menu with more configuration options for KUAL itself.

- [BatteryStatus](https://www.mobileread.com/forums/showpost.php?p=2636886&postcount=52)
  It provides a function to see the status of battery.

- [Koreader](https://github.com/koreader/koreader)
  It provides an ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats.

- More

  [Snapshots of NiLuJe’s hacks](http://www.mobileread.com/forums/showthread.php?t=225030)
  [A helpful list of Extensions for KUAL](http://www.mobileread.com/forums/showthread.php?t=205064)

## Update

1. Check if the jailbreak still works
   Create a file named **RUNME.sh** at the root of the Kindle storage.

   ```shell
   #!/bin/sh

   eips 0 0 'JailBreak'
   ```

   Run **;log runme** in Kindle's search box. Note that if the word "JailBreak" appears in the upper left corner of the Kindle screen, the jailbreak still works.

2. Update K5 JailBreak Hotfix
   See Jailbreak part.

3. Update [firmware](https://www.amazon.com/gp/help/customer/display.html?nodeId=GKMQC26VQQMM8XSW)
   See Jailbreak part.

4. Install KUAL
   See Instal Extension part.
