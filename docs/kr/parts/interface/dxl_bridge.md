---
layout: archive
lang: kr
ref: dxl_bridge
read_time: true
share: false
permalink: /docs/kr/parts/interface/dxl_bridge/
author_profile: false
sidebar:
  title: 다이나믹셀 커뮤니케이션 브릿지
  nav: "dxl_bridge"
---

# [개요](#개요)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product.png){: width='450px'}

**다이나믹셀 커뮤니케이션 브릿지**(이하 다이나믹셀 브릿지)는 RS485 통신 다이나믹셀(4 Pin)과 TTL 통신 다이나믹셀(3 Pin)의 통신을 상호 호환할 수 있도록 연결해 주는 역할을 합니다.  

U2D2에 있는 TTL과 RS485 단자는 마스터 PC와 서로 연결되어 있지만, TTL과 RS485간의 통신 선로는 연결되어 있지 않습니다. 따라서, U2D2를 통한 TTL과 RS485 다이나믹셀간의  

Broadcast Ping, Sync/Bulk Read 통신은 불가능합니다.  

![](/assets/images/parts/interface/dxl_bridge/u2d2_separate_ttl_485.png){: width='600px'}

반면, Dynamixel Communication Bridge는 TTL ↔ RS485 간의 상호 전환을 가능하게 하므로 Broadcast Ping, Sync/Bulk Read 패킷 통신이 가능합니다.  

![](/assets/images/parts/interface/dxl_bridge/u2d2_bridge_ttl_485.png){: width='950px'}

# [제품 사양](#제품-사양)

| 항목      | 사양           |
|:----------|:---------------|
| 동작 전압 | 3.5 V ~ 24.0 V |
| 허용 전류 | 최대 3.0 A     |
| 통신 속도 | 최대 6 Mbps    |

# [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_layout_kr.png){: width='600px'}

## [설명](#설명)

1. **TTL / RS485 Connecter (JST 3 / 4Pin)** : TTL 및 RS485 통신을 위한 3핀, 4핀 JST 커넥터 사용

2. **볼트 체결 홀** : 장치를 고정하는 용도로 사용. 불필요할 경우 체결 홀 절단선을 따라서 절단이 가능합니다.

3. **RS485 Termination resistance** : RS485의 종단저항을 연결할 수 있는 자리입니다. 저항은 1608 사이즈 (1.6mm x 0.8mm)의 칩저항을 사용할 수 있습니다.

# [연결 예시](#연결-예시)

1. 다이나믹셀의 동작 전압이 동일한 경우, 다음 이미지를 참고하세요. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_01.png){: width='600px'}

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_same_voltage_02.png){: width='600px'}

2. 다이나믹셀의 동작 전압이 다른 경우, 다음 이미지를 참고하세요. 

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_01.png){: width='600px'}

    ![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_connection_example_different_voltage_02.png){: width='600px'}

# [참고자료](#참고자료)

{% include kr/dxl/jst_485_ttl.md %}
