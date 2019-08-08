---
layout: popup
---

# ROBOTIS Protocol Compatibility Table

- [Protocol 1.0]
- [Protocol 2.0]

Compatibility Key: O= Yes ; X= No ; * = User Action Required
{: .notice --info}

| Product              |        [Protocol 1.0]        |        [Protocol 2.0]         |
|:---------------------|:----------------------------:|:-----------------------------:|
| AX-12W               |              O               |               X               |
| AX-12A               |              O               |               X               |
| AX-18A               |              O               |               X               |
| MX-12W               |              O               |               X               |
| MX-28                |              O               |              O*               |
| MX-64                |              O               |              O*               |
| MX-106               |              O               |              O*               |
| XL-320               |              X               |               O               |
| XL430-W250           |   O* <br>(F/W address 13)    |               O               |
| 2XL430-W250          |   O* <br>(F/W address 13)    |               O               |
| XC430-W150           |   O* <br>(F/W address 13)    |               O               |
| XC430-W240           |   O* <br>(F/W address 13)    |               O               |
| XM430-W210           |   O* <br>(F/W address 13)    |               O               |
| XM430-W350           |   O* <br>(F/W address 13)    |               O               |
| XH430-W210           |   O* <br>(F/W address 13)    |               O               |
| XH430-W350           |   O* <br>(F/W address 13)    |               O               |
| XH430-V210           |   O* <br>(F/W address 13)    |               O               |
| XH430-V350           |   O* <br>(F/W address 13)    |               O               |
| XM540-W150           |   O* <br>(F/W address 13)    |               O               |
| XM540-W270           |   O* <br>(F/W address 13)    |               O               |
| XH540-W150           |   O* <br>(F/W address 13)    |               O               |
| XH540-W270           |   O* <br>(F/W address 13)    |               O               |
| XH540-V150           |   O* <br>(F/W address 13)    |               O               |
| XH540-V270           |   O* <br>(F/W address 13)    |               O               |
| M42-10-S260          |              X               |               O               |
| M54-40-S250          |              X               |               O               |
| M54-60-S250          |              X               |               O               |
| H42-20-S300          |              X               |               O               |
| H54-100-S500         |              X               |               O               |
| H54-200-S500         |              X               |               O               |
| H54P-200-S500-R      |              X               |               O               |
| H54P-100-S500-R      |              X               |               O               |
| H42P-020-S300-R      |              X               |               O               |
| M54P-060-S250-R      |              X               |               O               |
| M54P-040-S250-R      |              X               |               O               |
| M42P-010-S260-R      |              X               |               O               |
| RoboPlus 1.0 Suite   |              o               |   X* (XL-320 and PRO only)    |
| R+ Manager 2.0       |              O               |               O               |
| R+ Task 2.0          |              O               |               O               |
| R+ Motion 2.0        |              O               |               O               |
| R+ Design            |              O               |               O               |
| DYNAMIXEL Wizard 2.0 |              O               |               O               |
| ROBOTIS OP2          |              O               | O* <br>(Requires F/W Upgrade) |
| ROBOTIS OP3          |              X               |               O               |
| ROBOTIS STEM         |              O               |               X               |
| BIOLOID Premium      |              O               |               X               |
| TurtleBot3 Burger    |    O*<br>(F/W address 13)    |               O               |
| TurtleBot3 WafflePi  |    O*<br>(F/W address 13)    |               O               |
| RH-P12-RN            |              X               |               O               |
| Manipulator-H        |              X               |               O               |
| THORMANG3            |              X               |               O               |
| OpenManipulator-X    |    O*<br>(F/W address 13)    |               O               |
| CM-530               |              O               |               X               |
| CM-550               |              X               |               O               |
| CM-700               |              O               |               X               |
| OpenCM9.04           |  O*<br>(Library-dependent)   |   O*<br>(Library-dependent)   |
| OpenCM485 EXP        | O <br>(Controller-dependent) |  O<br>(Controller-dependent)  |
| OpenCR1.0            |  O*<br>(Library-dependent)   |   O*<br>(Library-dependent)   |




**NOTE** :
- X-series can switch [protocol 2.0] into [protocol 1.0] aside from [XL320](/docs/en/dxl/x/xl320/).
- Except MX-12W, MX-series can be upgraded to [protocol 2.0] by updating firmware to V39 or above.
{: .notice--info}

**WARNING** : MX(2.0) Firmware is different from MX series control table and address.
Please check the control table address before usage.
MX(2.0) Firmware inherits Dynamixel X’s function.
Therefore, it supports Protocol 1.0 and Protocol 2.0, and various Operating Modes, Secondary ID, Drive Mode, Bus Watchdog, etc.
Please refer to the control table for more details.
{: .notice--warning}


[Protocol 1.0]: /docs/en/dxl/protocol1/
[Protocol 2.0]: /docs/en/dxl/protocol2/
