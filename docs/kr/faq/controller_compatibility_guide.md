---
layout: archive
lang: kr
ref: controller_compatibility
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/controller/controller_compatibility/
sidebar:
  title: 제어기 호환표
  nav: "controller_compatibility"
---

# [다이나믹셀을 지원하는 통신속도](#다이나믹셀을-지원하는-통신속도)

| 통신속도(bps) | [CM-5] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04] | [OpenCR] |
|:-------------:|:------:|:--------:|:--------:|:--------:|:--------:|:--------:|:------------:|:--------:|
|     9600      |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|     57600     |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|    115200     |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|      1M       |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|      2M       |   X    |    X     |    X     |    O     |    X     |    X     |      X       |    O     |
|      3M       |   X    |    X     |    X     |    O     |    X     |    X     |      X       |    O     |
|      4M       |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    O     |
|     4.5M      |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    O     |


# [호환표](#호환표)

## [다이나믹셀 호환표](#다이나믹셀-호환표)

|       모델       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
|    AX Series     |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
|    DX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
|    RX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
|    EX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
|  MX Series(TTL)  |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
| MX Series(RS485) |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |                   X(O)                   |      X       |    O     |
|      XL-320      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    O     |                   O(X)                   |      X       |    X     |
|    XL Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |                   X(O)                   |      X       |    O     |
|    XC Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |                   X(O)                   |      X       |    O     |
|    XM Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |                   X(O)                   |      X       |    O     |
|    XH Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |                   X(O)                   |      X       |    O     |
|    PRO Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                   X(O)                   |      X       |    O     |

**참고**: OpenCM9.04을 OpenCM 485 확장보드와 함께 사용하면, 모든 다이나믹셀을 제어할수 있습니다.
{: .notice}

## [부품 호환표](#부품-호환표)

|              모델              | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
|      Bioloid Serial Cable      |   O    |    X    |    X     |    X     |    X     |    O     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|            Mini USB            |   X    |    X    |    X     |    X     |    X     |    X     |    O     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|          Micro USB(B)          |   X    |    X    |    X     |    O     |    X     |    X     |    X     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|             LN-101             |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|     IRSS-10 (적외선 센서)      |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|       TS-10 (터치 센서)        |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|    DMS-80 (거리 측정 센서)     |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
| IR 어레이 (적외선 어레이 센서) |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |                    O                     |      X       |    O     |
|      GS-12 (자이로 센서)       |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |                    O                     |      O       |    O     |
|       CS-10 (컬러 센서)        |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|      MGSS-10 (자석 센서)       |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|     PIR-10 (동작감지 센서)     |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|       TPS-10 (온도 센서)       |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|      TMS-10 (온습도 센서)      |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    X     |    X     |    O     |                    O                     |      O       |    O     |
|       AX-S1 (통합 센서)        |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |                    O                     |      X       |    O     |
|        SM-10 (서보모터)        |   X    |    X    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|       GM-10A (감속모터)        |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |                    O                     |      O       |    O     |
|         고속 감속모터          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |                    O                     |      O       |    O     |
|         저속 감속모터          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |                    O                     |      O       |    O     |
|        LM-10 (LED 모듈)        |   X    |    O    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |                    O                     |      O       |    O     |
|           IR 수신기            |   X    |    X    |    O     |    O     |    X     |    O     |    O     |    X     |    O     |    X     |                    O                     |      X       |    O     |
|            ZIG-100             |   O    |    O    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|            ZIG-110A            |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|            BT-110A             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|             BT-210             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|             BT-410             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |
|  LB-04 Series (리튬이온전지)   |   X    |    X    |    X     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |                    X                     |      O       |    X     |
|  11.1V LiPo (리튬폴리머전지)   |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |                    O                     |      X       |    O     |
|           9.6V NiMH            |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|            OBB-10A             |   X    |    X    |    O     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|            ABB-030             |   X    |    X    |    X     |    X     |    O     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|             LFU-10             |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |                    O                     |      X       |    O     |
|              FU-5              |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|          사용자 장치           |   X    |    O    |    X     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |                    O                     |      O       |    O     |

`1` OpenCM9.04의 IR 수신기는 R+Task에서 지원하지 않습니다.

## [소프트웨어 호환표](#소프트웨어-호환표)

### [로보플러스 1.0](#로보플러스-10)

|          모델           | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:-----------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
| [로보플러스 태스크 1.0] |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |
| [로보플러스 매니저 1.0] |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |
| [로보플러스 모션  1.0]  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |

  {% capture notice_01 %}
  **참고:** 
  - 로보플러스 매니저 1.0은 펌웨어 복구만 가능하고, 제어기의 컨트롤 테이블 확인은 불가능 합니다.
  - R+ Manager 2.0은 펌웨어 복구 및 제어기의 컨트롤 테이블을 확인할 수 있습니다.
    - 호환하지 않는 제어기는 로보플러스 매니저 1.0을 사용하세요.
  {% endcapture %}
  <div class="notice">{{ notice_01 | markdownify}}</div>

### [로보플러스 2.0](#로보플러스-20)

|       모델       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
|  [R+ Task 2.0]   |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |
| [R+ Manager 2.0] |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |
| [R+ Motion 2.0]  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |

### [로보플러스 3.0](#로보플러스-30)

|     모델      | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:-------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
| [R+ Task 3.0] |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    X     |                   O(X)                   |      O       |    X     |


### [로보플러스 모바일](#로보플러스-모바일)

|       모델       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
|   [R+ m.Task]    |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      O       |    X     |
| [R+ m.Task 2.0]  |   O    |    O    |    X     |    O     |    O     |    O     |    O     |    X     |    X     |    X     |                   O(X)                   |      O       |    X     |
| [R+ m.Mtion 2.0] |   O    |    X    |    X     |    X     |    O     |    O     |    O     |    X     |    O     |    X     |                   O(X)                   |      X       |    X     |
|  [R+ m.Design]   |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    X     |    X     |                   O(X)                   |      X       |    X     |

### [로보플러스 모바일 (교육키트)](#로보플러스-모바일-교육키트)

|                   모델                   | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:----------------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
| [로보플러스 SMART] <br> ( I / II / III ) |   X    |    X    |    X     |    X     |    O     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|            [로보플러스 블록]             |   X    |    O    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      O       |    X     |
|                 [R+ IoT]                 |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      O       |    X     |
|             [로보티즈 미니]              |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                   O(X)                   |      X       |    X     |
|           로보플러스 Play 700            |   X    |    O    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |

  **참고**: 로보플러스 Play 700은 글로벌 전용제품 소프트웨어 입니다. 
  {: .notice} 

### [기타 소프트웨어](#기타-소프트웨어)

|              모델              | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 확장보드]) | [OpenCM 7.0] | [OpenCR] |
|:------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------------------:|:------------:|:--------:|
|     [로보플러스 스크래치]      |   X    |    O    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      O       |    X     |
|          [OpenCM IDE]          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    O                     |      X       |    X     |
|        [다이나믹셀 SDK]        |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    O                     |      X       |    O     |
|     [다이나믹셀 워크벤치]      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    O                     |      X       |    O     |
|      [다이나믹셀 위자드]       |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
|    [다이나믹셀 위자드 2.0]     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    X     |
| [ROBOTIS Manipulator library]  |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    X                     |      X       |    O     |
| [임베디드 SDK(CM-510/530/700)] |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |                    X                     |      X       |    X     |
|          아두이노 IDE          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                    O                     |      X       |    O     |

  {% capture etc %}
  **참고**:
  - ROBOTIS Manipulator library는 사용자가 매니퓰레이터를 직접 제작할수 있도록 제공하는 API(Application Programming Interface)입니다. 
  - 임베디드 SDK는 사용자가 직접 제어기 펌웨어를 개발할 수 있는 솔루션입니다.
  {% endcapture %}
  <div class="notice--info">{{ etc | markdownify }}</div>

[ln-101]: /docs/kr/parts/interface/ln-101/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-50]: /docs/kr/parts/controller/cm-50/
[CM-100]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[CM-900]: /docs/kr/parts/controller/cm-900/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[OpenCM 7.0]: /docs/kr/parts/controller/opencm7/
[OpenCM 485 확장보드]: /docs/kr/parts/controller/opencm485exp/
[OpenCR]: /docs/en/parts/controller/opencr10/
[로보플러스 태스크 1.0]: /docs/kr/software/rplus1/task/getting_started/
[로보플러스 매니저 1.0]: /docs/kr/software/rplus1/manager/
[로보플러스 모션  1.0]: /docs/kr/software/rplus1/motion/
[R+ Task 2.0]: /docs/kr/software/rplus2/task/
[R+ Manager 2.0]: /docs/kr/software/rplus2/manager/
[R+ Motion 2.0]: /docs/kr/software/rplus2/motion/
[R+ Task 3.0]: /docs/kr/software/rplustask3/
[R+ IoT]: /docs/kr/software/mobile_app/rplusiot/
[로보플러스 블록]: /docs/kr/software/rplus2/rplus2_block/
[R+ m.Task]: /docs/kr/software/rplus_mobile/mtask/
[R+ m.Task 2.0]: /docs/kr/software/rplus_mobile/mtask20/
[R+ m.Mtion 2.0]: /docs/kr/software/rplus_mobile/mmotion/
[R+ m.Design]: /docs/kr/software/rplus_mobile/mdesign/
[로보플러스 SMART]: /docs/kr/software/mobile_app/rplussmart/
[로보티즈 미니]: /docs/kr/software/mobile_app/mini_app/
[로보플러스 스크래치]: /docs/kr/software/rplus2/scratch/
[OpenCM IDE]: /docs/kr/software/opencm_ide/getting_started/              
[다이나믹셀 SDK]: /docs/kr/software/dynamixel/dynamixel_sdk/overview/
[다이나믹셀 워크벤치]: /docs/kr/software/dynamixel/dynamixel_workbench/
[다이나믹셀 위자드]: /docs/kr/software/rplus1/dynamixel_wizard/
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[임베디드 SDK(CM-510/530/700)]: /docs/kr/software/embedded_sdk/
[ROBOTIS Manipulator library]: /docs/kr/software/robotis_manipulator_libs/

[XL-320]: /docs/kr/dxl/x/xl320/
