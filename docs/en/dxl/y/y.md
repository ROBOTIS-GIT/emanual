---
layout: archive
lang: en
ref: dxl_y
permalink: /docs/en/dxl/y/
sidebar:
  title: DYNAMIXEL-Y
  nav: "dynamixel_y"
---

![](/assets/images/dxl/y/y_series_product.png)

DYNAMIXEL-Y is ROBOTIS’ industrialized premium smart actuator solution for full scale robots

# [Product Lineup](#product-lineup)

![](/assets/images/dxl/y/model_numbering_en.png)

![](/assets/images/dxl/y/y_productline.png)

> DYNAMIXEL-Y Lineups

**Features**
- High Performance Frameless Motor
- Persistent Multi-turn Absolute Encoder
- Optional Integrated Electric Brake for Safety
- Optional Integrated DYNAMIXEL Drive (DYD)
- Compact & Simple Design Featuring Hollow Shaft for Cable Routing
- Dynamic Motor Controller

![](/assets/images/dxl/y/y_type.png)

![](/assets/images/dxl/y/y_exploded_view.png)

# [Key Specifications](#key-Specifications)

|     Model           |Dimensions [mm]|Weight [g]|Resolution [pulse/rev]|      Type      |
|:-------------------:|:-------------:|:--------:|:--------------------:|:--------------:|
| [YM070-210-M001-RH] | Ø70 x 50.9    | 340g     | 524,288              | Motor          |
| [YM070-210-R051-RH] | Ø70 x 71.1    | 790g     | 26,738,688           | Motor, Reducer |
| [YM070-210-R099-RH] | Ø70 x 71.1    | 790g     | 51,904,512           | Motor, Reducer |
| [YM080-230-M001-RH] | Ø80 x 54.1    | 530g     | 524,288              | Motor          |
| [YM080-230-R051-RH] | Ø80 x 78.1    | 1,200g   | 26,738,688           | Motor, Reducer |
| [YM080-230-R099-RH] | Ø80 x 78.1    | 1,200g   | 51,904,512           | Motor, Reducer |

# [Communication Circuit](#communication-circuit)

## [UART Connection Circuit Diagram](#uart-connection-circuit-diagram)

DYNAMIXEL-Y servomotors require half-duplex RS-484 serial communications for control. The following schematic is the recommended circuit diagram to convert full-duplex RS-484 to half-duplex for use with DYNAMIXEL servos.

![](/assets/images/dxl/y/uart_connection.PNG)

**Note**: The circuit above is suitable for MCUs with a 5v logic level. For controllers using other logic levels, a level shifter is required to match DYNAMIXEL's 5v logic level.
{: .notice}

The above communication circuit is integrated into ROBOTIS' DYNAMIXEL controllers. In the provided circuit diagram, the direction of data transmission is determined based on the signal level of TX_Enable_5V:
- If TX_Enable_5V is High: The TxD signal is sent out over the D+ and D- lines.
- If TX_Enable_5V is Low: The input signals from D+ and D- signals are received and output to the RxD line.

## [Cable Connection](#cable-connection)
The DYNAMIXEL-Y connector pinout and recommended connection layout are shown in the diagram below below.

### [YM070](#ym070)
![](/assets/images/dxl/y/70_connect_cable_1.png) 

![](/assets/images/dxl/y/70_connect_cable_2.png)

### [YM080](#ym080)
![](/assets/images/dxl/y/80_connect_cable_1.PNG)

![](/assets/images/dxl/y/80_connect_cable_2.PNG)

**WARNING**: When wiring please pay attention to pin assignments and polarity. Incorrectly connecting the cables of your DYNAMIXEL-Y may cause severe damage.
{: .notice--warning}

[YM070-210-M001-RH]: /docs/en/dxl/y/ym070-210-m001-rh/
[YM070-210-R051-RH]: /docs/en/dxl/y/ym070-210-r051-rh/
[YM070-210-R099-RH]: /docs/en/dxl/y/ym070-210-r099-rh/
[YM080-230-M001-RH]: /docs/en/dxl/y/ym080-230-m001-rh/
[YM080-230-R051-RH]: /docs/en/dxl/y/ym080-230-r051-rh/
[YM080-230-R099-RH]: /docs/en/dxl/y/ym080-230-r099-rh/
