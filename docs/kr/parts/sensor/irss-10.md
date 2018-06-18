---
layout: archive
lang: kr
ref: irss-10
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/sensor/irss-10/
sidebar:
  title: 적외선 센서(IRSS-10)
  nav: "irss-10"
---

![](/assets/images/parts/sensors/ir.jpg)

> 적외선 센서 IRSS-10

# [개요](#개요)

- 적외선을 발생시켜 반사되어 들어오는 양을 측정하는 방식입니다.
- 적외선의 특성상 같은 거리의 물체도 색상이나 밝기에 따라 반사되는 양이 달라지므로, 물체와의 거리를 정밀하게 측정하기에는 적합하지 않습니다.

# [사양](#사양)

- 무게 : 4g
- 크기 : 24mm x 18mm x 12mm

# [핀 배열 정보](#핀-배열-정보)

![](/assets/images/parts/sensors/irss-10_pinout.png)

1. SIG1 : Low신호를 유지해야 함.
2. GND
3. ADC : IR 수광부에서 감지한 값을 아날로그 신호로 출력
4. VCC ( 3.3V )
5. SIG2 : High신호를 주면 IR LED를 켤 수 있음.

**주의**: 케이블을 잘못된 방향이나 무리한 힘으로 끼우거나 빼면 커넥터가 파손될 수 있으니 주의해주세요. 
{: .notice--warning}

**주의**: 제어기의 전원이 반드시 꺼져있는 상태에서 제품을 연결해주세요. 전원이 켜져있는 상태에서 연결 시, 오동작 및 고장을 일으킬 수 있습니다. 
{: .notice--warning}

# [거리와 센서값의 관계](#거리와-센서값의-관계)

- 흰색 물체에 대한 거리에 따른 센서값의 변화를 대략적으로 나타낸 그래프입니다. 센서값은 물체의 색상이나 주변 환경에 따라서도 달라질 수 있습니다.
- 적외선 센서는 발광부와 수광부가 분리되어 있기 때문에 아래 그래프에서와 같이 지나치게 가까운 곳의 물체는 적외선이 반사되어 수광부로 들어오는 각도가 맞지 않아서 오히려 센서값이 줄어드는 구간이 생기는 것을 알 수 있습니다. 또한 15cm 이상 떨어진 물체는 거의 감지할 수 없습니다.

![](/assets/images/parts/sensors/ir_graph.png)

# [튜토리얼](#튜토리얼)

- RoboPlus Task : 로보플러스 태스크의 [적외선 센서] 섹션 참조

[적외선 센서]: /docs/kr/software/rplus1/task/programming_02/#적외선센서

# [동영상](#동영상)

<iframe width="560" height="315" src="https://www.youtube.com/embed/-qRy_NDd5eU" frameborder="0" allowfullscreen></iframe>
 
[제어기별 연결장치]: /docs/kr/parts/controller/controller_compatibility/
