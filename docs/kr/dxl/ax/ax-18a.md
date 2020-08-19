---
layout: archive
lang: kr
ref: ax-18a
read_time: true
share: true
author_profile: false
permalink: /docs/kr/dxl/ax/ax-18a/
sidebar:
  title: AX-18A
  nav: "ax-18a"
product_group: dxl_ax
---

![](/assets/images/dxl/ax/ax-18f_product.jpg)
![](/assets/images/dxl/ax/ax-18a_product.png)

> AX-18F, AX-18A

**주의**: AX-18A 는  AX-18F 와 동일한 성능에 외형을 개선한 모델입니다. 현재는 AX-18A만 판매중 입니다.
{: .notice--warning}

# [주요 사양](#주요-사양)

| 항목          | 내용                                                                        |
|:--------------|:----------------------------------------------------------------------------|
| 통신 속도     | 7843 bps ~ 1 Mbps                                                           |
| 무게          | AX-18F (54.5 [g]), AX-18A (55.9 [g])                                        |
| 크기          | 32 X 50 X 40 [mm]<br />1.26 X 1.97 X 1.57 [inch]                            |
| 최소 제어각   | 0.29 [deg]                                                                  |
| 모터          | Coreless                                                                    |
| 기어비        | 254 : 1                                                                     |
| Stall Torque  | 1.8 [N&middot;m] (at 12 [V], 2.2 [A])                                       |
| 무부하 속도   | 97 [rpm] (at 12 [V])                                                        |
| 동작 모드     | 관절 모드 : 0 ~ 300 [deg]<br />바퀴 모드 : 무한 회전                        |
| 동작 온도     | -5 ~ +70 [&deg;C]                                                           |
| 사용 전압     | 9.0 ~ 12.0 [V] (**권장 전압 : 11.1 [V]**)                                   |
| 제어 명령     | Digital Packet                                                              |
| 프로토콜 타입 | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| 통신 연결     | TTL Level Multi Drop Bus                                                    |
| ID            | 254 ID (0~253)                                                              |
| 피드백        | Position, Temperature, Load, Input Voltage 등                               |
| 기어 재질     | Engineering Plastic(1, 2, 3), Precious Metal(4)                             |
| 케이스 재질   | Engineering Plastic(Front, Middle, Back)                                    |

**주의**: Stall Torque 는 순간적으로 낼수있는 최대정지토크를 의미합니다. 실제 구동을 위해 로봇을 설계하신다면 Stall Torque의 1/5 이하의 로드가 걸리도록 설계하셔야 안정적인 움직임이 가능합니다.
{: .notice}

{% include kr/dxl/warning.md %}

{% include kr/dxl/control_table.md %}

## [EEPROM 영역](#eeprom-영역)

| 주소 | 크기(Byte) | 명칭                                        | 의미                              | 접근 | 초기값 |
|:-----|:-----------|:--------------------------------------------|:----------------------------------|:-----|:-------|
| 0    | 2          | [Model Number](#model-number)               | 모델 번호                | R    | 18     |
| 2    | 1          | [Firmware Version](#firmware-version)       | 펌웨어 버전 정보                  | R    | -      |
| 3    | 1          | [ID](#id)                                   | 다이나믹셀 ID                     | RW   | 1      |
| 4    | 1          | [Baud Rate](#baud-rate)                     | 다이나믹셀 통신 속도              | RW   | 1      |
| 5    | 1          | [Return Delay Time](#return-delay-time)     | 응답 지연 시간                    | RW   | 250    |
| 6    | 2          | [CW Angle Limit](#cw-angle-limit)           | 시계 방향 한계 각도    | RW   | 0      |
| 8    | 2          | [CCW Angle Limit](#ccw-angle-limit)         | 반시계 방향 한계 각도  | RW   | 1023   |
| 11   | 1          | [Temperature Limit](#temperature-limit)     | 내부 한계 온도                    | RW   | 75     |
| 12   | 1          | [Min Voltage Limit](#min-voltage-limit)     | 최저 한계 전압                    | RW   | 60     |
| 13   | 1          | [Max Voltage Limit](#max-voltage-limit)     | 최고 한계 전압                    | RW   | 140    |
| 14   | 2          | [Max Torque](#max-torque)                   | 토크 한계              | RW   | 983    |
| 16   | 1          | [Status Return Level](#status-return-level) | 응답 레벨                         | RW   | 2      |
| 17   | 1          | [Alarm LED](#alarm-led)                     | 알람용 LED 기능                   | RW   | 36     |
| 18   | 1          | [Shutdown](#shutdown)                       | 알람용 셧 다운(Shut down) 기능    | RW   | 36     |

## [RAM 영역](#ram-영역)

| 주소 | 크기(Byte) | 명칭                                            | 의미                       | 접근 | 초기값     |
|:-----|:-----------|:------------------------------------------------|:---------------------------|:-----|:-----------|
| 24   | 1          | [Torque Enable](#torque-enable)                 | 토크 켜기                  | RW   | 0          |
| 25   | 1          | [LED](#led)                                     | LED On/Off                 | RW   | 0          |
| 26   | 1          | [CW Compliance Margin](#cw-compliance-margin)   | CW Compliance Margin       | RW   | 1          |
| 27   | 1          | [CCW Compliance Margin](#ccw-compliance-margin) | CCW Compliance Margin      | RW   | 1          |
| 28   | 1          | [CW Compliance Slope](#cw-compliance-slope)     | CW Compliance Slope        | RW   | 32         |
| 29   | 1          | [CCW Compliance Slope](#ccw-compliance-alope)   | CCW Compliance Slope       | RW   | 32         |
| 30   | 2          | [Goal Position](#goal-position)                 | 목표 위치       | RW   | -          |
| 32   | 2          | [Moving Speed](#moving-speed)                   | 목표 속도 값의 하위 바이트 | RW   | -          |
| 34   | 2          | [Torque Limit](#torque-limit)                   | 토크 한계       | RW   | Max Torque |
| 36   | 2          | [Present Position](#present-position)           | 현재 위치       | R    | -          |
| 38   | 2          | [Present Speed](#present-speed)                 | 현재 속도       | R    | -          |
| 40   | 2          | [Present Load](#present-load)                   | 현재 하중       | R    | -          |
| 42   | 1          | [Present Voltage](#present-voltage)             | 현재 전압                  | R    | -          |
| 43   | 1          | [Present Temperature](#present-temperature)     | 현재 온도                  | R    | -          |
| 44   | 1          | [Registered](#registered)                       | Instruction의 등록 여부    | R    | 0          |
| 46   | 1          | [Moving](#moving)                               | 움직임 유무                | R    | 0          |
| 47   | 1          | [Lock](#lock)                                   | EEPROM 잠금                | RW   | 0          |
| 48   | 2          | [Punch](#punch)                                 | Punch           | RW   | 32         |

## [컨트롤 테이블 설명](#컨트롤-테이블-설명)

### <a name="model-number"></a>**[Model Number (0)](#model-number-0)**
다이나믹셀의 모델 번호입니다.

### <a name="firmware-version"></a>**[Firmware Version (2)](#firmware-version-2)**
다이나믹셀 펌웨어 버전입니다.

### <a name="id"></a>**[ID (3)](#id-3)**
{% include kr/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate (4)](#baud-rate-4)**
제어기와 통신하기 위한 통신 속도 입니다. 0~254 (0xFE) 까지 사용 가능하며 산출 공식은 다음과 같습니다.  
Baudrate(BPS) = 2,000,000 / (Value + 1)

|    값     | 통신속도(bps) | 오차율  |
|:---------:|:-------------:|:-------:|
| 1(기본값) |      1M       | 0.000%  |
|     3     |    500,000    | 0.000%  |
|     4     |    400,000    | 0.000%  |
|     7     |    250,000    | 0.000%  |
|     9     |    200,000    | 0.000%  |
|    16     |    115200     | -2.124% |
|    34     |     57600     | 0.794%  |
|    103    |     19200     | -0.160% |
|    207    |     9600      | -0.160% |

**참고**: UART는 Baudrate 오차가 3% 이내이면 통신에 지장이 없습니다.
{: .notice}

**참고**: 높은 통신데이터를 정상적으로 사용하기위해, 응답시간을 낮춰주세요.  
[응답 시간 조정](/docs/kr/software/dynamixel/dynamixel_wizard2/#포트-응답-속도-설정)  
{: .notice}


### <a name="return-delay-time"></a>**[Return Delay Time (5)](#return-delay-time-5)**
{% include kr/dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)**
{% include kr/dxl/control_table_angle_limit.md %}

### <a name="temperature-limit"></a>**[Temperature Limit (11)](#temperature-limit-11)**
{% include kr/dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**[Min/Max Voltage Limit (12, 13)](#minmax-voltage-limit-12-13)**
{% include kr/dxl/control_table_volt_limit.md %}

### <a name="max-torque"></a>**[Max Torque (14)](#max-torque-14)**
{% include kr/dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**[Status Return Level (16)](#status-return-level-16)**
{% include kr/dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**[Alarm LED(17), Shutdown(18)](#alarm-led17-shutdown18)**
{% include kr/dxl/control_table_shutdown.md %}

### <a name="torque-enable"></a>**[Torque Enable (24)](#torque-enable-24)**
{% include kr/dxl/control_table_torque_enable.md %}

### <a name="led"></a>**[LED (25)](#led-25)**
{% include kr/dxl/control_table_led.md %}

### <a name="cw-compliance-margin"></a><a name="ccw-compliance-margin"></a>**[Compliance Margin (26, 27)](#compliance-margin-26-27)**
{% include kr/dxl/control_table_compliance_margin.md %}

### <a name="cw-compliance-slope"></a><a name="ccw-compliance-slope"></a>**[Compliance Slope (28, 29)](#compliance-slope-28-29)**
{% include kr/dxl/control_table_compliance_slope.md %}

### <a name="goal-position"></a>**[Goal Position (30)](#goal-position-30)**
{% include kr/dxl/control_table_dx_goal_position.md %}

### <a name="moving-speed"></a>**[Moving Speed (32)](#moving-speed-32)**
{% include kr/dxl/control_table_moving_speed.md %}

### <a name="torque-limit"></a>**[Torque Limit (34)](#torque-limit-34)**
{% include kr/dxl/control_table_torque_limit.md %}

### <a name="present-position"></a>**[Present Position (36)](#present-position-36)**
{% include kr/dxl/control_table_potentio_present_position.md %}

### <a name="present-speed"></a>**[Present Speed (38)](#present-speed-38)**
{% include kr/dxl/control_table_present_speed.md %}

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


# [조립 예시](#조립-예시)

![](/assets/images/dxl/ax/ax_12a_frame_assembly_02.png)

![](/assets/images/dxl/ax/ax_series_frame_assembly_01.png)

![](/assets/images/dxl/ax/ax_series_frame_assembly_02.png)

# [유지보수](#유지보수)

{% include kr/dxl/horn_bearing_replacement.md %}

# [참고자료](#참고자료)

**참고**  
[호환성 가이드]{: .blank}  
[케이블 호환성]{: .popup}
{: .notice}

## [인증 획득](#인증-획득)
표기되지 않은 인증에 대해서는 별도 문의하시기 바랍니다.

### [FCC](#fcc)

#### AX-18A
{% include kr/dxl/fcc_class_a.md %}

#### AX-18F
{% include kr/dxl/fcc_class_b.md %}

## [커넥터 정보](#커넥터-정보)
{% include kr/dxl/molex_ttl.md %}

## [도면](#도면)

![](/assets/images/dxl/ax/ax-18a_dimension.png)

{% include kr/dxl/download_center_notice.md %}

{% include kr/dxl/485_ttl_connection.md %}

[호환성 가이드]: http://www.robotis.com/service/compatibility_table.php?cate=d

{% include kr/dxl/common_link.md %}
