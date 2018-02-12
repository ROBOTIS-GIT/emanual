---
layout: archive
lang: kr
ref: opencm7
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/controller/opencm7/
sidebar:
  title: OpenCM 7.0
  nav: "opencm7"
---

# [개요](#개요)

![](/assets/images/parts/controller/opencm7/r+iot_45.jpg)

> OpenCM 7.0

- IoT키트에서 사용되는 제어기로, 스마트의 각종 부품들([감속모터], [서보모터], [접촉센서], [LED모듈], [적외선센서] 등..)을 연결할 수 있습니다.
- [RoboPlus Task2] 또는 R+ m. Task2(2.0.41 이상 버전)를 통해 제어용 태스크 코드를 작성하여 각 부품들의 동작을 제어할 수 있습니다.

# [주요 사양](#주요-사양)

|항목|세부 사양|
|:---:|:---|
|무게 | 10g|
|컨트롤러 | STM32L151C8|
|크기 | 66mm × 27mm × 9mm|
|동작 전압|2.6V ~ 5.2V, **권장전압: 3.0 ~ 5.0V**<br>(건전지 × 2 또는 리튬이온 배터리 × 1)|
|소비 전류|대기 상태: 20mA, 실행 상태: 90mA, 최대 한계: 300mA|
|동작 온도 | -5&deg;C ~ 70&deg;C|
|내부 I/O장치|마이크(소리 감지용) × 1<br>버저(Buzzer) × 1<br>LED × 3 (R / G / B)<br>사용자 입력버튼 × 1|
|외부 I/O 장치|4핀 통신 포트(무선 조종 및 다운로드용) × 1<br>모터 연결 포트(감속 모터용) × 2<br>다목적 포트(센서 및 출력용) × 4|

# [각 부 명칭](#각-부-명칭)

![](/assets/images/parts/controller/opencm7/r+iot_46.jpg)

- 시작 버튼: 짧게 버튼을 눌러 켜면, 시작 버튼 하단의 빨간색 전원 LED 에 불이 켜지며 제어기에 다운로드 한 프로그램이 실행됩니다.

  ![](/assets/images/parts/controller/opencm7/r+iot_47.jpg)

- 4핀 포트(통신용) : 시작 버튼 옆에 위치해 있으며, USB 다운로더(LN-101), ZIG-110A, BT-110A, BT-210, BT-410 등을 연결할 수 있습니다.
- 감속모터 포트 1 ~ 2 : 각 포트 번호는 ①, ②와 같이 숫자로 표시되어 있으며, 감속모터를 연결하는 2핀으로 된 포트입니다. 제어기 보드상의 흰 선으로 2핀 케이블의 방향이 표기되어 있습니다.
- 다목적 포트 3 ~ 6 : 각 포트 번호는 ③, ④와 같이 숫자로 표시되어 있으며, 적외선 센서와 접촉센서, 서보모터, LED 모듈 등을 연결할 수 있는 5핀으로 된 포트입니다. 제어기 보드상의 흰 선으로 5핀 케이블의 방향이 표기되어 있습니다.
- POWER LED (빨간색): 전원이 켜지면 POWER LED가 켜지고 전원이 꺼지면 꺼집니다.
- LED (RED / GREEN / BLUE) : 사용자가 ON/OFF를 제어할 수 있는 LED 입니다.
- 버저: 소리를 냅니다.
- 마이크: 소리를 감지합니다.
- 사용자 버튼: 버튼이 눌리는지 감지합니다.

# [전원 연결](#전원-연결)

- OpenCM7.0 은 배터리(건전지/리튬이온배터리) 또는 USB를 통해서 전원을 공급 받을 수 있습니다.
- 2핀 포트 / 5핀 포트에 연결되는 감속모터 / 서보모터 / 적외선 센서 등등 모듈에 공급되는 전원은 2핀 배터리 포트를 통해서만 공급될 수 있습니다.
- 2핀 전원포트에는 ABB-030(건전지x2 박스) 1개 또는 LBS-040(리튬이온 배터리) 한개를 연결할 수 있습니다.
- CPU및 부저, 마이크, LED 등 내부장치들에 공급되는 전원은 2핀 배터리 또는 USB를 통해서 공급될 수 있습니다.
- 전압의 범위는 2.6V ~ 5.2V 이고 권장전압은 3.0 ~ 5.0V 입니다.
- 전원 포트의 간단한 회로 구성은 다음과 같습니다. +부분에 전지의 +극을, -부분에 전지의 -극을 연결하면 됩니다.

  ![](/assets/images/parts/controller/opencm7/r+iot_48.jpg)

# [작동 방법](#작동-방법)

![](/assets/images/parts/controller/opencm7/r+iot_49.jpg)

- 시작 버튼을 짧게 눌러 켜면, 시작 버튼 좌측의 빨간색 전원 LED 에 불이 켜지며 제어기에 다운로드 한 프로그램이 실행됩니다.
- 처음 시작 시 연속으로 버튼을 누른 횟수에 따라 [시작 버튼 눌림 횟수]가 증가합니다. 따라서 이 파라미터를 사용하여 프로그래밍 하면 OpenCM7.0을 작동시킬 때 시작 버튼을 누르는 횟수에 따라 각각 다른 행동을 하도록 할 수 있습니다.
- 시작 버튼을 1초 이상 눌러 켜면 “삐삐” (2회) 소리가 나고 빨간색 전원LED 에 불이 켜지며 제어기가 켜지고 다운로드 된 프로그램이 실행되지 않는 manage 모드에 진입합니다.
- 시작 버튼을 5초 이상 눌러 켜면 “삐삐삐” (3회) 소리가 나고 펌웨어 복구 모드로 진입합니다.
- 제어기가 켜진 상태에서 다시 시작 버튼을 누르면 제어기가 꺼집니다.

# [무선 통신 모듈 연결하기](#무선-통신-모듈-연결하기)

- OpenCM7.0 에는 BT-410, BT-210 / BT-110 / ZIG-110A 무선 통신 모듈을 연결할 수 있습니다.

  ![](/assets/images/parts/controller/opencm7/r+iot_50.jpg)

# [스마트폰 연결](#스마트폰-연결)

Google Play 에서 m.Task2를 설치해 주세요

- OpenCM7.0을 스마트폰과 연결하기 위해서는 BT-110A, BT-210 또는 BT-410이 필요합니다.

  ![](/assets/images/parts/controller/opencm7/r+iot_51.jpg)

  > 스마트폰과 OpenCM7.0 제어기 연결 그림]

# [PC 연결](#pc-연결)

- OpenCM7.0을 PC와 연결하기 위해서는 LN-101또는 USB 케이블이 필요합니다.

  ![](/assets/images/parts/controller/opencm7/opencm7.0_micro_mini.jpg)

  > PC와 Micro MINI Cable을 연결한 OpenCM7.0 제어기 연결 그림

  ![](/assets/images/parts/controller/opencm7/opencm7.0_ln-101.jpg)

  > PC와 LN-101을 연결한 OpenCM7.0 제어기 연결 그림

# [컨트롤 테이블](#컨트롤-테이블)
컨트롤 테이블은 제어기 내부에 존재하는 데이터의 집합체입니다.  
사용자는 컨트롤 테이블의 주소를 이용하여 해당 주소에 저장된 데이터를 읽어오거나 새로운 데이터를 입력할 수 있습니다.
 
## 영역(EEPROM, RAM)
컨트롤 테이블은 2개의 영역으로 구분됩니다. RAM 영역에 위치한 데이터는 전원이 인가될 때마다 다시 초기값으로 설정됩니다(Volatile).  
반면 EEPROM 영역에 위치한 데이터는 값을 변경하면 전원이 꺼져도 그 값이 보존됩니다(Non-Volatile).
 
## 접근 속성(R, RW)
컨트롤 테이블의 데이터에는 2개의 접근 속성이 있습니다.  
‘RW’는 읽기와 쓰기 접근이 모두 가능합니다. 반면 ‘R’은 읽기 전용(Read Only) 속성을 갖습니다.  
읽기 전용 속성의 데이터는 사용자가 임의로 값을 바꿀 수 없기 때문에 주로 측정 또는 모니터링 용도로 사용되고, 읽기 쓰기 속성(‘RW’)은 제어 용도로 사용됩니다.
 
## 초기값
제어기에 전원이 인가될 때 컨트롤 테이블의 각 데이터는 초기값으로 설정됩니다.  
사용자가 초기값을 변경하면 새로운 초기값이 적용됩니다. RAM 영역의 초기값은 전원이 인가되었을 때 설정되는 값입니다.
 
## 크기
데이터의 크기는 용도에 따라 1, 2, 4[byte]로 정해져 있습니다. Instruction Packet을 통해 데이터를 변경할 때는 해당 데이터의 크기를 확인하시기 바랍니다.

## [EEPROM 영역](#eeprom-영역)

|주소|크기|데이터|설명|접근 속성|초기값|
|:---:|:---:|:---:|:---:|:---:|:---:|
|0|2|Model Number|모델 번호|R|420|
|6|1|Version of Firmware|펌웨어 버전 정보|R|-|
|7|1|ID|제어기 ID|R|200|
|8|1|Baud Rate|제어기 통신 속도|R|1|
|9|1|Return Delay Time|응답 지연 시간|RW|0|
|10|1|Status Return Level|응답 레벨|RW|2|
|11|1|Bootloader Version|부트로더 버전 정보|R|-|

## [RAM 영역](#ram-영역)

|주소|크기|데이터|설명|접근 속성|초기값|
|:---:|:---:|:---:|:---:|:---:|:---:|
|21|1|Mode Number|동작모드 번호|R|2|
|25|1|Press Counter|시작버튼 눌림 횟수|R|1|
|26|1|Button Status|시작버튼 상태|R|0|
|73|1|128ms Timer Value|128ms 타이머|RW|0|
|74|2|1ms Timer Value|1ms 타이머|RW|0|
|76|1|[Power Save Timer Value]|자동꺼짐 타이머 값|RW|0|
|77|1|Random Number|무작위 숫자|RW|-|
|79|1|Red LED|빨간색 LED|RW|0|
|80|1|Green LED|초록색 LED|RW|0|
|81|1|Blue LED|파란색 LED|RW|0|
|84|1|Buzzer Index|버저 종류|RW|0|
|85|1|Buzzer Time|버저 울림시간|RW|0|
|86|1|Sound Detected Count|최종 소리 감지 횟수|RW|0|
|87|1|Sound Detecting Count|실시간 소리 감지 횟수|R|0|
|88|1|Low Battery Sound Enable|저전압 경고음 설정|RW|1|
|97|1|Input Power Voltage|입력전원 전압|R|-|
|128|1|Port 3 Servo Mode|3번 포트 서보모터 모드|RW|0|
|129|1|Port 4 Servo Mode|4번 포트 서보모터 모드|RW|0|
|130|1|Port 5 Servo Mode|5번 포트 서보모터 모드|RW|0|
|131|1|Port 6 Servo Mode|6번 포트 서보모터 모드|RW|0|
|136|2|Port 1 Motor Speed|1번모터 회전 속도 |RW|0|
|138|2|Port 2 Motor Speed|2번모터 회전 속도 |RW|0|
|140|2|Port 3 Motor Speed|3번모터 회전 속도 |RW|0|
|142|2|Port 4 Motor Speed|4번모터 회전 속도 |RW|0|
|144|2|Port 5 Motor Speed|5번모터 회전 속도 |RW|0|
|146|2|Port 6 Motor Speed|6번모터 회전 속도 |RW|0|
|156|2|Port 3 Servo Position|3번 서보모터 위치 값|RW|-|
|158|2|Port 4 Servo Position|4번 서보모터 위치 값|RW|-|
|160|2|Port 5 Servo Position|5번 서보모터 위치 값|RW|-|
|162|2|Port 6 Servo Position|6번 서보모터 위치 값|RW|-|
|172|2|Port 3 IR Sensor Value|3번 포트 적외선 센서 값|R|-|
|174|2|Port 4 IR Sensor Value|4번 포트 적외선 센서 값|R|-|
|176|2|Port 5 IR Sensor Value|5번 포트 적외선 센서 값|R|-|
|178|2|Port 6 IR Sensor Value|6번 포트 적외선 센서 값|R|-|
|204|1|Port 3 Touch Sensor Value|3번 포트 터치 센서 값|R|-|
|205|1|Port 4 Touch Sensor Value|4번 포트 터치 센서 값|R|-|
|206|1|Port 5 Touch Sensor Value|5번 포트 터치 센서 값|R|-|
|207|1|Port 6 Touch Sensor Value|6번 포트 터치 센서 값|R|-|
|212|1|Port 3 LED Module Value|3번 포트 LED모듈 제어 값|RW|0|
|213|1|Port 4 LED Module Value|4번 포트 LED모듈 제어 값|RW|0|
|214|1|Port 5 LED Module Value|5번 포트 LED모듈 제어 값|RW|0|
|215|1|Port 6 LED Module Value|6번 포트 LED모듈 제어 값|RW|0|
|220|2|Port 3 User Device Value|3번 포트의 사용자 장치|RW|0|
|222|2|Port 4 User Device Value|4번 포트의 사용자 장치|RW|0|
|224|2|Port 5 User Device Value|5번 포트의 사용자 장치|RW|0|
|226|2|Port 6 User Device Value|6번 포트의 사용자 장치|RW|0|
|236|1|Port 3 Temperature Sensor Value|3번 포트 온도 센서 값|R|-|
|237|1|Port 4 Temperature Sensor Value|4번 포트 온도 센서 값|R|-|
|238|1|Port 5 Temperature Sensor Value|5번 포트 온도 센서 값|R|-|
|239|1|Port 6 Temperature Sensor Value|6번 포트 온도 센서 값 |R|-|
|244|1|Port 3 Ultrasonic Sensor Value|3번 포트 초음파 센서 값|R|-|
|245|1|Port 4 Ultrasonic Sensor Value|4번 포트 초음파 센서 값|R|-|
|246|1|Port 5 Ultrasonic Sensor Value|5번 포트 초음파 센서 값|R|-|
|247|1|Port 6 Ultrasonic Sensor Value|6번 포트 초음파 센서 값|R|-|
|252|1|Port 3 Magnetic Sensor Value|3번 포트 자석 센서 값|R|-|
|253|1|Port 4 Magnetic Sensor Value|4번 포트 자석 센서 값|R|-|
|254|1|Port 5 Magnetic Sensor Value|5번 포트 자석 센서 값|R|-|
|255|1|Port 6 Magnetic Sensor Value|6번 포트 자석 센서 값|R|-|
|260|1|Port 3 Motion Sensor Value|3번 포트 동작 감지 센서 값|R|-|
|261|1|Port 4 Motion Sensor Value|4번 포트 동작 감지 센서 값|R|-|
|262|1|Port 5 Motion Sensor Value|5번 포트 동작 감지 센서 값|R|-|
|263|1|Port 6 Motion Sensor Value|6번 포트 동작 감지 센서 값|R|-|
|268|1|Port 3 Color Sensor Value|3번 포트 칼라 센서 값|R|-|
|269|1|Port 4 Color Sensor Value|4번 포트 칼라 센서 값|R|-|
|270|1|Port 5 Color Sensor Value|5번 포트 칼라 센서 값|R|-|
|271|1|Port 6 Color Sensor Value|6번 포트 칼라 센서 값|R|-|
|276|1|Port 3 Hydro-Thermo Sensor Humidity Value|3번 포트 온습도 센서 습도 값|R|-|
|277|1|Port 4 Hydro-Thermo Sensor Humidity Value|4번 포트 온습도 센서 습도 값|R|-|
|278|1|Port 5 Hydro-Thermo Sensor Humidity Value|5번 포트 온습도 센서 습도 값|R|-|
|279|1|Port 6 Hydro-Thermo Sensor Humidity Value|6번 포트 온습도 센서 습도 값|R|-|
|284|1|Port 3 Hydro-Thermo Sensor Temperature Value|3번 포트 온습도 센서 온도 값|R|-|
|285|1|Port 4 Hydro-Thermo Sensor Temperature Value|4번 포트 온습도 센서 온도 값|R|-|
|286|1|Port 5 Hydro-Thermo Sensor Temperature Value|5번 포트 온습도 센서 온도 값|R|-|
|287|1|Port 6 Hydro-Thermo Sensor Temperature Value|6번 포트 온습도 센서 온도 값|R|-|
|292|2|Port 3 Brightness Sensor Value|3번 포트 조도 센서 값|R|-|
|294|2|Port 4 Brightness Sensor Value|4번 포트 조도 센서 값|R|-|
|296|2|Port 5 Brightness Sensor Value|5번 포트 조도 센서 값|R|-|
|298|2|Port 6 Brightness Sensor Value|6번 포트 조도 센서 값|R|-|


`Note` R+ Manager 2.0을 통해서 제어기를 연결하면 컨트롤 테이블을 확인할 수 있습니다.
{: .notice}

## [Address 기능 설명](#address-기능-설명)

### [Power Save Timer Value](#power-save-timer-value)
자동꺼짐 타이머 시간을 설정합니다. 기본값은 0이며, 이때 외부와의 통신이 없는 경우 타이머에 의해 60분 뒤에 전원이 꺼집니다.
255로 설정하는 경우 배터리가 방전될 위험이 있으니 주의하시기 바랍니다.

|설정값|설정된 타이머 시간|
|:---:|:---:|
|0|60분|
|1~60|1~60분|
|61~254|60분|
|255|무제한(배터리 방전에 주의)|

[감속모터]: /docs/kr/parts/motor/gm-10a/
[서보모터]: /docs/kr/parts/motor/servo_motor/
[접촉센서]: /docs/kr/parts/sensor/ts-10/
[LED모듈]: /docs/kr/parts/display/lm-10/
[적외선센서]: /docs/kr/parts/sensor/irss-10/
[RoboPlus Task2]: /docs/kr/software/rplus2/task/
[시작 버튼 눌림 횟수]: /docs/kr/software/rplus1/task/programming_02/#시작버튼-눌림횟수
[Power Save Timer Value]: #power-save-timer-value
