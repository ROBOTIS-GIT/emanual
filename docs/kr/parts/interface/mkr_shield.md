---
layout: archive
lang: kr
ref: mkr_shield
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/interface/mkr_shield/
sidebar:
  title: 다이나믹셀 쉴드 MKR
  nav: "mkr_shield"
---

![](/assets/images/parts/interface/mkr_shield/mkr_shield_product.jpg)

# [개요](#개요)

**다이나믹셀 쉴드(아두이노 MKR 시리즈)**(이후 "다이나믹셀 쉴드 MKR"로 통칭)는 MKR ZERO, MKR1000 WIFI, MKR WiFi 1010, Portenta H7과 같은 아두이노의 MKR 폼팩터를 공유하는 제어기와 호환됩니다.

아두이노 라이브러리(DYNAMIXEL2Arduino, DYNAMIXEL Shield)가 제공되어 아두이노 환경에서 다이나믹셀을 빠르고 편리하게 개발할 수 있습니다.

본 매뉴얼의 [다이나믹셀 쉴드 라이브러리](#다이나믹셀-쉴드-라이브러리) 항목을 참고하세요.

{% capture shield_00 %}
**주의**

1. 본 제품은 아두이노 제어기를 포함하지 않습니다. **아두이노 제어기는 별도로 구매하시기 바랍니다.**
2. **다이나믹셀 X 시리즈와 호환되는 TTL 헤더가 한 개 기본장착 되어있습니다.**  
   (제품 패키지에 AX, MX, X 시리즈에 사용할 수 있는 헤더가 동봉되어 있습니다)
3. 필요한 경우 동봉된 부품을 납땜해서 사용하시기 바랍니다.
4. 일부 아두이노 MKR 쉴드는 사용하는 핀에 따라 다이나믹셀 쉴드 MKR과 완전하게 호환되지 않을 수 있습니다. 다이나믹셀 쉴드 MKR과 함께 사용할 경우 각 제품의 데이터시트를 참고하시기 바랍니다.  
{% endcapture %}
<div class="notice--danger">{{ shield_00 | markdownify }}</div>

# [시작하기](#시작하기)

<iframe width="560" height="315" src="https://www.youtube.com/embed/1Y7FLG1n-9k" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**사용하고자하는 다이나믹셀에 맞는 전원을 공급해주세요.**
{: .notice--warning}

# [제품 사양](#제품-사양)

|              항목              | 사양                                                                                                                                            |
| :----------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| VIN(DXL) 입력 전압<sup>1</sup> | 3.5 ~ 24 [V]                                                                                                                                    |
|           동작 온도            | -10 ~ +80 [&deg;C]                                                                                                                              |
|       커넥터<sup>2</sup>       | JST([S3B-EH]), Molex([5268-02A])<br>배터리 커넥터<sup>3</sup>([SMW250-02])<br>터미널 블럭([DG350-3.5-02P-14])                                   |
|           통신 연결            | TTL Multidrop Bus (5V Level)                                                                                                                    |
|             케이블             | ![](/assets/images/parts/interface/mkr_shield/dc_jack_polarity.png)<br>DC 잭 케이블. Type A, O.D: 5.5 [mm], I.D: 2.5 [mm]<br>XL-320 변환 케이블 |
|              크기              | 65 x 25 [mm]                                                                                                                                    |
|              무게              | 11 [g]                                                                                                                                          |

<sup>1</sup> 12V를 지원하는 다이나믹셀 사용시 [ROBOTIS SMPS 12V 5A PS-10] 전원공급 장치를 추천합니다.  
<sup>2</sup> 한개의 JST 헤더가 기본 조립되어 있습니다. 필요한 경우 동봉된 커넥터를 사용하세요.  
<sup>3</sup> 배터리 커넥터는 다음의 로보티즈 배터리와 호환됩니다. [LB-010](https://www.robotis.com/shop/item.php?it_id=903-0143-000) 또는 [LB-020](https://www.robotis.com/shop/item.php?it_id=903-0277-000).
{: .notice}

## [지원하는 다이나믹셀](#지원하는-다이나믹셀)

다이나믹셀 쉴드 MKR은 `TTL` 기반의 다이나믹셀 제품을 지원합니다.

| 다이나믹셀 제품 |                                                 |                                                        |                                     |
| :-------------: | :---------------------------------------------- | :----------------------------------------------------- | :---------------------------------- |
|     **AX**      | [AX-12W]<br/>[AX-12+/12A]<br/>[AX-18F/18A]      |                                                        |                                     |
|     **MX**      | [MX-12W]<br/>[MX-28T/AT]<br/> [MX-28T/AT(2.0)]  | [MX-64T/AT]<br/> [MX-64T/AT(2.0)]                      | [MX-106T/AT]<br/> [MX-106T/AT(2.0)] |
|     **XL**      | [XL-320]<br/>[XL330-M077-T]<br/> [XL330-M288-T] | [XL430-W250-T]<br/>[2XL430-W250-T]                     |                                     |
|     **XC**      |                                                 | [XC430-W150-T]<br/> [XC430-W240-T]<br/>[2XC430-W250-T] |                                     |
|     **XM**      |                                                 | [XM430-W210-T]<br/> [XM430-W350-T]                     | [XM540-W150-T]<br/> [XM540-W270-T]  |
|     **XH**      |                                                 | [XH430-W210-T]<br/> [XH430-W350-T]                     | [XH540-W150-T]<br/> [XH540-W270-T]  |

## [부품 목록](#부품-목록)

제품 패키지에는 다음과 같은 부품이 포함되어 있습니다.

- 다이나믹셀 쉴드 MKR (1)
- JST 헤더([S3B-EH]) (2)
- Molex 헤더([5268-02A]) (2)
- 터미널 블럭([DG350-3.5-02P-14]) (1)
- DC 잭 케이블 (1)
- 배터리 커넥터([SMW250-02]) (1)
- XL-320 변환 케이블 (1)

# [각 부 명칭](#각-부-명칭)

다이나믹셀 쉴드 MKR의 회로 도면은 아래 링크를 통해 다운로드 받을 수 있습니다.

- [다이나믹셀 쉴드 MKR 회로도](https://www.robotis.com/service/download.php?no=1988)

![](/assets/images/parts/interface/mkr_shield/pinmap.png)

> 다이나믹셀 쉴드 MKR의 헤더는 아두이노 MKR 제어기를 기반으로 호환됩니다.

|         항목         |                                     세부 설명                                     |
| :------------------: | :-------------------------------------------------------------------------------: |
| DYNAMIXEL Ports(TTL) |                            TTL 기반의 다이나믹셀 지원                             |
|       VIN(DXL)       | 다이나믹셀 전용 외부 전원 공급 포트. 아두이노 MKR 제어기에 전원을 공급할 수 없음. |
|   +5V<sup>1</sup>    |         아두이노 MKR 제어기의 5V 전원을 다이나믹셀에 공급 (XL330 시리즈)          |
|      Jumper Cap      |                 `VIN(DXL)` 과 `+5V` 중 다이나믹셀 전원 공급 선택                  |

<sup>1</sup> 일부 아두이노 MKR 제어기는 연결된 USB 장치를 보호하기 위해 5V 전원 공급이 원활하지 않을 수 있습니다.
{: .notice--warning}

![](/assets/images/parts/interface/mkr_shield/mkr_pinmap.png)

> 아두이노 MKR 제어기 핀아웃 예시. 자세한 내용은 [아두이노 제품](https://www.arduino.cc/en/Main/Products)을 참고하세요.

| 핀 번호 | 핀 명칭 | 세부 설명                                                                            |
| :-----: | :-----: | :----------------------------------------------------------------------------------- |
|   13    |   RX    | 다이나믹셀로부터 데이터를 수신받는 하드웨어 시리얼 입력 핀                           |
|   14    |   TX    | 다이나믹셀에 데이터를 전송하는 하드웨어 시리얼 출력 핀                               |
| 21(A6)  |  TX_EN  | 다이나믹셀의 TTL BUS 흐름을 제어하는 핀<br />- **HIGH** : 송신<br />- **LOW** : 수신 |

# [연결 방법](#연결-방법)

다이나믹셀 쉴드 MKR은 아두이노 MKR 제어기의 상단 또는 하단에 조립될 수 있습니다.  
하나의 아두이노 MKR 제어기에 여러 쉴드를 사용할 경우 사용하는 핀에 따른 호환여부에 주의하시기 바랍니다.  
**아두이노 MKR 제어기는 다이나믹셀 쉴드 MKR의 VIN(DXL) 포트로부터 전원을 공급받을 수 없습니다.**

## 12V X 시리즈 다이나믹셀

12V 입력을 지원하는 대부분의 X 시리즈에는 다음과 같은 연결을 추천합니다 (XL-320과 XL330 제외).  
PC와 연결된 USB로부터 아두이노 MKR 제어기의 전원 공급 및 시리얼 통신이 이루어지며, 12V SMPS로부터 다이나믹셀 쉴드 MKR에 연결된 다이나믹셀에 전원이 공급됩니다.  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info01.jpg)

## AX / MX 시리즈 다이나믹셀

AX와 MX 시리즈 다이나믹셀은 Molex 커넥터를 사용합니다.  
동봉된 AX / MX 전용 커넥터를 비어있는 다이나믹셀 쉴드 MKR의 포트에 납땜하여 사용하거나 [로봇 케이블-X3P 180mm (변환용)]을 사용하세요.  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info02.jpg)

## XL330 (USB 전원)

XL330 시리즈는 다이나믹셀 최초의 저전압 제품으로, 5V USB 전원에서 구동할 수 있습니다.  
다이나믹셀 쉴드 MKR의 [전원 선택 점퍼](#전원-선택-점퍼)를 `+5V`쪽으로 바꿔 꽂은 다음, 아두이노 MKR 제어기의 5V USB 전원을 다이나믹셀에 공급할 수 있습니다.

일부 아두이노 MKR 제어기는 연결된 USB 장치를 보호하기 위해 5V 전원을 제한할 수 있습니다.  
{: .notice--warning}

![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info03.jpg)

아두이노 제어기에 프로그램이 업로드 되고나면, 1셀 리튬 계열의 배터리(3.7V)를 사용하여 각각 아두이노 MKR 제어기와 XL330 다이나믹셀에 전원을 공급하여 사용할 수도 있습니다.  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info04.jpg)

# [전원 선택 점퍼](#전원-선택-점퍼)

|                                                                                     VIN(DXL)을 통해 외부의 전원 사용시                                                                                      |                                                                                          아두이노 MKR 제어기의 5V USB 전원 사용시                                                                                          |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                                                      ![](/assets/images/parts/interface/mkr_shield/select_vindxl.png)                                                                       |                                                                                ![](/assets/images/parts/interface/mkr_shield/select_5v.png)                                                                                |
| 외부의 전원 공급 장치로부터 `VIN(DXL)`를 통해 다이나믹셀의 전원을 공급할 경우, 터미널 블럭에 표시된 극성에 맞게 케이블을 연결하시기 바랍니다. **이때 아두이노 MKR 제어기의 전원을 별도로 공급해야 합니다.** | 아두이노 MKR 제어기의 `+5V` USB 전원을 다이나믹셀에 공급할 경우 **일부 아두이노 MKR 제어기의 내장된 퓨즈로 인해 충분한 5V 전원을 공급받지 못할 수 있습니다.** 사용하려는 아두이노 MKR 제어기의 자료를 참고하시기 바랍니다. |

다이나믹셀 쉴드 MKR에 전원을 공급할 때 **전원의 극성**을 다시 한 번 확인해주세요.
{: .notice}

# [다이나믹셀 쉴드 라이브러리](#다이나믹셀-쉴드-라이브러리)

1. DYNAMIXEL2Arduino 라이브러리 : [깃허브 저장소][dynamixel2arduino github repository]
2. DYNAMIXEL Shield 라이브러리 : [깃허브 저장소][dynamixel shield github repository]

## [특징](#특징)

- `아두이노 MKR`과 `Portenta H7` 제어기에 호환됨
- 다이나믹셀 프로토콜 1.0과 2.0을 모두 지원
- DYNAMIXEL2Arduino 라이브러리에서 기본적으로 16개의 다이나믹셀 연결을 지원함.([config.h](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino/blob/master/src/utility/config.h#L62))
- SyncWrite 기능 지원
- DYNAMIXEL Shield 라이브러리(v0.1.0 이후 버전)에서는 DYNAMIXEL2Arduino 라이브러리가 반드시 필요함

## [라이브러리 설치](#라이브러리-설치)

**참고**  
아두이노 MKR 제어기를 아두이노 IDE에서 프로그램할 때에는 `Arduino SAMD Boards manager`가 아두이노 보드 매니저에 설치되어 있어야 합니다.
{: .notice}

아두이노 IDE에 라이브러리를 설치하는 방법은 아래와 같이 세 가지가 있습니다.

1. **라이브러리 매니저를 활용하는 방법**
2. Zip파일로 압축된 라이브러리를 불러오는 방법
3. 수동으로 설치하는 방법

각각의 방법은 [아두이노 공식 가이드]에서 찾아볼 수 있습니다.  
여기에서는 **라이브러리 매니저를 활용하는 방법**을 안내합니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

아두이노 라이브러리 매니저에서 `dynamixel shield`를 검색하고 최신 버전을 설치합니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

`전부 설치`를 선택해서 `Dynamixel2Arduino`를 설치합니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_04.png)

라이브러리가 모두 설치되면, 아래와 같이 DynamixelShield 항목 아래의 예제를 사용할 수 있습니다.

![](/assets/images/parts/interface/dynamixel_shield/examples.png)

## [라이브러리 API](#라이브러리-api)

### [다이나믹셀 쉴드(v0.1.0 이상))](#다이나믹셀-쉴드v010-이상)

**주의**  
다이나믹셀 쉴드 라이브러리(v0.1.0 이상)를 사용하기 위해서는 [DYNAMIXEL2Arduino 라이브러리](#라이브러리-설치)를 설치해야 합니다.
{: .notice--warning}

#### [Dynamixel2Arduino 클래스](#dynamixel2arduino-클래스)

- [begin()]{: .popup}
- [getPortBaud()]{: .popup}
- [ping()]{: .popup}
- [scan()]{: .popup}
- [getModelNumber()]{: .popup}
- [setID()]{: .popup}
- [setProtocol()]{: .popup}
- [setBaudrate()]{: .popup}
- [torqueOn()]{: .popup}
- [torqueOff()]{: .popup}
- [ledOn()]{: .popup}
- [ledOff()]{: .popup}
- [setOperatingMode()]{: .popup}
- [setGoalPosition()]{: .popup}
- [getPresentPosition()]{: .popup}
- [setGoalVelocity()]{: .popup}
- [getPresentVelocity()]{: .popup}
- [setGoalPWM()]{: .popup}
- [getPresentPWM()]{: .popup}
- [setGoalCurrent()]{: .popup}
- [getPresentCurrent()]{: .popup}
- [readControlTableItem()]{: .popup}
- [writeControlTableItem()]{: .popup}

#### [Master 클래스](#master-클래스)

Dynamixel2Arduino 클래스는 Master 클래스로부터 다음의 함수를 상속받습니다.

- [read()]{: .popup}
- [write()]{: .popup}
- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

#### [RobotisRemoteController 클래스](#robotisremotecontroller-클래스)

Remote Controller 클래스는 아두이노 MKR 제어기의 SoftwareSerial 기능을 활성화 해서 사용할 수 있습니다.

- [begin()][rc100_begin]{: .popup}
- [availableData()]{: .popup}
- [readData()]{: .popup}
- [availableEvent()]{: .popup}
- [readEvent()]{: .popup}
- [flushRx()]{: .popup}
- [available()]{: .popup}
- [read()]{: .popup}
- [peek()]{: .popup}
- [flush()]{: .popup}
- [write()]{: .popup}

# [다운로드](#다운로드)

- [다이나믹셀 쉴드 MKR 회로도(PDF)](https://www.robotis.com/service/download.php?no=1988)  
  ![](/assets/images/parts/interface/mkr_shield/mkr_schematic.png)

# [FAQ](#faq)

[ax-12w]: /docs/kr/dxl/ax/ax-12w/
[ax-12+/12a]: /docs/kr/dxl/ax/ax-12a/
[ax-18f/18a]: /docs/kr/dxl/ax/ax-18a/
[mx-12w]: /docs/kr/dxl/mx/mx-12w/
[mx-28t/at]: /docs/kr/dxl/mx/mx-28/
[mx-28t/at(2.0)]: /docs/kr/dxl/mx/mx-28-2/
[mx-64t/at]: /docs/kr/dxl/mx/mx-64/
[mx-64t/at(2.0)]: /docs/kr/dxl/mx/mx-64-2/
[mx-106t/at]: /docs/kr/dxl/mx/mx-106/
[mx-106t/at(2.0)]: /docs/kr/dxl/mx/mx-106-2/
[xl-320]: /docs/kr/dxl/x/xl320/
[xl330-m077-t]: /docs/kr/dxl/x/xl330-m077/
[xl330-m288-t]: /docs/kr/dxl/x/xl330-m288/
[xl430-w250-t]: /docs/kr/dxl/x/xl430-w250/
[2xl430-w250-t]: /docs/kr/dxl/x/2xl430-w250/
[xc430-w150-t]: /docs/kr/dxl/x/xc430-w150/
[xc430-w240-t]: /docs/kr/dxl/x/xc430-w240/
[2xc430-w250-t]: /docs/kr/dxl/x/2xc430-w250/
[xm430-w210-t]: /docs/kr/dxl/x/xm430-w210/
[xm430-w350-t]: /docs/kr/dxl/x/xm430-w350/
[xh430-w210-t]: /docs/kr/dxl/x/xh430-w210/
[xm540-w150-t]: /docs/kr/dxl/x/xm540-w150/
[xm540-w270-t]: /docs/kr/dxl/x/xm540-w270/
[xh430-w350-t]: /docs/kr/dxl/x/xh430-w350/
[xh540-w150-t]: /docs/kr/dxl/x/xh540-w150/
[xh540-w270-t]: /docs/kr/dxl/x/xh540-w270/
[s3b-eh]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[5268-02a]: https://www.molex.com/molex/products/part-detail/pcb_headers/0022057025
[smw250-02]: http://product.ic114.com/PDF/S/SMW250-NN.pdf
[dg350-3.5-02p-14]: http://www.degson.com/en/downpdf/id/542.html
[robotis smps 12v 5a ps-10]: https://www.robotis.com/shop/item.php?it_id=903-0124-200
[로봇 케이블-x3p 180mm (변환용)]: https://www.robotis.com/shop/item.php?it_id=903-0251-000
[ln-101]: /docs/kr/parts/interface/ln-101/
[rc-100]: /docs/kr/parts/communication/rc-100/
[아두이노 공식 가이드]: https://www.arduino.cc/en/Guide/Libraries
[dynamixel2arduino github repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[dynamixel shield github repository]: https://github.com/ROBOTIS-GIT/DynamixelShield
[begin()]: /docs/en/popup/arduino_api/begin/
[getportbaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getmodelnumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setid()]: /docs/en/popup/arduino_api/setID/
[setprotocol()]: /docs/en/popup/arduino_api/setProtocol/
[setbaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueon()]: /docs/en/popup/arduino_api/torqueOn/
[torqueoff()]: /docs/en/popup/arduino_api/torqueOff/
[ledon()]: /docs/en/popup/arduino_api/ledOn/
[ledoff()]: /docs/en/popup/arduino_api/ledOff/
[setoperatingmode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setgoalposition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getpresentposition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setgoalvelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getpresentvelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setgoalpwm()]: /docs/en/popup/arduino_api/setGoalPWM/
[getpresentpwm()]: /docs/en/popup/arduino_api/getPresentPWM/
[setgoalcurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getpresentcurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[readcontroltableitem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writecontroltableitem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[read()]: /docs/en/popup/arduino_api/read/
[write()]: /docs/en/popup/arduino_api/write/
[syncread()]: /docs/en/popup/arduino_api/syncRead/
[syncwrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkread()]: /docs/en/popup/arduino_api/bulkRead/
[bulkwrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getlastliberrcode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
[rc100_begin]: /docs/en/popup/arduino_api/rc100_begin/
[availabledata()]: /docs/en/popup/arduino_api/availableData/
[readdata()]: /docs/en/popup/arduino_api/readData/
[availableevent()]: /docs/en/popup/arduino_api/availableEvent/
[readevent()]: /docs/en/popup/arduino_api/readEvent/
[flushrx()]: /docs/en/popup/arduino_api/flushRx/
[available()]: /docs/en/popup/arduino_api/available/
[read()]: /docs/en/popup/arduino_api/read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/write/
