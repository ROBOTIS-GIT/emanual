---
layout: archive
lang: en
ref: appendix_lds_03
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_lds_03/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 31
---

<style>body {counter-reset: h1 13 !important;}</style>
<div style="counter-reset: h2 1"></div>
<div style="counter-reset: h3 3"></div>

<!--[dummy Header 1]>
  <h1 id="dummy">More Info</h1>
  <h2 id="dummy">Appendixes: LDS-03</h2>
  <p class=dummy_content>360 Laser Distance Sensor v3</p>
<![end dummy Header 1]-->

### [LDS-03](#lds-03)

[The previous LDS sensor(LDS-02)](/docs/en/platform/turtlebot3/appendix_lds_02/) is discontinued and replaced with LDS-03 since 2025.

#### [Overview](#overview)

![](/assets/images/platform/turtlebot3/appendix_lds/lds_coind4_small.png)
![](/assets/images/platform/turtlebot3/appendix_lds/lds_coind4_top_small.png)

- 360 Laser Distance Sensor LDS-03 is a 2D laser scanner capable of sensing 360 degrees that collects a set of data around the robot to use for SLAM (Simultaneous Localization and Mapping) and Navigation.
- The LDS-03 is used for TurtleBot3 Burger and Waffle Pi models.
- Only Tx UART interface is available for the LDS-03 sensor.
- The USB interface(USB2LDS) supports easier connection to a PC or SBC.

#### [Specifications](#specifications)

##### [General Specifications](#general-specifications)

| Items                    | Specifications                                                       |
|:-------------------------|:---------------------------------------------------------------------|
| Operating supply voltage | 5V DC ± 10%                                                          |
| LASWER Wave Length       | VCSEL Laser (λ=905 nm)                                               |
| LASER safety             | Class I (IEC-60825)                                                  |
| Current consumption      | 240 ~ 320 mA                                                         |
| Detection distance       | 0.05 ~ 12 m                                                          |
| Interface                | 3.3V USART (115200 bps, 8 data bits, no parity, 1 stop bit), Tx Only |
| Ambient Light Resistance | 60,000 lux                                                           |
| Life Time                | 10,000 hrs                                                           |
| Sampling Rate            | 4kHz (Fixed)                                                         |
| Operating Temperature    | -10 ~ 50 &deg;C                                                      |
| Storage Temperature      | -30 ~ 70 &deg;C                                                      |
| Dimensions               | 54.7(W) X 39.7(D) X 34(H)mm                                          |
| Mass                     | 42 g                                                                 |

##### [Measurement Performance Specifications](#measurement-performance-specifications)

| Items                                | Specifications |
|:-------------------------------------|:---------------|
| Distance Range                       | 0.05 ~ 12 m    |
| Distance Accuracy (0.05 ~ 1 m)       | ±10mm          |
| Distance Accuracy(1 m ~ )            | ±20mm          |
| `1` Scan Frequency                   | 10 Hz          |
| Angular Range                        | 360 &deg;      |
| `2` Angular Resolution               | 0.9 &deg;      |


**NOTE :**  
`1` Scan Frequency may vary by each product.  
`2` Due to the fixed sampling rate, the Angular Resolution may vary by the Scan Frequency.
{: .notice}

#### [Data Packet](#data-packet)

The LDS-03 adopts one-way communication and begins to send measuring data packet once working stably without any instruction packet.

| Header (2Byte)| Info | SampleInfo |  Speed (2Byte) |    Start Angle (2Byte)   | Data (24Byte) |   Stop Angle (2Byte)   |  CRC (2Byte) |
|:--------------|:-----|:-----------|:---------------|:-------------------------|:--------------|:-----------------------|:-------------|
|  0xA5, 0x5A   | Info | SampleInfo | speedL, speedH | startAngleL, startAngleH |      data     | stopAngleL, stopAngleH |   csL, csH   |


The `Data (24Byte)` consists of 8 point measurements for distance(2Byte) and Intensity(1Byte) as below.

| Point1 Distance (2Byte) | Point1 Intensity | Point2 Distance (2Byte) | Point2 Intensity | ... | Point12 Distance (2Byte) | Point12 Intensity |
|:------------------------|:------------------|:------------------------|:------------------|:----|:-------------------------|:-------------------|
| Distance_L, Distance_H  | Intensity        | Distance_L, Distance_H  | Intensity        | ... | Distance_L, Distance_H   | Intensity         |



- Packet Example
  - Speed : 0x0868 (2152 &deg;/s)
  - Start Angle : 0x7EAB (32427 divide by 100 = 324.27 &deg;)
  - End Angle : 0x82BE (33470 divide by 100 = 334.70 &deg;)
  - Timestamp : 0x1A3A (6714 ms)

| Header (2Byte)| Info | SampleInfo |  Speed (2Byte) |    Start Angle (2Byte)   | Data (24Byte) |   Stop Angle (2Byte)   |  CRC (2Byte) |
|:--------------|:-----|:-----------|:---------------|:-------------------------|:--------------|:-----------------------|:-------------|
|  0xA5, 0x5A   | 0x2C |     0x68   |   0xAB, 0x7E   |        0xBE, 0x82        |     Data      |       0x3A, 0x1A       |     0x50     |

- Data Example
  - Point1 Distance : 0x00E0 (224 mm)
  - Point1 Intensity : 0xE4 (228)
  - Point2 Distance : 0x00DC (220 mm)
  - Point2 Intensisty : 0xE2 (226)
  - Point12 Distance : 0x00B0 (176 mm)
  - Point12 Intensity : 0xEA (234)

| Point1 Distance (2Byte) | Point1 Itensity | Point2 Distance (2Byte) | Point2 Itensity | ... | Point8 Distance (2Byte) | Point8 Itensity |
|:------------------------|:----------------|:------------------------|:----------------|:----|-------------------------|:----------------|
|        0xE0, 0x00       |       0xE4      |        0xDC, 0x00       |       0xE2      | ... |        0xB0, 0x00       |       0xEA      |
