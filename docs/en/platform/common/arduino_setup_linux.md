---
layout: archive
lang: en
ref: common_arduino_setup_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/common/arduino_arduino_setup_linux/
sidebar:
  title: Common
  nav: "common"
---

# [Arduino Setup Linux](#arduino-setup-linux)

## Contents

 - [USB port settings]
 - [Compiler Settings]
 - [Install the Arduino IDE]
 - [Run the Arduino IDE]
 - [Porting the OpenCR board to the Arduino IDE]
 - [Install the OpenCR package via Boards Manager]
 - [Modemmanager removal]
 - [Bootloader writing]

***




## [USB port settings](#usb-port-settings)
Make the OpenCR USB port be able to upload the Arduino IDE program without root permission.
```
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/99-opencr-cdc.rules
sudo cp ./99-opencr-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
```


## [Compiler Settings](#compiler-settings)
Since the OpenCR libraries is built for 32 bit platform, 64 bit PC needs the 32 bit compiler relevants for the ArduinoIDE.
```
sudo apt-get install libncurses5-dev:i386
```


## [Install the Arduino IDE](#install-the-arduino-ide)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCR will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

Then, extract the downloaded file to the desired folder and execute the installation file from the terminal. In this case, the example shown below makes the folder tools in the user’s top folder (~/). This folder will act as the Arduino IDE folder.
```
cd ~/tools/arduino-1.16.0
./install.sh
```

Set the file path of installed Arduino IDE as an absolute path named PATH in the bashrc file. Here recommends to use gedit editor. (Use another editor, if necessary.) Finally, source it to apply the changes.
```
gedit ~/.bashrc
export PATH=$PATH:$HOME/tools/arduino-1.16.0
source ~/.bashrc
```

## [Run the Arduino IDE](#run-the-arduino-ide)

To run the Arduino IDE on Linux platform, type into the terminal as follows.
```
arduino
```
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide0.png)


## [Porting the OpenCR board to the Arduino IDE](#porting-the-opencr-board-to-the-arduino-ide)

### Preferences
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)
```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCR/master/arduino/opencr_release/package_opencr_index.json
```
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide1.png)


### [Install the OpenCR package via Boards Manager](#install-the-opencr-package-via-boards-manager)

Click Tools → Board → Boards Manager.
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide2.png)

Type OpenCR into the textbox to find the OpenCR by ROBOTIS package. After it finds out, click Install.
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide3.png)

After the installation, “INSTALLED” will be appeared.
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide4.png)

See if OpenCR Board is now on the list of Tools → Board. Click this to import the OpenCR Board source.
![](http://turtlebot3.readthedocs.io/en/latest/_images/ide5.png)

### Port setting
This step shows the port setting for the program uploads. The OpenCR should be connected to the PC and the OpenCR via the USB ports.

Select Tools → Port → /dev/ttyACM0.
```
The value of /dev/ttyACM0 may be different depending on the environment connected to the PC.
```

![](http://turtlebot3.readthedocs.io/en/latest/_images/ide6.png)

(TODO : the programmer in the picture should be changed into not the AVRISP mkll)



## [Modemmanager removal](#modemmanager-removal)

After programming with the Arduino IDE and uploading the program to the OpenCR, the OpenCR will be restarted and be reconnected. At the same moment, the modem-related packages of the Linux will send the AT command to manage the device. Thus indicates an connection error on the OpenCR, so this step should be done previously.
```
sudo apt-get purge modemmanager
```


## [Bootloader writing](#bootloader-writing)

```
Update only if the boot loader version has been changed.
```

The STM32F7xx, which is used for the main MCU on the OpenCR board, supports DFU(Device Firmware Upgrade). This enables the built-in bootloader of the MCU by itself to boot the DFU protocol by using USB, primarily for the bootloader initialization, the recovery mode, and the bootloader update. The biggest advantage to let the users be able to use bootloader with USB but no other JTAG equipment. Write the firmware by using the DFU mode which is embedded in MCU without writing / debugging equipment, such as STLink.

### Programmer Setting

Select Tools → DFU-UTIL

![](http://turtlebot3.readthedocs.io/en/latest/_images/ide7.png)


### Run DFU mode.
Press the Reset button while the Boot button is being pushed. This activates the DFU mode.

![](http://turtlebot3.robotis.com/en/latest/_images/opencr_button_for_dfu.png)

### Download the bootloader.

Click Tools → Burn Bootloader to download the bootloader.

![](http://turtlebot3.readthedocs.io/en/latest/_images/ide9.png)


[USB port settings]: /docs/en/platform/common/arduino_arduino_setup_linux/#usb-port-settings
[Compiler Settings]: /docs/en/platform/common/arduino_arduino_setup_linux/#complier-settings
[Install the Arduino IDE]: /docs/en/platform/common/arduino_arduino_setup_linux/#install-the-arduino-ide
[Run the Arduino IDE]: /docs/en/platform/common/arduino_arduino_setup_linux/#run-the-arduino-ide
[Porting the OpenCR board to the Arduino IDE]: /docs/en/platform/common/arduino_arduino_setup_linux/#porting-the-opencr-board-to-the-arduino-ide
[Install the OpenCR package via Boards Manager]: /docs/en/platform/common/arduino_arduino_setup_linux/#install-the-opencr-package-via-boards-manager
[Modemmanager removal]: /docs/en/platform/common/arduino_arduino_setup_linux/#modemmanager-removal
[Bootloader writing]: /docs/en/platform/common/arduino_arduino_setup_linux/#bootloader-writing
