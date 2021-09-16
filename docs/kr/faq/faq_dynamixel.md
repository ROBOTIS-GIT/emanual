---
layout: archive
lang: kr
ref: faq_dynamixel
read_time: true
share: true
author_profile: false
permalink: /docs/kr/faq/faq_dynamixel/
sidebar:
  title: FAQ 다이나믹셀
  nav: "faq_dynamixel"
---

**팁** : 다이나믹셀에 문제가 있을 경우 로보티즈 홈페이지의 [자가진단]을 통해 문제를 파악할 수 있습니다.
{: .notice--warning}

**참고** : 로보티즈 홈페이지의 [자주 묻는 질문]에서 더 많은 정보를 찾을 수 있습니다.
{: .notice}

# 다이나믹셀 프로토콜 1.0과 2.0의 차이는 무엇인가요?
두 다이나믹셀 프로토콜은 서로 다른 구조의 명령 패킷과 상태 패킷을 사용합니다.  
[다이나믹셀 프로토콜 1.0]과 [다이나믹셀 프로토콜 2.0]을 읽어보시기 바랍니다.

# 어떤 다이나믹셀이 다이나믹셀 프로토콜 1.0을 사용하나요? 
[DX], [AX], [RX], [EX] 시리즈와 다이나믹셀 프로토콜 1.0 펌웨어가 업로드 된 일부 [MX] 시리즈(MX-28/64/106)가 프토토콜 1.0과 호환됩니다.

**참고**: 각 제품의 [다이나믹셀 프로토콜 호환표](/docs/kr/popup/faq_protocol_compatibility_table/){: .popup} 참고하세요.
{: .notice}

# 어떤 다이나믹셀이 다이나믹셀 프로토콜 2.0을 사용하나요? 
[다이나믹셀-X], [다이나믹셀 PRO], [다이나믹셀-P] 시리즈와 다이나믹셀 프로토콜 2.0 펌웨어가 업로드 된 일부 [MX] 시리즈(MX-28/64/106)가 다이나믹셀 프로토콜 2.0과 호환됩니다.

**참고**: 각 제품의 [다이나믹셀 프로토콜 호환표](/docs/kr/popup/faq_protocol_compatibility_table/){: .popup} 참고하세요.
{: .notice}

# 컨트롤 테이블 (Control Table)은 무엇인가요?

컨트롤 테이블은 장치의 상태와 제어를 위한 다수의 데이터 필드 (EEPROM, RAM)로 구성된 집합체입니다.  
사용자는 READ Instruction Packet을 통해 컨트롤 테이블의 특정 데이터를 읽어서 장치의 상태를 파악할 수 있습니다.  
또한 WRITE Instruction Packet을 통해 컨트롤 테이블의 특정 데이터를 변경함으로써 장치를 제어할 수 있습니다.  
컨트롤테이블의 Address는 Instruction Packet으로 컨트롤 테이블의 특정 데이터를 접근할 때 사용하는 고유값입니다.  
장치의 데이터를 읽거나 쓰기 위해서는 Instruction Packet에 해당 데이터의 주소를 지정해 주어야 합니다

**참고**: Instruction 및 Status Packet에 대한 자세한 내용은 [다이나믹셀 프로토콜 1.0] 또는 [다이나믹셀 프로토콜 2.0]을 참고하세요. 
{: .notice}

**참고**: 각 제품의 [다이나믹셀 프로토콜 호환표](/docs/kr/popup/faq_protocol_compatibility_table/){: .popup} 참고하세요.
{: .notice}

# 다이나믹셀에는 어떤 커넥터와 케이블을 사용할 수 있나요?
각 다이나믹셀 매뉴얼의 **커넥터 정보** 항목을 참고하시기 바랍니다.

# 다이나믹셀과 연결하기 위해서는 어떤 장치가 필요한가요?
1. [U2D2]  
  U2D2는 가장 널리 사용될 뿐만 아니라 PC와 다이나믹셀을 연결하는데 가장 최적화된 인터페이스입니다.
2. [USB2DYNAMIXEL]  
  QC 번호를 확인해주세요. 만약 QC번호가 1412 ~ 1502 사이에 있다면 FTDI와 관련된 문제가 있을 수 있습니다. [드라이버 수동 설치]를 참고해주시고 이 방법으로 동작하지 않는다면 교환을 요청해주세요. 
2. 로보티즈 제어기  
  [OpenCM9.04], [OpenCM9.04] + [OpenCM 485 EXP], [CM-530], [CM-700], [OpenCR1.0]을 사용해서 다이나믹셀을 제어할 수 있습니다.
3. 기타 제어기
  다이나믹셀은 반이중 UART 통신(TTL 또는 RS-485 방식)을 지원합니다.각 다이나믹셀 매뉴얼의 **통신 회로** 항목을 참고하시기 바랍니다.

# 다이나믹셀 컨트롤 테이블을 테스트해보고 싶습니다.
1. **다이나믹셀 프로토콜 1.0**을 사용하는 다이나믹셀은 [다이나믹셀 위자드]혹은 [다이나믹셀 위자드 2.0]를 사용하시기 바랍니다.
2. **다이나믹셀 프로토콜 2.0**을 사용하는 다이나믹셀은 [R+ Manager 2.0]혹은 [다이나믹셀 위자드 2.0]를 사용하시기 바랍니다

# 다이나믹셀을 제어하려면 어떤 프로그램을 사용해야 하나요?
1. 다이나믹셀을 [U2D2] 또는 [USB2DYNAMIXEL]로 연결된 PC로 제어하려면  
  [다이나믹셀 SDK](C, C++, C#, Java, MATLAB, LabVIEW, Python, ROS) 또는 [R+ Task] 또는 [R+ Task 2.0]를 사용할 수 있습니다.
2. 다이나믹셀을 [OpenCM9.04] 또는 [OpenCR1.0] 로보티즈 제어기로 제어하려면
  [다이나믹셀 SDK]와 [다이나믹셀 워크벤치] 라이브러리를 지원하는 [아두이노 IDE]를 사용할 수 있습니다.

# 다이나믹셀과 호환되는 제품을 찾고싶어요.
로보티즈 홈페이지의 [부품 호환 가이드]에서 호환되는 제품을 찾을 수 있습니다.

# 3D 모델링 파일을 찾고싶어요
3D 파일은 로보티즈 홈페이지의 [다운로드 센터]에서 받을 수 있습니다.

# 다이나믹셀 부품을 구매할 수 있나요?
다이나믹셀은 교체용 기어를 구매할 수 있습니다. 다이나믹셀 프로는 부품을 별도로 판매하지 않습니다.

# 다이나믹셀의 전원 사양은 어떻게 되나요?
다이나믹셀은 모델에 따라 다른 전원 사양이 요구될 수 있습니다.  
각 모델의 매뉴얼을 참고하시기 바랍니다.  
매뉴얼에 명시된 전압 범위를 초과하지 않도록 주의하십시오. 부품 손상의 원인이 될 수 있습니다.  
다이나믹셀 프로의 경우 24V 직류 전원을 사용하는 것을 추천드립니다.

# 다이나믹셀의 토크는 어떻게 되나요?
각각의 다이나믹셀은 모두 다른 토크 범위를 가지고 있습니다.  
각 제품 매뉴얼의 **성능 그래프** 항목을 참조하셔서 가장 효율이 좋은 토크 영역 이내에서 사용하시기를 추천드립니다.  
다이나믹셀 프로의 경우 **주요 사양**을 참조하시기 바랍니다.

# 다이나믹셀이 로보티즈 소프트웨어(로보플러스, 다이나믹셀 위자드 등)에서 검색되지 않아요.
1. 올바른 전원을 다이나믹셀에 사용하고 있는지 확인해 주세요.
2. 연결된 다이나믹셀의 ID가 모두 다른지 확인해주세요. 동일한 ID를 사용할 경우 충돌이 발생합니다.
3. 케이블과 커넥터가 잘 연결되어 있는지 확인해 주세요.
4. 케이블에 손상이 없는지 확인해 주세요.
5. 모든 통신속도를 사용해서 검색해 보세요.
6. 검색되지 않는 다이나믹셀은 [펌웨어 복구]를 시도해 보세요.

# 다이나믹셀이 다이나믹셀 SDK 예제를 사용한 소프트웨어(LabView, Visual Studio 등)에서 검색되지 않아요.
드문 경우 윈도우 32비트 DLL이 두 자리 수 이상의 COM 포트를 인식하지 못하는 경우가 있습니다. (예 : COM10)

[다이나믹셀 프로토콜 1.0]: /docs/kr/dxl/protocol1/
[다이나믹셀 프로토콜 2.0]: /docs/kr/dxl/protocol2/
[DX]: /docs/kr/dxl/#dx-series
[AX]: /docs/kr/dxl/#ax-series
[RX]: /docs/kr/dxl/#rx-series
[EX]: /docs/kr/dxl/#ex-series
[MX]: /docs/kr/dxl/#mx-series
[다이나믹셀-X]: /docs/kr/dxl/#x-series
[다이나믹셀 PRO]: /docs/kr/dxl/#pro-series
[다이나믹셀-P]: /docs/kr/dxl/#pro-plus-series
[MX]: /docs/kr/dxl/#mx-series
[U2D2]: /docs/kr/parts/interface/u2d2/
[USB2DYNAMIXEL]: /docs/kr/parts/interface/usb2dynamixel/
[드라이버 수동 설치]: /docs/kr/parts/interface/usb2dynamixel/#드라이버-수동-설치
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[OpenCM 485 EXP]: /docs/kr/parts/controller/opencm485exp/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCR1.0]: /docs/kr/parts/controller/opencr10/
[다이나믹셀 위자드]: /docs/kr/software/rplus1/dynamixel_wizard/
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[R+ Manager 2.0]: /docs/kr/software/rplus2/manager/
[다이나믹셀 SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[R+ Task]: /docs/kr/software/rplus1/task/getting_started/
[R+ Task 2.0]: /docs/kr/software/rplus2/task/
[아두이노 IDE]: /docs/en/software/arduino_ide/
[다이나믹셀 워크벤치]: /docs/en/software/dynamixel/dynamixel_workbench/
[부품 호환 가이드]: http://www.robotis.com/service/compatibility_table.php?cate=dx
[다운로드 센터]: http://www.robotis.com/service/downloadcenter.php
[펌웨어 복구]: /docs/kr/software/dynamixel/dynamixel_wizard2/#펌웨어-복구
[자가진단]: http://www.robotis.com/model/selfcheck.php
[자주 묻는 질문]: http://www.robotis.com/model/board.php?bo_table=robotis_faq
