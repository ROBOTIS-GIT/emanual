---
layout: archive
lang: en
ref: turtlebot3_faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/faq/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 49
---

<div style="counter-reset: h1 32"></div>

# [FAQ](#faq)

1. [Enable **SSH Server** in Raspberry Pi](#enable-ssh-server-in-raspberry-pi)
2. [**Timesync** between TurtleBot3 and Remote PC](#timesync-between-turtlebot3-and-remote-pc)
3. [**Setup DYNAMIXELs** for TurtleBot3](#setup-dynamixels-for-turtlebot3)
4. [Can I **Charge the Battery** when the Battery is Connected to TurtleBot3?](#can-i-charge-the-battery-when-the-battery-is-connected-to-turtlebot3)
5. [How to Download the **STL files** of TurtleBot3](#how-to-download-the-stl-files-of-turtlebot3)
6. [**Intel® Joule™** USB-C Port is not Recognized on Windows 10](#intel-joule-usb-c-port-is-not-recognized-on-windows-10)
7. [**Intel® Joule™** Freezes while Booting/Installation](#intel-joule-freezes-while-bootinginstallation)
8. [How to **Update Software**](#how-to-update-software)
9. [How to **Update Firmware**](#how-to-update-firmware)

---

## [Enable SSH Server in Raspberry Pi](#enable-ssh-server-in-raspberry-pi)

First you have to install `SSH` on `Remote PC` and `Raspberry Pi`.

``` bash
$ sudo apt-get install ssh
```

In case of Raspberry Pi (TurtleBot3 Burger and Waffle Pi), since the SSH server of Ubuntu MATE 16.04.x and Raspbian is disabled by default. If you want to enable SSH, please refer to the documents below.

- [SSH Instruction](https://www.raspberrypi.org/documentation/remote-access/ssh/)
- [Ubuntu MATE in Raspberry Pi](https://ubuntu-mate.org/raspberry-pi/)

or you can use following commands.

``` bash
$ sudo service ssh start
$ sudo ufw allow ssh
```

Before starting to connect SSH, you need to check `host name`. Redbox in below image shows it.

![](/assets/images/platform/turtlebot3/faq/computer_name.png)

Then, you can use SSH following command in `Remote PC`.

``` bash
$ ssh ${HOSTNAME}@xxx.xxx.xx.xx
```

![](/assets/images/platform/turtlebot3/faq/connection_ssh.png)


## [Timesync between TurtleBot3 and Remote PC](#timesync-between-turtlebot3-and-remote-pc)

**NOTE**: This solution is subject to connect internet on your `TurtleBot` and `Remote PC` under same network.
{: .notice--info}

- Install `ntpdate`, and synchronize to NTP server on both `TurtleBot` and` Remote PC`.

``` bash
$ sudo apt-get install ntpdate
$ sudo ntpdate ntp.ubuntu.com
```

## [Setup DYNAMIXELs for TurtleBot3](#setup-dynamixels-for-turtlebot3)

**WARNING**: Please connect only **ONE** DYNAMIXEL with OpenCR.
{: .notice--warning}

1. **Upload Setup Firmware to OpenCR**  
As shown in the below image, find `Examples` > `turtlebot3` > `turtlebot3_setup` > `turtlebot3_setup_motor` and open the example.  

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_1.png)

2. **Click the Upload button on the Arduino IDE.**  
If example upload to the OpenCR is completed, connect **ONE** DYNAMIXEL to the OpenCR.  
Click the `Serial Monitor` icon in the upper right corner as shown in the below image.  

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_2.png)

3. **Reset OpenCR**  
Press the `RESET` button if the example does not run properly.

    ![](/assets/images/parts/controller/opencr10/bootloader_19.png)

4. **Select an Option**  
When the `Serial Monitor` is running, menu for the DYNAMIXEL setup will be displayed as shown below.  
TurtleBot3 consists of two DYNAMIXEL actuators for the left and right wheels, so select the proper option based on the assembled position.  
For example, to set up the left side DYNAMIXEL, enter `1` to the input textbox.

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_3.png)

5. **Confirmation**  
To prevent any mistakes, a confirmation will be required.  
To proceed the configuration, enter `Y` to the input textbox.

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_4.png)

6. **Configure DYNAMIXEL**  
The setup tool starts searching the connected DYNAMIXEL using different IDs and Baudrates.  
If DYNAMIXEL is detected, it will be automatically set up for TurtleBot3.  
When the setup is completed, `OK` message is printed on the screen.

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_5.png)

7. **Test DYNAMIXEL**  
Complete the setup procedure and verify if the change has been properly made.  
If you select one of the test menu for the DYNAMIXEL, the selected DYNAMIXEL will begin to rotate in the clockwise and counterclockwise.  
To end the test, press the `Enter`.  
For example, to test the left DYNAMIXEL, enter `3` as shown in below and enter `4` for the right DYNAMIXEL.

    ![](/assets/images/platform/turtlebot3/faq/dynamixel_setup_6.png)

8. **Upload TurtleBot3 Core**  
If DYNAMIXEL setup is completed, TurtleBot3 Core example should be uploaded to OpenCR.  
Please find proper core example from `Examples` > `tutlebot3` > `turtlebot3_burger` or `turtlebot3_waffle` > `turtlebot3_core` and upload the example to OpenCR.

## [Can I Charge the Battery when the Battery is Connected to TurtleBot3?](#can-i-charge-the-battery-when-the-battery-is-connected-to-turtlebot3)

Charging and discharging the battery at the same is **NOT** recommended and this may void the warranty of the product. If TurtleBot3 needs to be turned on while charging/replacing battery, please follow below procedure:

1. Connect SMPS 12V 5A to OpenCR
2. Disconnect the depleted battery from OpenCR
3. Connect the depleted battery to battery charger or replace the depleted battery with a fully charged battery
4. Connect the fully charged battery to OpenCR
5. Disconnect SMPS 12V 5A from OpenCR

## [How to Download the STL Files of TurtleBot3](#how-to-download-the-stl-files-of-turtlebot3)

You can download it in the following way.

We released the TurtleBot3 Friends hardware design file at the link below.

- [Locomotion (TurtleBot3 Friends)](/docs/en/platform/turtlebot3/locomotion/#turtlebot3-friends-car)

So, you can download the STL files directly from each Onshape address as shown in the following figures.

1. Sign in. (If you do not have an ID, you have to create one.)
2. Click the "toggle tab manager" (A menu will appear on the left side of the browser.)
3. Click the "Parts folder"
4. Right-click on the icon of the file you want to download.
5. Click the "Export..."
6. Finally, you can download the output file type you want.

![](/assets/images/platform/turtlebot3/faq/download_the_stl_files_01.png)

![](/assets/images/platform/turtlebot3/faq/download_the_stl_files_02.png)


## [Intel® Joule™ USB-C Port is not Recognized on Windows 10](#intel-joule-usb-c-port-is-not-recognized-on-windows-10)

Some users have reported that the USB-C port is not recognized on Windows 10 when they were trying to update BIOS. Please check below link that describes the solution that worked out (Thanks for ***Rknlhrqy*** and ***VRAORESEARCH***).

1. [ROS Discourse](https://discourse.ros.org/t/turtlebot-3-successfully-upload-alternative-ubuntu-desktop-16-04-to-joule/2224)
1. [Intel Communities](https://communities.intel.com/thread/109766)


## [Intel® Joule™ Freezes while Booting/Installation](#intel-joule-freezes-while-bootinginstallation)

If BIOS firmware is not properly installed, this might happen. Please burn the BIOS firmware 193 release version again.

1. Turn off the Joule.
2. Proceed BIOS firmware #193 [update](https://software.intel.com/en-us/flashing-the-bios-on-joule) using file from the below link.
- [Download BIOS Firmware #193](https://downloadmirror.intel.com/26206/eng/joule-firmware-2017-02-19-193-public.zip)
3. Make sure that you see the message in the red box.

![](/assets/images/platform/turtlebot3/faq/nvstorage.png)

## [How to Update Software](#how-to-update-software)

**[TurtleBot3]**

```bash
$ cd ~/catkin_ws/src/
$ rm -rf turtlebot3/ turtlebot3_msgs/ hls_lfcd_lds_driver/
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws/src/turtlebot3
$ sudo rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
$ cd ~/catkin_ws/
$ rm -rf build/ devel/
$ cd ~/catkin_ws && catkin_make -j1
```

**[RemotePC]**

```bash
$ cd ~/catkin_ws/src/
$ rm -rf turtlebot3/ turtlebot3_msgs/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws/
$ rm -rf build/ devel/
$ cd ~/catkin_ws && catkin_make
```

## [How to Update Firmware](#how-to-update-firmware)

**[TurtleBot3]**

- Burger

```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=burger
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR/raw/master/arduino/opencr_release/shell_update/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
```

- Waffle or Waffle Pi

```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=waffle
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR/raw/master/arduino/opencr_release/shell_update/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
```
