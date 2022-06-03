---
layout: archive
lang: kr
ref: openrb-150
read_time: true
share: false
author_profile: false
permalink: /docs/kr/parts/controller/openrb-150/
sidebar:
  title: OpenRB-150
  nav: "openrb-150"
---


# [개요](#개요)

![](/assets/images/parts/controller/openrb-150/openrb_fonts.png){: width="300px"}  
![](/assets/images/parts/controller/openrb-150/openrb_overview_01.png){: width="300px"}

OpenRB-150은 아두이노와 호환되는 오픈소스 제어기입니다. 

아두이노 MKR 보드와 동일한 폼팩터를 특징으로, MKR 악세사리와 호환 및 프로그래밍 할 수 있습니다. 

4개의 다이나믹셀 전용 포트를 가지고 있으며, 다이나믹셀 전용 소프트웨어인 [다이나믹셀 위자드 2.0]을 사용할 수 있습니다. 

**참고**: OpenRB-150에서 다이나믹셀 위자드 2.0을 사용하기 위해서는, 특정 펌웨어가 필요합니다. 해당 펌웨어는 OpenRB 보드 매니저에 포함되어 있습니다. 
{: .notice}

# [제품 사양](#제품-사양)

| 항목                         | 사양                                                        |
|:-----------------------------|:------------------------------------------------------------|
| MICROCONTROLLER              | SAMD21 Cortex-M0+ 32bit low power ARM® MCU                  |
| BOARD POWER SUPPLY           | (USB 3.0) 5 V<br />(VIN -or Terminal) 3.7 ~ 12.6 V          |
| 지원 배터리                  | Li-Po 1 - 3 cell (3.7 - 11.1 V)<br />XT60 connector ready   |
| DC 전류 (3.3V 핀)            | 300 mA                                                      |
| DC 전류 (5V 핀)              | 300 mA                                                      |
| 회로 동작 전압               | 3.3 V                                                       |
| 디지털 입출력 I/O 핀         | 24                                                          |
| PWM 핀                       | 12 (0, 1, 2, 3, 4, 5, 6, 7, 8, 10, A3 - or 18 -, A4 -or 19) |
| UART                         | 2                                                           |
| SPI                          | 1                                                           |
| I2C                          | 1                                                           |
| 아날로그 입력 핀             | 7 (ADC 8/10/12 bit)                                         |
| 아날로그 출력 핀             | 1 (DAC 10 bit)                                              |
| 외부 인터럽트                | 10 (0, 1, 4, 5, 6, 7, 8, A1 -or 16-, A2 - or 17)            |
| 입/출력 DC 전류              | 7 mA                                                        |
| 플래세 메모리                | 256 KB                                                      |
| 플래시 메모리 (부트로더)     | 8 KB                                                        |
| SRAM                         | 32 KB                                                       |
| EEPROM                       | no                                                          |
| 클럭 속도                    | 32.768 kHz (RTC), 48 MHz                                    |
| 내장 LED                     | 3                                                           |
| 다이나믹셀 TTL 포트          | 4 (Max 1 Mbps)                                              |
| 크기                         | 25 x 66 mm                                                  |
| 지원 소프트웨어 및 환경      | [아두이노 IDE], [다이나믹셀 위자드 2.0]                     |
| 지원 다이나믹셀 <sup>*</sup> | [X 시리즈], [MX 시리즈], [AX 시리즈], [P 시리즈]            |

`*` RS-485 모델은 [다이나믹셀 커뮤니케이션 브릿지]를 사용하세요.  
`*` 동작전압이 24V인 다이나믹셀은, 제어기와 독립된 별도의 전원을 사용하세요.

{% capture openrb-150_caution_01 %}
**주의**
- USB 포트로 공급할 수 있는 전류는 최대 500mA 입니다 (내장 퓨즈 사용). 포트를 통해 높은 전류가 흐르게 된다면, 제품의 손상을 일으킬 수 있습니다.  
- 높은 토크 및 순간적으로 빠른 동작을 요구하는 어플리케이션은, 터미널 블록(외부 전원 입력)을 통해 충분한 전원을 공급하세요.
- 제어기와 다이나믹셀 연결 전, 반드시 동작전압을 확인하고 올바른 전원을 사용하세요.
{% endcapture %}

<div class="notice--danger">{{ openrb-150_caution_01 | markdownify }}</div>

# [하드웨어 레이아웃](#하드웨어-레이아웃)

## [핀아웃](#핀아웃)

![](/assets/images/parts/controller/openrb-150/openrb-150_pinout.png)

## [리셋 버튼](#리셋-버튼)

`RESET` 버튼을 눌러, 마이크로컨트롤러를 강제 부팅할 수 있습니다. 

버튼을 연속으로 2번 누르면, 부트로더 모드에 진입하며, 업로드한 코드 및 펌웨어가 작동하지 않습니다. 

{% capture openrb-150_warning_01 %}
**주의**  
마이크로컨트롤러가 리셋되면, 다이나믹셀에 공급되는 파워도 함께 리셋됩니다 ([다이나믹셀 전원 스위치](#다이나믹셀-전원-스위치) 참고).

제품의 손상 및 사고를 방지하기위해, 다이나믹셀이 안정된 위치에 있을 때에만 마이크로컨트롤러를 리셋하세요.
{% endcapture %}
<div class="notice--danger">{{ openrb-150_warning_01 | markdownify }}</div>

## [다이나믹셀 전원 스위치](#다이나믹셀-전원-스위치)

다이나믹셀 포트(DYNAMIXEL Ports)로 입력되는 전원은, 마이크로컨트롤러 아래에 위치한 FET에 의해 제어됩니다. 

FET은 다이나믹셀 포트로 전원을 활성화 또는 비활성화할 수 있으며, OpenRB-150의 전원이 켜지면 자동으로 FET은 꺼지게 됩니다. 

FET이 켜진다면, `DXL` LED(적색)가 켜지며 전원공급 상태를 알 수 있습니다.

![](/assets/images/parts/controller/openrb-150/openrb-150_switch.png)

## [터미널 전원 입력](#터미널-전원-입력)

터미널 블록을 통해, 넓은 범위의 입력전원을 사용할 수 있습니다 (권장).  

터미널 블록을 통해 OpenRB-150에 전원 공급 시, 제공되는 전원 점퍼를 아래와 같이 `VIN(DXL)`에 결합하세요. 

![](/assets/images/parts/controller/openrb-150/openrb-150_jumper.png)  
> 터미널 블록 사용 시, VIN 전원 점퍼 결합 위치

![](/assets/images/parts/controller/openrb-150/openrb-150_power_inputs.png)  
> 전원 입력 회로 

**주의**  
배터리가 제어기에 연결되어 있는 상태에서, 배터리를 충전하지 마세요.
{: .notice--warning}

### XT60 커넥터

RC 제품에서 광범위하게 사용하는 XT60 커넥터는, OpenRB-150의 후면에서 직접 조립 가능합니다. 

터미널 블록을 제거 후, XT60 커넥터를 적절한 각도로 납땜하세요. 

![](/assets/images/parts/controller/openrb-150/openrb-150_power_xt60.png)  
> XT60 커넥터 위치

## [전원 점퍼](#전원-점퍼)

OpenRB-150은 3개의 전원 입력을 선택할 수 있습니다.

선택한 전원 입력으로부터 다이나믹셀과 제어기에 공급하기 위해서는, 전원 점퍼를 아래와 같이 결합하세요. 

|                              USB or VIN 핀 사용시                              |                             XT60 또는 터미널 블록 사용시                             |
|:------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------:|
| ![](/assets/images/parts/controller/openrb-150/openrb-150_power_jumper_5v.png) | ![](/assets/images/parts/controller/openrb-150/openrb-150_power_jumper_terminal.png) |

## [다이나믹셀 포트](#다이나믹셀-포트)

OpenRB-150은 4개의 TTL 다이나믹셀 포트를 사용합니다. 

RS-485 다이나믹셀 모델을 OpenRB-150과 사용하기 위해서는, [다이나믹셀 커뮤니케이션 브릿지]을 함께 사용하세요.

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png)
> 다이나믹셀 커뮤니케이션 브릿지

## [시리얼 포트](#시리얼-포트)

`Serial2` 포트는 코드 디버깅 및 다양한 디바이스를 제어하기 위해 사용될 수 있습니다.  

![](/assets/images/parts/controller/openrb-150/openrb-150_serial_port.png)

## [LED](#led)

3개의 내장 LED를 통해, OpenRB-150의 현재 상태를 알 수 있습니다. 

- `PWR` (녹색) : OpenRB-150에 켜지면, 해당 LED가 켜집니다. 
- `USER` (오렌지) : 핀 번호 `32`, 또는 아두이노에서 `LED_BUILTIN` 상수 선언을 통해, 해당 LED를 켜거나 끌수 있습니다. 
- `DXL` (적색) : 다이나믹셀 포트에 전원이 들어오면, 해당 LED가 켜집니다. 

![](/assets/images/parts/controller/openrb-150/openrb-150_leds.png)

# [핀 이름 정의](#핀-이름-정의)

```c++
// Battery
#define ADC_BATTERY	(33u)

// LEDs
#define PIN_LED     (32u)
#define LED_BUILTIN PIN_LED

// DYNAMIXEL POWER FET
#define DXL_PWR_SW  (31u)
```

# [전원 연결 방법](#전원-연결-방법)

OpenRB-150은 다음의 3가지 전원 입력 옵션을 제공합니다.

## USB C
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_usb.png)

## VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_vin.png)

## 터미널 VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_terminal_vin.png)

{% capture openrb-150_caution_02 %}
**주의**  
1. OpenRB-150에 전원 연결시, 반드시 극성을 확인하세요. 극성이 반대일 경우, 마이크로컨트롤러에 심각한 손상을 줄 수 있습니다. 
2. 선택한 전원에 따라, 전원 점퍼를 올바른 위치에 결합하세요. 
{% endcapture %}
<div class="notice--danger">{{ openrb-150_caution_02 | markdownify }}</div>

## [연결 예시](#연결-예시)

### \[USB 전용] 5V 다이나믹셀 연결하기 
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example01.png)

{% capture openrb-150_waring_01 %}
**주의**  
USB를 통해 전원 공급시, 다양한 동작을 수행하기 어려울 수 있습니다. 또한 USB포트로 성능 이상의 전원을 끌어오면 사용하는 PC가 재부팅 또는 손상될 수 있습니다.  

높은 토크 및 순간적으로 빠른 동작을 요구하는 어플리케이션은, 아래와 같이 터미널 블록(외부 전원 입력)을 통해, 연결된 액츄에이터에 충분한 전력을 공급해야 합니다. 

![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example01_1.png)

{% endcapture %}
<div class="notice--danger">{{ openrb-150_waring_01 | markdownify }}</div>

### [외부 전원] 12V 다이나믹셀 연결하기 (TTL)
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example02.png)

### [외부 전원] 12V 다이나믹셀 연결하기 (RS485)
![](/assets/images/parts/controller/openrb-150/openrb-150_connection_example03.png)

# [개발 환경 설정](#개발-환경-설정)

## [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)

OpenRB-150은 다이나믹셀 전용 유지보수 소프트웨어인 [다이나믹셀 위자드 2.0]을 지원합니다.  

전용 펌웨어인 `usb_to_dynamixel` 예제 업로드가 필요하며, 아두이노 IDE에서 보드 매니저 설치 시 기본으로 제공됩니다. 

**참고**  
`usb_to_dynamixel` 예제는 OpenRB-150에 공장 출하 상태로 업로드 되며, 최대 `1 Mbps` 까지 지원합니다. 
{: .notice}

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_connection.png)  
> `usb_to_dynamixel` 업로드 후, 다이나믹셀 위자드 2.0의 다양한 기능을 사용해 보세요.

OpenRB-150은 다이나믹셀 위자드 2.0의 대부분의 기능을 사용할 수 있습니다: 다이나믹셀 테스트, 펌웨어 업데이트/복구, 패킷 분석, 그래프 및 컨트롤 테이블 백업.

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_connection02.png)  
> 다양한 범위의 보드레이트 지원 (최대 1M bps)

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_fw_recovery.png)  
> 다이나믹셀 펌웨어 복구 및 업데이트 

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_graph.png)  
> 그래프 사용

![](/assets/images/parts/controller/openrb-150/openrb-150_wizard2_packet.png)  
> 전용 패킷 분석 도구 

## [아두이노 IDE 설치](#아두이노-ide-설치)

### [리눅스에 설치하기](#리눅스에-설치하기)

1. 아두이노 공식 홈페이지에서, `Linux 64 bit` 버전을 다운로드 하세요.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. 원하는 경로에서 다운로드한 파일을 추출한 뒤, 터미널창에서 설치 스크립트를 실행하세요. 
```
$ ./install.sh
```

3. 리눅스 플랫폼에서 아두이노 IDE를 실행시키기 위해, 터미널창에서 다음의 실행 명령어를 사용하세요.
```
$ arduino
```

### [맥에 설치하기](#맥에-설치하기)

1. 아두이노 공식 홈페이지에서, `Mac OS X version`을 다운로드 하세요.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. 다운로드한 아두이노 파일을 `Application`으로 드래그 하세요.

3. 아두이노 IDE를 실행하세요.

### [윈도우즈에 설치하기](#윈도우즈에-설치하기)

[Arduino Software Installation instruction video](https://youtu.be/1Y7FLG1n-9k?t=136)에서, 아두이노 설치영상을 참고하실수 있습니다. 

1. 아두이노 공식 홈페이지에서, `Windows Installer version`을 다운로드 하세요.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. 다운로드한 파일을 설치하세요. 

3. Arduino IDE를 실행하세요. 

## [보드 매니저 설치하기](#보드-매니저-설치하기)

Arduino IDE를 실행시킨 뒤, `파일` (File) > `환경설정` (Preference)을 선택하세요. 

`환경설정` 창이 나타나면, 아래의 주소를 복사하여 `추가적인 보드 매니저 URLs` (Additional Boards Manager URLs)에 붙여넣기 합니다.

```
https://raw.githubusercontent.com/ROBOTIS-GIT/OpenRB-150/master/package_openrb_index.json
```

![](/assets/images/parts/controller/openrb-150/openrb-150_board_manager_index.png)

### Arduino SAMD 보드 매니저

OpenRB-150에 예제 빌드 및 업로드하기 위해서는, Arduino SAMD 보드 매니저 설치가 요구됩니다.  

아래의 설명을 참고하여, Arduino SAMD 보드 매니저를 설치하세요.

1. `도구` (Tools) > `보드` (Board) > `보드 매니저` (Boards Manager)를 선택하세요.
2. `Arduino SAMD`를 검색 후, 가장 최신 버전의 보드 매니저를 설치하세요.

![](/assets/images/parts/controller/openrb-150/arduino_samd_board_manager.png)

### OpenRB-150 보드 매니저

아래의 설명을 참고하여, OpenRB-150 보드 매니저를 설치하세요. 

1. `도구` (Tools) > `보드` (Board) > `보드 매니저` (Boards Manager)를 선택하세요.
2. `OpenRB`를 검색 후, 가장 최신 버전의 보드 매니저를 설치하세요.

![](/assets/images/parts/controller/openrb-150/openrb-150_board_manager.png)

## [라이브러리 API](#라이브러리-api)

아두이노 IDE에서 라이브러리를 추가하는 세가지 방법이 있습니다.

- 라이브러리 매니저를 활용하는 방법
- Zip파일로 압축된 라이브러리를 불러오는 방법
- 수동으로 설치하는 방법

각각의 방법에 대한 자세한 설명은 [Arduino Official Guide]{: .blank}에서 찾을 수 있습니다.  
다음은 라이브러리 매니저를 활용하는 방법입니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

라이브러리 매니저에서 `DYNAMIXEL2Arduino`를 검색하고 설치합니다.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

DYNAMIXEL2Arduino 라이브러리가 성공적으로 설치되었다면, DYNAMIXEL2Arduino 항목에서 다이나믹셀을 제어하는 유용한 예제를 찾을 수 있습니다.

### [Dynamixel2Arduino 라이브러리](#dynamixel2arduino-라이브러리)

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

- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

## [스케치 업로드하기](#스케치-업로드하기)

USB 케이블로 OpenRB-150과 PC를 연결 후, OpenRB-150 보드를 선택하세요.

OpenRB-150이 연결된 Port를 선택 후, `업로드` 버튼을 클릭하면 스케치가 업로드 됩니다. 

![](/assets/images/parts/controller/opencm904/oencm904_upload_01.png)

**참고**
만약, 업로드를 진행하는동안 오류가 발생한다면, [리셋 버튼](#리셋-버튼)을 두번 누른 후, 부트로더 모드에서 스케치를 업로드하세요.
{: .notice}

# [다운로드](#다운로드)

- OpenRB-150 Schematic (PDF): **다운로드 링크가 곧 제공됩니다.**
- OpenRB-150 3D Modeling (STEP): **다운로드 링크가 곧 제공됩니다.**
- OpenRB-150 Board Manager ([GitHub Repo](https://github.com/ROBOTIS-GIT/OpenRB-150), [Zip])
- DYNAMIXEL2Arduino Library ([GitHub Repo](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino), [Zip])

[X 시리즈]: /docs/kr/dxl/x/
[MX 시리즈]: /docs/kr/dxl/mx/
[AX 시리즈]: /docs/kr/dxl/ax/
[P 시리즈]: /docs/kr/dxl/p/
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[아두이노 IDE]: https://www.arduino.cc/en/software
[다이나믹셀 커뮤니케이션 브릿지]: /docs/kr/parts/interface/dxl_bridge/
[OpenRB-150 Schematic (PDF)]: /docs/en/parts/controller/openrb-150/
[OpenRB-150 3D Modeling (STEP)]: /docs/en/parts/controller/openrb-150/

<!-- D2A Library Popup -->
[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
[GitHub repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[begin()]: /docs/en/popup/arduino_api/begin/
[getPortBaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getModelNumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setID()]: /docs/en/popup/arduino_api/setID/
[setProtocol()]: /docs/en/popup/arduino_api/setProtocol/
[setBaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueOn()]: /docs/en/popup/arduino_api/torqueOn/
[torqueOff()]: /docs/en/popup/arduino_api/torqueOff/
[ledOn()]: /docs/en/popup/arduino_api/ledOn/
[ledOff()]: /docs/en/popup/arduino_api/ledOff/
[setOperatingMode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setGoalPosition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getPresentPosition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setGoalVelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getPresentVelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setGoalPWM()]: /docs/en/popup/arduino_api/setGoalPWM/
[getPresentPWM()]: /docs/en/popup/arduino_api/getPresentPWM/
[setGoalCurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getPresentCurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[readControlTableItem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writeControlTableItem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[syncRead()]: /docs/en/popup/arduino_api/syncRead/
[syncWrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkRead()]: /docs/en/popup/arduino_api/bulkRead/
[bulkWrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getLastLibErrCode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
