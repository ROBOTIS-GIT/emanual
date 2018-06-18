---
layout: archive
lang: kr
ref: dms-80
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/sensors/dms-80/
sidebar:
  title: 거리 센서(DMS-80)
  nav: "dms-80"
---

![](/assets/images/parts/sensors/dms-80_product.jpg)

> 절대 거리 센서 DMS-80

# [개요](#개요)

- 일정 거리 이내의 물체나 벽을 감지할 때 사용할 수 있습니다.
- 적외선 센서에 비해 색깔에 영향을 거의 받지 않으며, 정확한 거리를 측정할 수 있습니다.

`제어기별 연결장치` [제어기별 연결장치]

# [사양](#사양)

- 무게 : 4.4g
- 감지 거리 : 10 ~ 80 cm
- 권장 공급 전압 : 4.5 ~ 5.5 V

# [핀 배열 정보](#핀-배열-정보)

![](/assets/images/parts/sensors/dms-80_pinout.png)

1. VCC(5V)
2. GND
3. ADC(거리 센서 감지값을 아날로그 신호로 출력)

**주의**: 케이블을 잘못된 방향이나 무리한 힘으로 끼우거나 빼면 커넥터가 파손될 수 있으니 주의해주세요. 
{: .notice--warning}

# [센서 출력](#센서-출력)

- 반사율 90%의 흰 종이와 반사율 18% 의 회색 종이에 대한, 거리 변화에 따른 아날로그 출력 전압과 이를 RoboPlus에서 확인한 그래프입니다.
- 색과 반사율이 변해도, 거리에 따른 출력값 변화가 거의 없는 것을 확인할 수 있습니다.

![](/assets/images/parts/sensors/dms-80_voltage_graph.png)

# [튜토리얼](#튜토리얼)

- RoboPlus Task : 로보플러스 태스크의 [DMS-80] 섹션 참조

[제어기별 연결장치]: /docs/kr/parts/controller/controller_compatibility/
[DMS-80]: /docs/kr/software/rplus1/task/programming_02/#dms-sensor
