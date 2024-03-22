---
layout: archive
lang: kr
ref: dxl_y
permalink: /docs/kr/dxl/y/
sidebar:
  title: 다이나믹셀-Y
  nav: "dynamixel_y"
---

![](/assets/images/dxl/y/y_series_product.png)

DYNAMIXEL-Y is ROBOTIS’ industrialized premium smart actuator solution for full scale Robots

# [제품 라인업](#제품-라인업)

![](/assets/images/dxl/y/dxl_y_productline_kr.png)

> 다이나믹셀-Y 시리즈 라인업

**Features**
- High Performance Frameless motor
- Multi-turn Absolute Encoder
- Integrated Electric Brake for Safety
- Integrated Dynamixel Drive(DYD)
- Compact & Simple Design with Hollow Shaft
- Dynamic Motor Controller

# [주요 사양](#주요-사양)

|     모델명          |   크기(mm)    |   무게  |  해상도    |       구성       |
|:-------------------:|:-------------:|:------:|:----------:|:---------------:|
| [YM070-210-M001-RH] | Ø70 x 50.9    | 340g   | 524,288    | Motor          |
| [YM070-210-R051-RH] | Ø70 x 71.1    | 790g   | 26,738,688 | Motor, Reducer |
| [YM070-210-R099-RH] | Ø70 x 71.1    | 790g   | 51,904,512 | Motor, Reducer |
| [YM080-230-M001-RH] | Ø80 x 54.1    | 530g   | 524,288    | Motor          |
| [YM080-230-R051-RH] | Ø80 x 78.1    | 1,200g | 26,738,688 | Motor, Reducer |
| [YM080-230-R099-RH] | Ø80 x 78.1    | 1,200g | 51,904,512 | Motor, Reducer |

# [통신 회로](#통신-회로)

## [UART 연결 회로도](#uart-연결-회로도)

Main Controller를 직접 제작하여 다이나믹셀-Y를 제어하기 위해서는 Main Controller UART의 신호를 RS485 type으로 변환시켜 주어야 합니다. 다음은 권장 회로도 입니다.

![](/assets/images/dxl/y/uart_connection.PNG)

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용 가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}

다이나믹셀 전용 제어기에는 위의 회로가 내장되어 있습니다. 위의 회로도에서 TTL Level의 TxD와 RxD는 TX_Enable_5V의 Level에 따라 다음과 같이 Data 신호의 방향이 결정됩니다.
- TX_Enable_5V =High인 경우: TxD의 신호가 D+, D-로 출력
- TX_Enable_5V =Low인 경우: D+, D-의 신호가 RxD로 입력

## [핀 배열](#핀-배열)
DYNAMIXEL-Y 커넥터의 핀 배열은 아래 그림과 같습니다.

### [YM070](#ym070)
![](/assets/images/dxl/y/70_connect_cable_1.png) 

![](/assets/images/dxl/y/70_connect_cable_2.png)

### [YM080](#ym080)
![](/assets/images/dxl/y/80_connect_cable_1.png)

![](/assets/images/dxl/y/80_connect_cable_2.png)

**경고**: 배선 시에는 핀 배열이 틀리지 않도록 각별히 주의하십시오. 올바르게 연결되지 않을 경우 다이나믹셀의 심각한 손상을 초래할 수 있습니다.
{: .notice--warning}

[YM070-210-M001-RH]: /docs/kr/dxl/y/ym070-210-m001-rh/
[YM070-210-R051-RH]: /docs/kr/dxl/y/ym070-210-r051-rh/
[YM070-210-R099-RH]: /docs/kr/dxl/y/ym070-210-r099-rh/
[YM080-230-M001-RH]: /docs/kr/dxl/y/ym080-230-m001-rh/
[YM080-230-R051-RH]: /docs/kr/dxl/y/ym080-230-r051-rh/
[YM080-230-R099-RH]: /docs/kr/dxl/y/ym080-230-r099-rh/