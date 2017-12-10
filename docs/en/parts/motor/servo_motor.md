---
layout: archive
lang: en
ref: servo_motor
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/motor/servo_motor/
sidebar:
  title: Servo Motor
  nav: "servo_motor"
---

# Servo Motor

![](/assets/images/parts/motor/servo_motor_product.jpg)

# [Introduction](#introduction)

- It is the motor used in OLLO; it is connected to CM-100, and the direction of spin and the speed of spin can be adjusted through port control.
- If it is set to "Spin Mode," it can be operated as the geared motor; if it is set to "Joint Mode," the motor can be moved to the designated location by setting the speed of spin(Power)and the value of location.
- It is mainly used to maintain certain angles pursuant to some conditions such as moving joints, moving steering devices, etc.

`Compatibility Guide` [Controller Compatibility]

# [Specifications](#specifications)

- Weight : 16g
- Dimensions : 18mm x 36mm x 27mm(with Horn)
- Gear Ratio : 194:1
- Speed : 85RPM @ 3.0V
- Position Sensor(Potentiometer)
- Safety Clutch installed

## [Control Angle](#control-angle)

- The servo motor of OLLO can control the location from 0 degree to 300 degrees, and the minimum control angle is about 0.29 degrees (300/1024).
- However, since the servo motor of OLLO is not as accurate as Dynamixel, and the torque is weaker than Dynamixel, it is appropriate servo motors are used for basic learning of the principles and usages; not appropriate to use for the places where accurate controls are needed.

![](/assets/images/parts/motor/servo_motor_01.png)

# [Pinout](#pinout)

![](/assets/images/parts/motor/servo_motor_pinout.png)

1. MOT-
2. GND
3. ADC : The current location of the motor is printed out as analog signals
4. VCC
5. MOT+

`Caution` Cables can may be damaged when not properly connected (i.e. wrong orientation), or use of excessive force during connection.
{: .notice--warning}

# [Tutorials](#tutorials)

- RoboPlus Task : Please refer to [Servo Motor] section in the Roboplus Task.
- Available Addresses
  - Operation Mode
  - Speed
  - Position

# [Videos](#videos)

<iframe width="560" height="315" src="https://www.youtube.com/embed/-qRy_NDd5eU" frameborder="0" allowfullscreen></iframe>

[Controller Compatibility]: /docs/en/parts/controller/controller_compatibility/
[Servo Motor]: /docs/en/software/rplus1/task/programming_02/#servo-motor
