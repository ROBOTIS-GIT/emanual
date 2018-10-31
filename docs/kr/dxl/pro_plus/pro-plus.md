---
layout: archive
lang: kr
ref: dxl_pro_plus
permalink: /docs/kr/dxl/pro-plus/
sidebar:
  title: DYNAMIXEL PRO+
  nav: "dynamixel_pro_plus"
---

![](/assets/images/dxl/pro_plus/pro-plus.png)

# [다이나믹셀 PRO+](#다이나믹셀-PRO+)

![](/assets/images/dxl/pro/dxl_pro_productline_kr.jpg)

> 다이나믹셀 PRO+ 라인업

- **일체형 로봇 구동장치** : 로봇의 관절에 필요한 기능을 하나의 모듈로 만들었습니다.

  ![](/assets/images/dxl/pro/dxl_pro_intro_kr.gif)

- **힘세고 단단한 사이클로이드 감속기**: 다이나믹셀 프로는 탈부착이 가능한 사이클로이드 감속기를 사용합니다. 싸이클로이드 방식을 사용함으로서 작고 가벼우면서도 감속비가 높은 감속 장치를 실현하였습니다. 또한 싸이클로이드 감속기는 진동 충격에 강한 내구성과 작은 백래쉬를 자랑합니다.
다양한 모델: 다이나믹셀 프로의 모터 전력, 감속기 형태, 감속비, 통신 타입, 가격대 등 구동기에 필요한 많은 사양을 다양화 하였습니다. 따라서, 사용자는 자신의 로봇에 보다 알맞는 다이나믹셀 프로를 선택하실 수 있습니다.

- **다양한 제어 알고리즘**: 다이나믹셀 프로는 위치, 속도, 전류 등 3가지 방식의 제어를 알고리즘을 사용합니다. 사용자는 이 3가지 방식의 제어기를 조합하여 자신의 로봇에 알맞게 튜닝하여 사용하실 수 있습니다. 전류 제어의 경우 다이나믹셀 프로와 함께 제공되는 전류 대 토크 상관관계 그래프를 사용하실 경우, 토크 제어기로 응용하여 사용하실 수 있습니다.

- **정밀 제어**: 최대 1,003,846(1회전)의 높은 분해능을 사용하여 제어하기 때문에, 사용자는  0.0004도의 작은 각도를 정밀하게 제어하실 수 있습니다.

# [주요 사양](#주요-사양)

|모델명|출력|크기(mm)|무게|해상도|모터|
|:---:|:---:|:---:|:---:|:---:|:---:|
|[H54P-200-S500-R](/docs/kr/dxl/pro_plus/h54p-200-s500-r/)|200W|54 x 126 x 54|855g|1,003,846|BLDC (Maxon)|
|[H54P-100-S500-R](/docs/kr/dxl/pro_plus/h54p-100-s500-r/)|100W|54 x 108 x 54|740g|1,003,846|BLDC (Maxon)|
|[H42P-020-S300-R](/docs/kr/dxl/pro_plus/h42p-020-s300-r/)|20W|42 x 84 x 42|340g|607,500|Coreless (Maxon)|

# [통신 회로](#통신-회로)

## [UART 연결 회로도](#uart-연결-회로도)
Main Controller를 직접 제작하여 다이나믹셀 프로를 제어하기 위해서는 Main Controller UART의 신호를 RS485 type으로 변환시켜 주어야 합니다. 다음은 권장 회로도 입니다.

![](/assets/images/dxl/pro/485_circuit_pro.png)

[MAX485 Datasheet](http://ecee.colorado.edu/~mcclurel/max485ds.pdf)

전원은 Pin1(-), Pin2(+)를 통하여 다이나믹셀로 공급됩니다. (다이나믹셀 전용 제어기에는 위의 회로가 내장되어 있습니다)

위의 회로도에서 TTL Level의 TxD와 RxD는 DIRECTION 485의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.
- DIRECTION485 Level =High인 경우: TxD의 신호가 D+, D-로 출력
- DIRECTION485 Level =Low인 경우: D+, D-의 신호가 RxD로 입력

## [핀 배열](#핀-배열)
커넥터의 핀 배열은 아래 그림과 같습니다. 다이나믹셀 프로에 있는 두 개의 4P 커넥터는 내부에서 서로 연결되어 있으므로 두 개 중 어떠한 커넥터에 연결해도 다이나믹셀 프로 시리즈를 구동시킬 수 있습니다. 또한, 2Pin 커넥터는 파워 커넥터 전용으로, 높은 전류를 사용할 때에는, 이 커넥터를 통해서 전원을 공급해주는 것을 권장합니다.

![](/assets/images/dxl/pro_plus/pin_name.png)

![](/assets/images/dxl/pro_plus/connection.png)

![](/assets/images/dxl/pro_plus/wiring.png)

**경고** : 배선 시에는 핀 배열이 틀리지 않도록 각별히 주의하십시오. 올바르게 연결되지 않을 경우 다이나믹셀의 심각한 손상을 초래할 수 있습니다.
{: .notice--warning}

## [연결 확인](#연결-확인)

배선을 통하여 다이나믹셀에 전원이 올바르게 공급되었다면 다이나믹셀의 LED가 한 번 깜박입니다.

## [기구 도면](#기구-도면)
출력부(혼)의 도면이 변경되었습니다. 다음은 PRO와 변경된 PRO+의 도면 입니다.

![](/assets/images/dxl/pro_plus/h54p_drawing.png)
