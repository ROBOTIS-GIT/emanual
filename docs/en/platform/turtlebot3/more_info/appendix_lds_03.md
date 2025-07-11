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
