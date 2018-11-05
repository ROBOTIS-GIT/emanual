---
layout: archive
lang: kr
ref: mx-12w
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/mx/mx-12w/
sidebar:
  title: MX-12W
  nav: "mx-12w"
---

![](/assets/images/dxl/mx/mx-12_product.jpg)

> MX-12W

# [주요 사양](#주요-사양)

| 항목           | 내용    |
| :------------- | :------------- |
|MCU | ST CORTEX-M3 (STM32F103C8 @ 72MHZ, 32BIT)|
|위치 센서 | Contactless absolute encoder (12BIT, 360 [°]) / Maker : ams (www.ams.com), Part No : AS5045|
|모터 | Cored|
| 통신속도       | 8,000 [bps] ~ 4.5 [Mbps]       |
|제어 알고리즘 | PID CONTROL |
| 최소 제어각 | 0.088 [&deg;]  |
| 동작 모드 | 관절 모드 (0 ~ 360 [°]) / 바퀴 모드 (무한 회전)|
| 무게 | 54.6 [g] |
| 크기 | 32 x 50 x 40 [mm] |
| 기어비 | 32 : 1  |
| 무부하 속도 | 470 [rev/min] (at 12V) |
| 동작 온도 | -5 ~ +70 [&deg;C] |
| 사용 전압 | 10 ~ 14.8 [V] (**권장 전압 : 12 [V]**) |
| 제어 명령 | Digital Packet |
| 프로토콜 타입 | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| 통신 연결 | TTL Level Multidrop Bus(Daisy Chain Type Connector) |
| ID | 254 ID (0 ~ 253) |
| 피드백 | Position, Temperature, Load, Input Voltage 등 |
| 재질 | Engineering Plastic |
| 대기 전류 | 60 [mA] |

{% include kr/dxl/warning.md %}

{% include kr/dxl/control_table_protocol1.md %}

## [EEPROM 영역](#eeprom-영역)

| 주소     | 크기<br>(Byte)     | 명칭     | 의미    | 접근     | 기본값  |
| :---------: | :-----------:  | :----------- | :------------ | :--------: | :------------: |
|0|2|[Model Number](#model-number)         | 모델 번호의 바이트      | R       | 104 |
|2|1|[Firmware Version](#firmware-version)    |펌웨어 버전 정보|R|-|
|3|1|[ID](#id)                  |통신 ID     |RW|1|
|4|1|[Baud Rate](#baud-rate)           |통신 속도|RW|1|
|5|1|[Return Delay Time](#return-delay-time)   |응답 지연 시간|RW|250|
|6|2|[CW Angle Limit](#cw-angle-limit)          |시계 방향 한계 각도 값의 바이트|RW|0|
|8|2|[CCW Angle Limit](#ccw-angle-limit)          |반시계 방향 한계 각도 값의 바이트|RW|4,095|
|11|1|[Temperature Limit](#temperature-limit)   |내부 한계 온도|RW|70|
|12|1|[Min Voltage Limit](#min-voltage-limit)   |최저 한계 전압|RW|60|
|13|1|[Max Voltage Limit](#max-voltage-limit)   |최고 한계 전압|RW|160|
|14|2|[Max Torque](#max-torque)           |토크 한계 값의 바이트|RW|1023|
|16|1|[Status Return Level](#status-return-level)      |응답 레벨|RW|2|
|17|1|[Alarm LED](#alarm-led)                             |알람용 LED 기능|RW|36|
|18|1|[Shutdown](#shutdown)            |알람용 셧 다운(Shut down) 기능|RW|36|
|20|2|[Multi Turn Offset](#multi-turn-offset)   |다중 회전 오프셋 바이트|RW|0|
|22|1|[Resolution Divider](#resolution-divider) |해상도 디바이더|RW|1|


## [RAM 영역](#ram-영역)

| 주소     | 크기<br>(Byte)     | 명칭     | 의미    | 접근     | 기본값  |
| :---------: | :-----------:  | :----------- | :------------ | :--------: | :------------: |
|24|1|[Torque Enable](#torque-enable)            |토크 켜기|RW|0|
|25|1|[LED](#led)                             |LED On/Off|RW|0|
|26|1|[D Gain](#d-gain)   |Derivative Gain|RW|8|
|27|1|[I Gain](#i-gain)   |Integral Gain|RW|0|
|28|1|[P Gain](#p-gain)   |Proportional Gain|RW|8|
|30|2|[Goal Position](#goal-position)                 |목표 위치 값의 바이트|RW|-|
|32|2|[Moving Speed](#moving-speed)             |목표 속도 값의 바이트|RW|-|
|34|2|[Torque Limit](#torque-limit)            |토크 한계 값의 바이트|RW|ADD 14\&15|
|36|2|[Present Position](#present-position)     |현재 위치 값의 바이트|R|-|
|38|2|[Present Speed](#present-speed)           |현재 속도 값의 바이트|R|-|
|40|2|[Present Load](#present-load)             |현재 하중 값의 바이트|R|-|
|42|1|[Present Voltage](#present-voltage)       |현재 전압|R|-|
|43|1|[Present Temperature](#present-temperature)|현재 온도|R|-|
|44|1|[Registered](#registered)                 |Instruction의 등록 여부|R|0|
|46|1|[Moving](#moving)                   |움직임 유무|R|0|
|47|1|[Lock](#lock)                   |EEPROM 잠금|RW|0|
|48|2|[Punch](#punch)                   |Punch 값의 바이트|RW|32|
|50|2|[Realtime Tick](#realtime-tick)                   |실시간 Tick|R|0|
|73|1|[Goal Acceleration](#goal-acceleration)   |목표 가속도값|RW|0|



## [컨트롤 테이블 설명](#컨트롤-테이블-설명)

### <a name="model-number"></a>**[Model Number (0)](#model-number-0)**
 장치의 모델 번호입니다.

### <a name="firmware-version"></a>**[Firmware Version (2)](#firmware-version-2)**
 장치의 펌웨어 버전입니다.

### <a name="id"></a>**[ID (3)](#id-3)**
{% include kr/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate (4)](#baud-rate-4)**
{% include kr/dxl/control_table_baudrate.md %}

Value 값이 250 이상인 경우 :

| Value     | Baud Rate     | 오차     |
| :------------: | :------------: | :------------: |
|250|2,250,000|0.000 [%]|
|251|2,500,000|0.000 [%]|
|252|3,000,000|0.000 [%]|

### <a name="return-delay-time"></a>**[Return Delay Time (5)](#return-delay-time-5)**
{% include kr/dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)**
{% include kr/dxl/control_table_mx_angle_limit.md %}

### <a name="temperature-limit"></a>**[Temperature Limit (11)](#temperature-limit-11)**
{% include kr/dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**[Min/Max Voltage Limit (12, 13)](#minmax-voltage-limit-12-13)**
{% include kr/dxl/control_table_volt_limit.md %}

### <a name="max-torque"></a>**[Max Torque (14)](#max-torque-14)**
{% include kr/dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**[Status Return Level (16)](#status-return-level-16)**
{% include kr/dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**[Alarm LED(17), Shutdown(18)](#alarm-led17-shutdown18)**
{% include kr/dxl/control_table_alarm_shutdown.md %}

### <a name="multi-turn-offset"></a>**[Multi Turn Offset (20)](#multi-turn-offset-20)**
{% include kr/dxl/control_table_multiturn_offset.md %}

### <a name="resolution-divider"></a>**[Resolution Divider (22)](#resolution-divider-22)**
{% include kr/dxl/control_table_resolution_divider.md %}

### <a name="torque-enable"></a>**[Torque Enable (24)](#torque-enable-24)**
{% include kr/dxl/control_table_torque_enable.md %}

### <a name="led"></a>**[LED (25)](#led-25)**
{% include kr/dxl/control_table_led.md %}

### <a name="p-gain"></a><a name="i-gain"></a><a name="d-gain"></a>**[PID Gains (26, 27, 28)](#pid-gains-26-27-28)**
{% include kr/dxl/control_table_mx_pid.md %}

### <a name="goal-position"></a>**[Goal Position (30)](#goal-position-30)**
{% include kr/dxl/control_table_mx_goal_position.md %}

### <a name="moving-speed"></a>**[Moving Speed (32)](#moving-speed-32)**
- 관절 모드, 다중 회전 모드  
  Goal Position으로 이동하는 속도입니다.  
  0 ~ 1,023 (0x3FF) 까지 사용되며, 단위는 약 0.916 [rev/min]입니다.  
  0으로 설정하면 속도 제어를 하지 않고 모터의 최대 속도를 사용한다는 의미입니다.  
  1,023의 경우 약 937.1 [rev/min]이 됩니다.  
  예를 들어, 300으로 설정된 경우 약 274.8 [rev/min]입니다.

- 바퀴 모드  
  목표 방향으로 이동하는 속도입니다.  
  0 ~ 2,047( 0x7FF)까지 사용되며, 단위는 0.916 [rev/min]입니다.  
  0 ~ 1,023 범위의 값을 사용하면 CCW 방향으로 회전하며 0으로 설정하면 정지합니다.  
  1,024 ~ 2,047 범위의 값을 사용하면 CW 방향으로 회전하며 1,024으로 설정하면 정지합니다.  
  즉, 10번째 bit가 방향을 제어하는 direction bit가 됩니다.

  **주의**: 해당 모델의 최대 속도를 확인하시기 바랍니다. 최대 속도 이상을 설정해도 모터는 그 이상의 속도를 낼 수 없습니다.
  {: .notice}

### <a name="torque-limit"></a>**[Torque Limit (34)](#torque-limit-34)**
{% include kr/dxl/control_table_torque_limit.md %}

### <a name="present-position"></a>**[Present Position (36)](#present-position-36)**
{% include kr/dxl/control_table_magnet_present_position.md %}

### <a name="present-speed"></a>**[Present Speed (38)](#present-speed-38)**
현재  이동하는 속도입니다.  
이 값은 0 ~ 2,047 (0x7FF) 까지 사용됩니다.  
0 ~ 1,023 범위의 값이면 CCW 방향으로 회전한다는 의미입니다.  
1,024 ~ 2,047 범위의 값이면 CW 방향으로 회전한다는 의미입니다.  
즉, 10번째 bit가 방향을 제어하는 direction bit가 되며 0과 1,024는 같습니다.  
이 값의 단위는 약 0.916 [rev/min] 입니다.  
예를 들어, 300으로 설정된 경우 CCW방향 약 274.8 [rev/min]으로 이동 중이라는 의미입니다

### <a name="present-load"></a>**[Present Load (40)](#present-load-40)**
{% include kr/dxl/control_table_present_load.md %}

### <a name="present-voltage"></a>**[Present Voltage (42)](#present-voltage-42)**
{% include kr/dxl/control_table_present_volt.md %}

### <a name="present-temperature"></a>**[Present Temperature (43)](#present-temperature-43)**
{% include kr/dxl/control_table_present_temp.md %}

### <a name="registered-instruction"></a>**[Registered Instruction (44)](#registered-instruction-44)**
{% include kr/dxl/control_table_reg_instruction.md %}

### <a name="moving"></a>**[Moving (46)](#moving-46)**
{% include kr/dxl/control_table_moving.md %}

### <a name="lock"></a>**[Lock (47)](#lock-47)**
{% include kr/dxl/control_table_lock.md %}

### <a name="punch"></a>**[Punch (48)](#punch-48)**
{% include kr/dxl/control_table_punch.md %}

### <a name="realtime-tick"></a>**[Realtime-Tick (50)](#realtime-tick-50)**
{% include kr/dxl/control_table_realtime_tick.md %}

**주의**: 펌웨어 버전 41 이상부터 사용 가능합니다.
{: .notice}

### <a name="goal-acceleration"></a>**[Goal Acceleration (73)](#goal-acceleration-73)**
{% include kr/dxl/control_table_goal_acceleration.md %}

# [조립 예시](#조립-예시)



# [유지보수](#유지보수)

{% include kr/dxl/horn_bearing_replacement.md %}

# [참고자료](#참고자료)

**주의**: [호환성 가이드]
{: .notice}

## [커넥터 정보](#커넥터-정보)
{% include kr/dxl/molex_ttl.md %}

## [Videos](#videos)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Tw4GfqUpzNA" frameborder="0" allowfullscreen></iframe>

## [도면](#도면)

![](/assets/images/dxl/ax/ax-12w_dimension.png)

더 많은 도면자료는 **[로보티즈 다운로드 센터](http://www.robotis.com/service/downloadpage.php?ca_id=70)**에서 제공됩니다.
{: .notice--success}

[호환성 가이드]: http://www.robotis.com/service/compatibility_table.php?cate=d
