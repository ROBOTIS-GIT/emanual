---
layout: archive
lang: en
ref: turtlebot3_opencr1_0_software_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/opencr1_0_software_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>

# [OpenCR1.0 Software Setup](#opencr10-software-setup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**Warning :** The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do **NOT** apply this instruction to your TurtleBot3.
{: .notice--warning}

**Note :** OpenCR1.0 is pre-loaded with the software needed to run your specific TurtleBot3 model(Burger or Waffle). Refer to the information below only if you want to modify the existing software or write new software for OpenCR1.0.
{: .notice--info}

**Note :** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame` and OpenCR1.0 software setup can be done from Intel® Joule™.
{: .notice--info}

OpenCR1.0 controls DYNAMIXELs with instructions from the SBC. To be able to control DYNAMIXELs, a specific firmware should be installed on the board. See the descriptions and configure the settings.

## [ArduinoIDE Settings for OpenCR1.0](#arduinoide-settings-for-opencr10)

Following instructions will setup OpenCR1.0 Arduino development environment on the `Remote PC`.

### [USB Port Settings](#usb-port-settings)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

**[Remote PC]** The following commands allow to use OpenCR1.0 USB port for uploading `Arduino IDE` program without acquiring root permission.

``` bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
$ sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

![](/assets/images/platform/turtlebot3/preparation/7_1_1_usb_port_setting.png)

### [Compiler Settings](#compiler-settings)

**[Remote PC]** OpenCR1.0 libraries are designed for 32-bit platform, therefore, 64-bit PC requires 32-bit compiler for Arduino IDE.

``` bash
$ sudo apt-get install libncurses5-dev:i386
```

![](/assets/images/platform/turtlebot3/preparation/7_1_2_compiler_settings.png)


### [Install Arduino IDE](#install-arduino-ide)

**[Remote PC]** Download the latest version of `Arduino IDE` from official Arduino homepage and install the program. OpenCR1.0 supports Arduino IDE `1.6.12` or later (OpenCR1.0 has also been tested with Arduino IDE `1.8.1`.).

- [Download Arduino](https://www.arduino.cc/en/Main/Software)

**[Remote PC]** Extract downloaded file to desired folder and execute the install file in the folder from the terminal. The below example uses *tools* folder in the root directory (`~/`). This folder will act as Arduino IDE folder.

``` bash
$ cd ~/tools/arduino-1.8.1
$ ./install.sh
```

**[Remote PC]** Open the script file with below command.

``` bash
$ gedit ~/.bashrc
```

**[Remote PC]** Append below `Arduino IDE` path information at the end of the `bashrc` file. It is recommended to use **gedit editor**. (Use another editor if necessary)

``` bash
$ export PATH=$PATH:$HOME/tools/arduino-1.8.1
```

**[Remote PC]** Last but not least, `source` the ``bashrc`` file to apply changes.

``` bash
$ source ~/.bashrc
```

### [Run Arduino IDE](#run-arduino-ide)

**[Remote PC]** In order to run `Arduino IDE` on Linux platform, enter below command on the terminal.

``` bash
$ arduino
```

**[Remote PC]** If the program is installed and configured correctly, you'll be able to see GUI program as below.

![](/assets/images/platform/turtlebot3/preparation/ide0.png)

### [Porting OpenCR1.0 to Arduino IDE](#porting-opencr10-to-arduino-ide)

#### [Preferences](#preferences)

**[Remote PC]** When `Arduino IDE` is running, go to `File` → `Preferences` from the menu of the program. When the *Preferences* window appears, copy and paste following link to the `Additional Boards Manager URLs` textbox. (This step may take about 20 min.)

``` bash
$ https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```

![](/assets/images/platform/turtlebot3/preparation/ide1.png)

#### [Install OpenCR1.0 Package from Boards Manager](#install-opencr10-package-from-boards-manager)

**[Remote PC]** Go to `Tools` → `Board` → `Boards Manager`.

![](/assets/images/platform/turtlebot3/preparation/ide2.png)

**[Remote PC]** Type `OpenCR` into the textbox to find the `OpenCR by ROBOTIS` package. If the package is found, click `Install`.

![](/assets/images/platform/turtlebot3/preparation/ide3.png)

**[Remote PC]** When the package installation is completed, `INSTALLED` text will be appeared next to the package name.

![](/assets/images/platform/turtlebot3/preparation/ide4.png)

**[Remote PC]** See if `OpenCR Board` is now in the list of `Tools` → `Board`. Select `OpenCR Board` to import OpenCR Board source.

![](/assets/images/platform/turtlebot3/preparation/ide5.png)

#### [Port Setting](#port-setting)

**[Remote PC]** This section shows how to setup the USB port for program upload. OpenCR1.0 should be connected to the PC with the USB port.
 
**[Remote PC]** Select `Tools` → `Port` → `/dev/ttyACM0`.

**Warning :** The last digit value `0` in the string ``/dev/ttyACM0`` might be different depend on the USB connection environment.
{: .notice--warning}

![](/assets/images/platform/turtlebot3/preparation/ide6.png)

### [Writing Bootloader (can be skipped)](#writing-bootloader-can-be-skipped)

**Note :** This section is not necessary until there is new updates in the OpenCR bootloader. Once the bootloader is burned on the board, IT DOESN'T NEED EXTRA BURNING.
{: .notice--info}

The STM32F7xx, which is used for the main MCU of OpenCR1.0, supports DFU(Device Firmware Upgrade). This enables built-in bootloader of the MCU to boot with the DFU protocol by using USB, primarily for the bootloader initialization, the recovery mode and the bootloader update. The biggest advantage of using bootloader with USB is that JTAG equipment is not required. Therefore, writing the new firmware by using the DFU mode which is embedded in the MCU will not require writing / debugging equipment such as STLink.

#### [Programmer Setting](#programmer-setting)

**[Remote PC]** Go to `Tools` → `DFU-UTIL`

![](/assets/images/platform/turtlebot3/preparation/ide7.png)

#### [Entering the DFU Mode](#entering-the-dfu-mode)

**[Remote PC]** Press `Boot` button at first, then press `Reset` button after few seconds while `Boot` button is pressed. Keeping `Boot` button pressed, release `Reset` button at second. Finally, release `Boot` button slowly. This enables user to activate the DFU mode.

![](/assets/images/platform/turtlebot3/preparation/opencr_button_for_dfu.png)

**[Remote PC]** If you successfully entered to DFU mode, you will be able to find `STMicroelectronics STM Device in DFU Mode` text string when *lsusb* is entered in the terminal.

![](/assets/images/platform/turtlebot3/preparation/ide10.png)

#### [Download the Bootloader](#download-the-bootloader)

**[Remote PC]** Go to `Tools` → `Burn Bootloader` to download the bootloader.

![](/assets/images/platform/turtlebot3/preparation/ide9.png)

**[Remote PC]** When download is completed, press `Reset` button again.

## [OpenCR1.0 Firmware Settings for ROS](#opencr10-firmware-settings-for-ros)

### [Add TurtleBot3 Firmware to OpenCR1.0](#add-turtlebot3-firmware-to-opencr10)

OpenCR1.0 firmware (or the source) for ROS is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.
If you have TurtleBot3 Burger,

**[Remote PC]** Go to `File` → `Examples` → `turtlebot3` → `turtlebot3_burger` → `turtlebot3_core`.

If you have TurtleBot3 Waffle,

**[Remote PC]** Go to `File` → `Examples` → `turtlebot3` → `turtlebot3_waffle` → `turtlebot3_core`.

![](/assets/images/platform/turtlebot3/opencr/o1.png)

**[Remote PC]** Click `Upload` button to upload the firmware to OpenCR1.0.

![](/assets/images/platform/turtlebot3/opencr/o2.png)

![](/assets/images/platform/turtlebot3/opencr/o3.png)

**Note :** If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR1.0 and try to upload the firmware again.
{: .notice--info}
  
**[Remote PC]** When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.
