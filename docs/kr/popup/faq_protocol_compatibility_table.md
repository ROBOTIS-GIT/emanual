---
layout: popup
---

# 로보티즈 프로토콜 호환표

- [프로토콜 1.0]
- [프로토콜 2.0]

**범례** O= 호환 ; X= 미호환 ; * = 호환가능
{: .notice --info}

| 제품                  |        [프로토콜 1.0]          |        [프로토콜 2.0]           |
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


**참고** :
- [XL-320](/docs/kr/dxl/x/xl320/)을 제외한 X 시리즈는 [프로토콜 2.0]을 기본으로 사용하지만 [프로토콜 1.0]을 별도로 설정해서 사용할 수 있습니다.
- MX-12W를 제외한 MX 시리즈는 MX(2.0) 펌웨어 V39 이상으로 업데이트하면 [프로토콜 2.0]을 기본으로 사용하고 [프로토콜 1.0]을 별도로 설정해서 사용할 수 있습니다.
{: .notice--info}

**경고** : MX(2.0) 펌웨어는 MX 펌웨어의 컨트롤 테이블과 다른 구조와 주소체계를 가지고 있습니다. 펌웨어를 업데이트하기 이전에 컨트롤 테이블을 확인하세요.
MX(2.0) 펌웨어는 다이나믹셀 X 시리즈의 컨트롤 테이블을 바탕으로 제작되었습니다.  
따라서 프로토콜 1.0과 2.0을 모두 지원하며, Secondary ID, Drive Mode, Bus Watchdog 등 다양한 기능을 지원합니다.  
더 자세한 정보는 각 제품의 컨트롤 테이블을 참조하세요.  
{: .notice--warning}


[프로토콜 1.0]: /docs/kr/dxl/protocol1/
[프로토콜 2.0]: /docs/kr/dxl/protocol2/
