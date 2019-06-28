---
layout: archive
lang: kr
ref: kit1
read_time: true
share: false
author_profile: false
permalink: /docs/kr/edu/engineer/kit1/
sidebar:
  title: ENGINEER Kit 1
  nav: "kit1"
product_group: 2xl430-w250
---

# [개요](#개요)

![](/assets/images/edu/engineer/kit1/enginner_main.png)

**로보티즈 엔지니어**는 스마트 기기를 활용한 AI 기술이 적용된 새로운 개념의 차세대 로봇입니다.  

- 다양한 움직임을 구현하는 관절형 구조
- 단계별 로봇교육과정 및 표준 커리큘럼 제공
- 3D프린팅 지원
- 로보플러스 엔지니어, 로보플러스 태스크 3.0 등 다용도 소프트웨어 사용가능
- Rasberry Pi 와 카메라 확장가능


## [부품 목록](#부품-목록)

![](/assets/images/edu/engineer/kit1/parts_list.png)

### [CM-550 제어기](#cm-550-제어기)

#### [제품 사양](#제품-사양)  

|     항목      |                                                           사양                                                        |
|:-------------:|:--------------------------------------------------------------------------------------------------------------------:|
|     무게      |                                                            58.8g                                                        |
|      MCU      |                                                        STM32F405RG                                                   |
|   동작 전압   |                                  허용 범위 : 6.5V ~ 15V, 권장 전압 : 11.1V (Li-PO 3cell)                               |
|  소모 전류량  | 대기시 : 50mA<br />포트 1 ~ 2 I/O 최대전류 : 0.5A<br />포트 3 ~ 5 I/O 최대전류 : 0.02A<br />전체 최대 전류 : 10A (Fuse)  |
|   동작 온도   |                                                    -5&deg;C ~ 70&deg;C                                                |
|   통신 모듈   |                                                    BLE Slave 모듈 내장                                                 |
| 내부 I/O 장치 | 버튼 : 2 개 (MODE 1, START 1)<br />마이크 (소리 감지) : 1<br />전압 센서 : 1<br />자이로 가속도 센서 : 1<br />RGB LED : 1 |
| 외부 I/O 장치 |       로보티즈 5핀 포트 : 5<br />(서보모터/IR센서/온습도센서 : 1, 2번 포트 사용)<br />다이나믹셀 X 시리즈 포트 : 6       |


#### [CM-550 각 부 명칭](#cm-550-각-부-명칭)  

![](/assets/images/edu/engineer/kit1/cm550_1.png)

![](/assets/images/edu/engineer/kit1/cm550_2_kr.png)

- `USB` 마이크로 USB 포트 : 마이크로 USB 케이블로 CM-550를 PC의 USB 포트와 연결할 수 있습니다.
- `UART` 외부통신 포트 : BT-210, BT-410, LN-101, 적외선 수신기 등의 무선 통신용 모듈이나 외부 장치와의 통신용으로 사용되는 포트입니다.
- `BAT` 배터리 소켓 : 배터리를 연결하는 소켓입니다.
- `12VDC` 전원잭 : 전원 공급기(SMPS)의 전원잭을 연결하는 소켓입니다.
- `POWER` 전원 스위치 : 제어기의 전원을 켜거나 끌 때 사용하는 스위치입니다.
- 상태 LED : 전원과 무선기기의 상태에 따라 다양한 색상과 표현으로 알려주는 RGB LED입니다.
- `MODE` MODE LED : CM-550의 동작 모드를 표시하는 RGB LED입니다. 아래의 [동작 모드] 설명을 참고하세요.
- `START` START LED : 아래의 [동작 모드] 설명을 참고하세요.
- `MODE` MODE 버튼 : 제어기의 동작 모드를 변경하기 위한 버튼입니다. 아래의 [동작 모드] 설명을 참고하세요.
- `START` START 버튼 : 현재 선택된 모드를 실행하기 위한 버튼입니다. 아래의 [동작 모드] 설명을 참고하세요.
- `DXL` 다이나믹셀 X 시리즈 포트 : 다이나믹셀 X 시리즈를 연결하기 위한 포트입니다.
- `PORT` 로보티즈 5핀 포트 : DMS, 접촉 센서, 적외선 센서 등의 주변장치를 연결하기 위한 5개의 포트입니다.  
  그 중 서보모터, 적외선센서, 온습도센서는 1, 2번 포트에만 연결할 수 있습니다. 각 포트마다 번호가 표시되어 있습니다.
- `MIC` 내장 마이크 : 박수 소리를 감지할 수 있는 마이크가 기본으로 내장되어 있습니다.
- `FUSE` 퓨즈 : 10A 퓨즈가 내장되어 있습니다.

**주의** :  CM-550 제어기의 USB 포트는 PC와의 통신용이므로 스마트 기기나 다른 장치와 연결하지 마세요. 제어기 고장의 원인이 될 수 있습니다.  
{: .notice--warning}


### [2XL430 다이나믹셀](#2xl430-다이나믹셀)

![](/assets/images/edu/engineer/kit1/2xl430_intro.png)

2XL430은 2축 제어가 가능한 새로운 다이나믹셀입니다.


| 항목             | 내용                                                      |
|:-----------------|:----------------------------------------------------------|
| MCU              | {{ site.data.dxl_x_info[page.product_group].mcu }}                |
| 위치 센서        | {{ site.data.dxl_x_info[page.product_group].encoder }}            |
| 모터             | {{ site.data.dxl_x_info[page.product_group].motor }}              |
| 통신속도         | {{ site.data.dxl_x_info[page.product_group].baudrate }}           |
| 제어 알고리즘    | {{ site.data.dxl_x_info[page.product_group].control }}            |
| 해상도           | {{ site.data.dxl_x_info[page.product_group].resolution }}         |
| 동작 모드        | {{ site.data.dxl_x_info[page.product_group].mode }}               |
| 무게             | {{ site.data.dxl_x_info[page.product_group].weight }}             |
| 크기 (W x H x D) | {{ site.data.dxl_x_info[page.product_group].dimensions }}         |
| 기어비           | {{ site.data.dxl_x_info[page.product_group].gearratio }}          |
| 정지 토크        | {{ site.data.dxl_x_info[page.product_group].stalltorque }}        |
| 무부하 속도      | {{ site.data.dxl_x_info[page.product_group].noloadspeed }}        |
| 동작 온도        | {{ site.data.dxl_x_info[page.product_group].temperature }}        |
| 사용 전압        | {{ site.data.dxl_x_info[page.product_group].voltage }}            |
| 제어 명령        | {{ site.data.dxl_x_info[page.product_group].command }}            |
| 프로토콜 타입    | {{ site.data.dxl_x_info[page.product_group].protocoltype }}       |
| 통신 연결        | {{ site.data.dxl_x_info[page.product_group].physicalconnection }} |
| ID               | {{ site.data.dxl_x_info[page.product_group].id }}                 |
| 피드백           | {{ site.data.dxl_x_info[page.product_group].feedback }}           |
| 재질             | {{ site.data.dxl_x_info[page.product_group].material }}           |
| 대기 전류        | {{ site.data.dxl_x_info[page.product_group].standbycurrent }}     |

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
1. 로봇을 통해서는 충전되지 않으며, 전용충전기를 사용하여 충전해야 합니다.
2. 충전기나 충전지를 분해 또는 떨어뜨리거나 충격을 가하면 안됩니다.
3. 충전지에 열을 가하거나 불, 물, 또는 기타 액체류에 접촉하면 안됩니다.
4. 전자레인지, 세탁기, 또는 세탁물 건조기에 전지를 넣으면 안됩니다.
5. 손상된 충전지를 사용하면 안됩니다. (부풀어 오른 것, 변형된 것, 외관이 손상된 것 등)
6. 충전지 양극과 음극을 단락시키면 안됩니다.
7. 충전지를 충전하기 전에 올바른 극에 연결되었는지 확인하고 충전합니다.
8. 충전지가 뜨거워진 상태에서 충전하면 안됩니다. 차가워진 후 충전합니다.
9. 온도나 습도가 높은 곳에 보관하면 안됩니다.
10. 충전기에 2셀, 3셀을 동시에 충전하면 안됩니다.
{% endcapture %}
<div class="notice--danger">{{ eng_kit1_danger3 | markdownify }}</div>

### [조립시 주의사항](#조립시-주의사항)

#### [다이나믹셀 조립](#다이나믹셀_조립)

- 2축 다이나믹셀을 제어하기 위해 혼마다 고유의 ID가 부여되어 있습니다.  
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
- 케이스의 중앙 위치와 출력혼의 위치가 일치한 상태가 중앙 값입니다.  
- 재조립 등으로 인하여 다이나믹셀 혼 위치가 변경되었을 경우 드라이버를 이용하여 혼 중앙의 볼트를 오른쪽방향으로 돌리면 혼이 회전합니다. 볼트를 왼쪽 방향으로 돌리지 않도록 주의해주세요.  
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

양쪽의 커넥터 중 한 곳만 연결하면 구동되며, 커넥터별로 구분은 필요없습니다. 로봇의 배선에 유리한 방향으로 연결하세요.

![](/assets/images/edu/engineer/kit1/cable_assembly_1.png)

##### 아이들러캡을 통한 중공형 결합 방법

![](/assets/images/edu/engineer/kit1/cable_assembly_2.png)

**참고**  
중공형 배선 연결은 케이블의 내구성을 더 높이거나 미관상의 케이블 정리를 위해 사용하는 결합 방법입니다.  
반드시 사용해야 하는 것은 아니며 아이들러캡 결합 후 부득이 케이블을 교체 시 일반적인 조립방법보다 시간이 더 소요될 수도 있습니다.  
{: .notice--info}


# [작동하기](#작동하기)

## [앱 설치하기](#앱-설치하기)

{% capture app_install %}  
현재 로보플러스 엔지니어는 비공개 상태입니다. 아래 링크를 통해 앱을 다운로드 받아 설치해 주세요.  
- **[로보플러스 엔지니어 안드로이드 앱 다운로드](http://www.robotis.com/service/download.php?no=1773)**  
- **로보플러스 태스크 3.0 [윈도우용 다운로드](http://www.robotis.com/service/download.php?no=1774), [안드로이드 앱 다운로드](http://www.robotis.com/service/download.php?no=1772)**
- **참고** : [인터넷에서 다운로드 받은 앱 설치하기]{: .popup}

[인터넷에서 다운로드 받은 앱 설치하기]: /docs/kr/popup/apk_install
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div>

1. 스마트폰 또는 태블릿에서 `플레이 스토어` 또는 `앱 스토어`를 실행합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_01_kr.png)

2. `플레이 스토어` 또는 `앱 스토어` 검색창에 **로보티즈**를 입력합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_02_kr.png)

3. 검색된 목록에서 `ROBOTIS ENGINEER`를 찾아 `설치`를 선택합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_03_kr.png)

4. 아래와 같은 화면이 나타나면 `동의`를 눌러 설치를 진행합니다.  
  ![](/assets/images/edu/engineer/kit1/app_installation_04_kr.png)


## [블루투스 연결하기](#블루투스-연결하기)

1. CM-550 제어기의 스위치를 눌러 전원을 켭니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_1.png)

2. 제어기의 모드버튼을 눌러 녹색이 점멸하도록 합니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_2.png)

3. 제어기의 시작버튼을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_3.png)

4. 스마트 기기에서 `ROBOTIS ENGINEER`앱을 실행하고 화면에 표시된 블루투스 아이콘을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_4.png)

5. 제어기에 표시된 숫자 (마지막 두자리)를 확인합니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_5.png)

6. 확인한 숫자를 왼쪽 상자에 입력한 후 `검색` 을 누릅니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_6.png)

7. 검색된 목록을 찾아 선택하면 블루투스 통신 연결이 완료되고, 로봇이 실행됩니다.  
  ![](/assets/images/edu/engineer/kit1/bluetooth_connection_7.png)

## [예제 다운로드](#예제-다운로드)
- CM-550 제어기에는 최초 출하시 KIT 1 타입에 맞는 프로그램이 기본적으로 다운로드되어 있습니다.  

| 예제명 |       태스크 파일        |       모션 파일       |
|:-------|:-----------------------:|:--------------------:|
| Dr.R   | [태스크 파일 다운로드]() | [모션 파일 다운로드]() |
| MAX-E1 | [태스크 파일 다운로드]() | [모션 파일 다운로드]() |
| SPI    | [태스크 파일 다운로드]() | [모션 파일 다운로드]() |


## [예제 실행하기](#예제-실행하기)

`ROBOTIS ENGINEER` 앱을 실행하고 조립된 로봇 예제와 같은 예제 메뉴를 선택하면 해당 예제에
맞는 다양한 기능들을 사용할 수 있습니다.    

![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

**주의** : 조립된 로봇과 다른 예제를 선택할 경우 로봇이 정상적으로 작동하지 않습니다.
{: .notice--warning}

앱 화면의 우측 상단의 메뉴버튼을 눌러 환경 설정을 할 수 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_configuration.png)

`연결할 장치 선택` : 연결할 블루투스 장치를 선택합니다.  
`예제 초기화` : 선택한 예제를 초기화 하는 기능입니다.  
`제스처 오차 범위 설정` : 제스처의 허용 오차 범위를 설정합니다.  
`갤러리에 예제 이미지 표시` : 스마트기기의 갤러리에 예제 이미지를 표시합니다.  
`미디어 스캔` : 파일이 PC에서 보이지 않을 때 사용하는 기능입니다.  
`버전 정보` : 현재 앱의 버전을 확인하는 기능입니다.  

**참고** : `ENGINEER 실험실`의 자료 및 각종 기능은 예고 없이 변경될 수 있습니다.  
{: .notice--info}


### [Dr.R](#drr)

#### 감정 표현  
Dr.R 예제를 선택하면 스마트 기기에 왼쪽과 같은 표정 화면이 나타납니다. 로봇을 터치하거나 지정된 이벤트가 발생하면 표정 변화, 움직이기, 말하기 등의 다양한 감정 표현을 합니다.  

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_1.png)

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_2.png)

#### 모드 선택하기

오른쪽 아래 `Mode`버튼을 터치하면 아래와 같이 모드 변경 메뉴가 나타납니다. 5개의 모드와 2개의 옵션 메뉴가 있습니다

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_3.png)

##### 모드 메뉴

|                        아이콘                         | 모드 설명                                                                                                                              |
|:-----------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit1/icon_demo.png)  | **DEMO : 감성인식 모드**<br>기본 데모 모드로 스마트 기기 화면을 통해 감정상태를 표현합니다.<br>로봇이나 스마트 기기를 터치하면 다양한 반응을 합니다.          |
|  ![](/assets/images/edu/engineer/kit1/icon_face.png)  | **FACE : 얼굴인식 모드**<br>스마트 기기의 카메라로 얼굴을 인식하고 추적하는 모드입니다.<br>AR 기술을 적용해 추적하는 얼굴 위에 스티커를 입힙니다.             |
| ![](/assets/images/edu/engineer/kit1/icon_object.png) | **OBJECT : 객체인식 모드**<br>사전에 등록된 물건을 카메라로 인식하고 말하는 모드입니다.<br>바나나, 볼펜, 차 열쇠, 지갑, 지폐 등 12종의 물건을 말할 수 있습니다.|
| ![](/assets/images/edu/engineer/kit1/icon_voice.png)  | **VOICE : 음성인식 모드**<br>등록된 음성 명령을 인식하고 실행하는 모드입니다.<br>모드 변경 및 옵션 메뉴 실행, 종료 등의 명령을 인식합니다.                  |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)  | **CLAP : 박수감지 모드**<br>제어기의 마이크 센서를 통해 박수소리를 인식하는 모드입니다.<br>인식한 박수소리의 숫자만큼 Dr.R이 따라서 박수를 칩니다.            |

##### 옵션메뉴

|                        아이콘                         | 옵션 설명                                                                       |
|:-----------------------------------------------------:|:---------------  ------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR : 다이나믹셀 점검**<br>로봇의 다이나믹셀 상태를 각각 테스트해 볼 수 있는 메뉴입니다. |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET : 모션오프셋**<br>모션 동작시 각 관절의 기본 위치를 설정하는 기능입니다.         |

**참고** : 해당 옵션은 모든 예제에 동일하게 적용되며 세부 설정 방법은 [로봇 설정하기](#로봇-설정하기)를 참고하세요
{: .notice--info}

### [MAX-E1](#max-e1)

#### 리모컨 화면

![](/assets/images/edu/engineer/kit1/max_controller.png)

`조종 모드` : MAX-E1의 조종 모드를 일반/전투/축구모드로 변경할 수 있습니다.  
`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
`모션 버튼` : 각 조종 모드에 따라 각각 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : 로봇의 다이나믹셀 토크를 켜거나 끌 수 있는 버튼입니다.  
`메뉴 버튼` : MAX-E1 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                         아이콘                         | 메뉴 설명                                                          |
|:------------------------------------------------------:|:----------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.                  |
| ![](/assets/images/edu/engineer/kit1/icon_gesture.png) | **GESTURE** : 등록된 스마트 기기의 동작 제스처로 로봇을 조종하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)   | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 MAX-E1이 박수를 칩니다.     |

### [SPI](#spi)

#### 리모컨 화면  

![](/assets/images/edu/engineer/kit1/spi_controller.png)

`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다.  
`모션 버튼` : SPI 로봇에 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : SPI 로봇의 다이나믹셀 토크를 켜거나 풀 수 있는 버튼입니다.  
`메뉴 버튼` : SPI 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

|                         아이콘                         | 메뉴 설명                                                  |
|:------------------------------------------------------:|:--------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE** : 기본 조종 모드 화면을 불러오는 버튼입니다.         |
| ![](/assets/images/edu/engineer/kit1/icon_music.png) | **GESTURE** : 스마트 기기를 통해 로봇과 함께 연주를 하는 기능입니다. |
|  ![](/assets/images/edu/engineer/kit1/icon_clap.png)   | **CLAP** : 박수소리를 감지하고 감지한 횟수만큼 SPI가 움직입니다.   |

## [로봇 설정하기](#로봇-설정하기)

### [모터 조립확인](#모터-조립확인)
로보티즈 엔지니어에 사용된 다이나믹셀 ID 확인 및 작동 상태를 체크하는 기능입니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `MOTOR`를 선택하여 점검합니다  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. 화면에서 ID 번호를 선택하면 해당 ID의 LED가 켜지고 중심 위치를 기준으로 조금씩 움직여 해당 ID 상태를 확인할 수 있습니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)


### [모터 오프셋 설정](#모터-오프셋-설정)
로보티즈 엔지니어에 사용된 다이나믹셀의 자세나 위치 값의 보정이 필요할 때 사용하는 기능입니다.  
오프셋 기능을 통해 보정된 값은 재실행 이후에도 지속적으로 적용됩니다.  
전문적인 지식을 토대로 미세하게 조정해야 하며 과도한 값을 사용시 예제 동작이 잘 안될 수 있습니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `OFFSET`을 선택합니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

2. 값 보정을 원하는 ID를 선택하면 아래와 같은 팝업창이 나타납니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

    `+ / -` : ID 값을 증가시키거나 감소시킴  
    `Torque On / Off` : 다이나믹셀의 토크를 켜기 / 끄기  
    `OK / CANCEL` : 오프셋 조정 값 저장 / 취소  

3. `OK`를 눌러 저장하면 아래와 같은 확인 창이 나타납니다. 한번 더 `OK`를 누르면 값이 저장되고 로봇에 반영됩니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

    `Reset Offset` : 선택 시 SAVE 창이 나타나며 `OK`를 클릭 시 전체 모션의 오프셋을 `0`으로 초기화 합니다.  
    `Initial Pose` : 최근에 저장된 모션 오프셋 값을 불러오는 명령입니다. 관절을 조정중에 잘못 조정하였을 경우 초기위치로 되돌아 가도록 합니다.

    ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

# [튜토리얼](#튜토리얼)

다양한 교육 관련 자료를 준비중에 있습니다.
{: .notice}

# [소프트웨어 다운로드](#소프트웨어-다운로드)

- ROBOTIS ENGINEER는 [로보플러스 태스크 3.0]을 지원합니다.
- [로보플러스 태스크 3.0]은 기존의 [로보플러스 태스크 2.0]과 [로보플러스 모션 2.0]이 통합된 프로그램입니다.
- 태스크 코드를 작성하여, 로봇을 원하는대로 명령으로 구동할 수 있습니다.
- 모션파일로 로봇의 행동을 직접 만들어 줄 수 있습니다.

{% capture app_install %}  
현재 로보플러스 엔지니어는 비공개 상태입니다. 아래 링크를 통해 앱을 다운로드 받아 설치해 주세요.  
- **[로보플러스 엔지니어 안드로이드 앱 다운로드](http://www.robotis.com/service/download.php?no=1773)**
- **로보플러스 태스크 3.0 [윈도우용 다운로드](http://www.robotis.com/service/download.php?no=1774), [안드로이드 앱 다운로드](http://www.robotis.com/service/download.php?no=1772)**
- **참고** : [인터넷에서 다운로드 받은 앱 설치하기]{: .popup}

[인터넷에서 다운로드 받은 앱 설치하기]: /docs/kr/popup/apk_install
{% endcapture %}
<div class="notice--success">{{ app_install | markdownify }}</div>

# [참고자료](#참고자료)

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
  > 제어기의 퓨즈 상태를 확인하고 필요 시 교체합니다. [퓨즈 교체하기](#퓨즈-교체하기)를 참고하세요.    

## [배터리 충전하기](#배터리-충전하기)

**주의** :  
반드시 제공된 충전기와 충전지(리튬폴리머 배터리)만 사용하십시오.  
처음 사용시 반드시 충전지를 충전해 주세요.
{: .notice--warning}

1. 제품에 포함되어 있는 충전지(리튬폴리머 배터리)를 준비합니다.  
  ![](/assets/images/edu/engineer/kit1/battery_charging_1_kr.png)  

2. 그림과 같이 충전지를 충전기와 연결합니다.  
  ![](/assets/images/edu/engineer/kit1/battery_charging_2_kr.png)  

3. 그림과 같이 빨간색 LED가 표시되면 충전 중인 상태이며, 녹색 LED가 표시되면 충전이 완료된 상태입니다.  
  ![](/assets/images/edu/engineer/kit1/battery_charging_3_kr.png)  

4. SMPS를 제어기에 직접 연결하면 배터리 없이 외부전원으로 로봇을 구동할 수 있습니다.  
  ![](/assets/images/edu/engineer/kit1/battery_charging_4_kr.png)  

5. 충전지는 충전용 커넥터와 로봇 작동용 커넥터가 연결되어 있습니다. 배터리를 충전할 때에는 반드시 `로봇 작동용` 커넥터를 분리해 주세요.  
  ![](/assets/images/edu/engineer/kit1/battery_charging_5_kr.png)  

## [배터리 잔량 확인하기](#배터리-잔량-확인하기)

![](/assets/images/edu/engineer/kit1/battery_check.png)  

배터리 잔량에 따라 CM-550의 상태 LED가 다음과 같은 색상으로 표시됩니다.
- 파란색 : 70% 이상  
- 녹 색 : 30% ~ 70%  
- 빨간색 : 30% 이하(저전압 경고음이 발생합니다.)  

**참고** : 제어기의 블루투스 장치가 연결되지 않았을 때에는 상태 LED가 깜빡거립니다. 따라서, 상태 LED의 깜빡거림은 배터리 잔량과는 관계가 없습니다.
{: .notice--info}

**주의** : 충전이 완료되면 반드시 충전기와 충전지를 분리하여 보관해주시고, 충전중인 배터리를 사용해서 로봇을 구동하지 않도록 주의하세요.
{: .notice--warning}

## [퓨즈 교체하기](#퓨즈-교체하기)

CM-550에는 과전류가 흘러서 회로가 손상되는 것을 방지하기 위한 퓨즈(Fuse)가 있습니다.  
만약 CM-550이 배터리로는 전원이 켜지지 않고 SMPS로만 전원이 켜진다면 퓨즈가 끊어진 것이니 교체해 주어야 합니다.

![](/assets/images/edu/engineer/kit1/charger_fuse_1.png)

![](/assets/images/edu/engineer/kit1/charger_fuse_2.png)

제어기와 연결된 전원을 모두 분리하고 제어기 바닥면의 퓨즈를 핀셋으로 꺼낸다음 새 퓨즈로 교체합니다.  

**경고** : 반드시 어댑터와 충전지를 연결하지 않은 상태로 퓨즈를 교체해야 합니다.  
{: .notice--danger}


[2XL430-W250 매뉴얼 바로가기]: /docs/kr/dxl/x/2xl430-w250/
[로보플러스 태스크 3.0]: /docs/kr/software/rplustask3/
[로보플러스 태스크 2.0]: /docs/kr/software/rplus2/task/
[로보플러스 모션 2.0]: /docs/kr/software/rplus2/motion/
