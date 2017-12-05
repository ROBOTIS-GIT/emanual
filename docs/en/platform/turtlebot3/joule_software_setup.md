---
layout: archive
lang: en
ref: turtlebot3_joule_software_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/joule_software_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h6 2">
</div>

## [[Short] Install Linux on TurtleBot3 Waffle (Intel® Joule™)](#short-install-linux-on-turtlebot3-waffle-intel-joule)

In this section, the Alternative Ubuntu Desktop 16.04 LTS will be installed on Intel® Joule™.

**[Remote PC]** Download Ubuntu image `Alternative Ubuntu 16.04 for Intel® Joule™` from the below link.

- http://people.canonical.com/~platform/snappy/tuchuck/desktop-final/tuchuck-xenial-desktop-iso-20170317-0.iso

**[Remote PC]** In order to make a bootable installation USB drive, please follow the [Alternative install(Ubuntu Desktop 16.04 LTS)][alternative-installubuntu-desktop-1604-lts] section from the below link.

- https://developer.ubuntu.com/core/get-started/intel-joule

**[Remote PC]** Before getting started, The board needs to have its BIOS updated to [BIOS version #193][bios-version-193] to install Ubuntu Image. Download [BIOS version #193][bios-version-193] and flash the BIOS into the Joule by following instructions in the below link.

- https://software.intel.com/en-us/flashing-the-bios-on-joule

**Warning :** Updating to the latest BIOS(1J2 or higher) may cause unexpected problem of `Intel® Joule™` with Ubuntu 16.04 LTS. Please use only the recommended [BIOS version #193][bios-version-193].
{: .notice--warning}

**Warning :** `Intel® Joule™` comes with `passive heatsink` in the package. It is recommended to use the heatsink. In order to operate Joule without the heatsink, please follow the extra instruction: https://software.intel.com/en-us/node/721471
{: .notice--warning}

[bios-version-193]: https://downloadmirror.intel.com/26206/eng/joule-firmware-2017-02-19-193-public.zip
[alternative-installubuntu-desktop-1604-lts]: https://developer.ubuntu.com/core/get-started/intel-joule#alternative-install:-ubuntu-desktop-16.04-lts


## [[Long] Install Linux on TurtleBot3 Waffle (Intel® Joule™)](#long-install-linux-on-turtlebot3-waffle-intel-joule)

**[Intel® Joule™]** Connect `micro HDMI to HDMI cable`, `power connector supplied by OpenCR1.0`, `USB devices` including `Bootable USB drive`, `mouse` and `keyboard`. You might need a USB hub to plug multiple USB devices into Joule.

**[Intel® Joule™]** Installation will be proceeded as shown in below images. When Joule is turned on, monitor will blink about 3 times after 5 seconds, and print menu screen. Press <kbd>F7</kbd> to go to `Boot Manager`.

![](/assets/images/platform/turtlebot3/preparation/j1.JPG)

**[Intel® Joule™]** Select <kbd>USB Device</kbd>.

![](/assets/images/platform/turtlebot3/preparation/j2.JPG)

![](/assets/images/platform/turtlebot3/preparation/j3.JPG)

![](/assets/images/platform/turtlebot3/preparation/j4.JPG)

![](/assets/images/platform/turtlebot3/preparation/j5.JPG)

**[Intel® Joule™]** Select <kbd>Erase disk and install Ubuntu</kbd> then <kbd>continue</kbd>.

![](/assets/images/platform/turtlebot3/preparation/j6.JPG)

**[Intel® Joule™]** `Intel® Joule™` has two different disk drives: 16GB micro SD Card and 16GB eMMC. In this instruction, it is highly recommended to install `Alternarive Ubuntu for Joule` on the `16GB eMMC`. Select `MMC/SD card #2 (mmcblk1) - 15.7 GB MMC 016G32` then <kbd>continue</kbd>.

![](/assets/images/platform/turtlebot3/preparation/j7.JPG)

![](/assets/images/platform/turtlebot3/preparation/j8.JPG)

**[Intel® Joule™]** Installation will take about 10 minutes.

![](/assets/images/platform/turtlebot3/preparation/j9.JPG)

**[Intel® Joule™]** When installation is completed, click <kbd>Restart Now</kbd>.

![](/assets/images/platform/turtlebot3/preparation/j10.JPG)

**[Intel® Joule™]** Remove bootable USB drive from Joule.

![](/assets/images/platform/turtlebot3/preparation/j11.JPG)

**[Intel® Joule™]** Don't press any key. It will boot from <kbd>16GB eMMC</kbd> which is a default boot device.

![](/assets/images/platform/turtlebot3/preparation/j12.JPG)

![](/assets/images/platform/turtlebot3/preparation/j13.JPG)

![](/assets/images/platform/turtlebot3/preparation/j14.JPG)

**[Intel® Joule™]** Finish the rest of settings.

![](/assets/images/platform/turtlebot3/preparation/j15.JPG)

![](/assets/images/platform/turtlebot3/preparation/j16.JPG)

![](/assets/images/platform/turtlebot3/preparation/j17.JPG)

![](/assets/images/platform/turtlebot3/preparation/j18.JPG)

![](/assets/images/platform/turtlebot3/preparation/j19.JPG)

![](/assets/images/platform/turtlebot3/preparation/j20.JPG)

![](/assets/images/platform/turtlebot3/preparation/j21.JPG)
