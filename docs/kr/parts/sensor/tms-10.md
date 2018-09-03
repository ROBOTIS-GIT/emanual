---
layout: archive
lang: kr
ref: tms-10
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/sensor/tms-10/
sidebar:
  title: 온습도 센서(TMS-10)
  nav: "tms-10"
---

![](/assets/images/parts/sensors//tms_sensor.jpg)

> 온습도 센서 TMS-10

# [개요](#개요)

- 주변 환경의 온도 및 토양중의 상대습도를 감지 할 수 있는 센서입니다.
- 센서의 다리 부분을 토양 속에 다 넣어야 정확한 상대습도를 측정할 수 있습니다.

`제어기별 연결장치` [제어기별 연결장치]

# [사양](#사양)

- 무게 : 4g
- 크기 : 30mm x 72mm x 5mm
- 측정 가능 감지 범위 : 20cm ~ 2m
- 측정 가능 감지 각도 : +/- 45 도

# [핀 배열 정보](#핀-배열-정보)

![](/assets/images/parts/sensors//tms_sensor1.jpg)

1. 사용안함
2. GND
3. ADC : 물체 감지 상태 출력
4. VCC ( 3.3V / 5V)
5. SIG2

# [SIG2 신호에 따른 센서 기능](#sig2-신호에-따른-센서-기능)

|SIG 2|ADC|
|:---:|:--:|
|LOW  |   온도 관련 값|
|HIGH|    상대습도 관련 값|

**주의**: 케이블을 잘못된 방향이나 무리한 힘으로 끼우거나 빼면 커넥터가 파손될 수 있으니 주의해주세요.
{: .notice--warning}

**주의**: 제어기의 전원이 반드시 꺼져있는 상태에서 제품을 연결해주세요. 전원이 켜져있는 상태에서 연결 시, 오동작 및 고장을 일으킬 수 있습니다. 
{: .notice--warning}

[제어기별 연결장치]: /docs/kr/parts/controller/controller_compatibility/
