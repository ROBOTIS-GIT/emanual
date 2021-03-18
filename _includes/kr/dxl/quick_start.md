
### 준비사항

{% if page.product_group=='xl330' %}
- 다이나믹셀 전원공급 장치 (다이나믹셀과 호환되는 제어기 또는 [LB-041](https://www.robotis.com/model/search.php?sfl=wr_subject%7C%7Cwr_content&stx=LB-041) 또는 별도의 파워 서플라이)
  - [제어기 다이나믹셀 호환표](/docs/kr/parts/controller/controller_compatibility/#다이나믹셀-호환표)
{% else %}
- 다이나믹셀 전원공급 장치 (SMPS2Dynamixel 또는 다이나믹셀과 호환되는 제어기)
  - [제어기 다이나믹셀 호환표](/docs/kr/parts/controller/controller_compatibility/#다이나믹셀-호환표)
{% endif %}
- OS가 설치된 PC.
- PC와 다이나믹셀 연결장치 ([U2D2] 또는 [USB2Dynamixel])
- [호환 소프트웨어](#호환-소프트웨어)

{% capture warn_01 %}
**주의**: 
- USB2DYNAMIXEL은 현재 단종되어 더 이상 판매되지 않습니다.
- 사용하는 소프트웨어에 따라, 호환되는 OS가 다를수 있습니다. 해당 소프트웨어 매뉴얼에서 지원하는 OS를 참조하세요. 
{% endcapture %}
<div class="notice--warning">{{ warn_01 | markdownify }}</div>

{% capture notice_01 %}
**참고**: 
- U2D2는 PC의 USB포트와 다이나믹셀 또는 제어기를 연결하여 직접 구동하기 위한 통신 변환 장치입니다.
- [U2D2 파워 허브 보드](/docs/kr/parts/interface/u2d2_power_hub/) 사용시, 안정적인 전원 공급 및 다수의 다이나믹셀을 관리할수 있습니다.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

### [호환 소프트웨어](#호환-소프트웨어)

다이나믹셀을 제어 및 관리하기위한 소프트웨어 입니다. 아래 호환 표를 참고하세요.

| 모델                  | AX Series | DX Series | RX Series | EX Series | MX Series | X-Series       | PRO Series | P Series |
|:----------------------|:----------|:----------|:----------|:----------|:----------|:---------------|:-----------|:---------|
| R+ Manager 2.0 | X         | X         | X         | X         | O         | O              | O          | O        |
| 다이나믹셀 위자드     | O         | X         | X         | O         | O         | X (XL320 지원) | O          | X        |
| 다이나믹셀 위자드2.0  | O         | O         | O         | O         | O         | O              | O          | O        |
| 다이나믹셀 SDK        | O         | O         | O         | O         | O         | O              | O          | O        |
| 다이나믹셀 워크벤치   | O         | O         | O         | O         | O         | O              | O          | O        |

{% capture notice_02 %}
**참고**: 로보티즈에서 제공하는 제어기와 다이나믹셀을 함께사용할수 있는 소프트웨어가 있습니다. 아래를 참고하세요.
- [제어기 다이나믹셀 호환표](/docs/kr/parts/controller/controller_compatibility/#다이나믹셀-호환표)
- [제어기 소프트웨어 호환표](/docs/kr/parts/controller/controller_compatibility/#소프트웨어-호환표)
{% endcapture %}
<div class="notice">{{ notice_02 | markdownify }}</div>

#### [로보플러스 매니저](#로보플러스-매니저)

[로보플러스 매니저]는 로봇을 구성하는 각 장치들을 관리해줍니다. 이 프로그램의 주요 역할은 다음과 같습니다.

- 제어기 펌웨어를 관리합니다. [(업데이트 및 복구 기능)](/docs/kr/software/rplus1/manager/#펌웨어-관리)
- 사용에 필요한 모드설정 또는 제어기 및 주변 장치들의 상태를 점검합니다. [(테스트 및 설정기능)](/docs/kr/software/rplus1/manager/#테스트-및-설정)

**참고**: 로보플러스 매니저 1.0은 기능의 제약이 있습니다. 최신버전인 [R+ Manager 2.0](#r-manger-20) 또는 [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)을 사용하세요. 
{: .notice}

#### [R+ Manager 2.0](#r-manger-20)

[R+ Manager 2.0]은 로봇을 구성하는 제어기와 다이나믹셀 장치들을 통합 관리합니다.
제품을 연결하면 해당 제품을 최신버전으로 업데이트할 수 있으며, 컨트롤 테이블을 테스트해볼 수 있습니다.
기존의 로보플러스 매니저1.0과 위자드1.0에서 제공하던 기능이 R+ Manager 2.0에서 통합되었습니다.

{% if page.product_group=='xl330' %}

{% else %}

{% capture warn_02 %}
**주의**: R+ Manager 2.0은 프로토콜 1.0을 사용하는 다이나믹셀과 호환되지 않습니다. 다이나믹셀 위자드 2.0 사용시, 모든 다이나믹셀의 펌웨어 복구/업데이트, 컨트롤 테이블 변경이 가능합니다.  
{% endcapture %}
<div class="notice--warning">{{ warn_02 | markdownify }}</div>

{% endif %}

#### [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)

[다이나믹셀 위자드 2.0]은 다양한 운영체제에서 다이나믹셀 제품들을 통합 관리할 수 있는 편리한 툴입니다.

다이나믹셀 위자드 2.0의 주요 역할은 다음과 같습니다.

- 모든 다이나믹셀의 펌웨어를 업데이트 및 복구할 수 있습니다.
- 다양한 프로토콜을 기반으로 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 및 파라미터 등을 설정하고, 목표 지령을 생성할 수 있습니다.
- 시간에 따라 변화하는 값들을 실시간 그래프로 확인할 수 있습니다.
- 사용자가 직접 프로토콜 패킷을 생성하여 전송하고, 모니터링 할 수 있습니다.

#### [다이나믹셀 SDK](#다이나믹셀-sdk)

[다이나믹셀 SDK]는 패킷 통신을 이용하여 다이나믹셀 제어 기능을 제공하는 소프트웨어 개발 키트입니다.  

**지원목록**:
- C, C++, C#, Python, Java, MATLAB, LabVIEW
- Windows, Mac, Linux. 
- ROS
- Arduino

#### [다이나믹셀 워크벤치](#다이나믹셀-워크벤치)

[다이나믹셀 워크벤치]는 DYNAMIXEL SDK 를 기반으로 보다 간단하고 사용하기 쉽게 만든 라이브러리입니다. 

**지원목록**:
- C++
- Linux, MacOS
- ROS
- Arduino

**참고**: 다이나믹셀 워크벤치는 DYNAMIXEL SDK 와 비교하여 기능상의 제약이 있을수 있습니다.
{: .notice}

[U2D2]: /docs/kr/parts/interface/u2d2/
[USB2Dynamixel]: /docs/kr/parts/interface/usb2dynamixel/
[로보플러스 매니저]: /docs/kr/software/rplus1/manager/
[R+ Manager 2.0]: /docs/kr/software/rplus2/manager/
[다이나믹셀 SDK]: /docs/kr/software/dynamixel/dynamixel_sdk/overview/
[다이나믹셀 워크벤치]: /docs/kr/software/dynamixel/dynamixel_workbench/
[다니아믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
