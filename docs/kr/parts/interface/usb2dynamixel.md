---
layout: archive
lang: kr
ref: usb2dynamixel
share: true
author_profile: false
permalink: /docs/kr/parts/interface/usb2dynamixel/
sidebar:
  title: USB2Dynamixel
  nav: "usb2dynamixel"
---

# [개요](#개요)

![img](/assets/images/parts/interface/usb2dynamixel_product.jpg)

> USB2Dynamixel

USB2Dynamixel은 PC 에서 다이나믹셀을 직접 구동하기 위해 사용되는 장치입니다. USB2Dynamixel 은 PC 의 USB 포트에 연결되어 사용되며, 각종 다이나믹셀이 연결될 수 있도록 3P 커넥터 및 4P 커넥터가 내장되어 있습니다.  

또한 USB2Dynamixel 은 노트북 등 시리얼 포트가 없는 PC 에서 USB 포트를 시리얼 포트로 변환할 때 이용될 수 있습니다. 이 기능은 CM-2, CM-2+, CM-5, CM-510 과 같은 다이나믹셀 전용 제어기를 USB 포트에 연결하여 이용할 경우 또는 로봇을 무선으로 제어하기 위해서 ZIG2Serial 을 USB 포트에 연결하여 이용할 경우 유용하게 사용될 수 있습니다.

## PC 를 이용한 다이나믹셀 제어

![img](/assets/images/parts/interface/usb2dynamixel_01.png)

## 시리얼 포트의 변환

![img](/assets/images/parts/interface/usb2dynamixel_02.png)

## 무선통신

![img](/assets/images/parts/interface/usb2dynamixel_03.png)

**NOTE** : USB2Dynamixel 통신이 불안정하다면 전압레벨 차이 일수 있습니다. 연결된 장비 및 PC가 그라운드와 연결되어 있는지 확인해주세요.
{: .notice}

# [각 부 명칭](#각-부-명칭)

![img](/assets/images/parts/interface/usb2dynamixel_04.jpg)

![img](/assets/images/parts/interface//usb2dynamixel_05.jpg)

| 명 칭       | 설 명                                      |
| :--------: | :---------------------------------------: |
| 상태 표시 LED | 전원 공급, TXD(data 쓰기), RXD(data 읽기) 상태를 표시합니다. |
| 기능 선택 스위치 | TTL, RS-485, RS-232 의 통신 방법을 선택합니다.      |
| 3P 커넥터    | TTL 통신으로 AX 시리즈의 다이나믹셀과 연결합니다.           |
| 4P 커넥터    | RS-485 통신으로 DX, RX 시리즈의 다이나믹셀과 연결합니다.    |
| 시리얼 커넥터   | RS-232 통신으로 USB 포트를 시리얼 포트로 변환합니다.       |

## [핀 배열](#핀-배열)

아래 그림은 USB2Dynamixel 에 사용되는 커넥터 핀들의 용도입니다. 각 핀들을 사용자의 용도에 맞게 이용하고자 하는 경우 각 핀들의 용도를 숙지하신 뒤 사용하시기 바랍니다.

- 4P / 3P 케이블 커넥터의 핀 배치도

  ![img](/assets/images/parts/interface//usb2dynamixel_07.jpg)

- 시리얼 커넥터의 핀 배치도

  ![img](/assets/images/parts/interface//usb2dynamixel_08.jpg)

# [통신모드 선택 방법](#통신모드-선택-방법)

아래 그림과 같이 USB2Dynamixel의 스위치를 변경하여 통신 모드를 선택할 수 있습니다.

![img](/assets/images/parts/interface/usb2dynamixel_06.png)

1. TTL 통신 : AX 시리즈, AX-S1 등 3핀 포트를 이용하는 다이나믹셀
2. RS485 통신 : DX 시리즈 , RX 시리즈, EX 시리즈 등 4핀 포트를 이용하는 다이나믹셀
3. RS232 통신 : CM-5, CM-510 등의 시리얼 케이블을 이용하는 제어기

# [사용 방법](#사용-방법)

- Dynamixel SDK : [Dynamixel SDK]를 이용해 다이나믹셀을 C언어로 직접 제어할 수 있습니다.

# [전원 공급](#전원-공급)

USB2Dynamixel은 다이나믹셀에 전원을 공급하지 않습니다. 따라서 다이나믹셀을 구동시키기 위해서는 아래와 같이 전원을 별도로 공급해 주어야 합니다. 각 다이나믹셀의 모델별 적정 공급 전압은 각 다이나믹셀 설명 페이지를 참고하세요.

{% capture warning_01 %}
**주의**: **전원 공급시 주의사항**
- 안정적인 전원공급을 위해 로보티즈 제어기나 SMPS2Dynamixel을 통한 전원공급을 권장드립니다.
- 다이나믹셀에 케이블을 연결할 때는 전원이 꺼진 상태에서 연결하는 것이 좋습니다.
{% endcapture %}

<div class="notice--warning">{{ warning_01 | markdownify }}</div>

## 다이나믹셀에 전원 인가

![img](/assets/images/parts/interface//usb2dynamixel_09.jpg)

PIN Figure 를 참조하여 커넥터의 2번 PIN 에는 플러스(+) 전원을, 커넥터의 1번 PIN 에는 마이너스(-) 전원을 인가하십시오.(다이나믹셀의 커넥터 2개는 동일한 것이므로 둘 중 어떠한 곳에 전원을 인가해도 무방합니다.)

## USB2Dynamixel과 다이나믹셀 사이에 전원 인가

![img](/assets/images/parts/interface//usb2dynamixel_10.jpg)

위와 같이 다이나믹셀에 전원을 인가할 수 없는 경우 아래와 같이 USB2Dynamixel 과 다이나믹셀 사이에 전원을 인가하십시오. USB2Dynamixel 커넥터 2번 PIN 에 연결되어 있는 전선을 분리하여 플러스(+) 인가합니다.USB2Dynamixel 커넥터 1번 PIN 에 연결되어 있는 전선에 Y 결선으로 전선을 추가로 연결하여 마이너스(-) 전원을 인가합니다.

# [드라이버 설치 확인](#드라이버-설치-확인)

USB 다운로더 드라이버가 PC에 바르게 설치되었는지 확인하는 방법은 다음과 같습니다.

1. PC 의 USB 포트에 USB 다운로더(LN-101 or USB2Dynamixel) 를 연결합니다.

    ![img](/assets/images/edu/task_download_01.jpg)

2. 내 컴퓨터 위에서 마우스 오른쪽 클릭으로 뜨는 팝업 메뉴의 관리를 선택합니다.

    ![img](/assets/images/parts/interface//ln101_driververify_01.png)

3. '장치 관리자'의 '범용 직렬 버스 컨트롤러' 장치 목록에서 'USB Serial Converter' 를 확인합니다.

    ![img](/assets/images/parts/interface//ln101_driververify_02.png)

4. '포트 (COM 및 LPT)' 장치 목록에서 `USB Serial Port(COMx)` 를 확인합니다.(COM 포트 번호는 시스템마다 다를 수 있습니다.)

    ![img](/assets/images/parts/interface//ln101_driververify_03.png)

# [드라이버 수동 설치](#드라이버-수동-설치)

로보플러스를 설치하게 되면 자동으로 FTDI Driver (USB2Dynamixel, USB다운로더(LN-101), BT-410 동글 드라이버)가 설치됩니다. 만약 로보플러스를 설치하지 않고, 해당 드라이버를 설치하거나, 로보플러스설치 시 드라이버가 제대로 설치되지 않았을 경우 아래와 같은 방법으로 드라이버를 수동으로 설치하십시오.
{: .notice}

1. PC 에 장치를 연결합니다. 드라이버가 설치되어 있지 않을 경우 새 하드웨어 검색 마법사 시작 창이 뜹니다.  
  목록 또는 특정 위치에서 설치(고급)(S) -> 다음(N)

    ![img](/assets/images/parts/interface//ln101_04_kr.png)

2. 드라이버의 위치를 지정합니다.  
  로보플러스를 설치한 경우 드라이버는 로보플러스설치 폴더의 LN101 폴더에 있습니다.  
  또는 최신 버전의 드라이버를 설치하고자 하는 경우 [FTDI Driver Download](http://www.ftdichip.com/Drivers/VCP.htm) 페이지에서 VCP Drivers 의 최신 버전을 받으시면 됩니다.

    - [Windows 32bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)
    - [Windows 64bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)

    ![img](/assets/images/parts/interface//ln101_05_kr.png)

    ![img](/assets/images/parts/interface//ln101_06_kr.png)

3. 다음(N) 을 누르면 설치가 진행되며 USB Serial Converter 의 드라이버 설치가 완료됩니다.

    ![img](/assets/images/parts/interface//ln101_07_kr.png)

4. 동일한 방법으로 USB Serial Port 드라이버도 설치해 줍니다.
    
    ![img](/assets/images/parts/interface//ln101_08_kr.png)


# [동영상](#동영상)

<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>

[Dynamixel SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
