---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/friends/
sidebar:
  title: OpenManipulator RM-X52-TNM
  nav: "openmanipulator"
---

<div style="counter-reset: h1 12"></div>

# [Friends](#friends)

  Friends List

  - [OpenManipulator SCARA](/docs/en/platform/openmanipulator/friends/#openmanipulator-scara)
  - [OpenManipulator Link](/docs/en/platform/openmanipulator/friends/#openmanipulator-link)
  - [OpenManipulator Planar](/docs/en/platform/openmanipulator/friends/#openmanipulator-planar)
  - [OpenManipulator Delta](/docs/en/platform/openmanipulator/friends/#openmanipulator-delta)
  - [OpenManipulator Stewart](/docs/en/platform/openmanipulator/friends/#openmanipulator-stewart)
  - [OpenManipulator Linear](/docs/en/platform/openmanipulator/friends/#openmanipulator-linear)

## [OpenManipulator SCARA](#openmanipulator-scara)

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Capture.png)

| Items               | Unit    |                                    |
|:--------------------|:--------|:-----------------------------------|
| **Actuator**        |         | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V       | 12                                 |
| **DOF**             | -       | 4 (3 DOF + 1 End-Effector)         |
| **Speed(Joint)**    | RPM     | 46                                 |
| **Reach**           | mm (in) | 276 (10.87)                        |
| **Communication**   | -       | TTL (Level Multidrop BUS)          |
| **Software**        | -       | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_spec_side.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                      |
|:------------------|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | PEN HOLDER             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | FRM BASE               | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | TAP HOLDER             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | FR12_H101_K            | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2768&GC=GD0B0001)                                            |
| .                 | FR12_S102_K            | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2766&GC=GD0B0001)                                            |
| .                 | HN12_I101              | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                            |
| **Actuators**     | Dynamixel XM430-W350-T | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                            |
| **Cables**        | CABLE_3P_130MM         | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2347&GC=GD0B0105&page=2)                                     |
| .                 | CABLE_3P_240MM         | 1|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                     |
| **Miscellaneous** | WB_M2X03               | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2%0900000070373%3A%3A3)      |
| .                 | WB_M2_5X4              | 14|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)    |
| .                 | WB_M2_5X06             | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A3%2C6) |
| .                 | WB_M2_5X12             | 2|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)     |
| .                 | FHS_M2_5X14            | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)         |
| .                 | NUT_M2_5(0.45P)        | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)                          |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1916070381) -->

#### 3D Printed Parts

- CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=691), [Thingiverse](https://www.thingiverse.com/thing:3069581))

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Scara` → `open_manipulator_scara` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Scara` → `Scara.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Processing.png)

### Video

 <iframe width="560" height="315" src="https://www.youtube.com/embed/4PK3I1JfSzc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Link](#openmanipulator-link)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Capture.png)

| Items                    | Unit    |                                    |
|:-------------------------|:--------|:-----------------------------------|
| **Actuator**             |         | Dynamixel XM430-W350-T             |
| **DOF**                  | -       | 3                                  |
| **Payload With Suction** | g (lb)  | 500 (1.10)                         |
| **Speed(Joint)**         | rad/sec | 4.82                               |
| **Weight**               | kg(lb)  | 0.55 (1.21)                        |
| **Reach**                | mm (in) | 350 (13.78)                        |
| **Communication**        | -       | TTL (Level Multidrop BUS)          |
| **Software**             | -       | Dynamixel SDK, Arduino, Processing |
| **Main Controller**      | -       | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                        | Quantity | Link                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:------------------|:---------------------------------|:---------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Plate**         | Base Plate-02                    | 1        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3331)                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Chassis Parts** | BASE LINK                        | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | ROTATION BASE                    | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | HOLDER A                         | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | HOLDER B                         | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 50                          | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 A                       | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 50 FOR 250                  | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 FOR 250                 | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 B                       | 4        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | TRIANGLE LINK                    | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | TOOL LINK                        | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **Actuators**     | Dynamixel XM430-W350-T           | 3        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                                                                                                                                                                                                                                                                                                                                        |
| **Cables**        | CABLE_3P_180MM                   | 2        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2755&GC=GD0B0105&page=2)                                                                                                                                                                                                                                                                                                                                                                                 |
| .                 | CABLE_3P_240MM                   | 1        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                                                                                                                                                                                                                                                                                                                                 |
| **Miscellaneous** | FHS_M2x3mm                       | 16       | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A3)                                                                                                                                                                                                                                                                                                                                                   |
| .                 | FHS_M2x6mm                       | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A6)                                                                                                                                                                                                                                                                                                                                                   |
| .                 | FHS_M2.5x5mm                     | 8        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A5)                                                                                                                                                                                                                                                                                                                                                 |
| .                 | FHS_M2.5x10mm                    | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A10)                                                                                                                                                                                                                                                                                                                                                |
| .                 | FHS_M3x10mm                      | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3a%3a2.5%0900000071552%3a%3a10&curSearch=%7b%22field%22%3a%22%40search%22%2c%22seriesCode%22%3a%22221000547315%22%2c%22innerCode%22%3a%22%22%2c%22sort%22%3a1%2c%22specSortFlag%22%3a0%2c%22allSpecFlag%22%3a0%2c%22page%22%3a1%2c%22pageSize%22%3a%2260%22%2c%2200000071822%22%3a%22nvd00000000000002%22%2c%2200000071552%22%3a%22mig00000001426443%22%7d&Tab=wysiwyg_area_0) |
| .                 | NUT_M2                           | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2)                                                                                                                                                                                                                                                                                                                                                                        |
| .                 | NUT_M2.5                         | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)                                                                                                                                                                                                                                                                                                                                                                      |
| .                 | PSCBRJ6-9                        | 18       | [Shop Link](https://us.misumi-ec.com/vona2/detail/110302637270/?HissuCode=PSCBRJ6-9&PNSearch=PSCBRJ6-9&KWSearch=PSCBRJ6-9&searchFlow=results2type)                                                                                                                                                                                                                                                                                                                             |
| .                 | MSRB6-1.0                        | 40       | [Shop Link](https://us.misumi-ec.com/vona2/detail/110100142970/?HissuCode=MSRB6-1.0&PNSearch=MSRB6-1.0&KWSearch=MSRB6-1.0&searchFlow=results2type)                                                                                                                                                                                                                                                                                                                             |
| .                 | NSFMR6-38                        | 1        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-38&PNSearch=NSFMR6-38&KWSearch=NSFMR6-38&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | NSFMR6-42                        | 1        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-42&PNSearch=NSFMR6-42&KWSearch=NSFMR6-42&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | NSFMR6-24                        | 6        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-24&PNSearch=NSFMR6-24&KWSearch=NSFMR6-24&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | Ball Bearing(O.D 10mm / I.D 6mm) | 20       | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000531116/?CategorySpec=unitType%3a%3a1%0900000044017%3a%3amig00000001446936%0900000043985%3a%3amig00000001455783&Inch=0)                                                                                                                                                                                                                                                                                                 |

<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1110711693) -->

#### 3D Printed Parts

CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=692), [Thingiverse](https://www.thingiverse.com/thing:3069557))

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Link` → `open_manipulator_link` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Link` → `Link.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Processing.png)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/WR9_1AheOok" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Planar](#openmanipulator-planar)

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                        | Quantity | Link                                                                                                                                                                        |
|:------------------|:---------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME                       | 1|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | laser_gripper                    | 1|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | link_100                         | 3|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | link_120                         | 3|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | HN12_I101                        | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                                              |
| **Actuators**     | Dynamixel XM430-W350-T           | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                                              |
| **Cables**        | CABLE_3P_240MM                   | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                                       |
| **Miscellaneous** | WB_M2_5X12                       | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)                                                      |
| .                 | FHS_M2_5X14                      | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)                                                           |
| .                 | NSFMR6-24                        | 6     | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-26&PNSearch=NSFMR6-26&KWSearch=NSFMR6-26&searchFlow=results2products)                         |
| .                 | Ball Bearing(O.D 10mm / I.D 6mm) | 24    | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000531116/?CategorySpec=unitType%3a%3a1%0900000044017%3a%3amig00000001446936%0900000043985%3a%3amig00000001455783&Inch=0) |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/03dca3ccd6175a054a517d7a/w/bd02756435abc4861fbe19d3/e/512dba920820826220bb1be1), [Thingiverse](https://www.thingiverse.com/thing:3064437))

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Planar` → `open_manipulator_planar` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Planar` → `Planar.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/UtFnywz4hdY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Delta](#openmanipulator-delta)

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                                                      |
|:------------------|:-----------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | Delta_centre           | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | Delta_gripper          | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | link                   | 3|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | HN12_I101              | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                            |
| **Actuators**     | Dynamixel XM430-W350-T | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                            |
| **Cables**        | CABLE_3P_240MM         | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                     |
| **Miscellaneous** | WB_M2_5X12             | 24|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101) |
| .                 | FHS_M2_5X14            | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)                                         |
| .                 | NSFMR6-24              | 6|[Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-26&PNSearch=NSFMR6-26&KWSearch=NSFMR6-26&searchFlow=results2products)             |
| .                 | Rod End Bearing(D 3mm) | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300371730/?HissuCode=PHSOM3&PNSearch=PHSOM3&KWSearch=phsom3&searchFlow=results2type)                         |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/cc6fdde79eccc8c21ff6048b/w/5275a0e3ad2bfd7d5bc573ac/e/485c206801d5b810c0c4297a), [Thingiverse](https://www.thingiverse.com/thing:3217182))

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Delta` → `open_manipulator_delta` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Delta` → `Delta.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/vFyphQwdV6I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Stewart](#openmanipulator-stewart)

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 6                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_side.png)
![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_bottom.png)
![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_top.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                                                        |
|:------------------|:-----------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | stewart_conv           | 6|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | st_link_new            | 6|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | PHSOM3                 | 12|[Shop Link](https://kr.misumi-ec.com/vona2/detail/110300371730/?HissuCode=PHSOM3&PNSearch=PHSOM3&KWSearch=phsom3&searchFlow=results2type)                           |
| .                 | SPJW6-100-M3-N3        | 6|[Shop Link](https://kr.misumi-ec.com/vona2/detail/110302636140/?HissuCode=SPJW6-100-M3-N3&PNSearch=SPJW6-100-M3-N3&KWSearch=SPJW6-100-M3-N3&searchFlow=results2type) |
| .                 | HN12_I101              | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                              |
| **Actuators**     | Dynamixel XM430-W350-T | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                              |
| **Cables**        | CABLE_3P_130MM         | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2347&GC=GD0B0105&page=2)                                                                       |
| **Miscellaneous** | WB_M3X08               | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/)                                                                                                    |
| .                 | NUT_M3                 | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/)                                                                                                    |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/7dd4f10904b98bdc250fd542/w/a3a3f0239f81db22c2393e00/e/83b69168ebe68946a7da5f22), [Thingiverse](https://www.thingiverse.com/thing:3272579))

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries. 

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Stewart` → `open_manipulator_stewart` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Stewart` → `Stewart.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/9YUWLAm24yA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Linear](#openmanipulator-linear)

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                              | Quantity | Link                                                                                                                           |
|:------------------|:---------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME                             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                              |
| .                 | linear_x_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_z_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_griper_bt                       | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_holder_mr                     | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | LINEAR_Y_HOLDER                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_guide_holder                  | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_pully_conv                      | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_pully_conv_dummy                | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | Aluminum Extrusion - 6 series, Base 30 | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/110302686450/?HissuCode=HFSLB6-3030-%5b50-1800%2f0.5%5d&searchFlow=results2similartn) |
| **Actuators**     | Dynamixel XM430-W350-T                 | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                 |
| **Cables**        | CABLE_3P_240MM                         | 1|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                          |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/056051479aa43c1d3575467b/w/e4a798df49f872fa4589217b/e/85be5fe21aa7c9c76732a701), [Thingiverse](https://www.thingiverse.com/thing:3255864))

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries. 

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Linear` → `open_manipulator_linear` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Linear` → `Linear.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/3FumPqbOs5k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
