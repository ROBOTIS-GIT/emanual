---
layout: archive
lang: kr
ref: zig2serial
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/communication/zig2serial/
sidebar:
  title: ZIG2Serial
  nav: "zig2serial"
---

# [개요](#개요)

![img](/assets/images/parts/communication/zig2serial_product.png)

> ZIG2Serial

- ZIG-100 의 ID 변경 : [로보플러스 매니저] 를 통해 ID 변경 가능
- PC 에서 ZIGBee 통신을 통해 로봇과 시리얼 통신
  - PC 의 프로그램은 별도로 제작해야 합니다.
  - 통신 테스트는 [로보플러스 매니저]로 할 수 있습니다.

# [제품 사양](#제품-사양)

|항목|설명|
|:---:|:---:|
|무게|11.12g|
|크기|56mm x 34mm x 12mm|
|동작 전압|4.5V ~ 5.5V|
|통신속도|57,600bps|

# [각 부 명칭](#각-부-명칭)

![img](/assets/images/parts/communication/zig2serial_01.png)


| 명칭 | 설명 |
|:---:|:---|
|  통신 상태 표시 LED      | RS-232 에서 ZIG-100 을 통해 나가는 신호가 있을 때는 TXD 가 켜지고, ZIG-100 을 통해 들어오는 신호가 있으면 RXD 가 켜집니다. |
|  ZIG-100 커넥터       | ZIG2Serial 에 ZIG-100 을 연결하기 위한 커넥터 입니다.  |
|  ZIG-100 상태 표시 LED | ZIG-100 의 상태를 표시합니다.꺼져 있는 경우 : ZIG-100 이 연결되지 않았거나 설정 상태일 경우입니다.켜져 있는 경우 : 상대 ZIG-100 과 연결되어 통신 준비가 된 상태입니다.깜빡거리는 경우 : 상대 ZIG-100 을 찾지 못한 상태입니다. |
|  리셋 스위치            | ZIG-100 을 재부팅 시킬 때 사용합니다.                |
|  전원 커넥터            | ZIG2Serial 이 동작하기 위해서는 5V 전원이 필요합니다. 사용자는 이 커넥터를 이용해서 전원을 공급할 수 있습니다. USB2Dynamixel 에 연결하여 사용하는 경우는 별도 전원 공급이 필요 없습니다. |
|  RS232 커넥터         | PC 의 RS-232 포트에 연결할 수 있습니다.              |

# [핀 배열](#핀-배열)

![img](/assets/images/parts/communication/zig2serial_02.png)

# [사용 방법](#사용-방법)

## [PC에 연결](#pc에-연결)

PC 에는 시리얼 포트라는 RS-232 통신용 커넥터가 있습니다. ZIG2Serial 의 RS-232 커넥터를 여기에 연결하면 됩니다. 만약 PC 에 시리얼 포트가 없으면 시중에 판매되는 USB2Serial 컨버터를 구매해서 사용해야 합니다.

## [전원 공급](#전원-공급)

ZIG2Serial이 동작하기 위해서는 5V 전원을 공급해야 합니다. ZIG2Serial 의 전원 커넥터를 이용해서 전원을 공급할 수 있습니다. 전원 연결용 케이블은 다음의 Pin 배열을 참고해서 직접 제작해야 합니다.

![img](/assets/images/parts/communication/zig2serial_03.png)

**외부 전원 연결용 저항** 위치에는 `0옴 저항`을 달아주거나 `납으로 연결`시켜 주어야 외부 전원이 공급됩니다.

당사의 [USB2Dynamixel] 제품을 사용할 경우 USB2Dynamixel 에서 ZIG2Serial 에 전원을 공급해 주어 별도의 전원 공급 없이 사용할 수 있습니다.

**WARNING** : **외부 전원 연결용 저항을 연결한 경우 반드시 제거 후 사용해 주세요!**
{: .notice-warning}

![img](/assets/images/parts/communication/zig2serial_04.png)

## [ZIG-100 연결](#zig-100-연결)

ZIG-100 의 방향에 주의하여 연결하시기 바랍니다.

![img](/assets/images/parts/communication/zig2serial_05.png)

## [BT-100 연결](#bt-100-연결)

BT-100 의 방향에 주의하여 연결하시기 바랍니다.

![img](/assets/images/parts/communication/zig2serial_bt100.jpg)

## [Broadcast 채널 선택](#broadcast-채널-선택)

ZIG-100은 CHANNEL_SEL 1,2 핀을 이용해서 Broadcast 채널을 선택할 수 있습니다. ZIG2Serial에서는 채널 선택을 위해 연결 설정을 변경해야 합니다.

![img](/assets/images/parts/communication/zig2serial_06.png)

- Open은 연결하지 않은 것으로 납을 제거하면 됩니다.
- Short는 연결한 것으로 납을 묻혀 놓으면 됩니다.
- R5와 R6에 있는 저항은 0Ω이므로 제거하고 대신 납을 묻혀도 무방합니다.
- ZIG2Serial은 공장 출하 시 기본적으로 R5, R6, R7이 모두 Short가 되어 채널 1로 설정되어 있습니다. R7의 납만 제거했다 묻혔다 해서 채널 1과 4를 쉽게 선택할 수 있습니다

**NOTE** : 자사 제품인 CM-5의 경우 ZIG-100을 장착했을 때, Broadcast 채널 1이 선택되도록 되어있습니다. 만약, ZIG2Serial을 다른 채널로 설정한 경우 Broadcast 통신 모드에서 CM-5와 통신이 되지 않습니다. 
{: .notice}

| 채널  | ZIG2Serial의 연결 상태               |
|:---:|:---:|
|1|R7 => Short<br />R6 => Short<br />R5 => Short|
|2|R7 => Short<br />R6 => Open<br />R5 => Short|
|3|R7 => Short<br />R6 => Short<br />R5 => Open|
|4|R7 => Short<br />R6 => Open<br />R5 => Open|
|4|R7 => Open<br />R6 => Don’t care<br />R5 => Don’t care|


# [활용 방법](#활용-방법)

- RoboPlus Manager : [로보플러스 매니저]를 통해 ZIG-100, ZIG-110의 설정값을 세팅할 수 있습니다.
- Zigbee SDK : [Zigbee SDK]를 통해 C언어로 Zigbee를 제어할 수 있습니다.


# [회로도](#회로도)

![img](/assets/images/parts/communication/zig2serial_07.gif)


# [동영상](#동영상)

<iframe width="560" height="315" src="https://www.youtube.com/embed/YgebCObXJZg" frameborder="0" allowfullscreen></iframe>

[로보플러스 매니저]: /docs/kr/software/rplus1/manager/
[USB2Dynamixel]: /docs/kr/parts/interface/usb2dynamixel/
[Zigbee SDK]: /docs/kr/software/embedded_sdk/zigbee_sdk/
