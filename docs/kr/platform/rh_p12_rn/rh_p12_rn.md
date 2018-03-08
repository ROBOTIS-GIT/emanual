---
layout: archive
lang: kr
ref: rh_p12_rn
read_time: true
share: true
author_profile: false
permalink: /docs/kr/platform/rh_p12_rn/
sidebar:
  title: RH-P12-RN
  nav: "rh_p12_rn"
---

# [개요](#개요)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_product.png)

> RH-P12-RN


# [주요 사양](#주요-사양)

| 항목                | 사양                                                                                           |
|:--------------------|:-----------------------------------------------------------------------------------------------|
| MCU                 | ST CORTEX-M4 (STM32F405 @ 168Mhz, 32bit)                                                       |
| 위치 센서           | Contactless Absolute Encoder (12bit, 360&deg;)<br />Maker : ams(www.ams.com), Part No : AS5045 |
| 모터                | Coreless                                                                                       |
| 통신 속도           | 9,600 bps ~ 10.5 Mbps                                                                          |
| 제어 알고리즘       | PID Control                                                                                    |
| 정밀도              | 0.088&deg;                                                                                     |
| 동작 모드           | 전류제어 모드<br />전류기반 위치제어 모드                                                |
| 무게                | 510g                                                                                           |
| 스트로크            | 0 ~ 108mm                                                                                      |
| 감속비              | 1295.7 : 1                                                                                     |
| 최대 파지력         | 170N                                                                                           |
| 권장 가반하중       | 5kg                                                                                            |
| 동작 온도           | -5&deg;C ~ 55&deg;C                                                                            |
| 사용 전압           | 24V                                                                                            |
| Command Signal      | Digital Packet                                                                                 |
| Protocol Type       | RS485 Asynchronous Serial Communication<br />(8bit, 1stop, No Parity)                          |
| Physical Connection | RS485 Multidrop BUS                                                                            |
| ID                  | 0 ~ 252                                                                                        |
| Feedback            | Position, Velocity, Current, Temperature, Input Voltage, etc                                   |
| Material            | Full Metal Gear, Metal Body                                                                    |
| Standby Current     | 30mA                                                                                           |
| Peak Current        | 3.33A                                                                                          |

{% include kr/dxl/control_table_protocol2.md %}

## [EEPROM 영역](#eeprom-영역)

| 주소     | 크기<br>(Byte)  | 명칭                                         | 설명                                       | 접근    | 기본값              |
|:-------:|:--------------:|:--------------------------------------------|:------------------------------------------|:------:|:------------------:|
|    0    |       2        | [Model Number](#model-number)               | Model Number                              |   R    |       35073        |
|    2    |       4        | [Model Information](#model-information)     | Model Information                         |   R    |         -          |
|    6    |       1        | [Firmware Version](#firmware-version)       | Firmware Version                          |   R    |         -          |
|    7    |       1        | [ID](#id)                                   | DYNAMIXEL ID                              |   RW   |         1          |
|    8    |       1        | [Baud Rate](#baud-rate)                     | Communication Speed                       |   RW   |         1          |
|    9    |       1        | [Return Delay Time](#return-delay-time)     | Response Delay Time                       |   RW   |        250         |
|   11    |       1        | [Operating Mode](#operating-mode)           | Operating Mode                            |   RW   |         5          |
|   17    |       4        | [Moving Threshold](#moving-threshold)       | Velocity Threshold for Movement Detection |   RW   |         10         |
|   21    |       1        | [Temperature Limit](#temperature-limit)     | Maximum Internal Temperature Limit        |   RW   |         80         |
|   22    |       2        | [Max Voltage Limit](#max-voltage-limit)     | Maximum Input Voltage Limit               |   RW   |        400         |
|   24    |       2        | [Min Voltage Limit](#min-voltage-limit)     | Minimum Input Voltage Limit               |   RW   |        150         |
|   26    |       4        | [Acceleration Limit](#acceleration-limit)   | Maximum Accleration Limit                 |   RW   |        255         |
|   30    |       2        | [Current Limit](#current-limit)             | Maximum Current Limit                     |   RW   |        820         |
|   32    |       4        | [Velocity Limit](#velocity-limit)           | Maximum Velocity Limit                    |   RW   |        100         |
|   36    |       4        | [Max Position Limit](#max-position-limit)   | Maximum Position Limit                    |   RW   |        1150        |
|   40    |       4        | [Min Position Limit](#min-position-limit)   | Minimum Position Limit                    |   RW   |         0          |
|   44    |       1        | [External Port Mode 1](#external-port-mode) | External Port Mode 1                      |   RW   |         0          |
|   45    |       1        | [External Port Mode 2](#external-port-mode) | External Port Mode 2                      |   RW   |         0          |
|   46    |       1        | [External Port Mode 3](#external-port-mode) | External Port Mode 3                      |   RW   |         0          |
|   47    |       1        | [External Port Mode 4](#external-port-mode) | External Port Mode 4                      |   RW   |         0          |
|   48    |       1        | [Shutdown](#shutdown)                       | Shutdown Error Information                |   RW   |         48         |
|   49    |       2        | [Indirect Address 1](#indirect-address)     | Indirect Address 1                        |   RW   |        634         |
|   51    |       2        | [Indirect Address 2](#indirect-address)     | Indirect Address 2                        |   RW   |        635         |
|   53    |       2        | [Indirect Address 3](#indirect-address)     | Indirect Address 3                        |   RW   |        636         |
|   ...   |       2        | [Indirect Address N](#indirect-address)     | Indirect Address N                        |   RW   |        ...         |
|   559   |       2        | [Indirect Address 256](#indirect-address)   | Indirect Address 256                      |   RW   |        889         |


## [RAM 영역](#ram-영역)

| 주소     | 크기<br>(Byte)  | 명칭                                               | 설명                            | 접근    | 기본값              |
|:-------:|:--------------:|:--------------------------------------------------|:-------------------------------|:------:|:------------------:|
|   562   |       1        | [Torque Enable](#torque-enable)                   | Motor Torque On/Off            |   RW   |         0          |
|   563   |       1        | [LED Red](#led-red)                               | Red LED Intensity Value        |   RW   |         0          |
|   564   |       1        | [LED Green](#led-green)                           | Green LED Intensity Value      |   RW   |         0          |
|   565   |       1        | [LED Blue](#led-blue)                             | Blue LED Intensity Value       |   RW   |         0          |
|   590   |       2        | [Position D Gain](#position-d-gain)               | D Gain of Position             |   RW   |         -          |
|   592   |       2        | [Position I Gain](#position-i-gain)               | I Gain of Position             |   RW   |         -          |
|   594   |       2        | [Position P Gain](#position-p-gain)               | P Gain of Position             |   RW   |         -          |
|   596   |       4        | [Goal Position](#goal-position)                   | Target Position Value          |   RW   |         -          |
|   600   |       4        | [Goal Velocity](#goal-velocity)                   | Target Velocity Value          |   RW   |         0          |
|   604   |       2        | [Goal Current](#goal-current)                     | Target Current Value           |   RW   |         0          |
|   606   |       4        | [Goal Acceleration](#goal-acceleration)           | Target Acceleration Value      |   RW   |         0          |
|   610   |       1        | [Moving](#moving)                                 | Movement Status                |   R    |         -          |
|   611   |       4        | [Present Position](#present-position)             | Present Position Value         |   R    |         -          |
|   615   |       4        | [Present Velocity](#present-velocity)             | Present Velocity Value         |   R    |         -          |
|   621   |       2        | [Present Current](#present-current)               | Present Current Value          |   R    |         -          |
|   623   |       2        | [Present Input Voltage](#present-input-voltage)   | Present Input Voltage          |   R    |         -          |
|   625   |       1        | [Present Temperature](#present-temperature)       | Present Internal Temperature   |   R    |         -          |
|   626   |       2        | [External Port Data 1](#external-port-data)       | External Port Data 1           |  R/RW  |         0          |
|   628   |       2        | [External Port Data 2](#external-port-data)       | External Port Data 2           |  R/RW  |         0          |
|   630   |       2        | [External Port Data 3](#external-port-data)       | External Port Data 3           |  R/RW  |         0          |
|   632   |       2        | [External Port Data 4](#external-port-data)       | External Port Data 4           |  R/RW  |         0          |
|   634   |       1        | [Indirect Data 1](#indirect-data)                 | Indirect Data 1                |   RW   |         0          |
|   635   |       1        | [Indirect Data 2](#indirect-data)                 | Indirect Data 2                |   RW   |         0          |
|   636   |       1        | [Indirect Data 3](#indirect-data)                 | Indirect Data 3                |   RW   |         0          |
|   ...   |       1        | [Indirect Data N](#indirect-data)                 | Indirect Data N                |   RW   |         0          |
|   889   |       1        | [Indirect Data 256](#indirect-data)               | Indirect Data 256              |   RW   |         0          |
|   890   |       1        | [Registered Instruction](#registered-instruction) | Check Reception of Instruction |   R    |         0          |
|   891   |       1        | [Status Return Level](#status-return-level)       | Select Types of Status Return  |   RW   |         2          |
|   892   |       1        | [Hardware Error Status](#hardware-error-status)   | Hardware Error Status          |   R    |         0          |


## [컨트롤 테이블 설명](#컨트롤-테이블-설명)

`주의` EEPROM Area에 존재하는 모든 Data는 Torque Enable(562)의 값이 ‘0’일 때만 변경할 수 있습니다.
{: .notice--warning}

### <a name="model-number"></a>**[Model Number(0)](#model-number0)**
RH-P12-RN의 모델 번호입니다.

| 모델명 | 모델 번호 |
| :--------: | :----------: |
|RH-P12-RN | 35073 (0x8901) |

### <a name="firmware-version"></a>**[Firmware Version(6)](#firmware-version6)**
RH-P12-RN의 펌웨어 버전입니다.

### <a name="id"></a>**[ID(7)](#id7)**
{% include kr/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate(8)](#baud-rate8)**
{% include kr/dxl/control_table_8_baudrate_pro.md %}

### <a name="return-delay-time"></a>**[Return Delay Time(9)](#return-delay-time9)**
{% include kr/dxl/control_table_return_delay_time.md %}

### <a name="operating-mode"></a>**[Operating Mode(11)](#operating-mode11)**
다이나믹셀의 제어 모드를 설정합니다. 각 제어 모드마다 특성이 다르기 때문에, 구현하려는 시스템에 적합한 제어 모드를 설정하시기 바랍니다.

| Value      | Operating Mode         | Description                                           |
|:-----------|:-----------------------|:------------------------------------------------------|
| 0          | 전류제어 모드            | 속도와 위치는 제어하지 않고, 전류를 제어합니다.            |
| 1 ~ 4      | Reserved               | -                                                     |
| 5(Default) | 전류기반 위치제어 모드    | 위치와 전류를 제어합니다.                                |

### <a name="moving-threshold"></a>**[Moving Threshold(17)](#moving-threshold17)**
{% include kr/dxl/control_table_17_movingthreshold_pro.md %}

### <a name="temperature-limit"></a>**[Temperature Limit(21)](#temperature-limit21)**
{% include kr/dxl/control_table_21_templimit_pro.md %}

### <a name="max-voltage-limit"></a><a name="min-voltage-limit"></a>**[Min/Max Voltage Limit(22, 24)](#minmax-voltage-limit22-24)**
{% include kr/dxl/control_table_22_voltlimit_pro.md %}

### <a name="acceleration-limit"></a>**[Acceleration Limit(26)](#acceleration-limit26)**
목표 가속도 값의 한계 값입니다.  
Goal Acceleration(606)은 이 값보다 큰 값을 쓸 수 없습니다.  
이 값보다 큰 값을 쓰려 하면, 값이 써지지 않고, Status packet의 error 에 Limit error bit가 set 됩니다.  
Goal Acceleration(606)은 전류 제어 모드를 제외한 모든 제어 모드에서 목표 궤적을 생성하는데 사용됩니다.

|            단위             |     값의 범위     |
|:---------------------------:|:-----------------:|
| 214.577 Rev/min<sup>2</sup> | 0 ~ 2,147,483,647 |

### <a name="current-limit"></a>**[Current Limit(30)](#current-limit30)**
목표 전류 값의 한계 값입니다.  
Goal Current(604)은 이 값보다 큰 값을 쓸 수 없습니다.  
이 값보다 큰 값을 쓰려 하면, 값이 써지지 않고, Status packet의 error 에 Limit error bit가 set 됩니다.

|     단위      | 값의 범위 |
|:-------------:|:-----------:|
| 약 4.02 mA |   0 ~ 820   |

### <a name="velocity-limit"></a>**[Velocity Limit(32)](#velocity-limit32)**
목표 속도 값의 한계 값입니다.  
Goal Velocity(600)은 이 값보다 큰 값을 쓸 수 없습니다.  
이 값보다 큰 값을 쓰려 하면, 값이 써지지 않고, Status packet의 error 에 Limit error bit가 set 됩니다.

|   단위    |     값의 범위      |
|:---------:|:-----------------:|
| 0.114 RPM | 0 ~ 2,147,483,647 |

### <a name="max-position-limit"></a><a name="min-position-limit"></a>**[Min/Max Position Limit(36, 40)](#minmax-position-limit36-40)**
Goal Position(596)의 상한 값과 하한 값입니다.  
Goal Position(596)에 Max Position Limit(36)과 Min Position Limit(40)의 범위를 벗어난 값을 쓰려고 할 경우, Status Packet 의 Error 필드를 통해 Data Limit Error(0x06)를 전송합니다.

| Max Position(Close) | Min Position(Open) |
|:-------------------:|:------------------:|
|        1,150        |         0          |


### <a name="external-port-mode"></a><a name="external-port-data"></a>**[External Port Mode](#external-port-mode)**, **[External Port Data](#external-port-data)**
다이나믹셀 프로는 다용도로 사용 가능한 External Port 를 제공합니다.  
External Port 의 용도는 External Port Mode (44, 45, 46, 47) 에 의해서 결정되고, External Port 의 신호는 External Port Data (626, 628, 630, 632) 에 의해 제어됩니다.

|External Port Mode|명칭|상세|
| :---: | :---: | :---: |
|0(초기값)|AI(Analogue Input)|External Port 신호를 12[bit] Digital로 변환|
|1|DO_PP(Digital Output Push-Pull)|External Port를 0[V] 또는 3.3[V]로 출력|
|2|DI_PU(Digital Input Pull-Up)|External Port 신호를 ‘0’ 또는 ‘1’의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 ‘1’|
|3|DI_PD(Digital Input Pull-Down)|External Port 신호를 0 또는 1의 Digital 신호로 변경<br />External Port에 신호가 연결되어 있지 않을 경우 ‘0’|

|External Port Mode|접근|기능|상세|
| :---: | :---: | :---: | :---: |
|Common|-|-|0 ~ 3.3[V], 0 ~ 5[mA]<br />VESD(HBM) : 2[kV]|
|0(AI)|Read|External Port 신호(signal)를 Digital로 변환<br />External Data = signal x (4,095 / 3.3)|Resolution : 12[bit] (0 ~ 4,095)|
|1(DO_PP)|Write|0 : External Port의 출력을 0[V]로 변경<br />1 : External Port의 출력을 3.3[V]로 변경|Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)|
|2(DI_PU)<br />3 (DI_PD)|Read|0 : External Port의 입력이 0[V]<br />1 : External Port의 입력이 3.3[V]|Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up/Down : 40 [kΩ] (typ)|

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

{% capture control_table_externalportdata_warning %}
`경고` External Port 는 전기적으로 절연되어 있지 않기 때문에, 전기적 사양을 준수하시기 바랍니다.  
전기적 사양을 초과하거나 신호 연결에 문제가 있는 경우, Dynamixel이 손상될 수 있으므로 각별한 주의가 요구됩니다. External Port를 사용할 때 다음 사항들을 주의하시기 바랍니다. 
- 정전기(ESD), 단락(Short circuit), 단선(Open circuit) 등에 의한 전기적인 충격이 발생하지 않도록 주의해 주십시오. 
- External Port 커넥터로 물이나 먼지가 유입되지 않도록 주의해 주십시오. 
- External Port를 사용하지 않을 때는 케이블을 제거해 주십시오. 
- External Port에 신호를 연결/해제 할 때는 전원이 꺼진 상태에서 진행해 주십시오. 
- External Port 의 GNDext 핀과 Dynamixel 커넥터의 GND핀을 직접 연결하지 마십시오. 전원 노이즈가 External Port로 유입될 수 있습니다.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>

#### 외부 확장 포트의 위치 및 핀 기능

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port.png)

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port_pinout.png)

|Pin 1|Pin 2|Pin 3|Pin 4|Pin 5|Pin 6|
| :---: | :---: | :---: | :---: | :---: | :---: |
|GND|3.3V|PORT1|PORT2|PORT3|PORT4|


### <a name="shutdown"></a>**[Shutdown(48)](#shutdown48)**
다이나믹셀 프로는 동작 중에 발생하는 위험 상황을 감지하여 스스로를 보호할 수 있습니다. 각 Bit의 기능은 ‘OR’ 논리로 적용되기 때문에 중복 설정이 가능합니다.  
즉 [Shutdown(48)]이 ‘0x05’(2진수 : 000,0101)로 설정되었을 경우, Input Voltage Error(2진수 : 0000,0001)와 Over Heating Error(2진수 : 0000,0100)가 발생하는 것을 모두 감지할 수 있습니다.  
위험상황이 감지되면, [Torque Enable(562)] 값이 ‘0’으로 변경되고 모터 출력은 0%가 됩니다.  
위험상황이 감지된 후에는 REBOOT을 하지 않는 한, Torque Enable(562)을 ‘1’(Torque ON)로 설정할 수 없습니다.  
[Shutdown(48)]에서 감지할 수 있는 위험 상황은 아래 표와 같습니다. [Shutdown(48)]의 초기값은 0x30 (2진수 : 0011,0000) 입니다.

|Bit   | 명칭     | 상세 설명     |
| :-------------: | :-------------: | :------------- |
|Bit 7|-|미사용, 항상 0|
|Bit 6|-|미사용, 항상 0|
|Bit 5|Overload Error(기본값)|최대 출력으로 제어할 수 없는 하중이 지속적으로 발생한 경우|
|Bit 4|Electrical Shock Error(기본값)|전기적으로 회로가 충격을 받거나, 입력 전력이 부족해서 모터가 정상동작하지 못하는 경우.|
|Bit 3|Motor Encoder Error|모터의 엔코더가 동작하지 않을 경우|
|Bit 2|OverHeating Error|내부 온도가 설정된 동작 온도 범위를 벗어난 경우|
|Bit 1|-|미사용, 항상 0|
|Bit 0|Input Voltage Error|인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우|

{% capture rh_p12_rn_01 %}
`Note` Shutdown 이 발생하면 다음과 같은 방법으로 다이나믹셀을 REBOOT 시킬 수 있습니다. 
1. H/W REBOOT : 전원을 껐다 켜는 방법 
2. S/W REBOOT : REBOOT Instruction Packet 을 전송하는 방법 (자세한 사항은 e-Manual의 [프로토콜]을 참고해 주세요)
{% endcapture %}

<div class="notice">{{ rh_p12_rn_01 | markdownify }}</div>

[프로토콜]: /docs/kr/dxl/protocol2/#reboot


### <a name="indirect-address"></a><a name="indirect-data"></a>**[Indirect Address](#indirect-address)**, **[Indirect Data](#indirect-data)**
{% include kr/dxl/control_table_49_indirectdata_pro.md %}

### <a name="torque-enable"></a>**[Torque Enable(562)](#torque-enable562)**
{% include kr/dxl/control_table_torque_enable_2.md %}

### <a name="led"></a>**[RGB LED(563)](#rgb-led563)**
{% include kr/dxl/control_table_563_led_pro.md %}

### <a name="position-d-gain"></a><a name="position-i-gain"></a><a name="position-p-gain"></a>**Position PID Gain(594, 592, 590)**
전류기반 위치 제어 모드에서 동작하는 위치 제어기의 Gain 값이며 범위는 0 ~ 32,767 입니다.  
아래 그림은 전류기반 위치 제어 모드에서의 위치 제어기와 전류 제어기 블록 다이어그램입니다.  
K<sub>P</sub>D, K<sub>P</sub>I, K<sub>P</sub>P 는 각각 Position D Gain, Position I Gain, Position P Gain 을 나타냅니다.  
사용자의 요청이 그리퍼에 전달된 후 그리퍼의 손가락이 구동되기까지의 과정은 다음과 같습니다.

1. 사용자의 위치값 변경 요청이Goal Position(596)에 등록됩니다.
2. Goal Position(596)은 Goal Velocity(600)와 Goal Acceleration(606)에 의해서 목표 위치 궤적과 목표 속도 궤적으로 변경됩니다. (Profile)
3. PID 제어기는 목표 궤적을 기반으로 목표 전류(Target Current)를 계산합니다.
4. Goal Current(604)는 계산된 목표 전류(Target Current)를 제한하여 최종 목표 전류를 결정합니다.
5. 전류 제어기는 최종 목표 전류를 기반으로 모터에 인가할 PWM 출력을 결정합니다.
6. 최종 PWM 값은 Inverter 를 통해 모터에 적용되고, 감속기를 거쳐 그리퍼의 손가락이 구동됩니다.
7. 구동 결과는 Present Position(611), Present Velocity(615), Present Current(621)에 표기됩니다.

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_control_diagram.png)

`Note` K<sub>P</sub>A는 Anti-windup Gain으로 사용자가 변경할 수 없습니다. PID제어기에 대한 설명은 다음의 사이트를 참고합니다. [PID 제어기(위키피디아)](http://en.wikipedia.org/wiki/PID_controller).
{: .notice}

### <a name="goal-position">**[Goal Position(596)](#goal-position596)**
이동시키고자 하는 곳의 위치 값입니다.  
값의 범위는 Min Position Limit(40) ~ Max Position Limit(36) 이며, 초기값은 0 ~ 1,150 (0x47E) 입니다.

|모델명|Goal Position = 0|Goal Position = 740|
| :-------: | :--------: | :--------: |
|RH-P12-RN|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png)|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png)|


### <a name="goal-velocity"></a>**[Goal Velocity(600)](#goal-velocity600)**
전류기반 위치 제어 모드에서만 사용되며, Profile 의 최대 속도를 설정합니다.  
Goal Velocity(600)가 ‘0’인 경우, Profile 은 비활성화 되며, 속도를 제한하지 않고 모터의 최대 RPM 을 사용합니다.

|단위|값의 범위|
| :---: | :---: |
| 약 0.114 RPM | -Velocity Limit(32) ~ Velocity Limit(32) |

`Note` 해당 모델의 최대 RPM을 확인하시기 바랍니다. Goal Velocity(600)를 최대 RPM 이상으로 설정해도 모터는 최대 RPM 이상의 속도를 낼 수 없습니다.
{: .notice}

### <a name="goal-current"></a>**[Goal Current(604)](#goal-current604)**
Operating Mode(11) 에 따라 다른 의미로 사용됩니다.

| Operating Mode          | Goal Current                                 |
|:------------------------|:---------------------------------------------|
| 0 (전류제어 모드)         | Goal Current(604)값이 목표 전류값으로 사용됩니다.|
| 5 (전류기반 위치제어 모드) | Goal Current(604)값이 최대 전류값으로 사용됩니다.|

Goal Current(604)는 Current Limit(30) 보다 큰 값을 사용할 수 없습니다.

|     단위    |                값의 범위                |
| :--------: | :------------------------------------: |
| 약 4.02 mA | -Current Limit(30) ~ Current Limit(30) |

### <a name="goal-acceleration"></a>**[Goal Acceleration(606)](#goal-acceleration606)**
전류기반 위치 제어 모드에서만 사용되며, Profile 의 가속도를 설정합니다.  
Goal Velocity(600)가 ‘0’인 경우, Profile 이 비활성화 되어 Goal Acceleration(606)은 적용되지 않습니다.

|단위|값의 범위|
| :---: | :---: |
| 214.577 Rev/min<sup>2</sup> | 0 ~ Acceleration Limit(26) |

### <a name="moving"></a>**[Moving(610)](#moving610)**
{% include kr/dxl/control_table_610_moving_pro.md %}

### <a name="present-position"></a>**[Present Position(611)](#present-position611)**
다이나믹셀의 현재 위치 값입니다.

|Model|Goal Position = 0|Goal Position = 740|
| :-------: | :--------: | :--------: |
|RH-P12-RN|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png)|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png)|

### <a name="present-velocity"></a>**[Present Velocity(615)](#present-velocity615)**
현재 이동하는 속도입니다.  
이 값은 -1,023 ~ 1,023까지 사용됩니다.  
0 ~ 1,023 범위의 값이면 좁히는(Grasp) 방향으로 회전한다는 의미입니다.  
-1,023 ~ 0 범위의 값이면 넓히는(Release) 방향으로 회전한다는 의미입니다.  
이 값의 단위는 약 0.114 RPM 입니다.
예를 들어, 300으로 설정된 경우 좁히는(Grasp) 방향으로 약 34.33 RPM의 속도로 이동 중이라는 의미입니다.

### <a name="present-current"></a>**[Present Current(621)](#present-current621)**
현재 전류 값입니다. 이 값의 단위는 약 4.02mA 입니다.

### <a name="present-input-voltage"></a>**[Present Input Voltage(623)](#present-input-voltage623)**
현재 공급되고 있는 전압 값이며, 이 값의 단위는 0.1V입니다.  
예를 들어, 값이 100이면 10V입니다.  
더 자세한 내용은 [Min/Max Voltage Limit(24, 22)](#max-voltage-limit)를 참조하세요.

### <a name="present-temperature"></a>**[Present Temperature(625)](#present-temperature625)**
내부의 온도 값이며, 이 값의 단위는 1&deg;C입니다.  
예를 들어, 값이 85이면 현재 내부 온도는 85&deg;C 입니다.  
더 자세한 내용은 [Temperature Limit(21)](#temperature-limit)를 참조하세요.

### <a name="registered-instruction"></a>**[Registered Instruction(890)](#registered-instruction890)**
{% include kr/dxl/control_table_reg_instruction.md %}

### <a name="status-return-level"></a>**[Status Return Level(891)](#status-return-level891)**
{% include kr/dxl/control_table_status_return_lv.md %}

### <a name="hardware-error-status"></a>**[Hardware Error Status(892)](#hardware-error-status892)**
{% include kr/dxl/control_table_hardware_error_status.md %}


# [조립 예시](#조립-예시)

## [옵션프레임 조립](#옵션프레임-조립)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_assembly.png)


# [참고자료](#참고자료)

## [커넥터 정보](#커넥터-정보)

{% include kr/dxl/molex_485_pro.md %}

## [도면](#도면)
`Download` [PDF]


[PDF]: http://support.robotis.com/en/baggage_files/dynamixel/rh-p12-rn.pdf
[Torque Enable(562)]: #torque-enable562
