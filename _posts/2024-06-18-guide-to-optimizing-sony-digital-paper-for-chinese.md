---
title:  Guide to Optimizing Sony Digital Paper for Chinese
date:   2024-06-18 22:49:50
category: Technology
---

I got a Sony DPT-RP1 digital paper yesterday. It is such a great tool to read A4 PDF files due to its large screen. The only shortcoming is that it is the Japanese version. The Japanese version has Japanese and English language and input methods, the US version only has English language and input methods, and the Chinese version has Chinese and English language and input methods. When opening a book with Chinese chapters, the Chinese characters in the Table of Contents cannot be displayed normally, but the Chinese and American versions can do that.

The reason why Chinese cannot be displayed correctly is that the same Chinese character is written in different ways in various countries and regions in East Asia, which are similar but different. The Japanese version of the system will give preference to Japanese Chinese characters, and if they do not exist, the standard simplified Chinese characters will be used.

Through my research, I found that the firmware on Sony's website in China, Japan, and the US is all the same. This means that the regional version identifier should be stored somewhere other than the firmware. The regional version limitation cannot be solved by flashing the firmware. 

## Solution

First, we need to use the open-source tool [dpt-tools](https://github.com/HappyZ/dpt-tools) to get root access to the system. [Guide](https://github.com/HappyZ/dpt-tools/wiki)

Then, we need to modify the system to achieve our goals.

- If we only want to correct the Chinese character font in the Table of Contents, we only need to do steps 1 and 2.
- If we want to input Chinese to use the search function, we need to do step 3.
- After doing steps 1,2 and 3, the Japanese version device will be the same as another version.
- If we want to display Chinese characters normally in the 3rd app, we need to do the rest steps to modify the system font setting.

### Steps

1. Open the app "Test Mode" and change SKU to C/U.

2. Change the system language to CN/US.
   ```shell
   adb shell am start -a android.settings.LOCALE_SETTINGS
   ```

3. (Optional) Change the input to Chinese IME.
   ```shell
   adb shell am start -a android.settings.INPUT_METHOD_SETTINGS
   ```

4. Enter the device shell.
   ```shell
   adb shell
   mount -o rw,remount /system
   ```

5. Open the font file '/system/etc/fonts_split_1_common.xml'
   Modify the value in `<family name= "default">` and `<family name="sans-serif">`

   - Original
     ```xml
             <font weight="400" style="normal">SSTJpPro-Light.otf</font>
             <font weight="500" style="normal">SSTJpPro-Regular.otf</font>
             <font weight="700" style="normal">SSTJpPro-Bold.otf</font>
     ```

   - Modified
     ```xml
             <font weight="400" style="normal">SST-Light.otf</font>
             <font weight="500" style="normal">SST-Regular.otf</font>
             <font weight="700" style="normal">SST-Bold.otf</font>
     ```

   Since the system does not have an editor, you can use the following command to back up the original file, and then modify it and then transfer it back to achieve the purpose of modification.

   ```shell
   # Pull the backup files to the local machine
   adb pull /system/etc/fonts_split_1_common.xml fonts_split_1_common.xml.bak
   
   # Modify the file by using any tools you have
   # Push font configuration to the device's /sdcard/Download directory
   adb push fonts_split_1_common.xml /sdcard/Download
   
   # Enter the device shell
   adb shell
   mount -o rw,remount /system
   
   # Move new font configuration files to the system directory
   mv /sdcard/Download/fonts_split_1_common.xml /system/etc/fonts_split_1_common.xml
   chown root:root /system/etc/fonts_split_1_common.xml
   chmod 644 /system/etc/fonts_split_1_common.xml
   ```

   

6. Reboot and done.



Extras: The backup of fonts_split_1_common.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<!--
    NOTE: this is the newer (L) version of the system font configuration,
    supporting richer weight selection. Some apps will expect the older
    version, so please keep system_fonts.xml and fallback_fonts.xml in sync
    with any changes, even though framework will only read this file.

    All fonts withohut names are added to the default list. Fonts are chosen
    based on a match: full BCP-47 language tag including script, then just
    language, and finally order (the first font containing the glyph).

    Order of appearance is also the tiebreaker for weight matching. This is
    the reason why the 900 weights of Roboto precede the 700 weights - we
    prefer the former when an 800 weight is requested. Since bold spans
    effectively add 300 to the weight, this ensures that 900 is the bold
    paired with the 500 weight, ensuring adequate contrast.
-->
<familyset version="22">
    <!-- first font is default -->
    <family name="default">
        <font weight="400" style="normal">SSTJpPro-Light.otf</font>
        <font weight="500" style="normal">SSTJpPro-Regular.otf</font>
        <font weight="700" style="normal">SSTJpPro-Bold.otf</font>
    </family>

    <family name="sst">
        <font weight="400" style="normal">SST-Light.otf</font>
        <font weight="500" style="normal">SST-Regular.otf</font>
        <font weight="700" style="normal">SST-Bold.otf</font>
    </family>

    <family name="sstjppro">
        <font weight="400" style="normal">SSTJpPro-Light.otf</font>
        <font weight="500" style="normal">SSTJpPro-Regular.otf</font>
        <font weight="700" style="normal">SSTJpPro-Bold.otf</font>
    </family>

    <family name="dyna">
        <font weight="400" style="normal">DFHEI5-SONY.ttf</font>
        <font weight="500" style="normal">DFHEI5-SONY.ttf</font>
        <font weight="700" style="normal">DFHEI5-SONY.ttf</font>
    </family>

    <family name="sans-serif">
        <font weight="400" style="normal">SSTJpPro-Light.otf</font>
        <font weight="500" style="normal">SSTJpPro-Regular.otf</font>
        <font weight="700" style="normal">SSTJpPro-Bold.otf</font>
    </family>
</familyset>

```
