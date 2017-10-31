---
layout: archive
lang: en
ref: cm-5
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/cm-5/
sidebar:
  title: CM-5
  nav: "cm-5"
---

# CM-5

# [Introduction](#introduction)

![](/assets/images/parts/controller/cm-5/cm-5_product.jpg)

`Note` CM-5 is discontinued.
{: .notice}

# [Specifications](#specifications)

|Item|Description|
|:---:|:---:|
|Weight|125.95g|
|CPU|ATMega128|
|Voltage Supply|Range : 7V ~ 12V<br />Recommended : 11.1V (3S1P Li-Po)|
|Current Consumption|Standby : 50mA<br />Max : 5A(Fuse)|
|Operation Temperature|-5&deg;C ~ 70&deg;C|
|External I/O Device|AX/MX Series Dynamixel Connector x 2|

# [Layout](#layout)

![](/assets/images/parts/controller/cm-5/cm-5_01.png)

- Power Switch : The switch to connect the power.
- Power Jack : The socket to connect the power jack of SMPS.
- Start Button : The button to select the mode.
- Mode Button : The button to change the operation mode of CM-5.
- PC Link(Serial Cable) : The port to connect the serial port of CM-5 and PC using serial cable; It is used for task code download or communication with PC.
- U / L / D / R Button : The assigned buttons used for entering purpose during the program operation; commands to robots are transmitted by these buttons.
- Mode Display LED : LED to display current operation mode of CM-5; Detailed descriptions are provided as below.
- Status Display LED : The LED represents the current status of CM-5.  Detailed descriptions are provided as below.
- POWER : Turned on if the power is ON; flickers if it is being charged.
- TXD : Turned on while CM-5 is transmitting the data to the outside.
- RXD : Turned on while CM-5 is receiving the data from the outside.
- AUX : Assigned LED to be used by the user in the program.  It can be turned on or off using task code.

## [MANAGE]
- It displays Dynamixel Management Mode is in progress.
- It is used to set or test the operations of CM-5, AX/MX Dynamixel using [RoboPlus Manager].
- It is automatically executed when RoboPlus Manager and CM-5 are connected.

## [PROGRAM]
- It displays the motion edit mode is in progress.
- It is used when the motions are editted with [RoboPlus Motion].
- It is automatically executed when RoboPlus Motion and CM-5 are connected.

## [PLAY]
- It displays the task code mode is in progress.
- It is used after downloading the written code to CM-5 with [RoboPlus Task].
- The Start button must be pressed directly by the user to execute when PLAY LED flickers.


# [Connecting Power](#connecting-power)

A rechargeable battery is installed in CM-5. If the rechargeable battery is charged, the device is ON when the power switch is set to ON. If you try to connect to external power without using the charger, the power is connected when SMPS is plugged and the power switch is set to ON.  If the power is connected, the Power LED is turned on, and one of the mode LEDs flickers.

![](/assets/images/parts/controller/cm-5/cm-5_02.png)
 
# [How to Operate](#how-to-operate)

- Turning the Power on : The power is turned on by moving the switch from OFF to ON.  
  ※ If the power is not turned on in spite of moving the switch to ON, the internal batteries may have been discharged.  
  Please refer to Charging to recharge, or connect the power using SMPS.
- Start : Move to PLAY using Mode Button to operate robots.  Press START Button to execute when the LED on PLAY flickers.  
  ※ If START button is pressed, the LED on PLAY is not supposed to be flickering any more; that is the normal status of the execution.
- End : If you want to stop the executed operations, press MODE Button to get back to waiting mode status, or turn OFF the power using Power Switch.

![](/assets/images/parts/controller/cm-5/cm-5_03.png)


**For CM-5, the firmware must be updated to use Roboplus instead of the Behavior Control Programmer(the old version).**  
**Please refer to [Firmware Update] on how to updated firmware in RoboPlus Manager.**
- It is used to control Dynamixel and the peripherals, and it can connect Dynamixel(AX/MX Dynamixel... etc.).
- Specific motions can be edited and saved through [RoboPlus Motion]. The saved motion (mtn file) can be always executed by [RoboPlus Task], and also the motions of each part can be controlled by writing the task codes for control.

- RoboPlus Motion  
  ![](/assets/images/parts/controller/cm-5/cm-5_04.jpg)

- RoboPlus Task  
  ![](/assets/images/parts/controller/cm-5/cm-5_05.jpg)

- RoboPlus Manager  
  ![](/assets/images/parts/controller/cm-5/cm-5_06.jpg)

# [Connect to PC](#connect-to-pc)

PC Link(Serial Cable) of CM-5 and Serial Port of PC must be connected using serial cable to communicaiton with PC. If you want to use Bioloid on the laptop without a serial port, you can communicate with PC using USB2Dynamixel.  (The USB2Dynamixel is sold separately.)

![](/assets/images/parts/controller/cm-5/cm-5_07.png)

# [Wireless Communication](#wireless-communication)

[ZIG-100] Wireless Communication Module can be connected to CM-5.

![](/assets/images/parts/controller/cm-5/cm-5_08.png)

# [Charging](#charging)

{% include en/parts/controller/charging_cm5.md %}

# [Fuse Replacement](#fuse-replacement)

{% include en/parts/controller/fuse_cm_5.md %}

[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[RoboPlus Motion]: /docs/en/software/rplus1/motion/
[RoboPlus Manager]: /docs/en/software/rplus1/manager/
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Firmware Update]: /docs/en/software/rplus1/manager/#firmware-update
