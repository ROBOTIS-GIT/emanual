---
layout: archive
lang: en
ref: dxl_x
permalink: /docs/en/dxl/x/
sidebar:
  title: DYNAMIXEL-X
  nav: "dxl_x_main"
---

![](/assets/images/dxl/x/x_series_product.png)

# [Features](#features)

![](/assets/images/dxl/x/dxl_x_productline.png)

> DYNAMIXEL-X Series Lineups

## Features
- Improved Torque, Compact Size.
- Enhanced Durability and Expansibility.
- Hollow Back Case Minimizes Cable Stress (3-way-routing).
- Direct Screw Assembly to the Case (without Nut Insert).
- Improved Heat Sink Featuring an Aluminum Case.

## Various Control Functions
- Current-Based Torque Control.
- Profile Control for Smooth Motion Planning.
- Trajectory Data and Moving Status (In-Position, Following Error, etc).
- Energy Saving (Reduced Current from 100mA to 40mA).
- Various Operating Modes
  - Current based Position Control (XW/XH/XM/XC330/XL330 only).
  - Current Control (XW/XH/XM/XC330/XL330 only only).
  - Velocity Control.
  - Position Control.
  - Extended Position Control.
  - PWM Control (Voltage Control Mode).

# [X Series](#x-series)
**Common Specifications**
- MCU : ARM CORTEX-M3 (72 \[MHz], 32Bit)
- Resolution : 4096 \[pulse/rev]
- Motor :
  - XD Series : Coreless (Maxon)
  - XW Series : Coreless (Maxon)
  - XH Series : Coreless (Maxon)
  - XM Series : Coreless
  - XC Series : Coreless
  - XL Series : Cored

XL320 has different specifications from other XL-Series. Please refer to [XL-320 Specifications](/docs/en/dxl/x/xl320/#주요-사양) for more details.
{: .notice--info}

## [XW Series](#xw-series)

| Model          | Stall Torque                                                                                              | No Load Speed                                                                          |
|:---------------|:----------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| [XW540-T260-R] | 8.8 [N.m] (at 11.1 [V], 4.5 [A])<br>9.5 [N.m] (at 12.0 [V], 4.9 [A])<br>11.2 [N.m] (at 14.8 [V], 5.9 [A]) | 37 [rev/min] (at 11.1 [V])<br>40 [rev/min] (at 12.0 [V])<br>48 [rev/min] (at 14.8 [V]) |
| [XW540-T140-R] | 6.4 [N.m] (at 11.1 [V], 4.5 [A])<br>6.9 [N.m] (at 12.0 [V], 4.9 [A])<br>8.3 [N.m] (at 14.8 [V], 5.9 [A])  | 67 [rev/min] (at 11.1 [V]<br>72 [rev/min] (at 12.0 [V]<br>88 [rev/min] (at 14.8 [V])   |
| [XW430-T333-R] | 2.9 [N.m] (at 11.1 [V], 1.2 [A])<br>3.1 [N.m] (at 12.0 [V], 1.3 [A])<br>3.6 [N.m] (at 14.8 [V], 1.5 [A])  | 29 [rev/min] (at 11.1 [V]<br>31 [rev/min] (at 12.0 [V]<br>39 [rev/min] (at 14.8 [V])   |
| [XW430-T200-R] | 6.4 [N.m] (at 11.1 [V], 4.5 [A])<br>6.9 [N.m] (at 12.0 [V], 4.9 [A])<br>8.3 [N.m] (at 14.8 [V], 5.9 [A])  | 49 [rev/min] (at 11.1 [V]<br>53 [rev/min] (at 12.0 [V]<br>66 [rev/min] (at 14.8 [V])   |

## [XD Series](#xd-series)

| Model          | Stall Torque                                                                                              | No Load Speed                                                                          |
|:---------------|:----------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| [XD540-T270-R] | 9.2 [N.m] (at 11.1 [V], 4.5 [A])<br>9.9 [N.m] (at 12.0 [V], 4.9 [A])<br>11.7 [N.m] (at 14.8 [V], 5.9 [A]) | 36 [rev/min] (at 11.1 [V])<br>39 [rev/min] (at 12.0 [V])<br>46 [rev/min] (at 14.8 [V]) |
| [XD540-T150-R] | 6.6 [N.m] (at 11.1 [V], 4.5 [A])<br>7.1 [N.m] (at 12.0 [V], 4.9 [A])<br>8.5 [N.m] (at 14.8 [V], 5.9 [A])  | 66 [rev/min] (at 11.1 [V])<br>70 [rev/min] (at 12.0 [V])<br>86 [rev/min] (at 14.8 [V]) |
| [XD430-T350-R] | 3.1 [N.m] (at 11.1 [V], 1.2 [A])<br>3.4 [N.m] (at 12.0 [V], 1.3 [A])<br>4.2 [N.m] (at 14.8 [V], 1.5 [A])  | 27 [rev/min] (at 11.1 [V])<br>30 [rev/min] (at 12.0 [V])<br>37 [rev/min] (at 14.8 [V]) |
| [XD430-T210-R] | 2.2 [N.m] (at 11.1 [V], 1.2 [A])<br>2.5 [N.m] (at 12.0 [V], 1.3 [A])<br>3.1 [N.m] (at 14.8 [V], 1.5 [A])  | 46 [rev/min] (at 11.1 [V])<br>50 [rev/min] (at 12.0 [V])<br>62 [rev/min] (at 14.8 [V]) |

## [XH Series](#xh-series)

| Model            | Stall Torque                                                                                              | No Load Speed                                                                          |
|:-----------------|:----------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| [XH540-V270-R]   | 9.2 [N.m] (at 24 [V], 2.4 [A])                                                                            | 34 [rev/min] (at 24 [V])                                                               |
| [XH540-W270-T/R] | 9.2 [N.m] (at 11.1 [V], 4.5 [A])<br>9.9 [N.m] (at 12.0 [V], 4.9 [A])<br>11.7 [N.m] (at 14.8 [V], 5.9 [A]) | 36 [rev/min] (at 11.1 [V])<br>39 [rev/min] (at 12.0 [V])<br>46 [rev/min] (at 14.8 [V]) |
| [XH540-V150-R]   | 6.4 [N.m] (at 24 [V], 2.4 [A])                                                                            | 60 [rev/min] (at 24 [V])                                                               |
| [XH540-W150-T/R] | 6.6 [N.m] (at 11.1 [V], 4.5 [A])<br>7.1 [N.m] (at 12.0 [V], 4.9 [A])<br>8.5 [N.m] (at 14.8 [V], 5.9 [A])  | 66 [rev/min] (at 11.1 [V])<br>70 [rev/min] (at 12.0 [V])<br>86 [rev/min] (at 14.8 [V]) |
| [XH430-V350-R]   | 3.3 [N.m] (at 24 [V], 0.7[A])                                                                             | 31 [rev/min] (at 24 [V])                                                               |
| [XH430-W350-T/R] | 3.1 [N.m] (at 11.1 [V], 1.2 [A])<br>3.4 [N.m] (at 12.0 [V], 1.3 [A])<br>4.2 [N.m] (at 14.8 [V], 1.5 [A])  | 27 [rev/min] (at 11.1 [V])<br>30 [rev/min] (at 12.0 [V])<br>37 [rev/min] (at 14.8 [V]) |
| [XH430-V210-R]   | 2.6 [N.m] (at 24 [V], 0.7[A])                                                                             | 52 [rev/min] (at 24 [V])                                                               |
| [XH430-W210-T/R] | 2.2 [N.m] (at 11.1 [V], 1.2 [A])<br>2.5 [N.m] (at 12.0 [V], 1.3 [A])<br>3.1 [N.m] (at 14.8 [V], 1.5 [A])  | 46 [rev/min] (at 11.1 [V])<br>50 [rev/min] (at 12.0 [V])<br>62 [rev/min] (at 14.8 [V]) |

## [XM Series](#xm-series)

| Model            | Stall Torque                                                                                               | No Load Speed                                                                          |
|:-----------------|:-----------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| [XM540-W270-T/R] | 10.0[N.m] (at 11.1 [V], 4.2 [A])<br>10.6 [N.m] (at 12.0 [V], 4.4 [A])<br>12.9 [N.m] (at 14.8 [V], 5.5 [A]) | 28 [rev/min] (at 11.1 [V])<br>30 [rev/min] (at 12.0 [V])<br>37 [rev/min] (at 14.8 [V]) |
| [XM540-W150-T/R] | 6.9 [N.m] (at 11.1 [V], 4.2 [A])<br>7.3 [N.m] (at 12.0 [V], 4.4 [A])<br>8.9 [N.m] (at 14.8 [V], 5.5 [A])   | 50 [rev/min] (at 11.1 [V])<br>53 [rev/min] (at 12.0 [V])<br>66 [rev/min] (at 14.8 [V]) |
| [XM430-W350-T/R] | 3.8 [N.m] (at 11.1 [V], 2.1 [A])<br>4.1 [N.m] (at 12.0 [V], 2.3 [A])<br>4.8 [N.m] (at 14.8 [V], 2.7 [A])   | 43 [rev/min] (at 11.1 [V])<br>46 [rev/min] (at 12.0 [V])<br>57 [rev/min] (at 14.8 [V]) |
| [XM430-W210-T/R] | 2.7 [N.m] (at 11.1 [V], 2.1 [A])<br>3.0 [N.m] (at 12.0 [V], 2.3 [A])<br>3.7 [N.m] (at 14.8 [V], 2.7 [A])   | 70 [rev/min] (at 11.1 [V])<br>77 [rev/min] (at 12.0 [V])<br>95 [rev/min] (at 14.8 [V]) |

## [XC Series](#xc-series)

| Model          | Stall Torque                                                                                                    | No Load Speed                                                                           |
|:---------------|:----------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------|
| [2XC430-W250]  | 1.3 [N.m] (at 9.0 [V], 1.1 [A])<br>1.6 [N.m] (at 11.1 [V], 1.3 [A])<br>1.8 [N.m] (at 12.0 [V], 1.4 [A])         | 48 [rev/min] (at 9.0 [V])<br>59 [rev/min] (at 11.1 [V])<br>64 [rev/min] (at 12.0 [V])   |
| [XC430-W240-T] | 1.4 [N.m] (at 9.0 [V], 1.1 [A])<br>1.7 [N.m] (at 11.1 [V], 1.3 [A])<br>1.9 [N.m] (at 12.0 [V], 1.4 [A])         | 52 [rev/min] (at 9.0 [V])<br>65 [rev/min] (at 11.1 [V])<br>70 [rev/min] (at 12.0 [V])   |
| [XC430-W150-T] | 1.2 [N.m] (at 9.0 [V], 1.1 [A])<br>1.4 [N.m] (at 11.1 [V], 1.3 [A])<br>1.6 [N.m] (at 12.0 [V], 1.4 [A])         | 80 [rev/min] (at 9.0 [V])<br>99 [rev/min] (at 11.1 [V])<br>106 [rev/min] (at 12.0 [V])  |
| [XC430-T240BB-T] | 1.4 [N.m] (at 9.0 [V], 1.1 [A])<br>1.7 [N.m] (at 11.1 [V], 1.3 [A])<br>1.9 [N.m] (at 12.0 [V], 1.4 [A])         | 52 [rev/min] (at 9.0 [V])<br>65 [rev/min] (at 11.1 [V])<br>70 [rev/min] (at 12.0 [V])   |
| [XC430-T150BB-T] | 1.2 [N.m] (at 9.0 [V], 1.1 [A])<br>1.4 [N.m] (at 11.1 [V], 1.3 [A])<br>1.6 [N.m] (at 12.0 [V], 1.4 [A])         | 80 [rev/min] (at 9.0 [V])<br>99 [rev/min] (at 11.1 [V])<br>106 [rev/min] (at 12.0 [V])  |
| [XC330-T288]   | 0.76 [N.m] (at 9.0 [V], 0.61 [A])<br> 0.92 [N.m] (at 11.1 [V], 0.80 [A])<br> 1.00 [N.m] (at 12.0 [V], 0.88 [A]) | 52 [rev/min] (at 9.0 [V])<br>65 [rev/min] (at 11.1 [V])<br>71 [rev/min] (at 12.0 [V])   |
| [XC330-T181]   | 0.65 [N.m] (at 9.0 [V], 0.61 [A])<br>0.76 [N.m] (at 11.1 [V], 0.80 [A])<br>0.80 [N.m] (at 12.0 [V], 0.88 [A])   | 83 [rev/min] (at 9.0 [V])<br>104 [rev/min] (at 11.1 [V])<br>113 [rev/min] (at 12.0 [V]) |
| [XC330-M288]   | 0.180 [N.m] (at 3.7 [V], 1.11 [A])<br>0.215 [N.m] (at 5.0 [V], 1.47 [A])<br>0.228 [N.m] (at 6.0 [V], 1.74 [A])  | 59 [rev/min] (at 3.7 [V])<br>81 [rev/min] (at 5.0 [V])<br>97 [rev/min] (at 6.0 [V])     |
| [XC330-M181]   | 0.180 [N.m] (at 3.7 [V], 1.11 [A])<br>0.215 [N.m] (at 5.0 [V], 1.47 [A])<br>0.228 [N.m] (at 6.0 [V], 1.74 [A])  | 95 [rev/min] (at 3.7 [V])<br>129 [rev/min] (at 5.0 [V])<br>155 [rev/min] (at 6.0 [V])   |

## [XL Series](#xl-series)

| Model           | Stall Torque                                                                                                   | No Load Speed                                                                          |
|:----------------|:---------------------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------|
| [2XL430-W250-T] | 1.0 [N.m] (at 9.0 [V], 1.0 [A])<br>1.4 [N.m] (at 11.1 [V], 1.3 [A])<br>1.5 [N.m] (at 12.0 [V], 1.4 [A])        | 47 [rev/min] (at 9.0 [V])<br>57 [rev/min] (at 11.1 [V])<br>61 [rev/min] (at 12.0 [V])  |
| [XL430-W250-T]  | 1.0 [N.m] (at 9.0 [V], 1.0 [A])<br>1.4 [N.m] (at 11.1 [V], 1.3 [A])<br>1.5 [N.m] (at 12.0 [V], 1.4 [A])        | 47 [rev/min] (at 9.0 [V])<br>57 [rev/min] (at 11.1 [V])<br>61 [rev/min] (at 12.0 [V])  |
| [XL330-M288]    | 0.42 [N.m] (at 3.7 [V], 1.11 [A])<br>0.52 [N.m] (at 5.0 [V], 1.47 [A])<br>0.60 [N.m] (at 6.0 [V], 1.74 [A])    | 76 [rev/min] (at 3.7 [V])<br>103 [rev/min] (at 5.0 [V])<br>123 [rev/min] (at 6.0 [V])  |
| [XL330-M077]    | 0.180 [N.m] (at 3.7 [V], 1.11 [A])<br>0.215 [N.m] (at 5.0 [V], 1.47 [A])<br>0.228 [N.m] (at 6.0 [V], 1.74 [A]) | 278 [rev/min] (at 3.7 [V])<br>383 [rev/min] (at 5.0 [V])<br>456 [rev/min] (at 6.0 [V]) |
| [XL-320]        | 0.39[N.m] (at 7.4 [V], 1.1 [A])                                                                                | 114 [rev/min] (at 7.4 [V], 0.18[A])                                                    |

[XW540-T260-R]: /docs/en/dxl/x/xw540-t260/
[XW540-T140-R]: /docs/en/dxl/x/xw540-t140/
[XW430-T333-R]: /docs/en/dxl/x/xw430-t333/
[XW430-T200-R]: /docs/en/dxl/x/xw430-t200/
[XD540-T270-R]: /docs/en/dxl/x/xd540-t270
[XD540-T150-R]: /docs/en/dxl/x/xd540-t150
[XD430-T350-R]: /docs/en/dxl/x/xd430-t350
[XD430-T210-R]: /docs/en/dxl/x/xd430-t210
[XH540-V270-R]: /docs/en/dxl/x/xh540-v270/
[XH540-W270-T/R]: /docs/en/dxl/x/xh540-w270/
[XH540-V150-R]: /docs/en/dxl/x/xh540-v150/
[XH540-W150-T/R]: /docs/en/dxl/x/xh540-w150/
[XH430-V350-R]: /docs/en/dxl/x/xh430-v350/
[XH430-W350-T/R]: /docs/en/dxl/x/xh430-w350/
[XH430-V210-R]: /docs/en/dxl/x/xh430-v210/
[XH430-W210-T/R]: /docs/en/dxl/x/xh430-w210/
[XM540-W270-T/R]: /docs/en/dxl/x/xm540-w270/
[XM540-W150-T/R]: /docs/en/dxl/x/xm540-w150/
[XM430-W350-T/R]: /docs/en/dxl/x/xm430-w350/
[XM430-W210-T/R]: /docs/en/dxl/x/xm430-w210/
[2XC430-W250]: /docs/en/dxl/x/2xc430-w250/
[XC430-W240-T]: /docs/en/dxl/x/xc430-w240/
[XC430-W150-T]: /docs/en/dxl/x/xc430-w150/
[XC430-T240BB-T]: /docs/en/dxl/x/xc430-t240bb/
[XC430-T150BB-T]: /docs/en/dxl/x/xc430-t150bb/
[XC330-T288]: /docs/en/dxl/x/xc330-t288
[XC330-T181]: /docs/en/dxl/x/xc330-t181
[XC330-M288]: /docs/en/dxl/x/xc330-m288
[XC330-M181]: /docs/en/dxl/x/xc330-m181
[2XL430-W250-T]: /docs/en/dxl/x/2xl430-w250/
[XL430-W250-T]: /docs/en/dxl/x/xl430-w250/
[XL330-M288]: /docs/en/dxl/x/xl330-m288/
[XL330-M077]: /docs/en/dxl/x/xl330-m077/
[XL-320]: /docs/en/dxl/x/xl320/
