---
layout: archive
lang: en
ref: all-dyd
read_time: true
share: true
author_profile: false
permalink: /docs/en/all-dyd/
sidebar:
  title: DYD
  nav: "all-dyd"
product_group: all-dyd
---

# [Overview](#overview)

DYNAMIXEL DRIVE (DYD) is a cycloid-based compact reduction gear with superior impact resistance while realizing high torque, high efficiency and light weight.


![](/assets/images/dyd/dyd_spec_01.png)

|                      Characteristics                      |   **DYD**{: .red}   | Starain Wave Gear | Planetary Gear |
|:---------------------------------------------------------:|:-------------------:|:-----------------:|:--------------:|
|                        Efficiency                         | **&#9678;**{: .red} |    **&#9651;**    |  **&#9678;**   |
|                     Back-Drive torque                     | **&#9711;**{: .red} |    **&#9651;**    |  **&#9678;**   |
|                    Accuracy (Backlash)                    | **&#9678;**{: .red} |    **&#9678;**    |  **&#9651;**   |
|               Rigidity under impact (shock)               | **&#9678;**{: .red} |    **&#9651;**    |  **&#9711;**   |
| Operating time to failure under heavy operating condition | **&#9678;**{: .red} |    **&#9651;**    |  **&#9711;**   |

- **&#9678;**: Excellent
- **&#9711;** : Good
- **&#9651;**: Average

{% include en/dyd/dyd_warning.md %}

## [Features](#features)

![](/assets/images/dyd/dyd_features_01.png)

- Superior Impact Resistance  
- High Durability & Strong Rigidity                              
- High Efficiency & Low Backlash
- High Precision
- Various Gear Ratios
- Lightweight & Compact Gear Module

## [Gear Ratio and Rotational Direction](#gear-ratio-and-rotational-direction)

In the following table, its shown input rotate direction and output rotate direction depend on fixed part.  
The housing fixed type is input and output rotations in the opposite direction.

|     Fixed     | Output Speed | Input Direction | Output Direction |                         Example                          |
|:-------------:|:------------:|:---------------:|:----------------:|:--------------------------------------------------------:|
|    Housing    |  i=(-1)1/R   |   Cathode (+)   |    Anode (-)     |    ![](/assets/images/dyd/all_dyd/dyd_housing_01.png)    |
| Output flange |  i=1/(R+1)   |   Cathode (+)   |   Cathode (+)    | ![](/assets/images/dyd/all_dyd/dyd_output_flange_01.png) |

# [Product Lineup](#product-lineup)

|                   [DYD-11]                   |                   [DYD-14]                   |                   [DYD-17]                   |
|:--------------------------------------------:|:--------------------------------------------:|:--------------------------------------------:|
| ![](/assets/images/dyd/dyd_lineup_11_02.png) | ![](/assets/images/dyd/dyd_lineup_14_02.png) | ![](/assets/images/dyd/dyd_lineup_17_02.png) |
| ![](/assets/images/dyd/dyd_lineup_11_01.png) | ![](/assets/images/dyd/dyd_lineup_14_01.png) | ![](/assets/images/dyd/dyd_lineup_17_01.png) |

## [Specifications](#specifications)

|                Properties                |  Unit  | DYD-11-033 | DYD-11-051 | DYD-14-051 | DYD-14-099 | DYD-17-051 | DYD-17-099 |
|:----------------------------------------:|:------:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
|                Gear ratio                |   \-   |     33     |     51     |     51     |     99     |     51     |     99     |
|     Rated output torque (@2,000rpm)      |   Nm   |    2.2     |    3.5     |    3.7     |    5.4     |     11     |     16     |
| Permissible peak torque at accel / decel |   Nm   |    8.8     |     14     |    14.8    |    21.6    |     44     |     64     |
|    Permissible peak torque at E-stop     |   Nm   |     28     |     28     |    43.2    |    43.2    |     96     |     96     |
|           Nominal input speed            |  rpm   |   2,000    |   2,000    |   2,000    |   2,000    |   2,000    |    2000    |
|           Maximum input speed            |  rpm   |   8,500    |   8,500    |   8,500    |   8,500    |   8,500    |    8500    |
|                 Backlash                 | arcmin |    <3.0    |    <3.0    |    <3.0    |    <3.0    |    <3.0    |    <3.0    |
|       Efficiency (@ 2,000rpm, 20℃)       |   %    |     65     |     65     |     60     |     60     |     70     |     70     |
|             Starting torque              |  cNm   |     5      |     3      |     5      |     3      |     4      |     3      |
|            Back-drive torque             |   Nm   |     1      |     1      |     3      |     3      |     5      |     5      |
|                Dimensions                |   mm   | □43 × 23.5 | □43 × 23.5 |  ∅68 × 30  |  ∅68 × 30  | ∅78 × 34.2 | ∅78 × 34.2 |
|                  Weight                  |   g    |    196     |    196     |    400     |    400     |    600     |    600     |

- **Nominal input speed**: 2,000 rpm
- **Maximum input speed**: 8,500 rpm
- **Service life**: 7,000 hours

## [Naming Convention](#naming-convention)

![](/assets/images/dyd/dyd_parts_number_update_01.jpg)

| Product Name | Model Size | Gear Ratio | Input Shaft | Special Production |
|:------------:|:----------:|:----------:|:-----------:|:------------------:|
|     DYD      |     11     |   33, 51   |  C <br>SD   |         SP         |
|     DYD      |     14     |   51, 99   |  C <br>SD   |         SP         |
|     DYD      |     17     |   51, 99   |  C <br>SD   |         SP         |

# [Engineering Data](#engineering-data)

## [Rated output torque](#rated-output-torque)

Rated output torque indicates allowable continuous load torque at rated input speed.

## [Permissible peak torque at accel / decel](#permissible-peak-torque-at-accel--decel)

When the reducer is operating, a torque higher than the rated torque is applied during acceleration or deceleration. It is used when calculating the average output torque. See "duty cycle".

## [Permissible peak torque at E-stop](#permissible-peak-torque-at-e-stop)

The gear may be subjected to momentary peak torques in the event of a collision or emergency stop. 

![](/assets/images/dyd/all_dyd/dyd_peak_torque.png)

## [Nominal input speed](#nominal-input-speed)

Nominal input speed represents a limit for average working cycle speed.

## [Maximum input speed](#maximum-input-speed)

The maximum input speed is the speed limit in the continuous operation. 

## [Moment of inertia](#moment-of-inertia)

The moment of inertia represents the moment of mass inertia based on the input axis of rotation. 

## [Backlash](#backlash)

As shown in the figure below, when the applied torque is increased to the rated torque and is brought back to zero, the torsional angle does not return exactly back to the zero point. This small difference is called hysteresis loss. 

![](/assets/images/dyd/all_dyd/dyd_backlash.png)

## [Efficiency](#efficiency)

The efficiency of the reduction gears depends on the specific lost motion, input speed, load, lubricant temperature and size. The results statistically evaluated from current production tests.

## [Starting torque](#starting-torque)

The starting torque is a quasi-static torque required to start rotation of the input shaft(dynamic friction), if no load is applied to the output flange. 

## [Back-drive torque](#back-drive-torque)

The back-driving torque is the torque applied on the output flange that is required to start rotation of the input shaft under no load. And the output flange fully rotate 1 revolution.

# [Product Selection Guide](#product-selection-guide)

## [Selection Flow Chart](#selection-flow-chart)

<!-- 

When configuring a system with reducers, the load applied to the reducer normally fluctuates during acceleration/deceleration or emergency conditions, therefore, it is recommended to reflect various operation conditions to estimate the average load and speed to select the appropriate DYD product. 

-->

![](/assets/images/dyd/dyd_selection_flowchart_01.png)

## [Duty Cycle](#duty-cycle)

In the figure the duty cycle is different from your cases, please supply the drawing and values of your duty cycle. These values are important for us to be able to determine effectively lifetimes

![](/assets/images/dyd/all_dyd/dyd_duty_cycle.png)

| Properties | Description                                  | Properties | Description                                 |
|:-----------|:---------------------------------------------|:-----------|:--------------------------------------------|
| Ta         | Average output load \[Nm\]                   | na         | Average input speed \[rpm\]                 |
| T1         | Maximum output torque at acceleration \[Nm\] | n1         | Average input speed at acceleration \[rpm\] |
| T2         | Output torque at constant speed \[Nm\]       | n2         | Input speed at constant motion \[rpm\]      |
| T3         | Maximum output torque at deceleration \[Nm\] | n3         | Average input speed at deceleration \[rpm\] |
| t1         | Acceleration time \[s\]                      |            |                                             |
| t2         | Constant motion time \[s\]                   |            |                                             |
| t3         | Deceleration time \[s\]                      |            |                                             |
| t4         | Idle time \[s\]                              |            |                                             |
| t          | Duty cycle time \[s\]                        |            |                                             |


## [Average Output Load](#average-output-load)

Please calculate values of your average output load. 

![](/assets/images/dyd/all_dyd/dyd_average_torque_eq.png)

![](/assets/images/dyd/all_dyd/dyd_average_output_torque.png)

## [Average Input Speed](#average-input-speed-2)

Please calculate values of your average input speed.

![](/assets/images/dyd/all_dyd/dyd_averlage_speed_eq.png)

![](/assets/images/dyd/all_dyd/dyd_average_input_speed.png)

## [Service Life](#service-life)

The nominal service life of the Dynamixel Drive is determined by the service life of the bearings on the input shaft.  
This nominal service life is limited by the material fatigue of the bearings. It does not take into account other factors that may be a limit to the practical service life, such as insufficient lubrication, contamination or overload. The nominal service life is only a statistical value.  

The required service life for a given speed and load values can be calculated as follows:

![](/assets/images/dyd/dyd_service_life_01_kr.png)

|  Properties   | Description                      |
|:-------------:|:---------------------------------|
|   Lh design   | Design service life \[hour\]     |
| Lh calculated | Calculated service life \[hour\] |
|      LR       | Reference service life \[hour\]  |
|      nR       | Nominal input speed  \[rpm\]     |
|      na       | Average input speed \[rpm\]      |
|      TR       | Rated torque \[Nm\]              |
|      Ta       | Average output load \[Nm\]       |

### [Service Life with Output Load](#service-life-with-output-load)

![](/assets/images/dyd/all_dyd/dyd_11_life.png){: width="600px"}
> Service Life: DYD-11 \| Test condition :  Input speed 2,000rpm, Test environment : Temperature 22 ºC, Humidity 55%

![](/assets/images/dyd/all_dyd/dyd_14_life.png){: width="600px"}
> Service Life: DYD-14 \| Test condition :  Input speed 2,000rpm, Test environment : Temperature 22 ºC, Humidity 55%

![](/assets/images/dyd/all_dyd/dyd_17_life.png){: width="600px"}
> Service Life: DYD-17 \| Test condition :  Input speed 2,000rpm, Test environment : Temperature 22 ºC, Humidity 55%

## [Product Selection Example](#product-selection-example)

### [Define the Duty Cycle](#define-the-duty-cycle)

| Properties |              Description              |   Value    | Note |
|:----------:|:-------------------------------------:|:----------:|:----:|
|     T1     | Maximum output torque at acceleration |   7.5 Nm   |      |
|     T2     |    Output torque at constant speed    |    5 Nm    |      |
|     T3     | Maximum output torque at deceleration |   2.5 Nm   |      |
|     n1     |  Average input speed at acceleration  | 1,500 rpm  |      |
|     n2     |    Input speed at constant motion     | 3,000 rpm  |      |
|     n3     |  Average input speed at acceleration  | 1,500 rpm  |      |
|     t1     |           Acceleration time           |    1 s     |      |
|     t2     |         Constant motion time          |    5 s     |      |
|     t3     |           Deceleration time           |    1 s     |      |
|     t4     |               Idle time               |    0 s     |      |
| Lh design  |          Design service life          | 6,500 hour |      |

### [Average Output Load Calculation](#average-output-load-calculation)

| Properties | Description         |  Value  | Note |
|:----------:|:--------------------|:-------:|:-----|
|     Ta     | Average output load | 4.72 Nm | cal. |

### [Average Input Speed Calculation](#average-input-speed-calculation)

| Properties | Description         |    Value     | Note |
|:----------:|:--------------------|:------------:|:-----|
|     na     | Average input speed | 2,571.43 rpm | cal. |

### [Pre-Selection : DYD-14-051](#pre-selection--dyd-14-051)

|               Properties                | Unit   | DYD-14-051 |
|:---------------------------------------:|:-------|:----------:|
|               Gear ratio                | \-     |     51     |
|     Rated output torque (@2,000rpm)     | Nm     |    3.7     |
| Permissible peak torque (accel / decel) | Nm     |    14.8    |
|    Permissible peak torque at E-stop    | Nm     |    43.2    |
|           Nominal input speed           | rpm    |   2,000    |
|           Maximum input speed           | rpm    |   8,500    |
|                Backlash                 | arcmin |    <3.0    |
|               Efficiency                | %      |     60     |
|                Dimension                | mm     |  Ø68 × 30  |
|                 Weight                  | g      |    400     |

### [Expected Service Life Calculation: DYD-14-051](#expected-service-life-calculation-dyd-14-051)

|  Properties   | Description             |   Value    |      Note      |
|:-------------:|:------------------------|:----------:|:--------------:|
| Lh calculated | Calculated service life | 6,027 hour |      cal.      |
|   Lh design   | Design service life     | 6,500 hour |                |
|      nR       | Nominal input speed     | 2,000 rpm  | see data sheet |
|      na       | Average input speed     | 2,142 rpm  |                |
|      TR       | Rated torque            |   3.7 Nm   | see data sheet |
|      Ta       | Average output torque   |  4.72 Nm   |                |

### [Design service life comparison : DYD-14-051](#design-service-life-comparison--dyd-14-051)

Design service life : 6,500 hour > Calculated service life : 6,027 hour

### [Pre-Selection : DYD-14-099](#pre-selection--dyd-14-099)

|               Properties                | Unit   | DYD-14-099 |
|:---------------------------------------:|:-------|:----------:|
|               Gear ratio                | \-     |     99     |
|     Rated output torque (@2,000rpm)     | Nm     |    5.4     |
| Permissible peak torque (accel / decel) | Nm     |    21.6    |
|    Permissible peak torque at E-stop    | Nm     |    43.2    |
|           Nominal input speed           | rpm    |   2,000    |
|           Maximum input speed           | rpm    |   8,500    |
|                Backlash                 | arcmin |    <3.0    |
|               Efficiency                | %      |     60     |
|                Dimension                | mm     |  ∅68 × 30  |
|                 Weight                  | g      |    400     |

### [Expected Service Life Calculation: DYD-14-099](#expected-service-life-calculation-dyd-14-099)

|  Properties   | Description             |   Value    |      Note      |
|:-------------:|:------------------------|:----------:|:--------------:|
| Lh calculated | Calculated service life | 6,837 hour |      cal.      |
|   Lh design   | Design service life     | 6,500 hour |                |
|      nR       | Nominal input speed     | 2,000 rpm  | see data sheet |
|      na       | Average input speed     | 2,142 rpm  |                |
|      TR       | Rated torque            |   5.4 Nm   | see data sheet |
|      Ta       | Average output torque   |  4.72 Nm   |                |


### [Design service life comparison : DYD-14-099](#design-service-life-comparison--dyd-14-099)

Design service life : 6,500 hour < Calculated service life : 6,837 hour

<!-- 

### [Confirm the Part Number : DYD-14-099](#confirm-the-part-number--dyd-14-099) 

-->

### [Select the input shaft type](#select-the-type-input-shaft-type)

Two types of input shafts are available; C and SD. 	

| Option |                Type - C                |                Type - SD                |
|:------:|:--------------------------------------:|:---------------------------------------:|
| Shape  | ![](/assets/images/dyd/dyd_c_type.png) | ![](/assets/images/dyd/dyd_sd_type.png) |
|  Name  |               Clamp-ring               |            Set-screw (D-Cut)            |

# [Use Applications](#use-applications)

![](/assets/images/dyd/dyd_application_01.png){: width="500px"}

[DYD-11-033]: /docs/en/all-dyd/dyd-11/
[DYD-11-051]: /docs/en/all-dyd/dyd-11/
[DYD-14-051]: /docs/en/all-dyd/dyd-14/
[DYD-14-099]: /docs/en/all-dyd/dyd-14/
[DYD-17-051]: /docs/en/all-dyd/dyd-17/
[DYD-17-099]: /docs/en/all-dyd/dyd-17/
[DYD-11]: /docs/en/all-dyd/dyd-11/
[DYD-14]: /docs/en/all-dyd/dyd-14/
[DYD-17]: /docs/en/all-dyd/dyd-17/
