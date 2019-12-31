---
layout: archive
lang: kr
ref: bt-410-dongle
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/communication/bt-410-dongle/
sidebar:
  title: BT-410 Dongle
  nav: "bt-410-dongle"
---

# [개요](#개요)

![img](/assets/images/parts/communication/bt-410_dongle_product.jpg)

> BT-410 동글

`BT-410동글`은 USB 2.0 인터페이스와 블루투스 4.0 저전력 표준 통신 인터페이스(마스터 기능)를 지니고 있으며 두 인터페이스를 변환해 주는 부품입니다.  
즉, BT-410동글을 PC에 장착하고 `BT-410 SLAVE 모듈`(1개)과 페어링을 하면 PC와 BT-410 SLAVE 모듈이 서로 데이터를 주고 받을 수 있습니다.  
(각 부품에 장착하는 방법은 부품별 설명 페이지를 참고하세요.)

**1. BT-410 동글과 연동이 가능한 무선통신 모듈**
  - BT-410 Slave 모듈

**2. BT-410 동글과 연동이 불가능한 무선통신 모듈**
  - BT-410 MASTER 모듈
  - BT-210 MASTER 모듈
  - BT-210 SLAVE 모듈
  - BT-100/110A
  - ZIG-100/110A

## 사용 예시

![img](/assets/images/parts/communication/bt-410_dongle_01.png)

**주의**: 제어기의 전원이 반드시 꺼져있는 상태에서 제품을 연결해주세요. 전원이 켜져있는 상태에서 연결시, 오동작 및 고장을 일으킬 수 있습니다.
{: .notice--warning}


# [제품 사양](#제품-사양)

|     항목      |                      세부 내용                      |
|:-------------:|:----------------------------------------------:|
|     무게      |                      7.5g                      |
|     크기      |             50.5mm x 20mm x 10.5mm             |
| 블루투스 사양 | Bluetooth Specification 4.0 Low Energy Support |
| 유효 통신거리 |                      10M                       |
|  주파수 대역  |                2.4GHz ISM Band                 |
|   Bandwidth   |                  MAX 128kbps                   |
| 기본 통신속도 |                   57,600bps                    |
|   동작 전압   |                      5.0V                      |
|   소모전류    |                   25mA (Max)                   |
|   동작 온도   |               0&deg;C ~ 40&deg;C               |
|   통신속도    |            1,200bps ~ 1,000,000bps             |
|    안테나     |                  Chip Antenna                  |
|  인터페이스   |               USB 2.0 Full Speed               |
|     감도      |                -81dBm (Typical)                |
|  공중선전력   |              -6 ~ 4dBm (Class 2)               |

## [사용 가능한 통신속도](#사용-가능한-통신속도)

{% include kr/parts/communication/bt_baudrate.md %}

# [호환성](#호환성)
BT-410 동글과 BT-410 Slave 모듈의 조합으로 가능한 작업

|     제품     | 펌웨어 복구<br />로보플러스 매니저 2.0 | 펌웨어 업데이트<br />로보플러스 매니저 2.0 | Entry | [R+ Scratch] | 태스크 2.0<br />다운로드 | 모션 2.0<br />다운로드 |
|:------------:|:--------------------------------------:|:------------------------------------------:|:-----:|:------------:|:------------------------:|:----------------------:|
|    CM-50     |                   O                    |                     O                      |   -   | O (영문버전) |            O             |           -            |
|   [CM-150]   |                   O                    |                     O                      |   -   |      -       |            O             |           -            |
|   [CM-200]   |                   O                    |                     O                      |   -   |      -       |            O             |           O            |
|   [CM-530]   |                   O                    |                     O                      |   -   |      -       |            O             |           O            |
| [OpenCM7.0]  |                   O                    |                     O                      |   O   |      O       |            O             |           -            |
| [OpenCM9.04] |                   O                    |                     O                      |   -   |      -       |            O             |           O            |
| [자동차로봇] |                   -                    |                     -                      |   O   |      O       |            -             |           -            |

# [통신 모드](#통신-모드)

BT-410 동글은 페어링 연결을 통해 신뢰성 있는 1:1 통신을 할 수 있습니다.

## [1:1 통신](#11-통신)

- 전원이 켜진 PC의 USB 포트에 장착하면 파란색 LED가 깜박이며, BT-410 SLAVE 모듈과 페어링이 성공하게 되면 파란색 LED가 계속 켜져 있게 됩니다.
- **자동페어링 방법** : BT-410 동글의 파란 LED가 깜박일 때(페어링 되어 있지 않음) BT-410 SLAVE 모듈을 가까이 갖다 대면(10cm 이내) 자동으로 페어링이 됩니다. (그 이후는 먼 거리에서도 페어링 되어 통신 가능.)

# [BT-410 동글 설정하기](#bt-410-동글-설정하기)
시스템 리셋, SLAVE 주소 설정, 자동페어링 기능 활성화/비활성화, **모드 변경 불가**

## [설정](#설정)

1. BT-410 동글을 PC에 연결 한 다음 드라이버 설치 후 COM포트 번호를 확인 합니다.

    - `다운로드` [Tera Term](https://osdn.net/projects/ttssh2/releases/)

    ![img](/assets/images/parts/communication/bt-410_dongle_02.png)

    - 해당 COM포트로 Tera Term 터미널 프로그램을 실행하고 File > a New connection 을 클릭합니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_03.png)

2. BT-410 동글의 COM 포트 번호를 선택

    ![img](/assets/images/parts/communication/bt-410_dongle_04.png)

3. Serial Port 설정창

    ![img](/assets/images/parts/communication/bt-410_dongle_05.png)

4. 통신속도를 57600 으로 설정

    ![img](/assets/images/parts/communication/bt-410_dongle_06.png)

5. Terminal 설정창

    ![img](/assets/images/parts/communication/bt-410_dongle_07.png)

6. Local echo 기능 활성화

    ![img](/assets/images/parts/communication/bt-410_dongle_08.png)

7. 터미널에서 아래와 같이 !표를 입력하면 OK가 뜨고 커맨드 모드로 진입합니다. 여기서 AT를 입력하고 엔터를 치면 계속 OK가 뜨는 것이 확인되면 성공적으로 BT-410과 연결되었고 설정을 할 수 있습니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_09.png)

8. 주변장치 검색 기능입니다. 아래와 같이 AT+BTINQ=DBE7DF000001를 입력 후 엔터를 누르면 현재 주변 BLE 장치 중 MAC 주소가 DBE7DF000001 이상인 장치들이 검색됩니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_10.png)

9. 장치 연결은 AT+BTINQ 커맨드로 주변 장치 검색을 하고 난 뒤 표시된 블루투스 어드레스(16진수 12자리)를 통해 페어링 연결 합니다. 예를 들면 위의 DBE7-DF-000001이라는 블루투스 어드레스를 ‘-‘표시 제외하고 ATDDBE7DF000001이라고 입력 후 엔터를 누르면 연결을 시도합니다.

# [AT 명령어](#at-명령어)

아래와 같이 터미널에서 AT 커맨드를 통해 BT-410 동글의 설정을 변경할 수 있고 AT커맨드의 종류는 아래와 같습니다.

1. 시스템 리셋  
  ATZ를 입력 후 엔터를 누르면 아래와 같이 BT-410 동글이 재시작 됩니다. 만약 설정을 변경하였다면 변경된 모드로 재시작합니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_11.png)

2. 주변장치 검색  
  아래와 같이 AT+BTINQ를 입력 후 엔터를 누르면 현재 주변 블루투스 장치 중 MAC 주소가 DBE7DF000001 이상인 장치들이 검색됩니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_12.png)

3. 자동 페어링  
  페어링 되지 않은 BT-410 SLAVE 모듈을 BT-410 동글 가까이(대략 10cm 이내) 근접시키면 자동을 페어링 됩니다.

4. 자동 페어링 기능 비활성화  
  AT+BTAUTOPAIR=0 을 입력 후 ENTER 키 입력

    ![img](/assets/images/parts/communication/bt-410_dongle_13.png)

    몇 초 뒤에 아래와 같이 성공메세지가 출력됨

    ![img](/assets/images/parts/communication/bt-410_dongle_14.png)

5. 자동 페어링 기능 활성화  
  AT+BTAUTOPAIR=1 을 입력 후 ENTER 키 입력

    ![img](/assets/images/parts/communication/bt-410_dongle_15.png)

    몇 초 뒤에 아래와 같이 성공 메세지가 출력됨

    ![img](/assets/images/parts/communication/bt-410_dongle_16.png)

6. 통신속도 변경  
  `AT+BTUART`,`baudrate`,`parity_bit`,`stop_bit`    
  `Example` AT+BTUART,57600,n,1  

# [드라이버 설치 확인방법](#드라이버-설치-확인방법)

BT-410 동글 드라이버가 PC에 바르게 설치되었는지 확인하는 방법은 다음과 같습니다.

1. PC 의 **USB 포트**에 BT-410 동글을 연결합니다.

    ![img](/assets/images/parts/communication/bt-410_dongle_17.png)

2. **내 컴퓨터** 위에서 마우스 **오른쪽 클릭**으로 뜨는 **팝업 메뉴**의 **관리**를 선택합니다.

    ![img](/assets/images/parts/interface/ln101_01.png)

3. '**장치 관리자**'의 '**범용 직렬 버스 컨트롤러**' 장치 목록에서 '**USB Serial Converter**' 를 확인합니다.

    ![img](/assets/images/parts/interface/ln101_02.png)

4. '**포트 (COM 및 LPT)**' 장치 목록에서 '**USB Serial Port(COMx)**' 를 확인합니다. (COM 포트 번호는 시스템마다 다를 수 있습니다.)

    ![img](/assets/images/parts/interface/ln101_03.png)

# [드라이버 수동 설치](#드라이버-수동-설치)

**참고**: RoboPlus 를 설치하게 되면 자동으로 FTDI Driver (USB2DYNAMIXEL, USB다운로더(LN-101), BT-410 동글 드라이버)가 설치됩니다. 만약 RoboPlus 를 설치하지 않고, 해당 드라이버를 설치하거나, RoboPlus 설치 시 드라이버가 제대로 설치되지 않았을 경우 아래와 같은 방법으로 드라이버를 수동으로 설치하십시오.
{: .notice}

1. PC 에 장치를 연결합니다. 드라이버가 설치되어 있지 않을 경우 새 하드웨어 검색 마법사 시작 창이 뜹니다.  
  목록 또는 특정 위치에서 설치(고급)(S) -> 다음(N)

    ![img](/assets/images/parts/interface/ln101_04_kr.png)   

2. 드라이버의 위치를 지정합니다.  
  RoboPlus 를 설치한 경우 드라이버는 RoboPlus 설치 폴더의 LN101 폴더에 있습니다.  
  또는 최신 버전의 드라이버를 설치하고자 하는 경우 [FTDI Driver Download](http://www.ftdichip.com/Drivers/VCP.htm) 페이지에서 VCP Drivers 의 최신 버전을 받으시면 됩니다.

    - [Windows 32bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)
    - [Windows 64bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)

    ![img](/assets/images/parts/interface/ln101_05_kr.png)

    ![img](/assets/images/parts/interface/ln101_06_kr.png)

3. 다음(N) 을 누르면 설치가 진행되며 USB Serial Converter 의 드라이버 설치가 완료됩니다.

    ![img](/assets/images/parts/interface/ln101_07_kr.png)

4. 동일한 방법으로 USB Serial Port 드라이버도 설치해 줍니다.

    ![img](/assets/images/parts/interface/ln101_08_kr.png)

# [참고자료](#참고자료)

## [인증 획득](#인증-획득)
표기되지 않은 인증에 대해서는 별도 문의하시기 바랍니다.
- KCC, FCC, CE

[R+ Scratch]: /docs/kr/software/rplus2/scratch/
[CM-150]: /doc/kr/parts/controller/cm-150
[CM-200]: /doc/kr/parts/controller/cm-200
[CM-530]: /doc/kr/parts/controller/cm-530
[OpenCM7.0]: /docs/kr/parts/controller/opencm70/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[자동차로봇]: /docs/kr/edu/car/
