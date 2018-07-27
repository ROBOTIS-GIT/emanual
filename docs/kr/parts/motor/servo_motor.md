---
layout: archive
lang: kr
ref: servo_motor
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/motor/servo_motor/
sidebar:
  title: 서보 모터
  nav: "servo_motor"
---

# [개요](#개요)

![img](/assets/images/parts/motor/servo_motor_product.jpg)

> 서보 모터 SM-10

- 올로(OLLO)에서 사용되는 모터로 CM-100 에 연결하여 포트 제어를 통해 동작을 제어할 수 있습니다.
- "회전 모드" 로 설정하면 감속모터와 동일하게 동작시킬 수 있으며, "관절 모드" 로 설정하면 회전 속도(힘)와 위치값 지정을 통해 모터를 지정된 위치까지 움직이도록 할 수 있습니다.
- 관절을 움직이거나 조향장치를 움직이는 등 조건에 따라 특정한 각도를 유지해야 하는 곳에 주로 사용합니다.

- `제품 호환 가이드` [제어기 호환표]

# [제품 사양](#제품-사양)

- 무게 : 16g
- 크기 : 18mm x 36mm x 27mm (with horn)
- 기어비 : 194:1
- 속력 : 85 RPM(at 3.0V)
- 특징
  - 위치센서(POT)
  - 안전장치(클러치) 장착

## [제어각](#제어각)

- 올로의 서보 모터는 0&deg; ~ 300&deg; 까지 위치를 제어할 수 있으며, 최소 제어각은 약 0.29&deg; (300&deg;/1024) 입니다.
- 하지만 올로의 서보모터는 다이나믹셀에 비해 정밀하지 못하고, 출력(토크)이 약하기 때문에, 서보모터의 원리와 사용법에 대한 기본적인 학습을 위한 용도로 사용되는 것이 알맞으며, 정밀한 제어를 필요로 하는 곳에 사용하기에는 적합하지 않습니다.

 ![img](/assets/images/parts/motor/servo_motor_01.png)

# [핀 배열](#핀-배열)

![img](/assets/images/parts/motor/servo_motor_pinout.png)

1. MOT-
2. GND
3. ADC : 모터의 현재 위치를 아날로그 신호로 출력
4. VCC
5. MOT+

**참고**: 케이블을 잘못된 방향이나 무리한 힘으로 끼우거나 빼면 커넥터가 파손될 수 있으니 주의해주세요.
{: .notice}

# [사용 방법](#사용-방법)

- 로보플러스 태스크 [서보모터] 사용법 참조
- 사용 가능한 어드레스 목록
  - 동작모드
  - 속도
  - 위치

# [동영상](#동영상)

 <iframe width="560" height="315" src="https://www.youtube.com/embed/-qRy_NDd5eU" frameborder="0" allowfullscreen></iframe>

 [서보모터]: /docs/kr/software/rplus1/task/programming_02/#서보모터
 [제어기 호환표]: /docs/kr/parts/controller/controller_compatibility/
