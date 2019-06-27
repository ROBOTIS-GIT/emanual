---
layout: archive
lang: kr
ref: kit1
read_time: true
share: false
author_profile: false
permalink: /docs/kr/edu/engineer/kit1/
sidebar:
  title: ENGINEER Kit 1
  nav: "kit1"
---
# [개요](#개요)

<img src="/assets/images/edu/engineer/kit1/enginner_main.png" width="800">

ROBOTIS ENGINEER는 스마트 기기를 활용한 AI 기술이 적용된 새로운 개념의 차세대 로봇입니다.  

- 다양한 움직임을 구현하는 관절형 구조
- 단계별 로봇교육과정 및 표준 커리큘럼 제공
- 3D프린팅 지원
- 로보티즈 엔지니어 , R+Task 3.0 등 다용도 소프트웨어 사용가능
- Rasberry Pi 와 카메라 확장가능


## [부품 목록](#부품-목록)

<img src="/assets/images/edu/engineer/kit1/parts_list.png" width="800">

### [CM-550 제어기](#cm-550-제어기)

#### [제품 사양](#제품-사양)  

| 항목          | 내용                                                                                                                                |
|:--------------|:------------------------------------------------------------------------------------------------------------------------------------|
| 무게          | 58.8g                                                                                                                               |
| 컨트롤러      | STM32F405RG                                                                                                                         |
| 동작전압      | 허용 범위 : 6.5V ~ 15V <br /> 권장전압 : 11.1V(Li-PO 3cell)                                                                         |
| 소모 전류량   | IDLE : 50mA (@ 11.1V)<br />Port 1~2 OUT I/O 최대전류 : 0.5A<br /> Port 3~5 OUT I.O 최대전류 : 0.02A <br /> 전체최대전류 : 10A(Fuse) |
| 동작온도      | -5 ~ 70[&deg;C]                                                                                                                     |
| 통신모듈      | BLE SLAVE 모듈 내장                                                                                                                 |
| 내부 I/O 장치 | 버튼 : 2(MODE 1, START 1)<br /> 마이크 (소리감지) : 1 <br>부저 : 1<br>전압센서: 1<br>자이로가속도센서: 1<br />RGB LED: 1            |
| 외부 I/O 장치 | 올로 호환 5 pin I/O 포트 : 5<br /> X Series Dynamixel 커넥터 : 6                                                                    |


#### [CM-550 각 부 명칭](#cm-550-각-부-명칭)  

<img src="/assets/images/edu/engineer/kit1/cm550_1.png" width="800">  

![](/assets/images/edu/engineer/kit1/cm550_2_kr.png)

  - Micro USB 연결잭 : USB 케이블로 CM-550 과 PC 의 USB 포트를 연결하는 포트입니다. 태스크 코드 다운로드 또는 PC와의 통신용으로 사용됩니다.  
  - 전원 스위치 : 전원을 ON / OFF 하기 위해 사용하는 스위치입니다.  
  - DC Power : 전원 공급기(SMPS)의 전원잭을 연결하는 소켓입니다.  
  - 전원 LED : 전원이 ON 상태이면 켜지고 OFF 상태이면 꺼지는 LED 입니다.  
  - MODE LED/버튼 : CM-550 의 동작 모드를 변경용 버튼 및 상태 표시용 RGB LED입니다.    
  - USER LED/버튼 : 사용자가 제어 가능한 버튼 및 RGB LED 입니다.  
  - 통신장치 포트 : BT-210, BT-410, LN-101 등 무선 통신용 모듈이나 기타 외부 보드와의 통신용으로 사용되는 포트입니다.  
  - 마이크 : 소리 횟수를 감지 할 수 있는 마이크 입니다.  
  - 배터리 소켓 : 배터리를 연결하는 소켓입니다.  
  - X-Series DYNAMIXEL Port : X시리즈 다이나믹셀을 Daisy chain 으로 연결하기 위한 6개의 포트입니다.  
  5 Pin AUX Device Port : DMS, 접촉 센서, 적외선 센서 등의 주변장치를 연결하기 위한 5개의 포트입니다. 그 중 서보모터, 적외선센서, 온습도센서는 1,2번 포트에만 연결할 수 있습니다. 포트 번호는 포트 옆에 숫자로 표시되어 있습니다.  
  - 퓨즈 : 10A용량의 보호용 퓨즈입니다.  
  - IMU : 각속도, 자이로, Roll/Pitch/Yaw등 값을 피드백 해 줄 수 있는 센서입니다.  
  - Buzzer : 음계나 멜로디 소리를 낼 수 있는 부저입니다.  
  - BLE Slave 모듈 : 스마트폰, BT-410 동글 등과 연결하여 통신할 수 있는 블루투스 모듈입니다.  
 



**주의** :  CM-550 제어기의 USB 포트는 PC와의 통신용이므로 스마트 기기나 다른 장치와 연결하지 마세요.
제어기 고장의 원인이 될 수 있습니다.  
{: .notice--warning}


### [2XL-430 다이나믹셀](#2xl-430-다이나믹셀)

2XL-430 은 2축 제어가 가능하도록 구현된 모터입니다

<img src="/assets/images/edu/engineer/kit1/2xl430_intro.png" width="600">

**[2XL430-W250](/docs/kr/dxl/x/2xl430-w250/) 매뉴얼 바로가기**

## [주의사항](#주의사항)

### [조립시 주의사항](#조립시-주의사항)
 
#### [다이나믹셀 조립](#다이나믹셀_조립)

ROBOTIS ENGINEER에서는 주요 관절 부위의 견고한 조립을 위해 나사를 사용합니다.
(표시된 부분이 나사를 조립하는 부분입니다)  

<img src="/assets/images/edu/engineer/kit1/2xl430_assembly_caution_1.png" width="900">  
<img src="/assets/images/edu/engineer/kit1/2xl430_assembly_caution_2.png" width="900">   

**주의** : 나사를 조이거나 풀 때 반드시 지정된 사양(PH 1)의 드라이버를 사용하시기 바랍니다.
{: .notice--warning}

#### [다이나믹셀 ID확인](#다이나믹셀-id확인)

![](/assets/images/edu/engineer/kit1/2xl430_id.png)

2XL 출력 축 & ID & LED 매칭   
- 2축 다이나믹셀을 제어하기 위한 고유 ID가 부여되어 있습니다.  
- 출력 축 맞은편 ID표기, 상태 LED로 다이나믹셀의 상태를 확인합니다  


#### [다이나믹셀 혼 위치 확인](#다이나믹셀-혼-위치-확인)

![](/assets/images/edu/engineer/kit1/2xl430_horn.png)  

{% capture warning_01 %}  
**주의** :   
케이스의 중앙 위치와 출력혼의 위치가 일치한 상태가 중앙 값입니다.  
재조립 등으로 인하여 다이나믹셀 혼 위치가 변경되었을 경우 드라이버를 이용하여 혼 중앙의 볼트를
  오른쪽방향으로 돌리면 혼이 회전합니다. 볼트를 왼쪽 방향으로 돌리지 않도록 주의해주세요.  
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>


#### [리벳 조립](#리벳-조립)

![](/assets/images/edu/engineer/kit1/rivet_assembly_6mm_kr.png)  

**주의** : 리벳을 다시 사용할 때는 반드시 핀홀을 먼저 끼웁니다. (사용했던 리벳은 핀과 핀홀로 분리되지 않습니다.) 
{: .notice--warning} 

![](/assets/images/edu/engineer/kit1/rivet_assembly_12mm_kr.png) 
 


### [케이블 연결](#케이블-연결)

#### 배선연결

양쪽의 커넥터 중 한 곳만 연결하면 구동되며, 커넥터별로 구분은 필요없습니다. 로봇의 배선에 유리한
방향으로 연결하세요.  
![](/assets/images/edu/engineer/kit1/cable_assembly_1.png)

#### 아이들러캡을 통한 중공형 결합 방법

![](/assets/images/edu/engineer/kit1/cable_assembly_2.png)

**참고** : 중공형 배선 연결은 케이블의 내구성을 더 높이거나 미관상의 케이블 정리를 위해 사용하는 결합 방법입
니다. 반드시 사용해야 하는 것은 아니며 아이들러캡 결합 후 부득이 케이블을 교체 시 일반적인 조립방법보다 시간이 더 소요될 수도 있습니다.  
{: .notice--info}



# [작동하기](#작동하기)

## [앱 설치하기](#앱-설치하기)

![](/assets/images/edu/engineer/kit1/app_installation_1_kr.png)

[ROBOTIS ENGINEER(Android) 다운로드]()  
[ROBOTIS ENGINEER(iOS) 다운로드]()  

다운로드 링크 필요


## [블루투스 연결하기](#블루투스-연결하기)

![](/assets/images/edu/engineer/kit1/bluetooth_connection_1.png)

**1. CM-550 제어기의 스위치를 눌러 전원을 켭니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_2.png)

**2. 제어기의 모드버튼을 눌러 녹색이 점멸하도록 합니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_3.png)

**3. 제어기의 시작버튼을 눌러 대기합니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_4.png)

**4. 스마트 기기에서 ROBOTIS ENGINEER앱을 실행하고 화면 표시된 버튼을 누릅니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_5.png)

**5. 제어기에 표시된 숫자 (마지막 두자리)를 확인합니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_6.png)

**6. 확인한 숫자를 왼쪽 상자에 입력한 후 "검색" 을 누릅니다.**  

![](/assets/images/edu/engineer/kit1/bluetooth_connection_7.png)

**7. 검색된 목록을 찾아 선택하면 블루투스 통신 연결이 완료되고, 로봇이 실행됩니다.** 

## [예제 다운로드](#예제-다운로드)
- 제어기에는 최초 출하 시 KIT 1 타입에 맞는 프로그램이 기본적으로 탑재되어 있습니다.  
- 예제 다운로드가 필요하시다면 아래 표를 참고해주세요.  

| 예제   | 다운로드                                                |
|:-------|:--------------------------------------------------------|
| Dr.R   | [태스크 파일 다운로드]()  <br /> [모션 파일 다운로드]() |
| MAX-E1 | [태스크 파일 다운로드]()  <br /> [모션 파일 다운로드]() |
| SPI    | [태스크 파일 다운로드]()  <br /> [모션 파일 다운로드]() |


## [예제 실행하기](#예제-실행하기)

ROBOTIS ENGINEER 앱을 실행하고 조립된 로봇 예제와 같은 예제 메뉴를 선택하면 해당 예제에
맞는 다양한 기능들을 사용할 수 있습니다.    
  
![](/assets/images/edu/engineer/kit1/engineer_app_1.png)

**주의** : 조립된 로봇과 다른 예제를 선택할 경우 로봇이 정상적으로 작동하지 않습니다.
{: .notice--warning}

## [환경 설정](#환경-설정)

![](/assets/images/edu/engineer/kit1/engineer_app_configuration.png)

- `연결할 장치 선택`  
 연결할 블루투스 장치를 선택합니다.  
- `예제 초기화` 
선택한 예제를 초기화 하는 기능입니다.  
- `제스처 오차 범위 설정`  
제스처의 허용 오차 범위를 설정합니다.  
- `갤러리에 예제 이미지 표시`  
스마트기기의 갤러리에 예제 이미지를 표시합니다.  
- `미디어 스캔`  
파일이 PC에서 보이지 않을 때 사용하는 기능입니다.  
- `버전 정보`  
현재 앱의 버전을 확인하는 기능입니다.  

**참고** : ENGINEER(실험실)의 자료 및 각종 기능은 변경될 수 있습니다.  
{: .notice--info}


### [Dr.R](#drr)


- 감정 표현  
Dr.R 예제를 선택하면 스마트 기기에 왼쪽과 같은 표정 화면이 나타납니다.로봇을 터치하거나 지정된 이벤트가 발생하면 표정 변화, 움직이기, 말하기 등의 다양한 감정 표현을 합니다.    

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_1.png)
![](/assets/images/edu/engineer/kit1/engineer_app_emotion_2.png)



- 모드 선택하기

오른쪽 아래(`Mode`)를 터치하면 아래와 같이 모드 변경 메뉴가 나타납니다.
5개의 모드와 2개의 옵션 메뉴가 있습니다

![](/assets/images/edu/engineer/kit1/engineer_app_emotion_3.png)

#### 모드 메뉴
 
<img src="/assets/images/edu/engineer/kit1/engineer_app_mode.png" width="900"> 


#### 옵션메뉴

<img src="/assets/images/edu/engineer/kit1/engineer_app_option.png" width="900">

**참고** :해당 옵션은 모든 예제에 동일하게 적용되며 세부 설정 방법은 [로봇 설정하기](#로봇-설정하기) 내용을 참고하세요
{: .notice--info}

### [MAX-E1](#max-e1)

#### 리모컨 화면  

![](/assets/images/edu/engineer/kit1/max_controller.png)

`조종 모드` : MAX-E1의 조종 모드를 일반/전투/축구모드로 변경할 수 있습니다.  
`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
`모션 버튼`: 각 조종 모드에 따라 각각 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : 로봇의 다이나믹셀 토크를 켜거나 끌 수 있는 버튼입니다.  
`메뉴 버튼` : MAX-E1 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

<img src="/assets/images/edu/engineer/kit1/max_menu.png" width="900">

### [SPI](#spi)

#### SPI 리모컨 화면  

![](/assets/images/edu/engineer/kit1/spi_controller.png)

`조종 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다.  
`모션 버튼` : SPI 로봇에 등록된 모션을 실행하는 버튼입니다.  
`토크 설정` : SPI 로봇의 다이나믹셀 토크를 켜거나 풀 수 있는 버튼입니다.  
`메뉴 버튼` : SPI 로봇의 특수 기능 메뉴를 불러오는 버튼입니다.  

#### 메뉴 화면

<img src="/assets/images/edu/engineer/kit1/spi_menu.png" width="900"> 

## [로봇 설정하기](#로봇-설정하기)

### [모터 조립확인](#모터-조립확인)

- ROBOTIS ENGINEER KIT에 사용된 다이나믹셀 ID 확인 및 작동 상태를 체크하는 기능입니다.

**1. 각 예제를 선택한 후 메뉴의 옵션에서** `MOTOR`**를 선택하여 점검합니다**  

![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

**2. 화면에서 ID 번호를 선택하면 해당 ID의 LED가 켜지고 중심 위치를 기준으로 조금씩 움직여 해당 ID 상태를 확인할 수 있습니다.**  

![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)


### [모터 오프셋 설정](#모터-오프셋-설정)

ROBOTIS ENGINEER KIT에 사용된 다이나믹셀의 자세나 위치 값의 보정이 필요할 때 사용하는 기능입
니다. 오프셋 기능을 통해 보정된 값은 재실행 이후에도 지속적으로 적용됩니다. 전문적인 지식을 토대
로 미세하게 조정해야 하며 과도한 값을 사용 시 예제 동작이 잘 안될 수 있습니다.  
  
**1. 각 예제를 선택한 후 메뉴의 옵션에서** `OFFSET` **을 선택합니다.**  
  
![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

**2. 값 보정을 원하는 ID를 선택하면 아래와 같은 팝업창이 나타납니다.**  

![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

`&#43; / - 키` : ID 값 조정 키  
`Torque On / Off` : 예제의 토크를 고정 / 풀기  
`OK / CANCEL` : 조정 값 저장 / 취소  

**3.** `OK` **를 눌러 저장하면 아래와 같은 확인 창이 나타납니다. 한번 더** `OK` **를 누르면 값이 저장되고 로봇에 반영됩니다.**  

![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

- `Reset Offset`  
  선택 시 'SAVE' 창이 나타나며 ‘OK’를 클릭 시 전체 모션의 오프셋을 ‘0’ 으로
  초기화 합니다.  
  
- `Initial Pose`  
  최근에 저장된 모션 오프셋 값을 불러오는 명령입니다. 관절을 조정중에 잘못 조정하였을 경
  우 되돌아 가도록 하는 것입니다

![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

# [튜토리얼](#튜토리얼)

## [코드 작성하기](#코드-작성하기)

- 코드작성 관련자료 필요  

## [예제 조립서](#예제-조립서)

- 조립서 링크 필요

## [3D 프린팅](#3d-프린팅)

- 3D 프린팅 관련 자료 필요

## [교육자료](#교육자료)

- 교육 관련 자료 필요.

# [다운로드](#다운로드)

- ROBOTIS ENGINEER는 [R+Task 3.0](/docs/kr/software/rplustask3/)을 지원합니다. 
- R+Task 3.0은 기존의 R+Task 2.0과 R+Motion 2.0이 통합된 프로그램입니다.
- Task code를 작성하여, 로봇을 원하는대로 명령으로 구동할수 있습니다.
- 모션파일로 로봇의 행동을 직접 만들어 줄수있습니다.

**[R+Task 3.0](/docs/kr/software/rplustask3/) 매뉴얼 바로가기**  
**[R+Task 3.0]() 다운로드 바로가기**

# [참고자료](#참고자료)

## [점검 및 자가진단](#점검-및-자가진단)

**1. 로봇의 전원이 켜지지 않아요!**  
- 충전지의 연결 및 충전상태를 점검해 보세요.  
 
**2. 충전지 잔량을 확인하고 싶어요.**  
- [충전지 잔량 확인 하기](#충전지-잔량-확인하기)를 참조하세요.   
 
**3. 로봇이 작동 중에 경고음이 들려요.**  
- 충전지의 잔량이 부족해서 나는 경고음입니다. 배터리를 충전해 주세요.    
  [배터리 충전하기](#배터리-충전하기)
 
**4. 로봇이 정상적으로 작동하지 않아요.**  
- 로봇의 조립 방법 및 [다이나믹셀 ID](#다이나믹셀-id확인)를 확인해 보세요.  
 
**5. 어댑터로는 동작하는데 충전지로 동작하지 않아요.**  
- 제어기의 퓨즈 상태를 확인하고 필요 시 교체합니다. [퓨즈 교체하기](#퓨즈-교체하기)를 참고하세요.    

## [배터리 충전하기](#배터리-충전하기)

**주의** :  
반드시 제공된 충전기와 충전지(리튬폴리머 배터리)만 사용하십시오.  
처음 사용 시 반드시 충전지를 충전해 주세요.
{: .notice--warning}

**1. 제품에 포함되어 있는 충전지(리튬폴리머 배터리)를 준비합니다.** 

![](/assets/images/edu/engineer/kit1/battery_charging_1_kr.png)  

**2. 그림과 같이 충전지를 충전기와 연결합니다.**  

![](/assets/images/edu/engineer/kit1/battery_charging_2_kr.png)  

**3. 그림과 같이 빨간색 LED가 표시되면 ‘충전 중’, 녹색 LED가 표시되면 ‘충전 완료’입니다.**    
 
![](/assets/images/edu/engineer/kit1/battery_charging_3_kr.png)  

**4. SMPS를 제어기에 직접 연결하면 외부전원으로도 로봇을 구동할 수 있습니다.**  

![](/assets/images/edu/engineer/kit1/battery_charging_4_kr.png)  
  
**5. 충전지는 충전용 커넥터와 로봇 작동용 커넥터가 연결되어 있습니다.**  

![](/assets/images/edu/engineer/kit1/battery_charging_5_kr.png)  

### [충전지 잔량 확인하기](#충전지-잔량-확인하기)

![](/assets/images/edu/engineer/kit1/battery_check.png)  

충전지 잔량에 따라 표시된 부분의 LED가 다음과 같은 색상으로 변경 됩니다  
- 파란색: 70% 이상  
- 녹 색: 30% ~ 70%  
- 빨간색: 30% 이하(저전압 알람이 발생합니다.)  

**참고** : 점등이 아니고 점멸하는 것은 제어기의 블루투스 장치에 통신연결이 없는 상태이므로 잔량과는 관계 없습니다.  
{: .notice--info}

**주의** :  
충전을 하지 않을때에는 반드시 충전기와 충전지를 분리하여 보관해주세요.  
충전을 하면서 로봇을 구동하지 않도록 하고, SMPS와 제어기를 직접 연결하여 사용하세요.  
{: .notice--warning}

## [퓨즈 교체하기](#퓨즈-교체하기)

CM-550 에는 과전류가 흘러서 회로가 망가지는 것을 방지하기 위한 퓨즈(Fuse)가 있습니다.
만약 CM-550 이 배터리로는 전원이 켜지지 않고 SMPS로만 전원이 켜진다면 퓨즈가 끊어진 것이니 교체해 주어야 합니다.

![](/assets/images/edu/engineer/kit1/charger_fuse_1.png)
![](/assets/images/edu/engineer/kit1/charger_fuse_2.png)

제어기 아래 부분의 퓨즈를 확인후, 핀셋으로 퓨즈를 제거하고 새 퓨즈로 교체합니다.  
  
**주의** : 어댑터와 충전지를 연결하지 않은 상태로 퓨즈를 교체해야 합니다.  
{: .notice--warning}

## [로봇 초기화](#로봇-초기화)

로봇 초기화하는 방법 관련 자료 필요
