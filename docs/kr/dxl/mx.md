---
layout: archive
lang: kr
ref: mx-series
permalink: /docs/kr/dxl/mx/
sidebar: 
  title: DYNAMIXEL MX Series
  nav: "dxl_mx_main"  
---

# [특징](#특징)

|                   MX-106T/R                   |                 MX-64T/R/AT/AR                 |                 MX-28T/R/AT/AR                 |                    MX-12W                    |
|:----------------------------------------------:|:----------------------------------------------:|:----------------------------------------------:|:--------------------------------------------:|
| ![](/assets/images/dxl/mx/mx-106t_product.jpg) | ![](/assets/images/dxl/mx/mx-64ar_product.png) | ![](/assets/images/dxl/mx/mx-28ar_product.jpg) | ![](/assets/images/dxl/mx/mx-12_product.jpg) |

- 비접촉식 앱솔루트 엔코더를 적용하여 내구성, 정밀도, 제어 범위 증가.

- 데드 구간없이 360° 전 영역의 위치제어 가능.

- 360°를 0.088° 단위로 4096단계에 걸쳐 제어 가능.

- Endless Turn Mode에서 속도 제어 가능.

- PID 제어를 통해 위치제어 신뢰성 및 정확성 증가.

- 4.5Mbps의 고속 통신을 지원.

- (MX-64 / MX-106) 전류 센싱을 통한 토크 제어.

- (MX-106) 마스터 / 슬레이브 방식의 듀얼 모드 지원.

# [MX 시리즈](#mx-시리즈)

**공통 사양**  
- MCU : ARM CORTEX-M3 (72 \[MHz], 32Bit)  
- 해상도 : 4096 \[pulse/rev]  
- 모터 :
  - MX-28/64/106 : Coreless(Maxon)
  - MX-12: Cored

| 프로토콜 1.0     | 프로토콜 2.0          | Stall Torque                                                                                           | 무부하 속도                                                                          |
|:-----------------|:----------------------|:-------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------|
| [MX-106T/R]      | [MX-106T/R(2.0)]      | 8.0 [N.m] (at 11.1 [V], 4.8 [A])<br>8.4 [N.m] (at 12[V], 5.2 [A])<br>10.0 [N.m] (at 14.8 [V], 6.3 [A]) | 41 [rev/min] (at 11.1 [V])<br>45 [rev/min] (at 12 [V])<br>55 [rev/min] (at 14.8 [V]) |
| [MX-64T/R/AT/AR] | [MX-64T/R/AT/AR(2.0)] | 5.5 [N.m] (at 11.1 [V], 3.9 [A])<br>6.0 [N.m] (at 12 [V], 4.1 [A])<br>7.3 [N.m] (at 14.8 [V], 5.2 [A]) | 58 [rev/min] (at 11.1 [V])<br>63 [rev/min] (at 12 [V])<br>78 [rev/min] (at 14.8 [V]) |
| [MX-28T/R/AT/AR] | [MX-28T/R/AT/AR(2.0)] | 2.3 [N.m] (at 11.1 [V], 1.3 [A])<br>2.5 [N.m] (at 12 [V], 1.4 [A])<br>3.1 [N.m] (at 14.8 [V], 1.7 [A]) | 50 [rev/min] (at 11.1 [V])<br>55 [rev/min] (at 12 [V])<br>67 [rev/min] (at 14.8 [V]) |
| [MX-12W]         | -                     | 0.2 [N&middot;m] (at 12 [V], 1.4 [A])                                                                  | 470 [rev/min] (at 12 [V])                                                            |

[MX-12W]: /docs/kr/dxl/mx/mx-12w/         
[MX-28T/R/AT/AR]: /docs/kr/dxl/mx/mx-28-2/
[MX-64T/R/AT/AR]: /docs/kr/dxl/mx/mx-64/
[MX-106T/R]: /docs/kr/dxl/mx/mx-106/
[MX-28T/R/AT/AR(2.0)]: /docs/kr/dxl/mx/mx-28-2/
[MX-64T/R/AT/AR(2.0)]: /docs/kr/dxl/mx/mx-64-2/
[MX-106T/R(2.0)]: /docs/kr/dxl/mx/mx-106-2/
