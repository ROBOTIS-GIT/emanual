---
layout: archive
lang: kr
ref: kit2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/engineer/kit2_introduction/
sidebar:
  title: 엔지니어 키트 2
  nav: "kit2"
product_group: kit2
page_number: 1
---

# [개요](#개요)

![](/assets/images/edu/engineer/kit2/kit2_main.png)

**STEAMCUP ENGINEER** 는 스마트 기기를 활용한 AI 기술이 적용된 새로운 개념의 차세대 로봇입니다.  
- 다양한 움직임을 구현하는 관절형 구조
- 단계별 로봇교육과정 및 표준 커리큘럼 제공
- 3D프린팅 지원
- 로보플러스 엔지니어, R+ Task 3.0 등 다용도 소프트웨어 사용가능
- 라즈베리 파이와 카메라 확장가능.
- 3개의 기본 예제(`MAX-E2`, `Commando`, `Scorpi`)와 추가 예제 및 [추가 교육자료](#/docs/kr/edu/engineer/kit2_advanced_course/#교육자료-다운로드) 제공.

**주의** 엔지니어 키트2 는 엔지니어 키트 1의 확장 버전입니다. 키트 2를 사용하기 위해서는, 엔지니어 키트 1에 포함된 부품들이 필요합니다.
{: .notice--warning}

## [부품 목록](#부품-목록)

![](/assets/images/edu/engineer/kit2/kit2_parts_list.png)

### [CM-550 제어기](#cm-550-제어기)

#### [제품 사양](#제품-사양)

|     항목      |                                                                                              사양                                                                                               |
|:-------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|     무게      |                                                                                            58.8 [g]                                                                                             |
|      MCU      |                                                                               ARM Cortex-M4 (168 [MHz], 32 [Bit])                                                                               |
|   동작 전압   | 충전지 : 허용범위 6.5 ~ 15 [V], **권장 전압 11.1 [V] (Li-PO 3cell)**<br />SMPS : 허용범위 6.5 ~ 15 [V], **권장 전압 12.0 [V]**<br />Micro USB : 허용범위 4.75 ~ 5.25 [V], **권장 전압 5.0 [V]** |
|  소모 전류량  |                               대기시 : 50 [mA]<br />포트 1 ~ 2 I/O 최대전류 : 0.5 [A]<br />포트 3 ~ 5 I/O 최대전류 : 0.02 [A]<br />전체 최대 전류 : 10 [A] (Fuse)                               |
|   동작 온도   |                                                                                        -5 ~ 70 [&deg;C]                                                                                         |
|   통신 모듈   |                                                                                       BLE Slave 모듈 내장                                                                                       |
| 내부 I/O 장치 |                       버튼 : 2 (MODE, START)<br />마이크 (소리 감지) : 1<br />부저 : 1<br />전압 센서 : 1<br />자이로 가속도 센서 : 1<br />온도 센서 : 1<br />RGB LED : 3                       |
| 외부 I/O 장치 |                                             로보티즈 5핀 포트 : 5 (서보모터/IR센서/온습도센서 : 1, 2번 포트 사용)<br />X 시리즈 다이나믹셀 포트 : 6                                             |

#### [CM-550 각 부 명칭](#cm-550-각-부-명칭)  

![](/assets/images/edu/engineer/kit1/cm550_1.png)

![](/assets/images/edu/engineer/kit1/cm550_2_kr.png)

- `USB` 마이크로 USB 포트 : 마이크로 USB 케이블로 CM-550를 PC의 USB 포트와 연결할 수 있습니다.
- `UART` 외부통신 포트 : BT-210, BT-410, LN-101, 적외선 수신기 등의 무선 통신용 모듈이나 외부 장치와의 통신용으로 사용되는 포트입니다.
- `BAT` 배터리 소켓 : 배터리를 연결하는 소켓입니다.
- `12VDC` 전원잭 : 전원 공급기(SMPS)의 전원잭을 연결하는 소켓입니다.
- `POWER` 전원 스위치 : 제어기의 전원을 켜거나 끌 때 사용하는 스위치입니다.
- `상태 LED` : 전원과 무선기기의 상태에 따라 다양한 색상과 표현으로 알려주는 RGB LED입니다.
- `MODE` MODE LED : CM-550의 동작 모드를 표시하는 RGB LED입니다. CM-550의 [동작 모드] 설명을 참고하세요.
- `START` START LED : CM-550의 [동작 모드] 설명을 참고하세요.
- `MODE` MODE 버튼 : 제어기의 동작 모드를 변경하기 위한 버튼입니다. CM-550의 [동작 모드] 설명을 참고하세요.
- `START` START 버튼 : 현재 선택된 모드를 실행하기 위한 버튼입니다. CM-550의 [동작 모드] 설명을 참고하세요.
- `DXL` 다이나믹셀 X 시리즈 포트 : 다이나믹셀 X 시리즈를 연결하기 위한 포트입니다.
- `PORT` 로보티즈 5핀 포트 : DMS-80, 접촉 센서, 적외선 센서 등의 주변장치를 연결하기 위한 5개의 포트입니다.  
  그 중 서보모터, 적외선센서, 온습도센서는 1, 2번 포트에만 연결할 수 있습니다. 각 포트마다 번호가 표시되어 있습니다.
- `MIC` 내장 마이크 : 박수 소리를 감지할 수 있는 마이크가 기본으로 내장되어 있습니다.
- `FUSE` 퓨즈 : 10A 퓨즈가 내장되어 있습니다.

**주의** : CM-550 제어기의 USB 포트는 PC와의 통신용이므로 스마트 기기나 다른 장치와 연결하지 마세요. 제어기 고장의 원인이 될 수 있습니다.  
{: .notice--warning}

**[CM-550 매뉴얼 바로가기]{: .blank}**
{: .notice}

### [Raspberry Pi](#raspberry-pi)
Raspberry Pi는 영국의 라즈베리 파이 재단이 교육 목적으로 개발한 리눅스 운영체제 기반의 싱글보드 컴퓨터입니다.  

#### [Raspberry Pi Zero W](#raspberry-pi-zero-w)
키트2에서 사용되는 Raspberry Pi Zero는 기존 라즈베리파이의 기능을 유지하면서 크기와 간격을 줄인 초소형 컴퓨터입니다.

![](/assets/images/edu/engineer/kit2/raspberry_pi_zero_port.png)
> 포트 및 기능

- `40 Pin GPIO Port`: 입출력을 담당하는 GPIO(General Purpose Input/Output) 헤더핀입니다. 센서등 외부장치와 통신 및 제어시 사용합니다.
- `Broadcom BCM2835`: 라즈베리 파이에서 사용되는 프로세서입니다. 
- `CSI Camera Connector`: 라즈베리파이 카메라 모듈을 연결할수있는 커넥터입니다.
- `Micro USB 5V Power Input`: 5 V 전원공급 포트입니다.
- `Micro USB Data Port`: USB 허브와 연결하여, 주변장치 (마우스,키보드등)을 사용할수 있는 포트입니다.
- `Mini-HDMI 1080P Video & Audio Output`: 모니터 및 오디오 출력을 위한 Mini HDMI 커넥터 입니다.
- `MicroSD Card`: 제공된 이미지 파일 설치 시, 사용하는 마이크로 카드 슬롯입니다.

#### [Raspberry Pi 카메라](#raspberry-pi-카메라)
라즈베리파이 카메라는 라즈베리파이와 연결하여 얼굴 및 색상 인식, 라인 감지, 영상 스트리밍 등의 다양한 기능을 수행할 수 있습니다.  

![](/assets/images/edu/engineer/kit2/raspberry_pi_cam_01.png)
> 라즈베리 파이 카메라 모듈

![](/assets/images/edu/engineer/kit2/raspberry_pi_cam_02.png)
> 라즈베리파이와 카메라모듈 연결모습

#### [CM-550에 장착하기](#CM-550-장착하기)
다음과 같은 모습으로, 제어기(CM-550)에 장착 시켜주세요.

![](/assets/images/edu/engineer/kit2/raspberry_pi_zero_connection.png)

**참고**: 부팅시 60초가 소요됩니다. 부팅이 되면 소리가 나면서 LED가 노랑색으로 변경됩니다.
{: .notice--info}

### [다이나믹셀 ](#다이나믹셀-)

#### [XL430-W250-T](#xl430-w250-t)
XL430-W250-T는 로봇의 기본관절로 사용되는 액츄에이터입니다.

![](/assets/images/dxl/x/xl430_product_new.png)

**[XL430-W250-T 매뉴얼 바로가기]{: .blank}**
{: .notice}

#### [2XL430-W250-T](#2xl430-w250-t)
2XL430-W250-T는 기존 하나의 축만 가지고있는 액츄에이터와 달리, 2축 제어가 가능한 새로운 다이나믹셀입니다.

![](/assets/images/edu/engineer/kit1/2xl430_intro.png)

**[2XL430-W250-T 매뉴얼 바로가기]{: .blank}** 
{: .notice}

### [LED 보드](#led-보드)
빨강, 파랑, 보라 3가지 색과 빛의 세기를 제어할 수 있는 R/B LED 보드입니다.  
로봇의 외형에 장착해 화려한 LED 효과를 주거나 대회 등에서 LED 색으로 팀을 구분하는 등의 다양한 용도로 활용할 수 있습니다.

![](/assets/images/edu/engineer/kit2/led_board_01.png)
> LED 보드

![](/assets/images/edu/engineer/kit2/led_board_02.png)
> LED 보드 부착용 스티커

![](/assets/images/edu/engineer/kit2/led_board_03.png)
> MAX-E2 LED 보드 장착모습

### [DMS-80](#dms-80)
절대 거리 센서 DMS-80 (DMS : Distance measuring Sensor)은 적외선을 활용해 거리를 감지하는 센서입니다.  
일반적인 적외선 센서에 비해 DMS는 반사체의 색상에 거의 영향을 받지 않으며 감지 거리도 10 ~ 80 cm까지 측정이 가능합니다.

![](/assets/images/edu/engineer/kit2/dms.png)

**[절대 거리 센서 DMS-80 매뉴얼 바로가기](/docs/kr/parts/sensor/dms-80/)**
{: .notice}

### [서보모터](#서보모터)
서보모터는 로봇의 관절과 같이 각도 조절이 필요한 곳에 주로 사용되는 모터입니다.  
바퀴처럼 구동시키는 회전 모드와 각도 및 위치 조절이 가능한 관절 모드를 지원하며 모드를 변경하여 필요에 맞게 사용할 수 있습니다.

![](/assets/images/parts/motor/servo_motor_product.jpg)

**[서보모터 매뉴얼 바로가기]{: .blank}**
{: .notice}

## [주의사항](#주의사항)

### [안전에 대한 주의사항](#안전에-대한-주의사항)

{% capture eng_kit1_danger1 %}  
![](/assets/images/icon_warning.png)  
1. 사용 전 본 매뉴얼을 충분히 숙지하시기 바랍니다.
2. 반드시 권장 공구를 사용해야 하며 칼이나 드릴과 같이 위험한 공구를 함부로 사용하지 마십시오.
3. 로봇이 동작할 때는 다칠 위험이 있으니 절대로 만지거나 얼굴을 가까이 가져가지 마십시오.
4. 손가락이 로봇의 관절 사이에 끼이지 않도록 유의하십시오.
5. 직사광선이 닿는 곳이나 고온 상태에서 로봇을 보관하거나 작동하지 마십시오.
6. 물기가 있는 곳에서 절대 작동시키지 마십시오.
7. 부품을 임의로 분해하거나 개조하여 사용하지 마십시오.
8. 로봇이나 부품이 유아나 어린이의 손에 닿지 않도록 유의하십시오.
9. 로봇이나 부품에 충격을 가하거나 날카로운 물체로 찌르지 마십시오.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger1 | markdownify }}</div>

### [사용상 주의사항](#사용상-주의사항)

{% capture eng_kit1_danger2 %}  
1. 나사를 조이는 드라이버는 반드시 지정된 사양의 드라이버(PH 1)를 사용하십시오.
2. 무리한 힘으로 나사를 돌리거나 부품을 끼우지 마십시오.
3. 책상이나 테이블 위에서 로봇을 동작시키면 떨어져 파손될 위험이 있으므로 반드시 바닥에서 동작시키십시오.
4. 낙하에 의한 파손은 본인의 부주의로 인한 것이므로 고장시 무상 수리되지 않습니다.
5. 로봇 관절 및 다이나믹셀 내부의 기어는 소모품입니다. 오래 사용하거나 무리하게 사용하면 기어의 유격이 커질 수 있습니다.
6. 순간 전류를 많이 소모하는 과격한 동작시, 전원이 꺼지는 현상이 발생할 수 있습니다. 이 경우 배터리 또는 높은 암페어(A)의 SMPS를 사용하세요.
{% endcapture %}
<div class="notice--warning">{{ eng_kit1_danger2 | markdownify }}</div>

### [충전기/충전지 사용시 주의사항](#충전기충전지-사용시-주의사항)

{% capture eng_kit1_danger3 %}  
![](/assets/images/icon_warning.png)  
1. 충전지는 로봇의 제어기로 충전되지 않으며, 반드시 제품에 포함된 전용충전기를 사용하여 충전해야 합니다.
2. 충전기나 충전지를 분해 또는 떨어뜨리거나 충격을 가하지 마십시오.
3. 충전지에 열을 가하거나 불, 물, 또는 기타 액체류에 접촉하지 마십시오.
4. 전자레인지, 냉장고, 세탁기, 또는 세탁물 건조기에 충전지를 넣지 마십시오.
5. 손상된 충전지를 사용하지 마십시오. (부풀어 오른 것, 변형된 것, 외관이 손상된 것 등)
6. 충전지의 양극과 음극을 단락시키지 마십시오.
7. 충전지를 충전하기 전에 올바른 극에 연결되었는지 확인하고 충전하십시오.
8. 충전지가 뜨거워진 상태에서 충전하지 마십시오. 충전지가 상온의 온도일 때 충전하십시오.
9. 온도나 습도가 높은 곳에 보관하지 마십시오.
10. 충전기에 여러개의 충전지를 동시에 연결하지 마십시오.
11. 충전기에 전원을 연결하지 않은 상태에서 배터리만 연결하지 마십시오.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger3 | markdownify }}</div>

### [조립시 주의사항](#조립시-주의사항)

#### [다이나믹셀 조립](#다이나믹셀_조립)

- 2축 다이나믹셀을 제어하기 위해 각 축마다 중복되지 않는 고유의 ID가 부여되어 있습니다.  
- 혼의 맞은편 ID, 상태 LED로 다이나믹셀의 상태를 확인할 수 있습니다  
- STEAMCUP ENGINEER에서는 주요 관절 부위의 견고한 조립을 위해 나사를 사용합니다.  
(표시된 부분이 나사를 조립하는 부분입니다)  

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_1.png)

![](/assets/images/edu/engineer/kit1/2xl430_assembly_caution_2.png)

**주의** : 나사를 조이거나 풀 때 반드시 지정된 사양(PH 1)의 드라이버를 사용하시기 바랍니다.
{: .notice--warning}

##### [다이나믹셀 ID확인](#다이나믹셀-id확인)

![](/assets/images/edu/engineer/kit1/2xl430_id.png)

##### [다이나믹셀 혼 위치 확인](#다이나믹셀-혼-위치-확인)

![](/assets/images/edu/engineer/kit1/2xl430_horn.png)  

{% capture warning_01 %}  
**주의**  
- 케이스 중앙의 표식과 혼의 표식이 일치한 상태가 중앙 값입니다.  
- 재조립 등으로 인하여 다이나믹셀 혼 위치가 변경되었을 경우 드라이버를 이용하여 혼 중앙의 나사를 시계방향으로 천천히 돌리면 혼이 회전합니다. 나사를 반시계 방향으로 돌리면 나사가 풀어지므로 주의해주세요.  
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

#### [리벳 조립](#리벳-조립)

##### 6mm 리벳

![](/assets/images/edu/engineer/kit1/rivet_assembly_6mm_kr.png)  

**주의** : 리벳을 다시 사용할 때는 반드시 핀홀을 먼저 끼웁니다. (사용했던 리벳은 핀과 핀홀로 분리되지 않습니다.)
{: .notice--warning}

##### 12mm 리벳

![](/assets/images/edu/engineer/kit1/rivet_assembly_12mm_kr.png)

#### [케이블 연결](#케이블-연결)

##### 배선연결

두 개의 커넥터 중 한 개만 연결해도 전원 공급이 되며 통신이 가능합니다. 로봇의 배선에 유리한 커넥터를 사용하세요.

![](/assets/images/edu/engineer/kit1/cable_assembly_1.png)

##### 아이들러 캡을 통한 중공형 배선

![](/assets/images/edu/engineer/kit1/cable_assembly_2.png)

**참고**  
중공형 배선 연결은 케이블의 내구성을 더 높이거나 미관상의 케이블 정리를 위해 사용하는 결합 방법입니다.  
반드시 사용해야 하는 것은 아니며 아이들러 캡 결합 후 케이블을 교체시 일반적인 조립방법보다 시간이 더 소요될 수도 있습니다.
{: .notice--info}

[XL430-W250-T 매뉴얼 바로가기]: /docs/kr/dxl/x/xl430-w250/
[서보모터 매뉴얼 바로가기]: /docs/kr/parts/motor/servo_motor/ 
[CM-550 매뉴얼 바로가기]: /docs/kr/parts/controller/cm-550/
[2XL430-W250-T 매뉴얼 바로가기]: /docs/kr/dxl/x/2xl430-w250/
[절대 거리 센서 DMS-80]: /docs/kr/parts/sensor/dms-80/
[동작 모드]: /docs/kr/parts/controller/cm-550/#동작-모드
