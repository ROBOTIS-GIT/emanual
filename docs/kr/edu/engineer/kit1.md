---
layout: archive
lang: kr
ref: kit1
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/engineer/kit1/
sidebar:
  title: 엔지니어 키트 1
  nav: "kit1"
---

# [개요](#개요)

![](/assets/images/edu/engineer/kit1/enginner_main.png)

**로보티즈 엔지니어** 는 스마트 기기를 활용한 AI 기술이 적용된 새로운 개념의 차세대 로봇입니다.  

- 다양한 움직임을 구현하는 관절형 구조
- 단계별 로봇교육과정 및 표준 커리큘럼 제공
- 3D프린팅 지원
- 로보플러스 엔지니어, 로보플러스 태스크 3.0 등 다용도 소프트웨어 사용가능
- 라즈베리 파이와 카메라 확장가능

## [부품 목록](#부품-목록)

![](/assets/images/edu/engineer/kit1/parts_list_kr.png)

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
- `DXL` 다이나믹셀-X 시리즈 포트 : 다이나믹셀-X 시리즈를 연결하기 위한 포트입니다.
- `PORT` 로보티즈 5핀 포트 : DMS, 접촉 센서, 적외선 센서 등의 주변장치를 연결하기 위한 5개의 포트입니다.  
  그 중 서보모터, 적외선센서, 온습도센서는 1, 2번 포트에만 연결할 수 있습니다. 각 포트마다 번호가 표시되어 있습니다.
- `MIC` 내장 마이크 : 박수 소리를 감지할 수 있는 마이크가 기본으로 내장되어 있습니다.
- `FUSE` 퓨즈 : 10A 퓨즈가 내장되어 있습니다.

**주의** : CM-550 제어기의 USB 포트는 PC와의 통신용이므로 스마트 기기나 다른 장치와 연결하지 마세요. 제어기 고장의 원인이 될 수 있습니다.  
{: .notice--warning}

**[CM-550 매뉴얼 바로가기]{: .blank}**
{: .notice}

### [2XL430 다이나믹셀](#2xl430-다이나믹셀)
2XL430-W250-T는 기존 하나의 축만 가지고있는 액츄에이터와 달리, 2축 제어가 가능한 새로운 다이나믹셀입니다.

![](/assets/images/edu/engineer/kit1/2xl430_intro.png)

| 항목             | 내용                                                      |
|:-----------------|:----------------------------------------------------------|
| MCU              | {{ site.data.dxl_x_info.2xl430-w250.mcu }}                |
| 위치 센서        | {{ site.data.dxl_x_info.2xl430-w250.encoder }}            |
| 모터             | {{ site.data.dxl_x_info.2xl430-w250.motor }}              |
| 통신속도         | {{ site.data.dxl_x_info.2xl430-w250.baudrate }}           |
| 제어 알고리즘    | {{ site.data.dxl_x_info.2xl430-w250.control }}            |
| 해상도           | {{ site.data.dxl_x_info.2xl430-w250.resolution }}         |
| 동작 모드        | {{ site.data.dxl_x_info.2xl430-w250.mode }}               |
| 무게             | {{ site.data.dxl_x_info.2xl430-w250.weight }}             |
| 크기 (W x H x D) | {{ site.data.dxl_x_info.2xl430-w250.dimensions }}         |
| 기어비           | {{ site.data.dxl_x_info.2xl430-w250.gearratio }}          |
| 정지 토크        | {{ site.data.dxl_x_info.2xl430-w250.stalltorque }}        |
| 무부하 속도      | {{ site.data.dxl_x_info.2xl430-w250.noloadspeed }}        |
| 동작 온도        | {{ site.data.dxl_x_info.2xl430-w250.temperature }}        |
| 사용 전압        | {{ site.data.dxl_x_info.2xl430-w250.voltage }}            |
| 제어 명령        | {{ site.data.dxl_x_info.2xl430-w250.command }}            |
| 프로토콜 타입    | {{ site.data.dxl_x_info.2xl430-w250.protocoltype }}       |
| 통신 연결        | {{ site.data.dxl_x_info.2xl430-w250.physicalconnection }} |
| ID               | {{ site.data.dxl_x_info.2xl430-w250.id }}                 |
| 피드백           | {{ site.data.dxl_x_info.2xl430-w250.feedback }}           |
| 재질             | {{ site.data.dxl_x_info.2xl430-w250.material }}           |
| 대기 전류        | {{ site.data.dxl_x_info.2xl430-w250.standbycurrent }}     |

**[2XL430-W250 매뉴얼 바로가기]{: .blank}**
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
- 로보티즈 엔지니어에서는 주요 관절 부위의 견고한 조립을 위해 나사를 사용합니다.  
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


# [작동하기](#작동하기)

## [앱 설치하기](#앱-설치하기)

- 로보티즈 엔지니어는 [로보플러스 태스크 3.0]를 지원합니다.
- [로보플러스 태스크 3.0]은 기존의 [로보플러스 태스크 2.0]과 [로보플러스 모션 2.0]이 통합된 프로그램입니다.
- 태스크 코드를 작성하여, 로봇을 원하는대로 명령으로 구동할 수 있습니다.
- 모션파일로 로봇의 행동을 직접 만들어 줄 수 있습니다.


{% capture software_install_01 %}  
![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**로보플러스 태스크 3.0**
- [윈도우용 설치파일 다운로드](http://www.robotis.com/service/download.php?no=1774) 
- [구글 플레이에서 다운로드](https://play.google.com/store/apps/details?id=com.robotis.task3)
- [앱스토어에서 다운로드](https://www.robotis.com/service/download.php?no=1899)   
{% endcapture %}
<div class="notice--success">{{ software_install_01 | markdownify }}</div>

{% capture software_install_02 %}  
![](/assets/images/edu/engineer/kit1/icon_engineer_48.png)  
**로보플러스 엔지니어**
- [구글 플레이에서 다운로드](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)
- [앱 스토어에서 다운로드](https://apps.apple.com/kr/app/r-engineer/id1475713920)
- **참고**: [로보플러스 엔지니어 다운로드 방법](/docs/kr/popup/engineer/engineer_app_installation){: .popup}
{% endcapture %}
<div class="notice--success">{{ software_install_02 | markdownify }}</div>

## [예제 다운로드](#예제-다운로드)
- CM-550 제어기에는 최초 출하시 KIT 1 타입에 맞는 프로그램이 기본적으로 다운로드되어 있습니다.  
- 종합예제는 `Dr.R`, `MAX-E1`, `SPI` 세가지 로봇이 모두 포함된 예제입니다.

| 기본 예제 |                                 태스크 파일                                  |                                 모션 파일                                 |
|:----------|:----------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|
| 종합 예제 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1779 ) | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1787) |
| Dr.R      | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1780)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1788) |
| MAX-E1    | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1781)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1789) |
| SPI       | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1782)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1790) |

| 추가 예제 |                                 태스크 파일                                  |                                 모션 파일                                 |
|:----------|:----------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|
| 종합 예제 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1779 ) | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1787) |
| 추가예제1 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1780)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1788) |
| 추가예제2 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1781)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1789) |
| 추가예제3 | [태스크 파일 다운로드](http://www.robotis.com/service/download.php?no=1782)  | [모션 파일 다운로드](http://www.robotis.com/service/download.php?no=1790) |

### [PC에서 예제 다운로드](#pc에서-예제-다운로드)
PC로 작성한 예제 또는 다운로드 받은 예제를 제어기에 다운로드 하는 방법입니다. 
- CM-550의 Micro USB 포트를 이용하면 PC와 직접 연결하여 태스크(.tsk3) 및 모션(.mtn3) 파일을 업로드 할 수 있습니다.
- CM-550에 내장된 BLE 슬레이브 모듈과 BT-410 동글을 페어링하면 PC에서 원격으로 예제를 업로드 할 수 있습니다.

1. [제어기와 PC 연결하기]{: .popup}
2. [PC에서 태스크 예제 다운로드 하기]{: .popup}
3. [PC에서 모션 예제 다운로드 하기]{: .popup}

### [스마트 기기에서 예제 다운로드 받기](#스마트-기기에서-예제-다운로드-받기)
스마트 기기에서 작성한 예제 또는 다운로드 받은 예제를 제어기에 원격으로 다운로드 하는 방법입니다. 

**참고** : CM-550이 스마트 기기와 블루투스로 연결되어야 합니다. [블루투스 연결하기](#블루투스-연결하기)를 참고하세요.
{: .notice}

1. [제어기와 스마트기기 연결하기]{: .popup}
2. [스마트기기에서 태스크 예제 다운로드 하기]{: .popup}
3. [스마트기기에서 모션 예제 다운로드 하기]{: .popup}

## [예제 실행하기](#예제-실행하기)

`ROBOTIS ENGINEER` 앱을 실행하고 조립된 로봇 예제를 선택하면 해당 예제에 맞는 다양한 기능들을 사용할 수 있습니다.    

![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

**주의** : 조립된 로봇과 다른 예제를 선택할 경우 로봇이 정상적으로 작동하지 않습니다.
{: .notice--warning}

앱 화면 우측 상단의 메뉴버튼을 눌러 환경 설정을 할 수 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_configuration_kr.png)

`연결할 장치 선택` : 연결할 블루투스 장치를 선택합니다.  
`예제 초기화` : 선택한 예제를 초기화 하는 기능입니다.  
`제스처 오차 범위 설정` : 제스처의 허용 오차 범위를 설정합니다.  
`갤러리에 예제 이미지 표시` : 스마트기기의 갤러리에 예제 이미지를 표시합니다.  
`미디어 스캔` : 파일이 PC에서 보이지 않을 때 사용하는 기능입니다.  
`버전 정보` : 현재 앱의 버전을 확인하는 기능입니다.  

### [블루투스 연결하기](#블루투스-연결하기)

1. CM-550 제어기의 스위치를 눌러 전원을 켭니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_1.png)

2. 제어기의 `MODE` 버튼을 눌러 녹색이 점멸하도록 합니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_2.png)

    **참고** : `MODE` 버튼이 녹색으로 점멸할 경우 태스크 프로그램의 실행을 대기하는 모드입니다.
    {: .notice--info}

3. 제어기의 `START` 버튼을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_3.png)

    **참고** : `MODE` 버튼이 녹색으로 점멸할 때 `START` 버튼을 누르면 `MODE` 버튼이 녹색으로 고정되며 태스크 프로그램이 실행됩니다.
    {: .notice--info}

4. 스마트 기기에서 `ROBOTIS ENGINEER`앱을 실행하고 화면에 표시된 블루투스 아이콘을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_4.png)

5. 제어기에 표시된 MAC 주소의 마지막 두자리를 확인합니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_5.png)

6. 확인한 문자를 왼쪽 상자에 입력한 후 `검색` 을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_6_kr.png)

7. 검색된 목록 중 제어기의 주소와 일치하는 항목을 선택하면 블루투스 통신 연결이 완료되고, 로봇이 실행됩니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_7_kr.png)


### [Dr.R](#drr)

#### 감정 표현  
Dr.R 예제를 선택하면 스마트 기기 화면에 아래와 같은 표정이 나타납니다. 로봇을 터치하거나 이벤트가 발생하면 표정 변화, 움직이기, 말하기 등의 다양한 감정 표현을 합니다.  

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_1.png)

#### 모드 선택하기

오른쪽 아래 `Mode` 버튼을 터치하면 아래와 같이 모드 변경 메뉴가 나타납니다. 5개의 모드와 2개의 옵션 메뉴가 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_3_kr.png)

##### 모드 메뉴

|                        아이콘                         | 모드 설명                                                                                                                                                       |
|:-----------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit1/icon_demo.png)  | **DEMO : 감성인식 모드**<br>기본 데모 모드로 스마트 기기 화면을 통해 감정상태를 표현합니다.<br>로봇이나 스마트 기기를 터치하면 다양한 반응을 합니다.            |
|  ![](/assets/images/edu/engineer/kit1/icon_face.png)  | **FACE : 얼굴인식 모드**<br>스마트 기기의 카메라로 얼굴을 인식하고 추적하는 모드입니다.<br>AR 기술을 적용해 추적하는 얼굴 위에 스티커를 입힙니다.               |
| ![](/assets/images/edu/engineer/kit1/icon_object.png) | **OBJECT : 객체인식 모드**<br>사전에 등록된 물건을 카메라로 인식하고 말하는 모드입니다.<br>바나나, 볼펜, 차 열쇠, 지갑, 지폐 등 12종의 물건을 말할 수 있습니다. |
| ![](/assets/images/edu/engineer/kit1/icon_voice.png)  | **VOICE : 음성인식 모드**<br>등록된 음성 명령을 인식하고 실행하는 모드입니다.<br>모드 변경 및 옵션 메뉴 실행, 종료 등의 명령을 인식합니다.                      |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP : 박수감지 모드**<br>제어기의 마이크 센서를 통해 박수소리를 인식하는 모드입니다.<br>인식한 박수소리의 숫자만큼 Dr.R이 따라서 박수를 칩니다.              |

##### 옵션메뉴

|                        아이콘                         | 옵션 설명                                                                                    |
|:-----------------------------------------------------:|:---------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR : 다이나믹셀 점검**<br>로봇의 다이나믹셀 상태를 각각 테스트해 볼 수 있는 메뉴입니다. |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET : 모션오프셋**<br>모션 동작시 각 관절의 기본 위치를 설정하는 기능입니다.            |

**참고** : 옵션 메뉴는 모든 예제에 포함되어 있으며 세부 설정 방법은 [로봇 설정하기](#로봇-설정하기)를 참고하세요.
{: .notice--info}

### [MAX-E1](#max-e1)

#### 리모컨 화면

![](/assets/images/edu/engineer/kit1/max_controller_kr.png)

`조종 모드` : MAX-E1의 조종 모드를 일반/전투/축구모드로 변경할 수 있습니다.  
`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
`모션 버튼` : 각 조종 모드에 따라 각각 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : 로봇의 다이나믹셀 토크를 켜거나 끌 수 있는 버튼입니다.  
`메뉴 버튼` : MAX-E1 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                         아이콘                         | 메뉴 설명                                                                    |
|:------------------------------------------------------:|:-----------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.                      |
| ![](/assets/images/edu/engineer/kit1/icon_gesture.png) | **GESTURE** : 등록된 스마트 기기의 동작 제스처로 로봇을 조종하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)   | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 MAX-E1이 박수를 칩니다.       |

### [SPI](#spi)

#### 리모컨 화면  

![](/assets/images/edu/engineer/kit1/spi_controller_kr.png)

`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다.  
`모션 버튼` : SPI 로봇에 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : SPI 로봇의 다이나믹셀 토크를 켜거나 풀 수 있는 버튼입니다.  
`메뉴 버튼` : SPI 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                        아이콘                         | 메뉴 설명                                                          |
|:-----------------------------------------------------:|:-------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png) | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.            |
| ![](/assets/images/edu/engineer/kit1/icon_music.png)  | **MUSIC** : 스마트 기기를 통해 로봇과 함께 연주를 하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 SPI가 움직입니다.   |

## [로봇 설정하기](#로봇-설정하기)

### [모터 조립확인](#모터-조립확인)
로보티즈 엔지니어에 사용된 다이나믹셀 ID 확인 및 작동 상태를 체크하는 기능입니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `MOTOR`를 선택하여 점검합니다  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. 화면에서 ID 번호를 선택하면 선택된 ID의 LED가 켜지고 중심 위치에서 좌우로 조금씩 움직입니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)


### [모터 오프셋 설정](#모터-오프셋-설정)
로보티즈 엔지니어에 사용된 다이나믹셀의 자세나 위치 값의 보정이 필요할 때 사용하는 기능입니다.  
오프셋 기능을 통해 보정된 값은 로봇의 전원을 끄더라도 저장됩니다.  
오프셋 기능을 숙지한 상태에서 미세하게 조정해야 하며 잘못된 값을 사용시 예제 동작이 잘 안되거나 로봇이 파손될 수 있습니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `OFFSET`을 선택합니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

2. 오프셋 값을 보정하려는 ID를 선택하면 아래와 같은 팝업창이 나타납니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

    - `+ / -` : ID 값을 증가시키거나 감소시킴  
    - `Torque On / Off` : 다이나믹셀의 토크를 켜거나 끄기  
    - `OK / CANCEL` : 오프셋 조정 값을 저장하거나 취소하기

3. `OK`를 눌러 저장하면 아래와 같은 확인 창이 나타납니다. 한 번 더 `OK`를 누르면 값이 저장되고 로봇에 반영됩니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

4. 오프셋을 초기화 하거나 저장된 값을 불러오는 기능을 사용할 수 있습니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

    - `Reset Offset` : 선택시 팝업창이 나타나며 `OK`를 클릭하면 모든 ID의 오프셋을 `0`으로 초기화 합니다.  
    - `Initial Pose` : 최근에 저장된 오프셋 값을 불러오는 명령입니다. 관절을 잘못된 값으로 조정하였을 경우 저장된 값을 불러옵니다.

# [튜토리얼](#튜토리얼)

## [머신러닝 기반의 사물인식](#머신러닝-기반의-사물인식)
로보티즈 엔지니어는 머신러닝(Tensor Flow)기반의 사물학습 및 객체인식 기능을 사용할 수 있습니다.  
아래의 과정을 따라하며 머신러닝을 쉽게 시작해보세요.

{% capture info_01 %}
- 사물학습 및 객체인식을 사용하기 위해서는, 카메라가 장착된 스마트 기기가 있어야 합니다.
- 스마트 기기에 **[로보플러스 엔지니어 앱](#소프트웨어-다운로드)** 을 설치해야 합니다.
{% endcapture %}
<div class="notice--info">{{ info_01 | markdownify}}</div>

### [윈도우즈](#윈도우즈)

{% capture info_02 %}
**아나콘다** : 기계 학습, 대규모 데이터 처리를 위한 모듈과 파이썬이 포함된 프로그램입니다.  
텐서플로우를 이용한 머신러닝 이미지 학습을 하기 위해서는 PC에 `아나콘다3 4.2.0`가 설치되어 있어야 합니다.  
- [윈도우 64비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86_64.exe)  
- [윈도우 32비트용 아나콘다3-4.2.0](https://repo.continuum.io/archive/Anaconda3-4.2.0-Windows-x86.exe)  
{% endcapture %}
<div class="notice">{{ info_02 | markdownify}}</div>

#### [pip 패키지 업그레이드](#pip-패키지-업그레이드)

1. `WIN` + `S` 키를 눌러 나타난 검색창에 **cmd** 를 검색한 다음 관리자 권한으로 명령 프롬프트를 실행합니다.  
`Ctrl` + `Shift` 를 누른 상태에서 `명령 프롬프트` 를 클릭해도 됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_01_kr.png)

2. 명령 프롬프트가 실행되면 아래와 같은 화면이 나타납니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_02_kr.png)

3. 명령 프롬프트에서 아래의 명령어를 입력해주세요.

    ``` posh
    python -m pip install --upgrade pip
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_03_kr.png)

4. pip패키지가 성공적으로 업그레이드되면 아래와 같이 표시됩니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_cmd_04_kr.png)

    pip 패키지가 업그레이드되지 않는다면, 아나콘다가 `C 드라이브` 에 정상적으로 설치되었는지 확인해주세요.
    {: .notice--warning}

#### [폴더생성](#폴더생성)

1. `D 드라이브`에 `!R+Smart` 폴더를 만들어 주세요.

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_01_kr.png)

    - 폴더 위치는 `D 드라이브` 또는 `C 드라이브` 등 상관없습니다. 매뉴얼에서는 `D 드라이브` 기준으로 설명합니다.
    - 폴더 이름은 사용자가 임의로 변경할 수 있습니다. 매뉴얼에서는 `!R+Smart` 기준으로 설명합니다.
    {: .notice--info}

2. `!R+Smart` 폴더가 생성된 위치로 이동해야 합니다. 현재 드라이브가 `C 드라이브` 이므로, 아래의 명령어를 입력하여 `D 드라이브`로 이동합니다.

    ``` posh
    d:
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_02_kr.png)


3. 아래의 명령어를 입력하여, `!R+Smart` 폴더로 이동합니다.

    ``` posh
    cd !R+Smart
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_mkdir_03_kr.png)

#### [아나콘다 가상실행 환경 만들기](#아나콘다-가상실행-환경-만들기)

1. 아래의 명령어를 입력해서 아나콘다 가상실행 환경을 만들어주세요.

    ``` posh
    conda create -n tensorflow python=3.5
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_01_kr.png)

2. 진행여부를 묻습니다. `y` 입력후, `Enter Key`를 눌러 패키지 설치를 진행합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_02_kr.png)

3. 성공적으로 설치되면 아래의 사진과 같이 나옵니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_03_kr.png)

#### [텐서플로우 설치하기](텐서플로우-설치하기)

머신러닝을 구동시키기 위해 텐서플로우를 설치합니다.

1. 아래의 명령어를 입력하여, 미리 구축했던 아나콘다 가상실행 환경에 텐서플로우를 활성화시킵니다.

    ``` posh
    activate tensorflow
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_04_kr.png)

2. 마지막으로 아래의 명령어를 입력해서 텐서플로우를 설치합니다.

    ``` posh
    pip install tensorflow==1.13.1
    ```
    
    **주의**: 명시된 버전과 다른 버전을 사용하면, 오류가 발생할 수 있습니다. **1.13.1 버전을 설치하세요.** 
    {: .notice--warning}

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_05_kr.png)

#### [파일과 폴더 생성](#파일과-폴더-생성)

1. `retrain.py` 파일을 다운로드합니다.

    [retrain.py 다운로드](http://www.robotis.com/service/download.php?no=1778)
    {: .notice}

2. `!R+Smart` 폴더에 다운로드받은 `retrain.py` 파일을 복사한 다음, 객체 추가를 위한 `photos` 폴더를 만듭니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_tensor_retrain_kr.png)

3. `photos` 폴더 안에 `001 dummy`, `002 banana` 그리고 `003 pineapple`과 같이 객체 이미지를 추가할 하위 폴더를 만들고 객체와 관련된 이미지를 각각의 폴더에 추가합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_image_01_kr.png)

 {% capture notice_01 %}
  **참고** :
  - `001 dummy` 폴더는 지정해둔 객체 이외의 이미지에 반응하기 위해 만들어 주세요. 더미 폴더는 객체인식 오류를 줄여줄수가 있습니다.  
  - 여러 이미지를 반복해서 학습시키기 때문에, 이미지가 많을수록 학습효과가 높아집니다.
  - 카메라의 객체 인식률을 높이기 위해 100개 이상의 이미지를 사용하는 것을 추천합니다.
  - 폴더명을 `001`, `002` 와 같은 숫자로 작성하면, 추가한 아이템번호가 순서대로 정렬됩니다.
 {% endcapture %}
 <div class="notice--info">{{notice_01 | markdownify}}</div>

  **주의** : 폴더와 파일 이름은 반드시 영문으로 작성해주세요.
  {: .notice--warning}

#### [이미지 학습](#이미지-학습)

1. 아래의 명령어를 입력하여, `photos` 폴더에 추가한 객체 이미지들을 학습시킬 수 있습니다.

    ```posh
    python retrain.py --bottleneck_dir=./bottlenecks --model_dir=./inception  --output_graph=./Smart_OC.pb --output_labels=./Smart_OC.txt --image_dir ./photos --architecture mobilenet_1.0_224 --how_many_training_steps 1000
    ```

    ![](/assets/images/edu/engineer/kit1/obj_classification_img_learning_01_kr.png)

    학습 명령어에서 `how_many_training_steps` 옵션은 이미지 학습의 횟수를 나타냅니다. 횟수는 1000회 정도가 적당하며, 예시의 명령어는 1000회로 학습합니다.
    {: .notice--info}

    **주의** : 폴더와 파일의 이름은 반드시 영문이어야 합니다. 한글 이름을 사용할 경우 오류가 발생합니다.
    {: .notice--warning}

2. 학습이 완료되면 아래와 같이 `Smart_OC.txt` 와 `Smart_OC.pb` 파일이 `!R+Smart` 폴더에 생성됩니다.

   ![](/assets/images/edu/engineer/kit1/obj_classification_oc_kr.png)

#### [프로젝트에 학습파일 적용하기](#프로젝트에-학습파일-적용하기)

1. ROBOTIS ENGINEER가 설치된 스마트 기기를 PC와 연결합니다.

2. 스마트 기기의 저장공간에서 `RoboPlus` > `ROBOTIS ENGINEER` > `CUSTOM` 폴더를 찾아 들어갑니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_01_kr.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_02_kr.png)  
    ![](/assets/images/edu/engineer/kit1/obj_classification_application_03_kr.png)

3. 프로젝트 폴더를 생성합니다. 여기에서는 `Project 1`을 프로젝트 폴더로 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_04.png)

    **참고** : 이미 사용중인 프로젝트가 있다면, 프로젝트 폴더를 생성하는 3번 과정은 건너뛸 수 있습니다.
    {: .notice--info}

4. 데이터베이스를 사용하기 위해서 `Db` 폴더를 생성합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_05_kr.png)

5. `!R+Smart` 에서 생성된 학습파일인 `Smart_OC.txt` 와 `Smart_OC.pb` 을 `Db` 폴더에 복사합니다.  

    ![](/assets/images/edu/engineer/kit1/obj_classification_application_06_kr.png)

6. 스마트 기기를 PC에서 분리한 다음 `ROBOTIS ENGINEER` 앱을 실행합니다.

    ![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

7. `User` 탭으로 이동합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_01_kr.png)

8. 3번 단계에서 생성한 `Project 1` 프로젝트 폴더의 `설정` 아이콘을 클릭합니다.   

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_02_kr.png)

9. `비전` > `객체 분류` 를 선택합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_03_kr.png)

10. 이미지 폴더가 추가되었는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_04_kr.png)

11. 객체를 놓고, 카메라를 통해 사물인식이 잘 되는지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/obj_classification_test_05.png)   

{% capture retrain %}
**참고** : 이미 생성된 학습파일인 `Smart_OC.txt` 와 `Smart_OC.pb` 에는 새로운 데이터를 추가할 수 없습니다.  
원하는 객체를 추가하려면 객체 이미지 폴더에 이미지를 추가한 다음, 새로운 학습파일을 만들어야 합니다.
- [파일과 폴더 생성 방법](#파일과-폴더-생성)
- [이미지 학습 방법](#이미지-학습)
{% endcapture %}
<div class="notice--info">{{ retrain | markdownify }}</div>


# [교육자료 다운로드](#교육자료-다운로드)

{% capture edu_application %}
아래의 링크에서 로보티즈 엔지니어 키트의 다양한 교육자료를 받을 수 있습니다.

- [**교육자료 신청하기**](https://www.robotis.com/pdf_project/register.php)
{% endcapture %}
<div class="notice--info">{{ edu_application | markdownify }}</div>

![](/assets/images/edu/engineer/kit1/engineer_edu_metarials_kr.png)

# [참고자료](#참고자료)

## [제어기 BLE 신호 세기 설정](#제어기-ble-신호-세기-설정)

CM-550에 내장된 BLE 슬레이브 모듈의 신호의 세기가 약하거나 간섭이 발생할 경우 통신이 불안정할 수 있습니다.  
이러한 경우 로보플러스 매니저 2.0을 사용하여 BLE 신호세기를 알맞게 설정할 수 있습니다.

아래 표는 여러개의 CM-550를 한 공간에서 사용할 때 BLE 신호 세기를 설정하는 방법입니다.

{% capture ble_setting %}  

| 나의 CM-550 | 주변의 CM-550 | BLE 신호 세기 |
|:-----------:|:-------------:|:-------------:|
| 통신 불안정 |   통신 안정   |     올림      |
| 통신 불안정 |  통신 불안정  |     올림      |
|  통신 안정  |  통신 불안정  |     내림      |
|  통신 안정  |   통신 안정   |  설정 불필요  |

- 한 개의 제어기만을 사용하는 환경에서 통신이 불안정하다면, 신호의 세기가 약할 수 있습니다. **BLE 신호 세기를 높여주세요**.
- 같은 공간에서 여러 개의 제어기를 사용할 때 통신이 불안정하다면, 제어기의 BLE 신호가 서로 간섭을 줄 수 있습니다. **통신이 불안정한 제어기의 BLE 신호세기를 높이거나 주변 제어기의 BLE 신호 세기를 낮춰주세요**.
- 모든 제어기의 통신이 잘 유지된다면 신호의 세기가 충분하고, 다른 제어기에 의해서 간섭이 발생하지 않는 경우입니다. **BLE 신호 세기를 유지시켜 주세요**.
{% endcapture %}
<div class="notice">{{ ble_setting | markdownify }}</div>

**참고** : 주변 환경과 사용하는 기기의 수에 따라서, BLE 신호 세기 및 간섭의 정도가 달라질 수 있습니다.
{: .notice}

1. CM-550의 BLE와 연결되어 있는 BT-410 마스터 모듈 또는 BT-410 동글의 전원이 꺼져있는지 확인합니다.  
  (만일 전원이 켜져있는 경우 CM-550을 켜는 순간 서로 페어링되기 때문에 BLE 신호 확인 및 설정을 할 수 없습니다)

2. CM-550의 전원을 켜고 USB 케이블로 PC에 연결합니다 (외부 전원 없이 USB 케이블로 제어기에 충분한 전원공급이 가능합니다).

3. CM-550의 `MODE` 버튼이 깜박이는 것을 확인합니다.

4. 로보플러스 매니저 2.0 을 실행합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_01_kr.png)

5. `업데이트 검사` 를 클릭한 다음, 로보플러스 매니저 2.0이 최신 버전인지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_02_kr.png)  
    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_03_kr.png)

6. `모든제품` 탭을 선택합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_04_kr.png)

7. 제품 중에서 CM-550을 선택 후 `확인` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_05_kr.png)

8.  `업데이트 & 테스트` 를 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_06_kr.png)

9. `다음` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_07_kr.png)

10. 제어기가 연결된 포트를 선택합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_08_kr.png)

11. 제어기와 PC의 통신속도를 선택합니다 (기본 통신속도는 57600 bps로 고정되어 있습니다).

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_09_kr.png)

12. 제어기 검색이 완료되면 `다음` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_10_kr.png)

13. 제어기와 연결된 부품의 펌웨어가 모두 최신 버전이라면 `다음` 을 클릭하거나, 업데이트가 필요한 경우 화면의 안내에 따라 펌웨어 업데이트를 진행합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_11_kr.png)

14. 제어기와 PC가 성공적으로 연결이 되면, 아래 그림과 같이 컨트롤 테이블이 표시됩니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_12_kr.png)

15. 컨트롤 테이블을 스크롤해서 `139`번 주소의 `BLE Signal Power` 를 찾습니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_13_kr.png)

16. 화면 오른쪽의 `BLE Signal Power` 에서 값을 선택 후 저장합니다.  
  큰 값을 선택할수록 신호가 강해지며, 통신이 불안정할 경우 신호 세기를 높여주세요.  

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_14_kr.png)

    `BLE Signal Power` 값이 `UNKNOWN(0)`인 경우 1번 단계로 돌아가서 BT-410 마스터 또는 BT-410 동글의 전원이 꺼져있는지 확인하시기 바랍니다.
    {: .notice}

17. 마지막으로, `BLE Signal Power` 의 값이 저장되었는지 확인해주세요.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_15_kr.png)

## [점검 및 자가진단](#점검-및-자가진단)

1. 로봇의 전원이 켜지지 않아요.  
  > 충전지의 연결 및 충전상태를 점검해 보세요.  

2. 충전지 잔량을 확인하고 싶어요.  
  > [충전지 잔량 확인 하기](#충전지-잔량-확인하기)를 참조하세요.

3. 로봇이 작동 중에 경고음이 들려요.  
  > 충전지의 잔량이 부족해서 나는 경고음입니다. [배터리를 충전](#배터리-충전하기)해 주세요.

4. 로봇이 정상적으로 작동하지 않아요.  
  > 로봇의 조립 방법 및 [다이나믹셀 ID](#다이나믹셀-id확인)를 확인해 보세요.  

5. 어댑터로는 동작하는데 충전지로 동작하지 않아요.  
  > 제어기의 퓨즈 상태를 확인하고 필요시 교체합니다. [퓨즈 교체하기](#퓨즈-교체하기)를 참고하세요.    

## [배터리 충전하기](#배터리-충전하기)

{% include kr/edu/engineer/battery_charge.md %}

## [충전지 잔량 확인하기](#충전지-잔량-확인하기)

{% include kr/edu/engineer/charge_level.md %}

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm-550.md %}

## [도면](#도면)

엔지니어 키트의 도면자료는 **[로보티즈 다운로드 센터](http://www.robotis.com/service/downloadpage.php?ca_id=70g0)** 에서 제공됩니다. 
{: .notice--success}

[CM-550 매뉴얼 바로가기]: /docs/kr/parts/controller/cm-550/
[2XL430-W250 매뉴얼 바로가기]: /docs/kr/dxl/x/2xl430-w250/
[로보플러스 태스크 3.0]: /docs/kr/software/rplustask3/
[로보플러스 태스크 2.0]: /docs/kr/software/rplus2/task/
[로보플러스 모션 2.0]: /docs/kr/software/rplus2/motion/
[동작 모드]: /docs/kr/parts/controller/cm-550/#동작-모드
[제어기와 PC 연결하기]: /docs/kr/popup/engineer/connect_controller_pc
[PC에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_pc
[PC에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_pc
[제어기와 스마트기기 연결하기]: /docs/kr/popup/engineer/connect_controller_mobile
[스마트기기에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_mobile
[스마트기기에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_mobile
