---
layout: archive
lang: kr
ref: dxl-selection-guide
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/dxl-selection-guide/
sidebar:
  title: 다이나믹셀 선택 가이드
  nav: "dxl-selection-guide"
---

{::options parse_block_html="true" /}

# [시작하기](#시작하기)

다이나믹셀을 선택할때 로보티즈에서 제공하는 제품들과의 호환성을 먼저 고려해야합니다. 제시된 항목들은 다이나믹셀을 사용함에 있어서 고려되어야할 항목들 입니다. 

- [다이나믹셀 ](#다이나믹셀-)
- [전원](#전원)
- [제어기와 인터페이스](#제어기와-인터페이스)
- [소프트웨어와 도구](#소프트웨어와-도구)

## [스토어](#스토어)

제품들은 로보티즈 스토어에서 구매가능합니다. (PSU 제외)

해외에 있는 유저들은 2-4 번 링크를 이용하세요. 

1. **ROBOTIS Shop (한국)**: [https://www.robotis.com/shop/](https://www.robotis.com/shop/)
2. **ROBOTIS America (USA)**: [https://robotis.us/](http://en.robotis.com/shop_en/)
3. **ROBOTIS Japan**: [https://e-shop.robotis.co.jp/](https://e-shop.robotis.co.jp/)
4. **ROBOTIS China**: [TaoBao](https://shop292418244.taobao.com/index.htm?spm=2013.1.w5002-17478325885.2.5bbc75c1kB9jsV)

# [다이나믹셀 ](#다이나믹셀-)

다이나믹셀 선택 시, 모델의 특성과 성능그래프를 참고하세요.

## [모델](#모델)

모델별로 특성(특징 및 성능, 폼팩터, 기어비, 통신 인터페이스)이 존재하며, 다이나믹셀 x 시리즈와 P 시리즈는 아래 네이밍 규칙에 따라 특성을 알수 있습니다. 

![](/assets/images/dxl/x/dxl_x_productline.png)
> 다이나믹셀-X 네이밍 규칙

![](/assets/images/dxl/p/dynamixel_pro_plus_lineup_table.jpg)
> 다이나믹셀-P 네이밍 규칙

**참고**: 다이나믹셀 AX시리즈와 MX 시리즈는 제시된 네이밍 규칙을 따르지 않습니다. [성능 그래프](#성능-그래프)로 이동하세요.
{: .notice}

## [성능 그래프](#성능-그래프)

다이나믹셀 선택시 가장 먼저 참조되어야 할것은, 성능 그래프(N-T 그래프) 입니다. 

성능 그래프는 다이나믹셀의 전반적인 성능을 파악할수있도록, 입력(토크)에 따른 각 데이터의 측정치를 보여줍니다. 

![](/assets/images/dxl/pro/h54-100-s500-r_performance_graph_2.png)
> 성능 그래프 (N-T 그래프)

**참고**: **Stall Torque**의 20%가 일반적인 시스템의 사용범주에 속합니다. Stall Torque는 제품 e-Manual의 **주요 사양**을 참고하세요. 
{: .notice}

1. **Torque(Nm)** - 다이나믹셀 출력축의 외부 부하(Nm)입니다.

2. **Speed(RPM)** - 외부 부하에 따른, 출력 속도(RPM)입니다. 토크를 기준으로 Speed는 그래프의 검정색 라인에 따라 변화됩니다. 

3. **Current(A)** - 외부 부하에 따른 출력 전류 입니다. 토크를 기준으로 Current는 그래프의 빨간색 라인을 따라 변화됩니다. 

4. **Efficiency(%)** - 내부의 DC모터와 기어세트를 거친 출력 효율 입니다. 모델이 가지는 DC모터와 기어세트에 따라 출력 효율은 부하와 속도 측면에서 달라질수 있습니다. 토크를 기준으로 Efficiency는 그래프의 초록색 라인에 따라 변화됩니다.

## [통신](#통신)

다이나믹셀의 주요 특징으로, 컨트롤 테이블(데이터 필드 집합)에 할당된 주솟값에 접근하여 데이터를 쓰고 읽습니다. 각 데이터를 쓰고 읽기 위해서는 반드시 **동일한 통신 프로토콜** ([TTL](#ttl) 또는 [RS485](#rs485))이 약속되어야 합니다. 

<details>
<summary>
![](/assets/images/icon_unfold.png) **팁**: **TTL과 RS485를 같이 사용할수 있는 방법이 있나요?**
</summary>

일반적으로 서로 다른 통신 프로토콜을 가지는 다이나믹셀은 서로 데이터를 주고 받을수 없습니다. 서로간의 통신을 해석 하기위해서는 통신변환 인터페이스인 [다인나믹셀 커뮤니케이션 브릿지](/docs/kr/parts/interface/dxl_bridge/)를 사용하세요.

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)
</details>

### [TTL](#ttl)

0 ~ 5V 논리레벨을 가지는 TTL은, 다이나믹셀의 기본 통신 프로토콜중 하나입니다. TTL을 사용하는 모델은 [네이밍 규칙](#모델)에 따라 모델 이름이 "-T"로 끝이납니다. 예를 들어, XL330-M288-T는 TTL 기반의 인터페이스를 사용하여 통신해야합니다. TTL모델은 후면 커넥터가 3핀으로 이루어져 있습니다. 

![](/assets/images/dxl/x/x_series_ttl_pin.png)  
> 다이나믹벨의 후면 커넥터 (3핀 JST, -T 모델)

<details>
<summary>
![](/assets/images/icon_unfold.png) **팁**: **다이나믹셀 통신회로 (TTL)**
</summary>
다이나믹셀을 제어하기 위해서는, 메인 제어기의 UART 신호를 Half-Duplex 타입으로 변환해야합니다. 다음은 그 권장 회로도입니다.
![](/assets/images/dxl/ttl_circuit.png)  

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}  

**참고**: XL330 시리즈의 통신 버스의 전압은 3.3V 이지만, 5V 통신 버스와도 호환됩니다.
{: .notice}  
</details>

### [RS485](#rs485)

장거리 통신을 위해서는 RS485 모델을 선택하는것이 좋습니다. RS485을 사용하는 모델은 [네이밍 규칙](#모델)에 따라 이름이 "-R"로 끝이납니다. 예를 들어, XD40-T150-R은 RS-485 기반의 인터페이스를 사용해서 통신해야 합니다. RS485 모델은 후면 커넥터가 4핀으로 이루어져 있습니다. 

![](/assets/images/dxl/x/x_series_485_pin.png)   
> 다이나믹벨의 후면 커넥터 (4핀 JST, -R 모델)

<details>
<summary>
![](/assets/images/icon_unfold.png) **팁**: **다이나믹셀 통신 회로(RS485)**
</summary>

다이나믹셀을 제어하기 위해서는, 메인 제어기의 UART 신호를 Half-Duplex 타입으로 변환해야합니다. 다음은 그 권장 회로도입니다.
![](/assets/images/dxl/x/x_series_485_circuit.jpg)  

**참고**: 위 회로는 5V 전원을 사용하는 MCU를 사용하거나 IO가 5V tolerant한 경우 사용가능합니다. 그 외의 경우, Level Shifter를 사용하세요.
{: .notice}  
</details>

# [전원](#전원)

다이나믹셀의 사용 전압에 따라, 적절한 전압을 공급하는것이 중요합니다. 선택가이드에서는 다이나믹셀과 자주 사용되는 전원 솔루션을 제시합니다. 

**참고**: 다이나믹셀을 데이지 체인으로 연결시, 커넥터가 받아드릴수 있는 허용 전류를 고려하는것이 좋습니다. 허용 전류는 **커넥터 정보** (e.g,[XD540-T150 커넥터 정보](/docs/kr/dxl/x/xd540-t150/#connector-information))를 참고하세요. 선택한 다이나믹셀에 따라, 사용되는 커넥터의 종류는 다를수 있습니다. (e.g, JST 또는 Molex)
{: .notice}

## [사용 전압](#사용-전압)

전원을 선택하기 전에, 다이나믹셀 모델별 사용 전압을 확인하세요. 

### [다이나믹셀 X 시리즈](#다이나믹셀-x-시리즈)

다이나믹셀 X 시리즈의 사용 전압은 선택한 모델에 따라 달라질수 있습니다. 아래 표를 참고하세요. 

| Symbol |                 사용 전압                 |               추천 전압               |
|:------:|:-----------------------------------------:|:-------------------------------------:|
|   M    |                 3.7 ~ 6.0                 |                **5.0**                |
| T / W  | 10.0 ~ 14.8<br>(Max 12V for XL430, XC330) | **12.0** <br>(11.1V for XL430, XC330) |
| H / V  |                   24.0                    |               **24.0V**               |

**참고**: **_Symbol_** 은 다이나믹셀-X의 [네이밍 규칙](#models)에서만 사용됩니다. 다이나믹셀 AX 및 MX 시리즈의 사용 전압은 [DYNAMIXEL.com](http://www.dynamixel.com/list.php?dxl=x)을 방문하여, **Voltage** 항목을 참고하세요.
{: .notice}

### [다이나믹셀 P 시리즈](#다이나믹셀-p-시리즈)

다이나믹셀 P 시리즈는 24V에서 동작합니다. 다이나믹셀-X의 `V` (24V 동작)모델과 호환가능합니다. 

|  시리즈   | 사용 전압 | 추천 전압 |
|:---------:|:---------:|:---------:|
| PM Series |   24.0    | **24.0**  |
| PH Series |   24.0    | **24.0**  |

## [전원 솔루션](#전원-솔루션)

### [SMPS](#smps)

SMPS는 인터페이스 또는 제어기를 통해 다이나믹셀에 전압을 공급하는 안정적인 전원 솔루션입니다. 로보티즈에서 제공되는 제어기와 인터페이스는 2.5mm ID / 5.5 mm OD, Center Positive 규격의 SMPS 호환 커넥터를 지원합니다. 
  
![](/assets/images/reference/selection_guide/selection_guide_smps.png)
> SMPS 12V, 5A

### [배터리](#배터리)

배터리는 시스템에게 자유로운 이동성을 보장합니다. 또한 방전율이 높고, 용량이 큰 Li-Po 배터리를 사용하게 된다면 전체 시스템에 장시간 충분한 전류를 제공할수도 있습니다. 시스템의 안전을 위해 PCM(Protection Circuit Modules)이 내장되어있는 배터리를 선택하는것이 권장됩니다. 
  
![](/assets/images/reference/selection_guide/selection_guide_lipo.png)
> LIPO Battery(LB-012) 11.1V 1800mAh 

### [PSU](#psu)

PSU는 시스템에게 좀 더 넓은 범위의 전원 선택지를 제공합니다. 특히 24V 사용 전압을 가진 다이나믹셀 P시리즈 및 다이나믹셀 X시리즈의 V모델과 함께 사용할때, PSU는 시스템에게 좋은 선택지가 될 수 있습니다. 전압 안정을 위해 충분한 용량과 전력이 공급되는 모델을 사용하는것이 권장됩니다.

# [제어기와 인터페이스](#제어기와-인터페이스)

제어기와 인터페이스는 다이나믹셀의 데이터를 읽거나 쓰기위해 사용합니다. 제시된 제어기와 인터페이스는, 다이나믹셀을 시작하기에 좋은 선택지가 될 수 있습니다.

{% capture sdk_notice_03 %}
**참고**: [제어기 호환표](/docs/kr/parts/controller/controller_compatibility/)에서 다이나믹셀 및 여러제품의 호환성을 확인해보세요.
{% endcapture %}
<div class="notice">{{ sdk_notice_03 | markdownify }}</div>

## [인터페이스](#인터페이스)

### [U2D2](#u2d2)
 
 U2D2는 USB 신호를 TTL 또는 RS485 신호로 변환해주는 통신 변환 인터페이스 입니다. PC에 U2D2와 같은 통신 인터페이스를 연결하여 [DYNAMIXEL Wizard 2.0]의, 다이나믹셀 테스트 (그래프/패킷 외 기타), 관리 및 환경설정이 가능하며, PC 및 SBC등과 함께 [다이나믹셀 SDK](#다이나믹셀-sdk) 개발 라이브러리를 사용하여 다이나믹셀에 데이터를 직접 읽고 쓸수 있습니다. 
 
![](/assets/images/parts/interface/u2d2_04.png){: width="400px", height="240px"}

아래의 다이나믹셀 스타터세트는, 다이나믹셀 개발(다이나믹셀 SDK) 및 테스트 (다이나믹셀 위자드 2.0)을 시작할수 있도록 준비된 패키지 입니다: [U2D2], [U2D2 Power Hub Board], SMPS 12V 5A AC Adapter 

  ![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_01.png) 

  > Connection Example of the DYNAMIXEL Starter Set

<!-- NOTE: DYNAMIXEL Quick Start Guide -->

### [다이나믹셀 쉴드](#다이나믹셀-쉴드)

[다이나믹셀 쉴드] 및 [다이나믹셀 쉴드 MKR]은 아두이노 보드를 가지고 있는 유저들을 위한, 쉴드 인터페이스 입니다. 제공되는 [DynamixelShield](#dynamixelshield) 라이브러리를 사용하여, 아두이노 환경에서 다이나믹셀을 사용해보세요. 

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_05.png) 
> Connection Example of DYNAMIXEL with DYNAMIXEL Shield

## [임베디드 제어기](#임베디드-제어기)

로보티즈에서 제공하는 임베디드 제어기는 아두이노 환경을 지원합니다. 

<!-- ### [OpenRB-150](#openrb-150)

The [OpenRB-150]  is a new open source controller that is highly compatible with the Arduino products. Using a dedicated library Dynamixel2Arduino(#dynamixel2arduino), you can just start off DYNAMIXEL with ease.
- SAMD21 Cortex-M0+ 32bit low power ARM® MCU allows the OpenRB to support feature of Arduino IDE. 
- More features with Arduino MKR formfactor Shield
- On-board 3Pin JST connectors to directely power and control the DYNAMIXEL.  
- With the firmware provided by the OpenRB Board Manager, you can scan use the OpenRB-150 with [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)  -->

### [OpenCR1.0](#opencr10)

[OpenCR 1.0]은 ARM Cortex-M7 및 IMU 센서 / 여러 포트가 내장된 사용한 강력한 성능의 오픈소스 로봇 제어기입니다. PCB Gerber, BOM, 펌웨어 및 소스코드등 개발에 필요한 자료가 공개 되어있으며, ROS 공식 플랫폼인 [TurtleBot3](/docs/en/platform/turtlebot3/overview/)의 제어기로 사용되었습니다. 
OpenCR 1.0은 아두이노 환경에서 [다이나믹셀 SDK](#다이나믹셀-sdk-arduino)와 [Arduino Library](#arduino-library)를 모두 지원합니다. 

![](/assets/images/parts/controller/opencr10/opencr_pinout.png) 
> OpenCR 1.0 Layout and Pin Map

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_03.png) 
> Connection Example of DYNAMIXEL with OpenCR 1.0

### [OpenCM9.04](#opencm904)

[OpenCM9.04]은 ARM Cortex-M7을 사용한 제어기입니다. 아두이노 환경에서 [다이나믹셀 SDK](#다이나믹셀-sdk-arduino)와 [Arduino Library](#arduino-library)를 모두 지원합니다. 

![](/assets/images/parts/controller/opencm904/opencm904_14.png)

{% capture exp_board %}
**참고**: [OpenCM485 확장 보드](/docs/kr/parts/controller/opencm485exp)를 사용하여, TTL 및 RS485 다이나믹셀까지 폭넓게 사용가능합니다.  
![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)

{% endcapture %}

<div class="notice">{{ exp_board | markdownify }}</div>

## [교육용](#교육용)

### [CM 시리즈](#cm-시리즈)

[교육용 키트](/docs/kr/edu/)에서 사용되는 CM 시리즈는 전용 [교육용 소프트웨어]를 지원하는, 고성능 레벨의 교육용 임베디드 제어기입니다. 

CM 시리즈는 로보티즈가 제공하는 전용 센서를 사용할수 있도록 올로 포트를 제공하며, 교육용 소프트웨어를 통해 쉽게 센서의 값을 읽고 제어할수 있습니다. 

![](/assets/images/dxl/dxl_quick_start_insert/dxl_control_04.png)
> Connection Example of DYNAMIXEL with CM series.

![](/assets/images/parts/controller/cm-150/cm-150_002.jpg)
> e.g, OLLO Ports for sensor controls on CM-150

다음 제어기들은, 로보티즈에서 사랑받는 교육용 제어기입니다. 제공된 링크로 접근하여, 자세한 사항을 확인하세요. 
- [OpenCM9.04]
- [CM-530]
- [CM-550]

**참고**: 더 많은 교육용 제어기는 [제어기](/docs/kr/parts/all-controller/) 페이지에서 확인하세요.
{: .notice}

**참고**: 모든 센서가 CM시리즈의 각 제어기와 호환되는것은 아닙니다. [부품 호환표](/docs/kr/parts/controller/controller_compatibility/#부품-호환표)를 참고하여, 호환되는 센서와 제어기를 확인하세요. 
{: .notice}

## [기타 제어기](#기타-제어기)

로보티즈는 [다이나믹셀 시스템](/docs/kr/platform/)과 [교육용 키트](/docs/kr/edu/)에서 제공되는 여러 제어기를 다수 제공하고 있습니다. 더 많은 정보를 위해, [제어기](/docs/kr/parts/all-controller/) 페이지를 참고하세요.

# [소프트웨어와 도구](#소프트웨어와-도구)

다이나믹셀 시스템을 제어하기위해서, 적절한 소프트웨어를 사용하는것은 중요한 요소입니다. 제시된 도구에서, 다이나믹셀 테스트 및 관리도구 / 개발도구 / 교육용 소프트웨어를 선택하세요. 

[소프트웨어 호환표](/docs/kr/parts/controller/controller_compatibility/#소프트웨어-호환표)를 참고하여, 선택한 소프트웨어가 제어기와 호환되는지 확인 할 수 있습니다.

## [테스트 및 관리도구](#테스트-및-관리도구)

### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/)은 다양한 OS(Linux / Mac / Windows)에서 사용가능한 다이나믹셀에 최적화된 관리 도구 입니다. 
다이나믹셀을 사용한다면, 매우 권장되는 도구입니다. ([U2D2](#u2d2) 또는 [호환 제어기](/docs/kr/parts/controller/controller_compatibility/#기타-소프트웨어) 필요)

다음의 특징들이 있습니다. 

- 다이나믹셀 펌웨어 업데이트 
- 다이나믹셀 자가진단
- 다이나믹셀 설정 및 테스트
- 실시간 데이터 플로팅 모니터링 (그래프)
- 패킷 송/수신 및 모니터링

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_001.png)

### [R+ Manager 2.0](#r-manager-20)

[R+ Manager 2.0](/docs/kr/software/rplus2/manager/)은 로보플러스 소프트웨어중 하나입니다. R+Manager 2.0은 CM 시리즈 및 교육용 키트에서 제공되는 [CM 시리즈](#cm-시리즈)의 유지보수(펌웨어 복구 및 업데이트) 및 CM 시리즈에 연결된 다이나믹셀의 테스트를 위해서 사용될수 있습니다. 

![](/assets/images/sw/rplus2/manager/roboplus_manager2_07.jpg)

**참고**: 교육용 키트 또는 CM시리즈 사용자가 아니라면, 다이나믹셀 전용 관리프로그램 [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)을 사용하세요.
{: .notice}

## [개발도구](#개발도구)

### [다이나믹셀 SDK](#다이나믹셀-sdk)

<iframe width="560" height="315" src="https://www.youtube.com/embed/F-sXbIAM0jc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

[다이나믹셀 SDK](/docs/kr/software/dynamixel/dynamixel_sdk/overview/)는 주요 OS(Windows, Mac, Linux)에서, 다양한 개발언어(C, C++, C#, Python, Java, Matlab and LabVIEW)를 지원하는 개발 키트 라이브러리 입니다. 제공되는 API를 사용하여, 다이나믹셀의 데이터에 쉽게 접근하여 데이터를 쓰고 읽을수 있습니다. 

**참고**: 다이나믹셀에 읽고 쓰기위해서는, 디바이스의 출력 신호 (USB 또는 UART)를 다이나믹셀 통신 프로토콜인 TTL 및 RS485 통신 회로를 구성하여 신호를 변환해야합니다. 다이나믹셀 SDK를 PC 및 SBC 환경에서 사용한다면, 통신 변환 인터페이스인 [U2D2](#u2d2)사용이 권장됩니다. 다이나믹셀의 통신 회로는 [통신](#통신)를 참고하세요. 
{: .notice}

#### [다이나믹셀 SDK (Arduino)](#다이나믹셀-sdk-arduino)

[임베디드 제어기](#임베디드-제어기)는 [Arduino IDE](/docs/kr/software/arduino_ide/)에서 다이나믹셀 SDK를 사용 할수 있습니다. 

**참고**: 아두이노 IDE에서 저레벨 수준의 개발 언어 사용이 필요하지 않다면, 직관적인 API를 제공하는 [Dynamixel2Arduino](#dynamixel2arduino) 라이브러리 사용이 권장됩니다. 
{: .notice}

### [아두이노 라이브러리](#아두이노-라이브러리)

로보티즈는 아두이노 환경에서 다이나믹셀 시스템 개발을 위한 라이브러리와 함께 다양한 예제를 제공합니다. 
- [Dynamixel2Arduino](#dynamixel2arduino)
- [DynamixelShield](#dynamixelshield)

![](/assets/images/parts/interface/dynamixel_shield/examples.png)
> DynamixelShield Library: 제공 예제

#### [Dynamixel2Arduino](#dynamixel2arduino)

[Dynamixel2Arduino]는 [다이나믹셀 SDK](#다이나믹셀-sdk-arduino)를 기반으로 설계된 라이브러리 입니다. 유저 친화적인 API를 제공하며, 다이나믹셀 SDK 보다 쉬운 코드 환경 제공합니다. 
- [API 확인하기](/docs/kr/software/arduino_ide/#dynamixel2arduino-library)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

#### [DynamixelShield](#dynamixelshield)

[DynamixelShield] 라이브러리는 [Dynamixel2Arduino](#dynamixel2arduino)의 기능을 상속받은 [다이나믹셀 쉴드](#다이나믹셀-쉴드) 전용 라이브러리 입니다. 

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

## [교육용 소프트웨어](#교육용-소프트웨어)

교육용 소프트웨어는, [교육용 키트](/docs/kr/edu/)와 [CM 시리즈](#cm-시리즈)와 호환되는 전용 소프트웨어 입니다.
- 태스크 와 모션 프로그래밍 도구는 교육용 키트에서 사용되는 기본예제를 제공합니다. 
- 교육용 키트에서 사용되는 CM 시리즈 제어기 관리 및 테스트를 위한, 전용 관리도구 [R+ Manager 2.0](#r-manager-20)을 사용할수 있습니다. 

### [로보플러스](#로보플러스)

CM 시리즈와 교육용 키트에서 사용가능한 소프트웨어인, R+ (로보플러스)는 유저 친화적인 프로그래밍 환경을 지원합니다. 더 많은 정보는 [로보플러스](/docs/kr/software/#로보플러스)를 참고하세요. 

![](/assets/images/sw/rplus_task3/task3_001.png)
> R+Task 3.0

[DYNAMIXEL Wizard 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[다이나믹셀 SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[U2D2]: /docs/kr/parts/interface/u2d2/
[U2D2 Power Hub Board]: /docs/kr/parts/interface/u2d2_power_hub/
[Software]: /docs/kr/software/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[The OpenCM 485 Expansion Board]: /docs/kr/parts/controller/opencm485exp/
[OpenCR 1.0]: /docs/kr/parts/controller/opencr10/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[R+ 3.0 software]: /docs/kr/software/rplustask3/
[다이나믹셀 쉴드]: /docs/kr/parts/interface/dynamixel_shield/
[다이나믹셀 쉴드 MKR]: /docs/kr/parts/interface/mkr_shield
[RC-100]: /docs/kr/parts/communication/rc-100/
[LN-101]: /docs/kr/parts/interface/ln-101/
[Dynamixel2Arduino]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[DynamixelShield]: https://github.com/ROBOTIS-GIT/DynamixelShield
