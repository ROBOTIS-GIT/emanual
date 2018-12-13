---
layout: archive
lang: en
ref: bioloid-gp
read_time: true
share: true
author_profile: false
permalink: /docs/en/edu/bioloid/gp/
sidebar:
  title: BIOLOID GP
  nav: "bioloid-gp"
---

# [Introduction](#introduction)

![](/assets/images/edu/bioloid/gp_product.jpg)

- Best humanoid robot with high-quality Dynamixel AX-18F (legs)
- Strong, lightweight aluminum frames
- Excellent mobility such as turning during walking or high-speed walking
- Basic humanoid motions such as combat and soccer modes provided
- Self-position-correcting using Gyro sensor
- Gripper set and sensors included for various missions
- Wireless remote included (Zigbee installed)
- Up-to-date version of RoboPlus- programming software- included
- Digital Packet communication and simple Daisy Chain cable arrangement

# [Getting Started](#getting-started)

## [Part List](#part-list)

![](/assets/images/edu/bioloid/gp_partlist_1_en.png)

![](/assets/images/edu/bioloid/gp_partlist_2_en.png)

## [Operating](#operating)

### Downloading the Program

- Program for type A is installed by default in CM-530.
- You can find task codes and motion files for other actions on the [Download](#download) page.

{% include en/parts/controller/cm510_530_turnon.md %}

### Checking the robot's basic posture (To check whether the robot has been assembled correctly)

- When the robot is turned on, it defaults to the pose shown below.

![](/assets/images/edu/bioloid/gp_basic_pose.png)

- Check the angles of the arms and legs. If they are different from the picture, go back to "Check Assembly Mode".

- Check whether the cables have been assembled on the outer part of the leg.

**NOTE** : If the robot has been incorrectly assembled to an extent where it may be severely damaged, a warning sound will be activated. Also, the LED of the motor with the problem will turn on and release its torque to prevent damage.
{: .notice}


### Robot in Action

- `U` : Soccer Mode
- `D` : Battle Mode
- `L` or `R` : Performance Mode

![](/assets/images/edu/bioloid/premium_operation_03.jpg)

**NOTE** : Operating the robot with the RC-100 without selecting the mode will automatically start the soccer mode.
{: .notice}

![](/assets/images/edu/bioloid/premium_operation_04.jpg)

1. Press the POWER/MODE button for 2 seconds to power on.
2. Press the buttons below to control the robot.

##### Walking Motions

|  Buttons  |           Motion            |  Buttons  |            Motion            |
|:---------:|:---------------------------:|:---------:|:----------------------------:|
|     U     |           Forward           |     D     |           Backward           |
|     L     |          Turn Left          |     R     |          Turn Right          |
|   U + L   |     Walk Forward + Left     |   U + R   |     Walk Forward + Right     |
|   L + 5   |        Left Sidestep        | L + 5 + 6 |      Fast Left Sidestep      |
| L + U + 5 | Left Forward Diagonal Step  | L + D + 5 | Left Backward Diagonal Step  |
|   R + 5   |       Right Sidestep        | R + 5 + 6 |     Fast Right Sidestep      |
| R + U + 5 | Right Forward Diagonal Step | R + D + 5 | Right Backward Diagonal Step |

##### Standard

| Buttons |            Motion             | Buttons |          Motion          |
|:-------:|:-----------------------------:|:-------:|:------------------------:|
|  1 + U  |       Gets up facing up       |  1 + D  |   Gets up facing down    |
| 5+6+U+1 |   Soccer Mode(Change Mode)    | 5+6+D+3 | Battle Mode(Change Mode) |
| 5+6+L+2 | Performance Mode(Change Mode) |    -    |            -             |

![](/assets/images/edu/bioloid/gp_rc100_mode.png)

##### U: Soccer Mode

| Buttons |         Motion          | Buttons |          Motion          |
|:-------:|:-----------------------:|:-------:|:------------------------:|
|  2 + U  | Left Leg + Forward Kick |  4 + U  | Right Leg + Forward Kick |
|  2 + D  |  Left Leg + Back Kick   |  4 + D  |  Right Leg + Back Kick   |
|  2 + L  |  Left Leg + Left Kick   |  4 + L  |  Right Leg + Left Kick   |
|  2 + R  |  Left Leg + Right Kick  |  4 + R  |  Right Leg + Right Kick  |
|    3    |     Defense Standby     |  3 + L  |    Block Ball + Left     |
|  3 + U  |         Defense         |  3 + R  |    Block Ball + Right    |

##### D: Battle Mode

![](/assets/images/edu/bioloid/gp_battle_mode.png)

| Buttons |        Motion        | Buttons |       Motion        |
|:-------:|:--------------------:|:-------:|:-------------------:|
|  2 + U  | Hit + Forward Attack |    3    |       Defense       |
|  2 + L  |  Hit + Left Attack   |  2 + R  | Hit + Right Attack  |
|  4 + U  |  Upper Body Tackle   |  4 + D  |  Lower Body Tackle  |
|  4 + L  |  Left Strong Tackle  |  4 + R  | Right Strong Tackle |

##### L/R: Performance Mode

| Buttons |   Motion    | Buttons |    Motion    |
|:-------:|:-----------:|:-------:|:------------:|
|  2 + U  |  Gretting   |  2 + R  |  Handstand   |
|  2 + D  | Clap(Twice) |  3 + U  | Roll on Side |
|  2 + L  |  Clap(337)  |  3 + D  |   Push ups   |

After mounting the IR receiver on CM-530 under control mode, you can set the channels to control it remotely by pressing the Aux button. If you change the channel of the controller, you must also change the channel of RC-100. On how to change the channel of RC-100, please refer to Changing RC-100's Channel.

#### Setting the CM-530 IR Channels (Start + U/L/D/R)

|  Buttons  |         Description         |
|:---------:|:---------------------------:|
| Start + U | Set the RC-100 channel as 1 |
| Start + L | Set the RC-100 channel as 2 |
| Start + D | Set the RC-100 channel as 3 |
| Start + R | Set the RC-100 channel as 4 |

##### My remote controller does not work properly.
- Set to control mode.
- Check whether the IR receiver has been properly connected.
- Check whether the remote controller is on. Replace the battery and try again.
- Point towards the IR receiver and try again.
- Check if there are others controlling robots nearby, which may cause wireless interferences.

##### We want to play soccer or battle with several robots.
- In order to play a game with several users, you must install the [ZIG-110] set.
- [ZIG-110] set is available at the Robotis shopping mall.
- Please refer to [Controller] and [RC-100] for installation information.


## [Battery Charge](#battery-charge)

{% include en/edu/bioloid/stem_charge.md %}

# [Tutorial](#tutorial)

## [Screen Output](#screen-output)

{% include en/edu/bioloid/screen_output.md %}

## [Button & LED](#button--led)

{% include en/edu/bioloid/button_led.md %}

# [Download](#download)

|File Type|Download|
|:---:|:---:|
|Humanoid Task Code|[Download](http://support.robotis.com/en/baggage_files/bioloid/bio_gp_humanoid_en.tsk)|
|Humanoid Basic Motion File|[Download](http://support.robotis.com/en/baggage_files/bioloid/bio_gp_humanoid_kr.mtn)|
|QuickStart Guide PDF File|[Download](http://www.robotis.com/download/doc/BIO_GP_Humanoid_ASM_EN.pdf)|

# [References](#references)

## [Replacing Fuse](#replacing-fuse)

{% include en/parts/controller/fuse_cm510_530.md %}

## [Dynamixel Management](#dynamixel-management)

{% include en/edu/bioloid/dynamixel_management.md %}

{% include en/parts/communication/zigbee_control.md %}

### ZIG-110A Set Assembly Method(GP)

![](/assets/images/edu/bioloid/gp_zig110_assembly_01.png)

![](/assets/images/edu/bioloid/gp_zig110_assembly_02.png)


## [Control Multiple Robots](#control-multiple-robots)

{% include en/edu/bioloid/control_multirobot.md %}


## [Adding Sensors](#adding-sensors)

With the Bioloid Premium Kit, you can connect additional [IR Sensor] and [Touch Sensor] to the CM-530.
For more information on each sensors, please click on the names of the sensors.

### IR Sensor

![](/assets/images/parts/sensors/ir.jpg)

- IR Sensor Applications
  - The IR sensor can detects objects in front of the robot.
  - It can also be used to detect object on the side when walking or moving.

[More information](/docs/en/software/rplus1/task/programming_02/#ir-sensor)

### Touch Sensor

![](/assets/images/parts/sensors/touch.jpg)

- Touch Sensor Applications
  - The touch sensor enables the robot to feel when it has been touched.
  - For example, the sensor can be used to make the robot react to certain touches.

[More information](/docs/en/software/rplus1/task/programming_02/#touch-sensor)

### DMS(Distance Measuring Sensor)

![](/assets/images/edu/bioloid/gp_dms_mounting.png)

[More information](/docs/en/parts/sensor/dms-80/)

## [Make Your Own Sensor](#make-your-own-sensor)

You can make your own sensor with simple control functions using the ADC port and OUT port on CM-510/CM-530.

**CAUTION** : Connecting poorly designed circuits may damage the controller. Please be sure to acquire sufficient knowledge about circuits beforehand.
{: .notice--warning}

### PIN Information

![](/assets/images/parts/controller/cm-530/cm510_external_io.png)

- Below is a pin diagram of CM-510’s external port.
  1. OUT : 5V Output
  2. VCC (5V)
  3. ADC : Can read analog signals made by users.
  4. GND
  5. NC : Not used

- Below is a pin diagram of CM-530’s external port.
  1. OUT1 : 3.3V Output (Maximum Allowed Current 0.3A)
  2. VCC (5V)
  3. ADC : Can read analog signals made by users.
  4. GND
  5. OUT2 : 3.3V Output (Maximum Allowed Current 0.3A)

**NOTE** : Please use the 5P Cable when using other sensors. The 5P cable can be purchased from ROBOTIS.
{: .notice}

### Controlling User’s Device

#### External Output Control
Below is an example of an LED circuit to turn the LED on and off using the OUT port (Pin 1).
You need to adjust the amound of resistance depending on the type of controller and/or the type of LED.

![](/assets/images/edu/bioloid/premium_led_circuit.png)

A high signal can be sent to the OUT port using RoboPlus Task.

1. Select the user's device in the writable parameter such as LOAD and CALCULATE, then select the port on which the device is connected.
2. Then, set the high signal to the readable parameter using a constant.

![](/assets/images/edu/bioloid/premium_diy_sensor_01.png)

![](/assets/images/edu/bioloid/premium_diy_sensor_02.png)

When the code above is executed, high signal will be sent to the OUT port of the device connected to PORT 3, and the LED will turn on.

#### Reading the ADC Value
Most of the sensors used in robots, such as IR sensors and distance sensors, support analog output. The CM-510 can use its external ports to read the sensor’s analog output signals. These sensors may be designed by the user or bought from a store.

- Below is an image of a tilt sensor. When the sensor is tilted, it prints the tilted value as the analog singal.

![](/assets/images/edu/bioloid/premium_diy_sensor_03.png)

- The left pin of the tilt sensor is 5V VCC. The center is an analog signal output pin, and the right pin is GND.  This sensor can be used by connecting its pins to the corresponding pins on CM-510’s external port.  To try for yourself, please refer to the pin information for CM-510’s external ports.

![](/assets/images/edu/bioloid/premium_diy_sensor_04.png)

- You can incorporate the sensor’s analog output to your robot's movements as in the example below.

![](/assets/images/edu/bioloid/premium_diy_sensor_05.png)

[CM-530]: /docs/en/parts/controller/cm-530/
[AX-12A]: /docs/en/dxl/ax/ax-12a/
[DMS Sensor]: /docs/en/parts/sensor/dms-80/
[IR Sensor]: /docs/en/parts/sensor/irss-10/
[Touch Sensor]: /docs/en/parts/sensor/ts-10/
[Gyro Sensor]: /docs/en/parts/sensor/gs-12/
[USB2Dynamixel]: /docs/en/parts/interface/usb2dynamixel/
[Controller]: /docs/en/parts/controller/controller_compatibility/
[RC-100]: /docs/en/parts/communication/rc-100/
[ZIG-110]: /docs/en/parts/communication/zig-110/
[How to Download of task code]: /docs/en/faq/download_task_code/
[Custom Motions: Task Code]: #custom-motions-task-code
[Gripper Assembly]: #gripper-assembly
