---
layout: archive
lang: kr
ref: dyd-17
read_time: true
share: false
author_profile: false
permalink: /docs/kr/all-dyd/dyd-17/
sidebar:
  title: DYD-17
  nav: "dyd-17"
product_group: all-dyd
---

# [개요](#개요)

![](/assets/images/dyd/dyd_17_product_image_01.png)

> DYD-17

## [세부사양](#세부사양)

|             Properties             |    Unit     | DYD-17-051 | DYD-17-099 | Note |
| :--------------------------------: | :---------: | :--------: | :--------: | :--: |
|             Gear ratio             |      -      |     51     |     99     |  -   |
|       Repeatable peak torque       |     Nm      |    34.0    |    54.0    |  -   |
| Read output torque<br>(@2,000 rpm) |     Nm      |    16.0    |    24.0    |  -   |
|        Maximum input speed         |     rpm     |   6,000    |   6,000    |  -   |
|        Average input speed         |     rpm     |   2,000    |   2,000    |  -   |
|         Moment of intertia         | X10-4 kgm^2 |   0.284    |   0.322    |  -   |
|       Backlash     |    arcmin    |    <3.0    |    <3.0    |  -   |
|            Lost motion             |   arcmin    |    <3.0    |    <3.0    |  -   |
|        Torsional stiffness         |  Nm/arcmin  |    2.2     |    2.2     |  -   |
| Efficiency(@2,000 rpm, 20 &#8451;) |      %      |     58     |     58     |  -   |
|          Starting torque           |     cNm     |     30     |     30     |  -   |
|         Back-Drive torque          |     Nm      |    5.0     |    5.0     |  -   |
|            Service life            |    horse    |   5,000    |   5,000    |  -   |
|        Dimension (O.D. X H)        |     mm      | 78 x 34.2  | 78 x 34.2  |  -   |
|               Weight               |      g      |    600     |    600     |  -   |

**참고**: 제품의 성능 개선을 위해 사양은 변경될 수 있습니다.
{: .notice}

{% include kr/dyd/dyd_warning.md %}

## [효율특성](#효율특성)

감속기의 효율은 주변 환경의 온도 및 입력속도에 따라 달라질 수 있으며, 특히 입력속도-출력부하에 대한 효율특성은 다음과 같습니다.

![](/assets/images/dyd/dyd_17_efficiency.png){: width="700px"}

> DYD-17 효율특성 그래프, 시험환경 : 온도 22도, 습도 55%

# [기구도면](#기구도면)

![](/assets/images/dyd/dyd_17_drawings.png)

> DYD-17 기구도면

# [호환성 및 옵션](#호환성-및-옵션)

## [Higher ratio reduction(additional planetary gear, PG option) 고감속 옵션(유성기어 추가감속), PG옵션](#higher-ratio-reductionadditional-planetary-gear-pg-option-고감속-옵션유성기어-추가감속-pg옵션)

고속의 모터를 적용하기 위해 추가 감속이 필요한 경우, PG 옵션을 통해 다양한 감속비를 구성할 수 있습니다.

![](/assets/images/dyd/dyd_17_pg_option_01.png)

> PG 옵션

|  DYD gear ratio  | 51  |  -  |  -  |  -  | 99  |  -  |  -  |  -  |
| :--------------: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|  PG gear ratio   |  3  |  4  |  5  |  7  |  3  |  4  |  5  |  7  |
| Total gear ratio | 153 | 204 | 255 | 357 | 297 | 396 | 495 | 693 |

## [입력부 샤프트 옵션](#입력부-샤프트-옵션)

DYD의 입력부에 구동 시스템(모터 또는 구동소스)을 구성함에 있어서 다양한 입력축이 제공될 수 있습니다.

| Option |                   Type - C                    |               Type - D                |                  Type - SC                  |
| :----: | :-------------------------------------------: | :-----------------------------------: | :---------------------------------------: |
| Shape  | ![](/assets/images/dyd/dyd_clamp_ring_01.png) | ![](/assets/images/dyd/dyd_d_cut.png) | ![](/assets/images/dyd/dyd_set_screw.png) |
|  Name  |                  Clamp-ring                   |                 D-Cut                 |                 Set-screw                 |

{% capture dyd_input_shaft_reference %}

**참고**: 다음 표에서 각 DYD에서 기본으로 제공하는 입력축을 참고하세요.

| DYD-11  |  DYD-14  |  DYD-17  |
|:-------:|:--------:|:--------:|
| Type-SC | Type - C | Type - C |
{% endcapture %}

<div class="notice">{{ dyd_input_shaft_reference | markdownify }}</div>

# [조립 예시](#조립-예시)

## [조립공차](#조립공차)

DYD를 적용하여 시스템을 구성함 있어서, 입력부, 출력부, 고정부에 대한 참조 형상과 각 파트의 치수공차 및 기하 공차를 활용하여 효율적으로 시스템을 구성할 수 있습니다.

![](/assets/images/dyd/dyd_17_assembly_tollerance_01.png){: width="700px"}

> 조립공차

## [PG 옵션 조립예시](#pg-옵션-조립예시)

고감속 모듈인 PG옵션은 모터를 부착하기위한 브라켓이 필요합니다. 단, 브라켓은 제공되지 않습니다.

![](/assets/images/dyd/dyd_17_pg_option_assembly_01.png)

> PG 옵션 조립예시
