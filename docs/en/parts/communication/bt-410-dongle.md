---
layout: archive
lang: en
ref: bt-410-dongle
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/communication/bt-410-dongle/
sidebar:
  title: BT-410 Dongle
  nav: "bt-410-dongle"
---

# [Introduction](#introduction)

![](/assets/images/parts/communication/bt-410_dongle_product.jpg)

> BT-410 Dongle

BT-410 Dongle converts USB 2.0 interface and Bluetooth 4.0 Low Energy standard communication interface(Master).  
If BT-410 Dongle is connected to the PC, it can be paired with a BT-410 Slave module to exchange data.  
(Please refer to each product page for instructions)
 
**1. BT-410 Dongle Compatible Devices**
  - BT-410 SLAVE Module

**2. BT-410 Dongle Incompatible Devices**
  - BT-410 Master Module
  - BT-210 Master Module
  - BT-210 Slave Module
  - BT-100/110A
  - ZIG-100/110A
 
`Caution` 
Please make sure to turn off the controller before connecting the Bluetooth module. The device may cause malfunction or be damaged if connected while the controller is turned on.
{: .notice--warning}

# [Specifications](#specifications)

|Item|Description|
|:---:|:---:|
|Weight|7.5g|
|Dimension|50.5mm x 20mm x 10.5mm|
|Bluetooth| Bluetooth Specification 4.0 Low Energy Support|
|Effective Communication Distance|10M|
|Frequency|2.4GHz ISM Band|
|Bandwidth|MAX 128kbps|
|Default baud rate|57,600bps|
|Operating Voltage|5.0V|
|Current Consumption|25mA (Max)|
|Operating temperature|0&deg;C ~ 40&deg;C|
|Baud rates|1,200bps ~ 1,000,000bps|
|Antenna|Chip Antenna|
|Interface|USB 2.0 Full Speed|
|Sensitivity|-81dBm (Typical)|
|Conducted Net Power|-6 ~ 4dBm (Class 2)|

## [Available Baudrate](#available-baudrate)

{% include en/parts/communication/bt_baudrate.md %}

# [Compatibility](#compatibility)
Available features with BT-410 Dongle and BT-410 Slave pair.

||Firmware Recovery<br />R+ Manager 2.0|Firmware Update<br />R+ Manager 2.0|Entry|R+ Scratch|TASK 2.0 Download|Motion 2.0 Download|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|CM-50(PLAY700)|O|O|-|O|O|-|
|[CM-150]|O|O|-|-|O|-|
|[CM-200]|O|O|-|-|O|O|
|[CM-530]|O|O|-|-|O|O|
|OpenCM7.0|O|O|O|O|O||
|[OpenCM9.04]|O|O|-|-|O|O|
|Car Robot|-|-|O|O|-|-|

# [Communication Mode](#communication-mode)

Utilizes a pairing mechanism that allows reliable 1:1 communication.

## [1:1 Communication](1-1-communication)

- Once the power is supplied to the Bluetooth module, the blue LED will blink. Successful pairing will turn on the solid blue LED.
- **Auto Pairing** : When the blue LED of BT-410 dongle is blinking(not paired), approach the BT-410 Slave module near the BT-410 dongle(within 10cm) to automatically pair both devices. Successfully paired devices can be paired again within the range of Bluetooth communication.

# [BT-410 Dongle Setting](bt-410-dongle-setting)
Can reset system, change device name, and set SLAVE address, but **CANNOT** change mode.

1. Connect the BT-410 dongle to PC and check assigned port number from the Device Manager. Then connect using the Tera Term terminal program through the respective COM port.

    ![](/assets/images/parts/communication/bt-410_dongle_02.png)
    
    - Run Tera Term terminal program and select `New Connection...` under the File menu.
    - `Download` [Tera Term](http://www.robotis.com/download/software/teraterm-4.73.zip)

    ![](/assets/images/parts/communication/bt-410_dongle_03.png)
    
    - Select assigned COM port for BT-410 dongle.

    ![](/assets/images/parts/communication/bt-410_dongle_04.png)

3. Go to Setup > Serial port.

    ![](/assets/images/parts/communication/bt-410_dongle_05.png)

4. Set the Baud rate to 57600.

    ![](/assets/images/parts/communication/bt-410_dongle_06.png)

5. Go to Setup > Terminal.

    ![](/assets/images/parts/communication/bt-410_dongle_07.png)

6. Enable Local echo.

    ![](/assets/images/parts/communication/bt-410_dongle_08.png)

7. If an exclamation mark("!") is entered, "OK" will be returned and command mode becomes available. If entering "AT" on the terminal returns "OK", BT-410 dongle is successfully connected and ready to be configured.

    ![](/assets/images/parts/communication/bt-410_dongle_09.png)

8. The command "AT+BTINQ=DBE7DF000001" will search for the BLE devices whose MAC address is higher than DBE7DF000001.

    ![](/assets/images/parts/communication/bt-410_dongle_10.png)

9. After searching for available devices with "AT+BTINQ" command, use returned MAC address to pair with the device. For example, in order to pair with above searched device, use "ATD" command followed by the MAC address: "ATDDBE7DF00512B".

# [AT Commands](#at-commands)

The followings are AT terminal commands for the BT-410 Dongle.

1. System Reset  
  Enter ATZ to reset BT-410 dongle. If settings are modified, the modified setting will be applied on reset.

    ![](/assets/images/parts/communication/bt-410_dongle_11.png)

2. Search Device  
  Enter "AT+BTINQ=DBE7DF000001" to search for the Bluetooth devices whose MAC address is higher than DBE7DF000001.             

    ![](/assets/images/parts/communication/bt-410_dongle_12.png)

3. Auto Pairing  
  Unpaired BT-410 Slave module can be automatically paired if it is located within 10 cm to the BT-410 dongle.  

4. Disable Auto Pairing  
  Enter "AT+BTAUTOPAIR=0"

    ![](/assets/images/parts/communication/bt-410_dongle_13.png)
 
  A few seconds later, below message will be displayed.
 
    ![](/assets/images/parts/communication/bt-410_dongle_14.png)
 
5. Enable Auto Pairing  
  Enter "AT+BTAUTOPAIR=1"

    ![](/assets/images/parts/communication/bt-410_dongle_15.png)
 
  A few seconds later, below message will be displayed.
 
    ![](/assets/images/parts/communication/bt-410_dongle_16.png)
 
6. Change Baudrate  
  AT+BTUART,baudrate,parity_bit,stop_bit  
  `Example` AT+BTUART,57600,n,1  

# [Check Driver](#check-driver)
How to check whether the BT-410 Dongle driver is installed correctly is as follows.

1. Connect **BT-410 Dongle** to the **USB Port** of PC.

    ![](/assets/images/parts/communication/bt-410_17.png)

2. Select Manage in the popped-up menu shown by right-clicking My Computer.

    ![img_04][img_04]

3. Check USB Serial Converter in Universal Serial Bus Controllers of Device Manager.

    ![img_05][img_05]

4. Check USB Serial Port(COMx) in the list of Ports(COM & LPT). COM Port number may vary depending on each system.

    ![img_06][img_06]

# [Install Driver Manually](#install-driver-manually)

If you installed RoboPlus, FTDI Driver (USB2Dynamixel, USB Downloader (LN-101) driver, BT-410 Dongle) is installed together automatically. If you didn't install the RoboPlus yet, or if the driver is not installed appropriately, please install it manually according to following procedures.
{: .notice}

1. Connect a device to PC. If the driver is not installed yet, Found New Hardware Wizard will be popped up. Install from a list or specific location (Advanced)(S) -> Next(N)

    ![img_07][img_07]

2. Decide the location of Driver. If RoboPlus S/W has been installed automatically, the driver is in LN101 folder of RoboPlus Installation folder. Or if you want to install the newest version, download the newest version VCP driver from [FTDI Driver Download] page.

    ![img_08][img_08]
    
    ![img_09][img_09]

3. Click the Next(N) button to start the installation. Installation of USB Serial Converter driver is completed.

    ![img_10][img_10]

4. Install the USB Serial Port driver in the same way.

    ![img_11][img_11]

[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-530]: /docs/en/parts/controller/cm-530/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/

[img_04]: /assets/images/parts/interface/ln101_01.png
[img_05]: /assets/images/parts/interface/ln101_02.png
[img_06]: /assets/images/parts/interface/ln101_03.png
[img_07]: /assets/images/parts/interface/ln101_04.png
[img_08]: /assets/images/parts/interface/ln101_05.png
[img_09]: /assets/images/parts/interface/ln101_06.png
[img_10]: /assets/images/parts/interface/ln101_07.png
[img_11]: /assets/images/parts/interface/ln101_08.png
