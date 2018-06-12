---
layout: archive
lang: en
ref: specifications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/specifications/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 3"></div>

# [Specifications](#specifications)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models.png)

## [Hardware Specifications](#hardware-specifications)

| Items                              | Burger                                                              | Waffle (Discontinued)                                               | Waffle Pi                                                           |
| :--------------------------------- | :------------------------------------------------------------------ | :------------------------------------------------------------------ | :------------------------------------------------------------------ |
| Maximum translational velocity     | 0.22 m/s                                                            | 0.26 m/s                                                            | 0.26 m/s                                                            |
| Maximum rotational velocity        | 2.84 rad/s (162.72 deg/s)                                           | 1.82 rad/s (104.27 deg/s)                                           | 1.82 rad/s (104.27 deg/s)                                           |
| Maximum payload                    | 15kg                                                                | 30kg                                                                | 30kg                                                                |
| Size (L x W x H)                   | 138mm x 178mm x 192mm                                               | 281mm x 306mm x 141mm                                               | 281mm x 306mm x 141mm                                               |
| Weight (+ SBC + Battery + Sensors) | 1kg                                                                 | 1.8kg                                                               | 1.8kg                                                               |
| Threshold of climbing              | 10 mm or lower                                                      | 10 mm or lower                                                      | 10 mm or lower                                                      |
| Expected operating time            | 2h 30m                                                              | 2h                                                                  | 2h                                                                  |
| Expected charging time             | 2h 30m                                                              | 2h 30m                                                              | 2h 30m                                                              |
| SBC (Single Board Computers)       | Raspberry Pi 3 Model B                                              | Intel® Joule™ 570x                                                  | Raspberry Pi 3 Model B                                              |
| MCU                                | 32-bit ARM Cortex®-M7 with FPU (216 MHz, 462 DMIPS)                 | 32-bit ARM Cortex®-M7 with FPU (216 MHz, 462 DMIPS)                 | 32-bit ARM Cortex®-M7 with FPU (216 MHz, 462 DMIPS)                 |
| Remote Controller                  | -                                                                   | -                                                                   | RC-100B + BT-410 Set (Bluetooth 4, BLE)                             |
| Actuator                           | Dynamixel XL430-W250                                                | Dynamixel XM430-W210                                                | Dynamixel XM430-W210                                                |
| LDS(Laser Distance Sensor)         | 360 Laser Distance Sensor LDS-01                                    | 360 Laser Distance Sensor LDS-01                                    | 360 Laser Distance Sensor LDS-01                                    |
| Camera                             | -                                                                   | Intel® Realsense™ R200                                              | Raspberry Pi Camera Module v2.1                                     |
| IMU                                | Gyroscope 3 Axis<br />Accelerometer 3 Axis<br />Magnetometer 3 Axis | Gyroscope 3 Axis<br />Accelerometer 3 Axis<br />Magnetometer 3 Axis | Gyroscope 3 Axis<br />Accelerometer 3 Axis<br />Magnetometer 3 Axis |
| Power connectors                   | 3.3V / 800mA<br />5V / 4A<br />12V / 1A                             | 3.3V / 800mA<br />5V / 4A<br />12V / 1A                             | 3.3V / 800mA<br />5V / 4A<br />12V / 1A                             |
| Expansion pins                     | GPIO 18 pins<br />Arduino 32 pin                                    | GPIO 18 pins<br />Arduino 32 pin                                    | GPIO 18 pins<br />Arduino 32 pin                                    |
| Peripheral                         | UART x3, CAN x1, SPI x1, I2C x1, ADC x5, 5pin OLLO x4               | UART x3, CAN x1, SPI x1, I2C x1, ADC x5, 5pin OLLO x4               | UART x3, CAN x1, SPI x1, I2C x1, ADC x5, 5pin OLLO x4               |
| Dynamixel ports                    | RS485 x 3, TTL x 3                                                  | RS485 x 3, TTL x 3                                                  | RS485 x 3, TTL x 3                                                  |
| Audio                              | Several programmable beep sequences                                 | Several programmable beep sequences                                 | Several programmable beep sequences                                 |
| Programmable LEDs                  | User LED x 4                                                        | User LED x 4                                                        | User LED x 4                                                        |
| Status LEDs                        | Board status LED x 1<br />Arduino LED x 1<br />Power LED x 1        | Board status LED x 1<br />Arduino LED x 1<br />Power LED x 1        | Board status LED x 1<br />Arduino LED x 1<br />Power LED x 1        |
| Buttons and Switches               | Push buttons x 2, Reset button x 1, Dip switch x 2                  | Push buttons x 2, Reset button x 1, Dip switch x 2                  | Push buttons x 2, Reset button x 1, Dip switch x 2                  |
| Battery                            | Lithium polymer 11.1V 1800mAh / 19.98Wh 5C                          | Lithium polymer 11.1V 1800mAh / 19.98Wh 5C                          | Lithium polymer 11.1V 1800mAh / 19.98Wh 5C                          |
| PC connection                      | USB                                                                 | USB                                                                 | USB                                                                 |
| Firmware upgrade                   | via USB / via JTAG                                                  | via USB / via JTAG                                                  | via USB / via JTAG                                                  |
| Power adapter (SMPS)               | Input : 100-240V, AC 50/60Hz, 1.5A @max<br />Output : 12V DC, 5A    | Input : 100-240V, AC 50/60Hz, 1.5A @max<br />Output : 12V DC, 5A    | Input : 100-240V, AC 50/60Hz, 1.5A @max<br />Output : 12V DC, 5A    |

## [Dimension and Mass](#dimension-and-mass)

### [Data of TurtleBot3 Burger](#data-of-turtlebot3-burger)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_dimension1.png)

### [Data of TurtleBot3 Waffle](#data-of-turtlebot3-waffle)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_dimension2.png)

### [Data of TurtleBot3 Waffle Pi](#data-of-turtlebot3-waffle-pi)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_dimension3.png)

## [Components](#components)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_burger_components.png)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_waffle_components.png)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_waffle_pi_components.png)

### [SBCs](#sbcs)

- [Raspberry Pi 3 Model B](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)
  - TurtleBot3 Burger, Waffle Pi
- [Raspberry Pi 3 Model B+](https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/)
  - Coming soon!
- [Intel® Joule™ 570x](http://ark.intel.com/products/96414/Intel-Joule-570x-Developer-Kit)
  - TurtleBot3 Waffle

### [Sensors](#sensors)

- [360 Laser Distance Sensor LDS-01](/docs/en/platform/turtlebot3/appendix_lds_01/)
  - TurtleBot3 Burger, Waffle, Waffle Pi
- [Intel® Realsense™ R200](https://software.intel.com/en-us/RealSense/R200Camera)
  - TurtleBot3 Waffle
- [The Raspberry Pi Camera Module v2.1](https://www.raspberrypi.org/products/camera-module-v2/)
  - TurtleBot3 Waffle Pi

### [Embedded Board](#Embedded-board)

- [OpenCR1.0](/docs/en/platform/turtlebot3/appendix_opencr1_0/)
  - TurtleBot3 Burger, Waffle, Waffle Pi

### [Actuators](#actuators)

- [Dynamixel XL430](/docs/en/dxl/x/xl430-w250/)
  - TurtleBot3 Burger
- [Dynamixel XM430](/docs/en/dxl/x/xm430-w210/)
  - TurtleBot3 Waffle, Waffle Pi