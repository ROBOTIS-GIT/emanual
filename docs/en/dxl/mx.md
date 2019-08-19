---
layout: archive
lang: en
ref: mx-series
permalink: /docs/en/dxl/mx/
sidebar:
  title: DYNAMIXEL MX Series
  nav: "dxl_mx_main"
---


# [Features](#features)


|                   MX-106T/R                   |                 MX-64T/R/AT/AR                 |                 MX-28T/R/AT/AR                 |                    MX-12W                    |
|:----------------------------------------------:|:----------------------------------------------:|:----------------------------------------------:|:--------------------------------------------:|
| ![](/assets/images/dxl/mx/mx-106t_product.jpg) | ![](/assets/images/dxl/mx/mx-64ar_product.png) | ![](/assets/images/dxl/mx/mx-28ar_product.jpg) | ![](/assets/images/dxl/mx/mx-12_product.jpg) |

- Advanced durability, degree of precision, and wider control zone were achieved thanks to the newly applied CONTACTLESS ABSOLUTE ENCODER.

- 360 degrees POSITION CONTROL without dead zone.

- 4,096 PRECISE RESOLUTION by 0.088 degrees.

- SPEED CONTROL at ENDLESS TURN MODE.

- Reliability and accuracy were advanced in the position control through PID CONTROL.

- High baud rate up to 4.5Mbps.

- (MX-64 / MX-106) Torque control via current sensing.

- (MX-106) Supports dual mode for master/slave method.

# [MX Series](#mx-series)

**Common Specifications**  
- MCU : ARM CORTEX-M3 (72 \[MHz], 32Bit)  
- Resolution : 4096 \[pulse/rev]  
- Motor :
  - MX-28/64/106 : Coreless(Maxon)
  - MX-12: Cored
  
| Protocol 1.0     | Protocol 2.0          | Stall Torque                                                                                           | No Load Speed                                                                        |
|:-----------------|:----------------------|:-------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------|
| [MX-106T/R]      | [MX-106T/R(2.0)]      | 8.0 [N.m] (at 11.1 [V], 4.8 [A])<br>8.4 [N.m] (at 12[V], 5.2 [A])<br>10.0 [N.m] (at 14.8 [V], 6.3 [A]) | 41 [rev/min] (at 11.1 [V])<br>45 [rev/min] (at 12 [V])<br>55 [rev/min] (at 14.8 [V]) |
| [MX-64T/R/AT/AR] | [MX-64T/R/AT/AR(2.0)] | 5.5 [N.m] (at 11.1 [V], 3.9 [A])<br>6.0 [N.m] (at 12 [V], 4.1 [A])<br>7.3 [N.m] (at 14.8 [V], 5.2 [A]) | 58 [rev/min] (at 11.1 [V])<br>63 [rev/min] (at 12 [V])<br>78 [rev/min] (at 14.8 [V]) |
| [MX-28T/R/AT/AR] | [MX-28T/R/AT/AR(2.0)] | 2.3 [N.m] (at 11.1 [V], 1.3 [A])<br>2.5 [N.m] (at 12 [V], 1.4 [A])<br>3.1 [N.m] (at 14.8 [V], 1.7 [A]) | 50 [rev/min] (at 11.1 [V])<br>55 [rev/min] (at 12 [V])<br>67 [rev/min] (at 14.8 [V]) |
| [MX-12W]         | -                     | -                                                                                                      | 470 [rev/min] (at 12 [V])                                                            |


[MX-12W]: /docs/en/dxl/mx/mx-12w/        
[MX-28T/R/AT/AR]: /docs/en/dxl/mx/mx-28-2/
[MX-64T/R/AT/AR]: /docs/en/dxl/mx/mx-64/
[MX-106T/R]: /docs/en/dxl/mx/mx-106/
[MX-28T/R/AT/AR(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64T/R/AT/AR(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106T/R(2.0)]: /docs/en/dxl/mx/mx-106-2/
