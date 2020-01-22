---
layout: archive
lang: kr
ref: dxl_pro
permalink: /docs/kr/dxl/pro/
sidebar:
  title: 다이나믹셀 PRO
  nav: "dynamixel_pro"
---





![](/assets/images/dxl/pro/dynamixelpro_main.jpg)
> 다이나믹셀 PRO

**주의** :  다이나믹셀 PRO는 는 현재 단종되어 더 이상 판매되지 않습니다.
{: .notice--warning}

# [제품 라인업](#제품-라인업)

![](/assets/images/dxl/pro/dxl_pro_productline_kr.jpg)

> 다이나믹셀 PRO 라인업

- **일체형 로봇 구동장치** : 로봇의 관절에 필요한 기능을 하나의 모듈로 만들었습니다.

  ![](/assets/images/dxl/pro/dxl_pro_intro_kr.jpg)

- **힘세고 단단한 사이클로이드 감속기**: 다이나믹셀 PRO는 탈부착이 가능한 사이클로이드 감속기를 사용합니다. 싸이클로이드 방식을 사용함으로서 작고 가벼우면서도 감속비가 높은 감속 장치를 실현하였습니다. 또한 싸이클로이드 감속기는 진동 충격에 강한 내구성과 작은 백래쉬를 자랑합니다.

- **다양한 모델**: 다이나믹셀 PRO의 모터 전력, 감속기 형태, 감속비, 통신 타입, 가격대 등 구동기에 필요한 많은 사양을 다양화 하였습니다. 따라서, 사용자는 자신의 로봇에 보다 알맞는 다이나믹셀 PRO를 선택하실 수 있습니다.

- **다양한 제어 알고리즘**: 다이나믹셀 PRO는 위치, 속도, 전류 등 3가지 방식의 제어를 알고리즘을 사용합니다. 사용자는 이 3가지 방식의 제어기를 조합하여 자신의 로봇에 알맞게 튜닝하여 사용하실 수 있습니다. 전류 제어의 경우 다이나믹셀 PRO와 함께 제공되는 전류 대 토크 상관관계 그래프를 사용하실 경우, 토크 제어기로 응용하여 사용하실 수 있습니다.

- **정밀 제어**: 1회전당 최대 502,000(0.0007[&deg;C]/pulse)의 높은 분해능을 사용하여 제어하기 때문에, 사용자는 작은 각도로 정밀하게 제어하실 수 있습니다.

# [주요 사양](#주요-사양)

|                                                    모델명                                                    |   크기(mm)    | 무게 | 해상도  |      모터       |
|:------------------------------------------------------------------------------------------------------------:|:-------------:|:----:|:-------:|:---------------:|
| [H54-200-S500-R](/docs/en/dxl/pro/h54-200-s500-r/)<br>[H54-200-S500-R(A)](/docs/en/dxl/pro/h54-200-s500-ra/) | 54 x 126 x 54 | 855g | 501,923 |   BLDC(Maxon)   |
| [H54-100-S500-R](/docs/en/dxl/pro/h54-100-s500-r/)<br>[H54-100-S500-R(A)](/docs/en/dxl/pro/h54-100-s500-ra/) | 54 x 108 x 54 | 732g | 501,923 |   BLDC(Maxon)   |
|   [H42-20-S300-R](/docs/en/dxl/pro/h42-20-s300-r/)<br>[H42-20-S300-R(A)](/docs/en/dxl/pro/h42-20-s300-ra/)   | 42 x 84 x 42  | 340g | 303,750 | Coreless(Maxon) |
|   [M54-60-S250-R](/docs/en/dxl/pro/m54-60-s250-r/)<br>[M54-60-S250-R(A)](/docs/en/dxl/pro/m54-60-s250-ra/)   | 54 x 126 x 54 | 853g | 251,417 |   BLDC(Maxon)   |
|   [M54-40-S250-R](/docs/en/dxl/pro/m54-40-s250-r/)<br>[M54-40-S250-R(A)](/docs/en/dxl/pro/m54-40-s250-ra/)   | 54 x 108 x 54 | 710g | 251,417 |   BLDC(Maxon)   |
|   [M42-10-S260-R](/docs/en/dxl/pro/m42-10-s260-r/)<br>[M42-10-S260-R(A)](/docs/en/dxl/pro/m42-10-s260-ra/)   | 42 x 72 x 42  | 269g | 263,187 | Coreless(Maxon) |
|                               [L54-50-S290-R](/docs/en/dxl/pro/l54-50-s500-r/)                               | 54 x 108 x 54 | 656g | 207,692 |      BLDC       |
|                               [L54-50-S500-R](/docs/en/dxl/pro/l54-50-s290-r/)                               | 54 x 108 x 54 | 656g | 361,384 |      BLDC       |
|                               [L54-30-S400-R](/docs/en/dxl/pro/l54-30-s500-r/)                               | 54 x 108 x 54 | 612g | 288,395 |      BLDC       |
|                               [L54-30-S500-R](/docs/en/dxl/pro/l54-30-s400-r/)                               | 54 x 108 x 54 | 591g | 361,384 |      BLDC       |
|                               [L42-10-S300-R](/docs/en/dxl/pro/l42-10-s300-r/)                               | 42 x 72 x 42  | 257g |  4,096  |    Coreless     |

# [통신 회로](#통신-회로)

{% include kr/dxl/communication_circuit_pro.md %}
