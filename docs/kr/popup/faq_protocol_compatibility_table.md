---
layout: popup
---

# 로보티즈 프로토콜 호환표

- [프로토콜 1.0]
- [프로토콜 2.0]

**범례** O= 호환 ; X= 미호환 ; *= 특정 조건에서 사용가능.
{: .notice --info}

# AX-시리즈

| 모델  | 프로토콜 1.0 | 프로토콜 2.0 |
|:-------|:------------:|:------------:|
| AX-12W |      O       |      X       |
| AX-12A |      O       |      X       |
| AX-18A |      O       |      X       |

# MX-시리즈

| 모델  | 프로토콜 1.0 | 프로토콜 2.0 |
|:-------|:-------------|:------------:|
| MX-12W | O            |      X       |
| MX-28  | O            |      O*      |
| MX-64  | O            |      O*      |
| MX-106 | O            |      O*      |

{% capture notice_01 %}
**참조** : 
- MX-시리즈는 펌웨어 복구 통해 프로토콜 2.0을 사용할 수 있습니다. 복구 방법은 [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/#펌웨어-복구) 또는 [로보플러스 매니저 2.0](/docs/kr/software/rplus2/manager/#펌웨어-복구)의 펌웨어 복구를 참조하세요.
- MX-시리즈의 프로토콜 2.0은 펌웨어 버전(v39 이상)부터 지원됩니다. 업데이트 방법은 [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/#펌웨어-업데이트) 또는 [로보플러스 매니저 2.0](/docs/kr/software/rplus2/manager/#펌웨어-업데이트)의 펌웨어 업데이트를 참조하세요.
- 프로토콜 2.0으로 변경시, Secondary ID, Drive Mode, Bus Watchdog등의 기능을 사용할 수 있습니다.
{% endcapture %}
<div class="notice">{{ notice_01| markdownify }}</div>

# X-시리즈

| 모델       |      프로토콜 1.0       | 프로토콜 2.0 |
|:------------|:-----------------------:|:------------:|
| XL-320      |            X            |      O       |
| XL430-W250  | O* <br>(F/W address 13) |      O       |
| 2XL430-W250 | O* <br>(F/W address 13) |      O       |
| XC430-W150  | O* <br>(F/W address 13) |      O       |
| XC430-W240  | O* <br>(F/W address 13) |      O       |
| XM430-W210  | O* <br>(F/W address 13) |      O       |
| XM430-W350  | O* <br>(F/W address 13) |      O       |
| XH430-W210  | O* <br>(F/W address 13) |      O       |
| XH430-W350  | O* <br>(F/W address 13) |      O       |
| XH430-V210  | O* <br>(F/W address 13) |      O       |
| XH430-V350  | O* <br>(F/W address 13) |      O       |
| XM540-W150  | O* <br>(F/W address 13) |      O       |
| XM540-W270  | O* <br>(F/W address 13) |      O       |
| XH540-W150  | O* <br>(F/W address 13) |      O       |
| XH540-W270  | O* <br>(F/W address 13) |      O       |
| XH540-V150  | O* <br>(F/W address 13) |      O       |
| XH540-V270  | O* <br>(F/W address 13) |      O       |

{% capture notice_01 %}
**참조** : 
- 다이나믹셀 X는 Protocol Type(13)을 변경할 수 있습니다. 각 모델의 컨트롤 테이블 Protocol Type(13)을 참조하세요.
- **XL-320은 프로토콜 1.0으로 변경할 수 없습니다.**
{% endcapture %}
<div class="notice">{{ notice_01| markdownify }}</div>

# PRO-시리즈

| 모델         | 프로토콜 1.0 | 프로토콜 2.0 |
|:--------------|:------------:|:------------:|
| M42-10-S260   |      X       |      O       |
| M54-40-S250   |      X       |      O       |
| M54-60-S250   |      X       |      O       |
| H42-20-S300   |      X       |      O       |
| H54-100-S500  |      X       |      O       |
| H54-200-S500  |      X       |      O       |
| L54-50-S500-R |      X       |      O       |
| L54-50-S290-R |      X       |      O       |
| L54-30-S500-R |      X       |      O       |
| L54-30-S400-R |      X       |      O       |
| L42-10-S300-R |      X       |      O       |

# PRO+ 시리즈

| 모델           | 프로토콜 1.0 | 프로토콜 2.0 |
|:----------------|:------------:|:------------:|
| H54P-200-S500-R |      X       |      O       |
| H54P-100-S500-R |      X       |      O       |
| H42P-020-S300-R |      X       |      O       |
| M54P-060-S250-R |      X       |      O       |
| M54P-040-S250-R |      X       |      O       |
| M42P-010-S260-R |      X       |      O       |

# 기타 

| 모델                  |        프로토콜 1.0          |        프로토콜 2.0           |
|:---------------------|:----------------------------:|:-----------------------------:|
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


[프로토콜 1.0]: /docs/kr/dxl/protocol1/
[프로토콜 2.0]: /docs/kr/dxl/protocol2/
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[로보플러스 매니저 2.0]: 
