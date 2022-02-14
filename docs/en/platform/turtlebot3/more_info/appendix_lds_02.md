---
layout: archive
lang: en
ref: appendix_lds_02
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_lds_02/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 30
---

<div style="counter-reset: h1 13"></div>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 3"></div>

<!--[dummy Header 1]>
  <h1 id="appendixes"><a href="#appendixes">Appendixes</a></h1>
<![end dummy Header 1]-->

### [LDS-02](#lds-02)

[The previous LDS sensor(LDS-01)](/docs/en/platform/turtlebot3/appendix_lds_01/) is discontinued and replaced with LDS-02 since 2022.

#### [Overview](#overview)

![](/assets/images/platform/turtlebot3/appendix_lds/lds_ld08_small.png)
![](/assets/images/platform/turtlebot3/appendix_lds/lds_ld08_top_small.png)

- 360 Laser Distance Sensor LDS-02 is a 2D laser scanner capable of sensing 360 degrees that collects a set of data around the robot to use for SLAM (Simultaneous Localization and Mapping) and Navigation.
- The LDS-02 is used for TurtleBot3 Burger and Waffle Pi models.
- Only Tx UART interface is available for the LDS-02 sensor.
- The USB interface(USB2LDS) supports easier connection to a PC or SBC.

#### [Specifications](#specifications)

##### [General Specifications](#general-specifications)

| Items                    | Specifications                                                       |
|:-------------------------|:---------------------------------------------------------------------|
| Operating supply voltage | 5V DC ± 10%                                                          |
| PWM Frequency            | 10 ~ 30 KHz (Square wave, High : 3.3V, Low : 0V)                     |
| PWM Duty Cycle           | 0 ~ 100%                                                             |
| LASWER Wave Length       | Low powered Infrared Laser (λ=793 nm)                                |
| LASER safety             | Class I, 21 CFR 1040.10 and 1040.11                                  |
| Current consumption      | 240 mA (Start up current 400 mA)                                     |
| Detection distance       | 160 ~ 8,000 mm                                                       |
| Interface                | 3.3V USART (115200 bps, 8 data bits, no parity, 1 stop bit), Tx Only |
| Ambient Light Resistance | 25,000 lux                                                           |
| Life Time                | 1,000 hrs                                                            |
| Sampling Rate            | 2.3kHz (Fixed)                                                       |
| Operating Temperature    | -10 ~ 40 &deg;C                                                      |
| Storage Temperature      | -30 ~ 70 &deg;C                                                      |
| Dimensions               | 70(W) X 90(D) X 42(H)mm                                              |
| Mass                     | 131 g                                                                |

##### [Measurement Performance Specifications](#measurement-performance-specifications)

| Items                                | Specifications |
|:-------------------------------------|:---------------|
| Distance Range                       | 160 ~ 8,000mm  |
| Distance Accuracy (160 ~ 300 mm)     | ±10mm          |
| Distance Accuracy(300 ~ 6,000 mm)    | ±3.0%          |
| Distance Precision(6,000 ~ 8,000 mm) | ±5.0%          |
| `1` Scan Frequency                   | 5Hz or above   |
| Angular Range                        | 360 &deg;      |
| `2` Angular Resolution               | 1 &deg;        |


**NOTE :**  
`1` Scan Frequency may vary by each product.  
`2` Due to the fixed sampling rate, the Angular Resolution may vary by the Scan Frequency.
{: .notice}

#### [Data Packet](#data-packet)

The LDS-02 adopts one-way communication and begins to send measuring data packet once working stably without any instruction packet.

| Header | Length | Speed (2Byte)    | Start Angle (2Byte) | Data (36Byte) | End Angle (2Byte) | Timestamp (2Byte) | CRC |
|:-------|:-------|:-----------------|:--------------------|:--------------|:------------------|:------------------|:----|
| 0x54   | 0x2C   | Speed_L, Speed_H | Angle_L, Angle_H    | Data          | Angle_L, Angle_H  | Time_L, Time_H    | CRC |


The `Data (36Byte)` consists of 12 point measurements for distance(2Byte) and confidence(1Byte) as below.

| Point1 Distance (2Byte) | Point1 Confidence | Point2 Distance (2Byte) | Point2 Confidence | ... | Point12 Distance (2Byte) | Point12 Confidence |
|:------------------------|:------------------|:------------------------|:------------------|:----|:-------------------------|:-------------------|
| Distance_L, Distance_H  | Confidence        | Distance_L, Distance_H  | Confidence        | ... | Distance_L, Distance_H   | Confidence         |

- Packet Example
  - Speed : 0x0868 (2152 &deg;/s)
  - Start Angle : 0x7EAB (32427 divide by 100 = 324.27 &deg;)
  - End Angle : 0x82BE (33470 divide by 100 = 334.70 &deg;)
  - Timestamp : 0x1A3A (6714 ms)

| Header | Length | Speed (2Byte) | Start Angle (2Byte) | Data (36Byte) | End Angle (2Byte) | Timestamp (2Byte) | CRC  |
|:-------|:-------|:--------------|:--------------------|:--------------|:------------------|:------------------|:-----|
| 0x54   | 0x2C   | 0x68, 0x08    | 0xAB, 0x7E          | Data          | 0xBE, 0x82        | 0x3A, 0x1A        | 0x50 |

- Data Example
  - Point1 Distance : 0x00E0 (224 mm)
  - Point1 Confidence : 0xE4 (228)
  - Point2 Distance : 0x00DC (220 mm)
  - Point2 Confidence : 0xE2 (226)
  - Point12 Distance : 0x00B0 (176 mm)
  - Point12 Confidence : 0xEA (234)

| Point1 Distance (2Byte) | Point1 Confidence | Point2 Distance (2Byte) | Point2 Confidence | ... | Point12 Distance (2Byte) | Point12 Confidence |
|:------------------------|:------------------|:------------------------|:------------------|:----|:-------------------------|:-------------------|
| 0xE0, 0x00              | 0xE4              | 0xDC, 0x00              | 0xE2              | ... | 0xB0, 0x00               | 0xEA               |
