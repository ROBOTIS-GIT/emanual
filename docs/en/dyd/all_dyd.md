---
layout: archive
lang: en
ref: all-dyd
read_time: true
share: false
author_profile: false
permalink: /docs/en/all-dyd/
sidebar:
  title: DYD
  nav: "all-dyd"
product_group: all-dyd
---

# [Overview](#overview)

Generally, a traditional Cycloidal Gear Drive is well known as being strong but  larger in size and heavier compared to the Harmonic Drive. However, unlike traditional Cycloid Drives, the ROBOTIS DYNAMIXEL DRIVE(DYD) achieves high torque and accurate repeatability at the same time while being more compact, lighter, and stronger over other reducers in the market

![](/assets/images/dyd/dyd_spec_01.png)


|                      Characteristics                      |  Planetary  |  Harmonic   |     DYD     |
|:---------------------------------------------------------:|:-----------:|:-----------:|:-----------:|
|                        Gear ratio                         |  &#11093;   | **&#9678;** | **&#9678;** |
|                       Contact ratio                       |  &#11093;   |  &#11093;   | **&#9678;** |
|                       Compact size                        | **&#9651;** | **&#9678;** | **&#9678;** |
|                       Light Weight                        | **&#9651;** | **&#9678;** | **&#9678;** |
|                         Backlash                          | **&#9651;** | **&#9678;** |  &#11093;   |
|                        Efficiency                         | **&#9678;** | **&#9678;** | **&#9678;** |
|               Rigidity under impact (shock)               |  &#11093;   | **&#9651;** | **&#9678;** |
|                     Noise & vibration                     | **&#9651;** | **&#9678;** |  &#11093;   |
| Operating time to failure under heavy operating condition |  &#11093;   | **&#9651;** | **&#9678;** |

## [Features](#features)

![](/assets/images/dyd/dyd_features_01.png)

- High Durability and Strong Rigidity
- High Impact Resistance
- High Precision
- Variable Gear Ratio
- High Efficiency & Low Backlash
- Lightweight & Compact Gear Module

## [Gear Ratio and Rotational Direction](#gear-ratio-and-rotational-direction)

In the following image, it is shown that the rotational direction of the input motor and the output component depends on the fixed position of the reducer. When the DYD drive is fixed and the output flange is rotating, the rotational direction is opposite to the input direction while the output speed becomes reciprocal of the input speed(R). If the DYD drive housing is rotating while the output flange is fixed to the frame, the rotating direction of input and output is the same while the output becomes reciprocal of the input speed + 1(R+1).


|     Fixed     | Output Speed | Input Direction | Output Direction |                       Example                       |
|:-------------:|:------------:|:---------------:|:----------------:|:---------------------------------------------------:|
|    Housing    |  i=(-1)1/R   |   Cathode (+)   |    Anode (-)     |    ![](/assets/images/dyd/dyd_housing_01_kr.png)    |
| Output flange |  i=1/(R+1)   |   Cathode (+)   |   Cathode (+)    | ![](/assets/images/dyd/dyd_output_flange_01_kr.png) |

# [Product Lineup](#product-lineup)

|                                  DYD-11                                  |                                  DYD-14                                  |                                  DYD-17                                  |
|:------------------------------------------------------------------------:|:------------------------------------------------------------------------:|:------------------------------------------------------------------------:|
| [![](/assets/images/dyd/dyd_lineup_11_01.png)](/docs/kr/all-dyd/dyd-11/) | [![](/assets/images/dyd/dyd_lineup_14_01.png)](/docs/kr/all-dyd/dyd-14/) | [![](/assets/images/dyd/dyd_lineup_17_01.png)](/docs/kr/all-dyd/dyd-17/) |
|               ![](/assets/images/dyd/dyd_lineup_11_02.png)               |               ![](/assets/images/dyd/dyd_lineup_14_02.png)               |               ![](/assets/images/dyd/dyd_lineup_17_02.png)               |

> Click to the product page.

## [Specifications](#specifications)

|             Properties             | Unit  | DYD-11-033 | DYD-11-051 | DYD-14-051 | DYD-14-099 | DYD-17-051 | DYD-17-099 |
|:----------------------------------:|:-----:|:----------:|:----------:|:----------:|:----------:|:----------:|:----------:|
|             Gear ratio             |   -   |     33     |     51     |     51     |     99     |     51     |     99     |
|       Repeatable peak torque       |  Nm   |    8.5     |    17.0    |    27.0    |    39.0    |    34.0    |    54.0    |
| Read output torque<br>(@2,000 rpm) |  Nm   |    2.2     |    3.5     |    5.4     |    7.8     |    16.0    |    24.0    |
|        Maximum input Speed         |  rpm  |   6,000    |   6,000    |   6,000    |   6,000    |   6,000    |   6,000    |
|        Average input speed         |  rpm  |   2,000    |   2,000    |   2,000    |   2,000    |   2,000    |   2,000    |
|     Hysteresis loss / Backlash     | armin |    <3.0    |    <3.0    |    <3.0    |    <3.0    |    <3.0    |    <3.0    |
|          Starting torque           |  cNm  |     20     |     20     |     20     |     20     |     30     |     30     |
|            Service life            | horse |   3,000    |   3,000    |   5,000    |   5,000    |   5,000    |   5,000    |
|         Dimension (W X H)          |  mm   | 43 X 23.65 | 43 X 23.6  |  ø68 x 30  |  ø68 x 30  | ø78 x 34.2 | ø78 x 34.2 |
|               Weight               |   g   |    196     |    196     |    400     |    400     |    600     |    600     |

## [Part Numbers](#part-numbers)

![](/assets/images/dyd/dyd_parts_number_01.png)

| Product name | Model Size | Ratio  | Shaft version |  Option   | Special production |
|:------------:|:----------:|:------:|:-------------:|:---------:|:------------------:|
|     DYD      |     11     | 33, 51 |      SC       | S, RG, PG |         SP         |
|     DYD      |     14     | 51, 99 |      C,D      | S, RG, PG |         SP         |
|     DYD      |     17     | 51, 99 |      C,D      | S, RG, PG |         SP         |

# [Product Selection Guide](#product-selection-guide)

## [Selection Flow Chart](#selection-flow-chart)

When configuring a system with reducers, the load applied to the reducer normally fluctuates during acceleration/deceleration or emergency conditions, therefore, it is recommended to reflect various operation conditions to estimate the average load and speed to select the appropriate DYD product.

![](/assets/images/dyd/dyd_selection_flowchart_01.png)

## [Duty Cycle](#duty-cycle)

In the figure below shows an example of various torque and speed conditions during an operation. These values are critical factors in determining the lifecycle of the DYD product.

![](/assets/images/dyd/dyd_duty_cycle_01_kr.png)

| Properties | Description                                | Properties | Description                               |
|:----------:|:-------------------------------------------|:----------:|:------------------------------------------|
|     Ta     | Average output load                        |     na     | Average input speed                       |
|     T1     | maximum output torque at acceleration [Nm] |     n1     | average input speed at acceleration [rpm] |
|     T2     | output torque at constant speed [Nm]       |     n2     | input speed at constant motion [rpm]      |
|     T3     | maximum output torque at deceleration [Nm] |     n3     | average input speed at deceleration [rpm] |
|     t1     | acceleration time [s]                      |     -      | -                                         |
|     t2     | constant motion time [s]                   |     -      | -                                         |
|     t3     | deceleration time [s]                      |     -      | -                                         |
|     t4     | idle time [s]                              |     -      | -                                         |
|     t      | Duty cycle time [s]                        |     -      | -                                         |
|            |                                            |     -      | -                                         |

## [Average Output Load](#average-output-load)

The average output load can be calculated as below.

![](/assets/images/dyd/dyd_average_output_torque_01.png)

![](/assets/images/dyd/dyd_average_output_torque_02.png)

## [Average Input Speed](#average-input-speed)

The average input speed can be calculated as below.

![](/assets/images/dyd/dyd_average_input_speed_01.png)

![](/assets/images/dyd/dyd_average_input_speed_02.png)

## [Service Life)](#service-life)

The service life of DYD is determined by the fatigue failure of the bearings on the input shaft. Other factors that may affect the actual service life, such as insufficient lubrication, contamination or overload are not taken into account. The nominal service life is provided based on a statistical test value.  

The required service life for a given speed and load values can be calculated as follows:

![](/assets/images/dyd/dyd_service_life_01_kr.png)

| Properties | Description                    |
|:----------:|:-------------------------------|
|     Lh     | Required service life [hours]  |
|     LR     | Reference service life [hours] |
|     nR     | nominal input speed [rpm]      |
|     na     | average input speed [rpm]      |
|     TR     | nominal torque [Nm]            |
|     Ta     | average output torque [Nm]     |

## [Product Selection Example](#product-selection-example)

### [Define the Duty Cycle](#define-the-duty-cycle)

| Properties | Description                                | Value | Note |
|:----------:|:-------------------------------------------|:-----:|:-----|
|     T1     | Maximum output torque at acceleration [Nm] |  7.5  | -    |
|     T2     | Output torque at constant speed [Nm]       |   5   | -    |
|     T3     | Maximum output torque at deceleration [Nm] |  2.5  | -    |
|     n1     | Average input speed at acceleration [rpm]  | 1,500 | -    |
|     n2     | Input speed at constant motion [rpm]       | 3,000 | -    |
|     n3     | Average input speed at deceleration [rpm]  | 1,500 | -    |
|     t1     | Acceleration time [s]                      |   1   | -    |
|     t2     | Constant motion time [s]                   |   5   | -    |
|     t3     | deceleration time [s]                      |   1   | -    |
|     t4     | idle time [s]                              |   0   | -    |
|     Lh     | Required service life [hours]              | 5,000 | -    |

### [Average Output Load Calculation](#average-output-load-calculation)

| Properties | Description         | Value | Note |
|:----------:|:--------------------|:-----:|:-----|
|     Ta     | Average output load | 4.72  | cal. |

### [Average Input Speed Calculation](#average-input-speed-calculation)

| Properties | Description         |  Value  | Note |
|:----------:|:--------------------|:-------:|:-----|
|     na     | Average input speed | 2571.43 | cal. |

### [Select Part Number : DYD-14-051](#select-part-number-dyd-14-051)

|             Properties             |  Unit  | DYD-14-051 |
|:----------------------------------:|:------:|:----------:|
|             Gear ratio             |   -    |     51     |
|       Repeatable peak torque       |   Nm   |    27.0    |
| Read output torque<br>(@2,000 rpm) |   Nm   |    5.4     |
|        Maximum input Speed         |  rpm   |   6,000    |
|        Average input speed         |  rpm   |   2,000    |
|     Hysteresis loss / Backlash     | arcmin |    <3.0    |
|          Starting torque           |  cNm   |     20     |
|            Service life            |   hr   |   5,000    |
|         Dimension (W X H)          |   mm   |  ø68 x 30  |
|               Weight               |   g    |    400     |

> Selecting Part Number Example for DYD-14-051

### [Expected Service Life Calculation: DYD-14-051](#expected-service-life-calculation-dyd-14-051)

| Properties | Description                    |  Value  | Note           |
|:----------:|:-------------------------------|:-------:|:---------------|
|     Lh     | Required service life [hours]  | 4,883.5 | cal.           |
|     LR     | Reference service life [hours] |  5,000  | See data sheet |
|     nR     | Nominal input speed [rpm]      |  2,000  | See data sheet |
|     na     | Average input speed [rpm]      |  2,142  | -              |
|     TR     | Nominal torque [Nm]            |   5.4   | -              |
|     Ta     | Average output torque [Nm]     |  4.72   | See data sheet |

### [Service Life Comparison: DYD-14-051](#service-life-comparison-dyd-14-051)

Required service life : 5,000 hours > Expected service life : 4,880 hours

**Note**: The expected service life does not meet the required service life.
{: .notice}

### [Select another Part Number : DYD-14-099](#select-another-part-number--dyd-14-099)

|             Properties             | DYD-14-099 |
|:----------------------------------:|:----------:|
|             Gear ratio             |     99     |
|       Repeatable peak torque       |    39.0    |
| Read output torque<br>(@2,000 rpm) |    7.8     |
|        Maximum input Speed         |   6,000    |
|        Average input speed         |   2,000    |
|     Hysteresis loss / Backlash     |    <3.0    |
|          Starting torque           |     20     |
|            Service life            |   5,000    |
|         Dimension (W X H)          |  ø68 x 30  |
|               Weight               |    400     |

### [Expected Service Life Calculation: DYD-14-099](#expected-service-life-calculation-dyd-14-099)

| Properties | Description                    |  Value  | Note           |
|:----------:|:-------------------------------|:-------:|:---------------|
|     Lh     | Required service life [hours]  | 5,520.4 | cal.           |
|     LR     | Reference service life [hours] |  5,000  | See data sheet |
|     nR     | Nominal input speed [rpm]      |  2,000  | See data sheet |
|     na     | Average input speed [rpm]      |  2,142  | -              |
|     TR     | Nominal torque [Nm]            |   7.8   | See data sheet |
|     Ta     | Average output torque [Nm]     |  4.72   | -              |

### [Service Life Comparison: DYD-14-099](#service-life-comparison-dyd-14-099)

Required service life : 5,000 hours > Expected service life : 5,520 hours

### [Calculate the output speed](#calculate-the-output-speed)

Output Speed i=-(1/R)*V_in = -(1/99)*3,000=30.3 rpm 

### [Calculate the Peak Torque](#calculate-the-peak-torque)

Maximum torque within the duty cycle = 7.5 Nm < 39 Nm (Repeatable peak torque)

### [Check the Starting Torque](#check-the-starting-torque)

Starting Torque = 20 cNm (DYD-14)

### [Confirm the Part Number : DYD-14-099](#confirm-the-part-number--dyd-14-099)

### [Select the Type of Input Shaft](#select-the-type-of-input-shaft)

| Option |                   Type - C                    |               Type - D                |                  Type-SC                  |
|:------:|:---------------------------------------------:|:-------------------------------------:|:-----------------------------------------:|
| Shape  | ![](/assets/images/dyd/dyd_clamp_ring_01.png) | ![](/assets/images/dyd/dyd_d_cut.png) | ![](/assets/images/dyd/dyd_set_screw.png) |
|  Name  |                  Clamp-ring                   |                 D-Cut                 |                 Set-screw                 |

# [Glossary](#glossary)

## [Rated output torque](#rated-output-torque)

Rated torque indicates allowable continuous load torque at rated input speed.

## [Repeatable peak torque](#repeatable-peak-torque)

The repeatable peak torque indicates the permissible torque for instantaneous load in case of emergency stop or unexpected impact.

## [Maximum input speed](#maximum-input-speed)

The maximum input speed indicates the speed limit of the continuous operation.

## [Average input speed](#average-input-speed-1)

The average  input  speed  indicates the average input speed of the duty cycle.

## [Moment of inertia](#moment-of-inertia)

Effective moment of inertia is calculated by the inertia of each rotating component and the variation of parallel axis theorem based on the input shaft rotation.

## [Hysteresis loss / Backlash)](#hysteresis-loss--backlash)

As shown in Figure below, when the rated torque is gradually applied to the output shaft then removed while the input is firmly fixed, the differential torsional angle between the zero point and the output shaft is called the hysteresis loss which includes the clearance or mechanical margin between the gear mesh.

![](/assets/images/dyd/dyd_hysteresis_loss.png)

> Hysteresis loss

## [Lost motion](#lost-motion)

The lost motion indicates the torsional angle at +/- 3% of the rated output torque as shown in the figure above.

## [Torsional stiffness](#torsional-stiffness)

The torsional stiffness indicates the spring constants between 50% and 100% of the rated output torque, and can be calculated as follows: Torsional stiffness = b/a [Nm/arcmin].

## [Efficiency](#efficiency)

The efficiency of the reduction gears depends on the lost motion, input speed, load, lubricant temperature and size. The efficiency of each lineup is statistical value based on the test result. Please refer to the specification of each product.

![](/assets/images/dyd/dyd_14_efficiency.png)

> Efficiency characteristic for DYD-14

## [No-load Starting torque](#no-load-starting-torque)

The no-load starting torque indicates the quasi-static torque required to start rotation of the input shaft(dynamic friction) when no load is applied to the output flange. The value in specification is a statistical value based on the current production test results.

## [Back-Drive torque](#back-drive-torque)

As shown in the figure below, the back-drive torque indicates the amount of torque applied on the output flange just enough to start rotation of the input shaft under no load. 

![](/assets/images/dyd/dyd_back_drive_torque.png)

> Back-Drive torque

## [Lubrications](#lubrications)

Grease for lubrication of the gearhead is injected during assembly, and additional injection is not required.

# [Use Applications](#use-applications)

## [Collaborative Robots](#collaborative-robots)

![](/assets/images/dyd/dyd_application_01.png)

> DYD Application: Collaborative Robot

## [Mobile Platforms](#mobile-platforms)

![](/assets/images/dyd/dyd_application_02.png)

> DYD Application: Mobile Platform
