---
layout: archive
lang: kr
ref: dxl_bridge
read_time: true
share: true
permalink: /docs/kr/parts/interface/dxl_bridge/
author_profile: false
sidebar:
  title: 다이나믹셀 커뮤니케이션 브릿지
  nav: "dxl_bridge"
---

# [개요](#개요)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png){: width='300px'}

**다이나믹셀 커뮤니케이션 브릿지**는 RS485 통신 다이나믹셀(4 Pin, JST 타입)과 TTL 통신 다이나믹셀(3 Pin, JST 타입)의 통신을 상호 호환할 수 있도록 연결해 주는 역할을 합니다.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/oRbzORRpgqg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

{% capture why_bridge %}
**참고**

[U2D2 인터페이스](/docs/kr/parts/interface/u2d2/)의 TTL과 RS485 단자는 마스터 PC와 서로 연결되어 있지만, TTL과 RS485간의 통신 선로는 연결되어 있지 않습니다. 따라서, U2D2를 통한 TTL과 RS485 다이나믹셀간의 **Broadcast Ping, Sync 및 Bulk Read**와 같은 Instruction Packet 통신은 불가능합니다.
- Instruction Packet에 대한 자세한 정보는, [다이나믹셀 프로토콜 1.0](/docs/kr/dxl/protocol1/#instruction-packet) or [프로토콜 2.0](/docs/kr/dxl/protocol2/#instruction-packet)을 참고하세요.

![](/assets/images/parts/interface/dxl_bridge/u2d2_separate_ttl_485.png){: width='600px'}

반면, 다이나믹셀 커뮤니케이션 브릿지는 TTL과 RS485 간의 상호 전환을 가능하게 하므로 다이나믹셀간의 **Broadcast Ping, Sync 및 Bulk Read** Instruction Packet 통신이 가능합니다.  

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png)

{% endcapture %}
<div class="notice">{{ why_bridge | markdownify }}</div>

# [제품 사양](#제품-사양)

| 항목      | 사양           |
|:----------|:---------------|
| 동작 전압 | 3.5 V ~ 30.0 V |
| 허용 전류 | 3.0 A          |
| 통신 속도 | 최대 6 Mbps    |

# [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_front_kr.png){: width='600px'}

> 각 부 명칭 - 전면 

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_back_kr.png){: width='600px'}

> 각 부 명칭 - 후면

**참고**: `VDD`는 다이나믹셀 커뮤니케이션 브릿지 후면에 프린팅된 `Vin`과 동일한 명칭입니다. 
{: .notice}

## [설명](#설명)

1. **TTL (JST 3핀) / RS485 Connecter (JST 4핀)** : TTL 및 RS485 통신을 위한 3핀, 4핀 JST 커넥터 사용

2. **볼트 체결 홀** : 장치를 고정하는 용도로 사용. 불필요할 경우 체결 홀 절단선을 따라서 절단이 가능합니다.

3. **RS485 종단 저항** : RS485의 종단저항을 연결할 수 있는 자리입니다. 저항은 1608 사이즈 (1.6mm x 0.8mm)의 칩저항을 사용할 수 있습니다.

# [연결 예시](#연결-예시)

1. 다이나믹셀의 동작 전압이 동일한 경우, 다음 예시 이미지를 참고하세요. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_01.png)
    > 다이나믹셀이 Master Device에서 전원을 공급 받는 경우, 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_02.png)
    > 다이나믹셀이 외부에서 전원을 공급 받는 경우,

2. 다이나믹셀의 동작 전압이 다른 경우, 다음 예시 이미지를 참고하세요. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_01.png)
    > 전원이 다이나믹셀 커뮤니케이션 브릿지의 RS485 커넥터로 공급되는 경우, 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_02.png)
    > 전원이 다이나믹셀 커뮤니케이션 브릿지의 TTL 커넥터로 공급되는 경우, 

    **주의**: 다이나믹셀 커뮤니케이션 브릿지의 TTL 커넥터와 RS485 커넥터의 `VDD` 단자(2번 Pin, [각 부 명칭](#각-부-명칭) 참조)는 서로 연결되어 있습니다. TTL과 RS485에 서로 다른 전원을 사용할 경우, 둘 중 하나의 `VDD`만 다이나믹셀 커뮤니케이션 브릿지에 연결하세요.  
    {: .notice--warning} 

# [참고자료](#참고자료)

## [커넥터 정보](#커넥터-정보)

{% include kr/dxl/jst_485_ttl.md %}
