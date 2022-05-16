---
layout: archive
lang: kr
ref: robothand_mx28
read_time: true
share: true
author_profile: false
permalink: /docs/kr/platform/robothand_mx28/
sidebar:
  title: 로봇핸드(MX-28)
  nav: "robothand_mx28"
---

# [개요](#개요)

![img](/assets/images/platform/hand/3fingerhand_mx-28_01.jpg)
![img](/assets/images/platform/hand/3fingerhand_mx-28_02.jpg)

> 로봇핸드 (3 FINGER HAND PHN-33C_R/L)

**주의** : 로봇핸드(MX-28)는 현재 단종되어 더 이상 판매되지 않습니다.
{: .notice--warning}

# [주요 사양](#주요-사양)

|항목|사양|
|:---:|:---:|
|크기(손을 편 상태)| 167mm x 164mm x 98mm|
|무게 | 400g|
|자유도| 3 DOF ([MX-28] x 3)|
|Actuator의 최소 제어각 | 0.088&deg;|
|힘(손가락 끝)| 1.7kgf (16.7N)|
|동작 온도 | -5&deg;C ~ +85&deg;C|
|사용 전압 | 10  ~  14.8V (권장 전압 12.0V)|
|사용 전류| 0.45A ~ 5.1A (at 14.8V)|
|인터페이스| RS-485 Multi Drop BUS|

# [시작하기](#시작하기)

## [제품 구성](#제품-구성)

| 부품                                     | 설명                                     |
| :-------------------------------------: | --------------------------------------- |
| ![img](/assets/images/platform/hand/platform_hand.jpg) | Hand 본체 (1개)<br />오른손과 왼손 옵션에 따라 다릅니다.         |
| ![img](/assets/images/platform/hand/cm700.jpg) | [CM-700] 세트 (1개)<br />Hand와 연결되어 제어하는 장치입니다.<br />(구성품은 첨부되어 있는 문서를 참고하시기 바랍니다.) |
| ![img](/assets/images/platform/hand/ln101.jpg) | USB 다운로더 [LN-101] (1개)<br />PC와 CM-700을 연결하기 위한 장치입니다. |
| ![img](/assets/images/platform/hand/platform_hand_siliconefinger.jpg) | 실리콘 파트 세트 (1개)<br />여분으로 사용할 수 있는 실리콘 손가락 커버입니다. |
| ![img](/assets/images/platform/hand/cable-pwr01.jpg) | CABLE-PWR01 (1개)<br />SMPS(직류 전원 공급 장치)를 가지고 있는 경우 연결하여 사용할 커넥터입니다. |
| ![img](/assets/images/platform/hand/img_20121015_215310.jpg) | WB M2.5*6 (20개)<br />NUT M2.5 (20개)<br />다이나믹셀과 프레임을 체결할 수 있는 스크류세트입니다. |
| ![img](/assets/images/platform/hand/4pcable.jpg) | 4PCABLE-100 (2개)<br />4PCABLE-200 (1개)<br />Hand와 CM-700을 연결하거나 MX-28끼리 연결할 수 있는 케이블입니다. |

## [설치](#설치)

1. RoboPlus CD를 이용해서 PC에 RoboPlus를 설치합니다. (CD가 없는 경우는 [홈페이지 자료실]에서 받을 수 있습니다.)

   ![img](/assets/images/platform/hand/roboplus_install2.jpg)

2. Hand와 CM-700을 4P케이블을 이용해서 연결합니다.

   ![img](/assets/images/platform/hand/platform_hand_cm700connect.jpg)

3. LN-101을 이용해서 CM-700과 PC를 연결합니다. ([LN-101 드라이버 설치])

   ![img](/assets/images/platform/hand/cm700_ln101.png)

4. CM-700에 전원을 연결합니다.
   - SMPS를 이용하는 경우는 CABLE-PWR01을 이용합니다.
   - 직접 전원을 공급하는 경우는 권장 전압과 +/-방향을 주의하시기 바랍니다.

   ![img](/assets/images/platform/hand/platform_hand_power.jpg)

## [작동](#작동)

바로 실행할 수 있는 데모 프로그램을 제공하며 최초 구매시에는 설치되어 있습니다. ([데모 프로그램 설치 방법])  
PC와 연결하지 않고 바로 데모를 실행할 수 있습니다.

![img](/assets/images/platform/hand/platform_hand_rundemo.jpg)

아래 단계로 PC와 연결하여 제어할 수도 있습니다.

1. LN-101로 PC와 CM-700이 연결된 상태에서 [로보플러스 터미널]을 실행합니다.
2. 올바른 포트 번호를 이용해서 RoboPlus Terminal을 포트와 연결시킵니다.
3. CM-700의 전원을 켭니다.
4. RoboPlus Terminal에 메시지가 출력되면 정상입니다.
5. help를 입력하면 사용 가능한 명령어 목록이 나오며 해당 명령을 입력하면 작동합니다

# [로봇핸드 프로그래밍](#로봇핸드-프로그래밍)

개발자는 CM-700에 들어가는 Hand 제어 프로그램을 만들 수 있습니다.

## [개발환경 구축하기](#개발환경-구축하기)

CM-700에서 동작하는 프로그램을 만들기 위해서는 Atmega2561 개발 환경인 WinAVR과 Atmel Studio를 설치해야 합니다.

- [WinAVR 설치 방법](/docs/kr/software/embedded_sdk/embedded_c_cm510/#winavr-설치)
- [Atmel Studio 설치 방법](/docs/kr/software/embedded_sdk/embedded_c_cm510/#atmel-studio-설치)

## [개발에 필요한 정보](#개발에-필요한-정보)

개발에 필요한 정보를 얻을 수 있습니다.

- [프로그래밍의 기초](/docs/kr/software/embedded_sdk/embedded_c_cm510/#기본-프로그래밍)
- [프로그램(Hex파일) 설치 방법](/docs/kr/software/embedded_sdk/embedded_c_cm510/#프로그램-설치실행)
- [CM-700의 하드웨어 포트 정보](/docs/kr/software/embedded_sdk/embedded_c_cm510/#cm-700)

## [데모 프로그램 분석](#데모-프로그램-분석)

- `AVR STUDIO4 다운로드` [PHN_Development(v1.00).zip]
- `Atmel STUDIO6 다운로드` [PHN_Development(v1.01).zip]

[PHN_Development(v1.00).zip]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/platform/hand/phn_development(v1.00).zip
[PHN_Development(v1.01).zip]: https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/platform/hand/phn_development(v1.01).zip

### [소스 구조](#소스-구조)

#### 공용 소스(플랫폼에 상관 없이 Hand 어플리케이션 개발을 위해 사용할 수 있는 소스)

- **dynamixel.h**, **dynamixel.c** : [다이나믹셀과 통신하기 위한 프로토콜]이 구현되어 있는 소스
- **hand.h**, **hand.c** : Hand를 보다 쉽게 제어하기 위한 API함수

#### 플랫폼 의존 소스(하드웨어에 의존적인 소스이며 다른 플랫폼에서 동작시키려면 포팅이 필요합니다.)

- **dxl_hal.h**, **dxl_hal.c** : 실제로 다이나믹셀 패킷을 전송/수신하는 소스
- **serial.h**, **serial.c** : PC와 통신하기위한 소스

#### 데모 소스

- **demo.c** : 데모 프로그램이 구현되어 있는 소스

### dynamixel.h, dynamixel.c, dxl_hal.h, dxl_hal.c

이 소스에 대한 정보는 [다이나믹셀 SDK]에서 보다 자세히 확인할 수 있습니다.

### serial.h, serial.c

CM-700에서 UART1을 통해서 PC와 통신하기 위한 소스가 구현되어 있습니다.  
PC와 통신은 다음의 설정 값으로 고정되어 있습니다.

- 통신 속도: 57,600bps
- Data 8bit
- 1 Stop bit
- No parity
- No Flow/Hardware Control

표준 입출력 방식을 지원하여 \<stdio.h>관련 함수를 사용할 수 있습니다.  
각 함수의 사용법은 다음과 같습니다.

- **serial_initialize** : UART1를 초기화합니다. 통신 속도(bps)를 넘겨줍니다.
- **serial_write** : UART1을 통해서 데이터를 전송합니다. 전송할 데이터 배열의 포인터와 길이를 넘겨줍니다.
- **serial_read** : 내부 통신 버퍼에서 수신된 데이터를 꺼내옵니다. 저장할 배열의 포인터와 길이를 넘겨줍니다.
- **serial_get_qstate** : 통신 버퍼에 들어있는 수신된 데이터 크기를 알려줍니다.

### hand.h, hand.c

Dynamixel API를 이용해서 Hand를 보다 직관적으로 제어하기 위해 재구성한 API입니다.  
소스를 이해하기에 앞서서 다음을 먼저 알아야 합니다.

- FINGER FLAG: Hand의 각 손가락을 개별 제어하기 위해 flag를 각 함수에 전달합니다.
  - FINGER1은 엄지 손가락이고 값은 1입니다.
  - FINGER2은 집게 손가락이고 값은 2입니다.
  - FINGER3은 가운데 손가락이고 값은 4입니다.
  
- 손가락 선택별 Flag값은 다음과 같습니다.
  - FINGER1 only: 1
  - FINGER2 only: 2
  - FINGER1 + FINGER3: 1 + 4 = 5
  - FINGER2 + FINGER3: 2 + 4 = 6
  - 전체 선택: 1 + 2 + 4 = 7

- [컨트롤 테이블] : Hand에 사용된 Actuator 내부 기능을 정의한 테이블이며, 제어하기 위해 알고 있어야 합니다.

#### 각 함수의 사용법은 다음과 같습니다.

- **hand_unbend** : 손가락을 폅니다. FINGER FLAG와 [speed] 값을 넘겨줍니다.  
  동작이 완료될 때까지 Block됩니다. 동작 완료 여부는 다이나믹셀의 [Moving flag]를 통해 알 수 있습니다.
- **hand_bend** : 손가락을 구부립니다. FINGER FLAG와 [speed]값을 넘겨줍니다.  
  동작이 완료될 때까지 Block됩니다. 동작 완료 여부는 다이나믹셀의 [Moving flag]를 통해 알 수 있습니다.
- **hand_set_compliance** : 각 손가락의 Compliance 제어 특성중 [Slope] 값을 설정합니다.  
- **hand_set_torque_limit** : 각 손가락의 [토크 한계 값]을 설정합니다.
- **hand_torque_on**, **hand_torque_off** : 각 손가락의 [토크를 On/Off]시킵니다.

#### Hand의 설정을 값을 바꾸고 싶다면 Define된 값을 수정할 수 있습니다.

- **FINGER_ID** : 각 손가락에 사용된 다이나믹셀의 ID입니다. 공장 출하시 설정 값은 다음과 같습니다.
  - ID 1 : 엄지 손가락
  - ID 2 : 집게 손가락
  - ID 3 : 가운데 손가락
- **FINGER_UNBEND** : 손가락을 폈을때 [Actuator의 위치 값]입니다.
- **FINGER_BEND** : 손가락을 구부렸을때 [Actuator의 위치 값]입니다.
- **FINGER_DIRECTION** : 위치 값의 증가 방향이 UNBEND에서 BEND로 되는 것이 1이고, 그 반대가 -1입니다.

### Demo.c

Hand 데모 프로그램 예제가 구현되어 있습니다.  
프로그램의 동작 구조는 다음과 같습니다.

1. Hand를 초기화시킵니다.
   - serial/dynamixel 통신을 초기화합니다.
   - compliance와 torque limit값을 설정합니다.
2. Start버튼이 눌렸는지 확인하여 데모를 실행합니다. (PC연결 없이 데모 실행 기능 제공)
3. PC로부터 문자열 입력을 기다립니다.
4. 입력된 문자열로부터 명령어를 분리하여 각 기능을 실행하는 것을 반복합니다. (명령어와 파라미터는 공백 문자로 구분됩니다.)
   - help: 명령어 설명을 출력합니다. disp_help()
   - demo: 데모를 실행합니다. demo()
   - bend: 파라미터를 분리하여 hand_bend를 실행합니다.
   - unbend: 파라미터를 분리하여 hand_unbend를 실행합니다.
   - compliance: 파라미터를 분리하여 hand_compliance를 실행합니다.
   - limit: 파라미터를 분리하여 hand_torque_limit를 실행합니다.
   - torque: 파라미터를 분리하여 hand_torque_on 혹은 hand_torque_off를 실행합니다.
   - exit: 프로그램을 종료합니다.
   - 그 외의 명령어는 에러를 출력합니다.

이 프로그램은 일반적인 터미널 프로그램을 이용해서 텍스트기반으로 제어할 수 있습니다.  
만약, PC로 Hand를 제어할 경우에는 시리얼 통신 프로그래밍을 통해 해당 명령어를 텍스트로 전송하여 제어 시스템을 구축할 수도 있습니다.

# [유용한 정보](#유용한-정보)

## [Force Feedback](#force-feedback)

이 제품은 접촉면의 힘을 측정할 센서가 부착되어 있지 않아서 Force Feedback을 구현할 수 없습니다.  
하지만, 관절에 사용된 Actuator인 다이나믹셀은 [Load를 센싱할 수 있는 기능]이 있습니다. 이 기능은 많은 제약이 있지만, 아주 기초적으로 Force Feedback을 구현할 수 있습니다.  
다이나믹셀의 현재 하중 감지는 다음과 같은 특징이 있습니다.

- 센서로 측정한 것이 아니라 현재의 속도와 출력을 바탕으로 유추한 값입니다. 즉, 실제 토크와 일치하지 않습니다.
- 방향(CW/CCW)과 크기를 알 수 있습니다.
- 약 128msec 느린 업데이트 주기로 인해서 실시간 제어에 활용하기 어렵습니다.

필요에 따라 이 기능을 이용해서 Hand가 물체를 집었는지 안 집었는지를 판단하는 용도로 사용할 수 있습니다.  
만약, 접촉면의 힘을 꼭 측정하려면 센서를 부착할 수 있습니다. 구현은 사용자가 직접 해야하며 아래의 절차를 참고하시기 바랍니다.

1. 센서를 선정한다. FSR센서 같이 ADC로 입력 받을 수 있는 간단한 센서를 추천합니다.
2. CM-700에 연결하는 권장 회로도와 핀 정보는 아래와 같습니다.
    
    ![img](/assets/images/platform/hand/mcs_led_circuit.png)
    
    ![img](/assets/images/platform/hand/cm700_5p.jpg)

    (1) OUT : 5V  포트 제어용  
    (2) VCC (5V)  
    (3) ADC : 센서의 아날로그 신호 입력 있음.  
    (4) GND  
    (5) NC : 사용하지 않음  

3. Hand의 손가락에 집을 물건의 접촉이 잘 되도록 센서를 부착합니다.
4. CM-700의 [ADC 예제]를 참고하여 센서의 값을 이용해서 프로그래밍합니다. ([하드웨어 포트맵 참고])

## [로보플러스 사용하기](#로보플러스-사용하기)

비 전문가를 위한 개발 환경인 RoboPlus를 이용해서 Hand를 제어할 수 있습니다.

- `태스크 다운로드` [PHN_Demo_KR.tsk](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/platform/hand/phn_demo_kr.tsk)
- `모션 다운로드` [PHN_Demo_KR_33C.mtn](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/platform/hand/phn_demo_kr_33c.mtn)

- [로보플러스 사용준비(CM-700 펌웨어 복구)]
- [로보플러스 태스크 프로그래밍]
- [로보플러스 모션으로 Hand 모션 만들기]


# [다운로드](#다운로드)

## [도면](#도면)

- `다운로드` [3Finger Hand PHN-33B(pdf).zip](http://www.robotis.com/service/download.php?no=463)
- `다운로드` [3Finger Hand PHN-33B(stp).zip](http://www.robotis.com/service/download.php?no=464)
- ​`다운로드` [Platform_Hand_Bottom_Dimension.pdf](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/baggage_files/platform/hand/platform_hand_dimension_bottom.pdf)

[MX-28]: /docs/kr/dxl/mx/mx-28/
[CM-700]: /docs/kr/parts/controller/cm-700/
[LN-101]: /docs/kr/parts/interface/ln-101/
[데모 프로그램 설치 방법]: #로봇핸드-프로그래밍
[로보플러스 터미널]: /docs/kr/software/rplus1/terminal/
[다이나믹셀과 통신하기 위한 프로토콜]: /docs/kr/dxl/protocol1/
[다이나믹셀 SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[컨트롤 테이블]: /docs/kr/dxl/mx/mx-28/#control-table
[speed]: /docs/kr/dxl/mx/mx-28/#moving-speed-32
[Moving flag]: /docs/kr/dxl/mx/mx-28/#moving-46
[토크를 On/Off]: /docs/kr/dxl/mx/mx-28/#torque-enable-24
[Load를 센싱할 수 있는 기능]: /docs/kr/dxl/mx/mx-28/#present-load-40
[ADC 예제]: /docs/kr/software/embedded_sdk/embedded_c_cm510/#적외선-센서
[하드웨어 포트맵 참고]: /docs/kr/software/embedded_sdk/embedded_c_cm510/#cm-700
[로보플러스 사용준비(CM-700 펌웨어 복구)]: /docs/kr/software/rplus1/manager/#펌웨어-복구
[로보플러스 태스크 프로그래밍]: /docs/kr/software/rplus1/task/getting_started/
[로보플러스 모션으로 Hand 모션 만들기]: /docs/kr/software/rplus1/motion/
