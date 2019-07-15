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

# 다이나믹셀을 지원하는 통신속도

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


# 호환표

## 다이나믹셀

|       모델       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|    AX Series     |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    DX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    RX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    EX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|  MX Series(TTL)  |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
| MX Series(RS485) |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|      XL-320      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    O     |             O(X)             |      X      |    X     |
|    2XL Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XL Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XM Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XH Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    PRO Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    X     |             X(O)             |      X      |    O     |


## 부품

|              모델              | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|      Bioloid Serial Cable      |   O    |    X    |    X     |    X     |    X     |    O     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|            Mini USB            |   X    |    X    |    X     |    X     |    X     |    X     |    O     |    X     |    X     |    X     |              X               |      X      |    X     |
|          Micro USB(B)          |   X    |    X    |    X     |    O     |    X     |    X     |    X     |    O     |    X     |    O     |              O               |      O      |    O     |
|             LN-101             |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    O     |    O     |    O     |              O               |      O      |    O     |
|            IRSS-10             |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|       TS-10 (터치 센서)        |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|    DMS-80 (거리 측정 센서)     |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
| IR 어레이 (적외선 어레이 센서) |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|      GS-12 (자이로 센서)       |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |              O               |      O      |    O     |
|       CS-10 (컬러 센서)        |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|      MGSS-10 (자석 센서)       |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|     PIR-10 (동작감지 센서)     |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|       TPS-10 (온도 센서)       |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|      TMS-10 (온습도 센서)      |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    X     |    X     |    O     |              O               |      O      |    O     |
|       AX-S1 (통합 센서)        |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|        SM-10 (서보모터)        |   X    |    X    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|       GM-10A (감속모터)        |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|         고속 감속모터          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|         저속 감속모터          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|        LM-10 (LED 모듈)        |   X    |    O    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|           IR 수신기            |   X    |    X    |    O     |    O     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|            ZIG-100             |   O    |    O    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|            ZIG-110A            |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|            BT-110A             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|             BT-210             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|             BT-410             |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|  LB-04 Series (리튬이온전지)   |   X    |    X    |    X     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |              X               |      O      |    X     |
|  11.1V LiPo (리튬폴리머전지)   |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |              O               |      X      |    O     |
|           9.6V NiMH            |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|            OBB-10A             |   X    |    X    |    O     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|            ABB-030             |   X    |    X    |    X     |    X     |    O     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|             LFU-10             |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |              O               |      X      |    O     |
|              FU-5              |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|          사용자 장치           |   X    |    O    |    X     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |

`1` OpenCM9.04의 IR 수신기는 R+Task에서 지원하지 않습니다.

## 소프트웨어


### 로보플러스 1.0

|         모델          | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:---------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| 로보플러스 태스크 1.0 |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| 로보플러스 매니저 1.0 |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| 로보플러스 모션  1.0  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

### 로보플러스 2.0

|         모델          | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:---------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| 로보플러스 태스크 2.0 |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| 로보플러스 매니저 2.0 |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
|  로보플러스 모션 2.0  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

### 기타 소프트웨어

|         모델          | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:---------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| 로보플러스 태스크 3.0 |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      O      |    X     |
|      OpenCM IDE       |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    X     |
|     아두이노 IDE      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      O      |    O     |
|      스크래치2.0      |   X    |    X    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      O      |    X     |




[ln-101]: /docs/kr/parts/interface/ln-101/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-50]: /docs/kr/parts/controller/cm-100/
[CM-100]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[CM-900]: /docs/kr/parts/controller/cm-900/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[485 EXP]: /docs/kr/parts/controller/exp485/
[OpenCR]: /docs/en/parts/controller/opencr10/
