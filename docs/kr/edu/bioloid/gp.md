---
layout: archive
lang: kr
ref: bioloid-gp
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/bioloid/gp/
sidebar:
  title: 로보티즈 GP
  nav: "bioloid-gp"
---

# [개요](#개요)

![](/assets/images/edu/bioloid/gp_main_KR.jpg)

- 고성능 다이나믹셀 AX-18F(하체)가 장착된 최고 성능의 휴머노이드  
- 초경량, 고강도의 알루미늄 프레임 적용  
- 이동 중 방향전환과 고속 보행 등 뛰어난 운동 성능 보유  
- 휴머노이드 격투, 축구 및 다양한 기본 모션 제공  
- 자이로 센서를 기반으로 한 자세 보정 기능  
- 미션 수행이 가능한 그리퍼 세트 및 센서 기본 포함  
- 무선 리모컨 포함(지그비 기본 내장)  
- 업그레이드된 전용 프로그래밍 소프트웨어 [로보플러스] 제공  
- 디지털 패킷통신 제어 및 Daisy Chain 방식의 간단한 배선 정리

# [시작하기](#시작하기)

## [부품 목록](#부품-목록)

![](/assets/images/edu/bioloid/gp_partlist_1_KR.png)

![](/assets/images/edu/bioloid/gp_partlist_2_KR.png)

## [작동하기](#작동하기)

### 프로그램 다운로드
- 제어기에는 최초 출하시 프로그램이 기본적으로 탑재되어 있습니다.
- [기본 프로그램] 페이지에서 동작시키고자 하는 타입에 맞는 태스크 코드와 모션 파일을 로봇에 다운로드 합니다.

{% include kr/parts/controller/cm510_530_turnon.md %}

### 로봇의 기본 자세 확인하기(올바르게 조립되었는지 확인)

- 로봇이 아래와 같이 기본 자세를 취합니다.

  ![](/assets/images/edu/bioloid/gp_base_KR.png)

- 팔과 다리의 각도를 확인합니다. 만약 그림과 다르다면, 아래 로봇 작동하기의 조립 확인 모드에서 로봇의 조립 상태를 확인하세요.
- 케이블이 다리 바깥으로 연결되었는지 확인하세요.

**참고**: 로봇에 손상을 줄 정도로 심각하게 조립이 잘못 되었을 경우, 경고음이 울립니다. 이와 동시에 문제가 있는 모터의 힘이 풀리며 LED 가 켜집니다. 이는 로봇의 손상을 막기 위한 안전장치가 작동하는 것입니다.
{: .notice}

### 로봇 조종하기
- 로봇을 켜고 PLAY 모드를 실행 한 후, R / D / L / U 버튼을 누르면 다음 모드가 실행 됩니다.
  - U : 축구 모드
  - D : 격투 모드
  - L or R : 퍼포먼스 모드  

    ![](/assets/images/edu/bioloid/bp_act_4_1_KR.jpg)

**참고**: 기본적으로 로봇은 리모컨(RC-100)으로 조종합니다. 모드 선택없이 리모컨으로 동작시키면 축구 모드가 자동선택 됩니다.
{: .notice}

#### 리모컨(RC-100) 작동 방법
1. POWER/MODE 버튼을 1초 이상 누르면 전원이 켜집니다.
2. 리모컨의 버튼을 눌러 로봇을 조종합니다.

![](/assets/images/edu/bioloid/bp_act_4_2_KR.jpg)

##### 보행 (방향 버튼 : U / L / D / R)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|U|앞으로 가기|D|뒤로 가기|
|L|왼쪽으로 회전|R|오른쪽으로 회전|
|U + L|전진하며 왼쪽으로 회전|U + R|전진하며 오른쪽으로 회전|
|L + 5|좌 이동|L + 5 + 6|빠른 좌 이동|
|L + U + 5|좌 이동하며 앞으로|L + D + 5|좌 이동하며 뒤로|
|R + 5|우 이동|R + 5 + 6|빠른 우 이동|
|R + U + 5|우 이동하며 앞으로|우 이동하며 앞으로|우  이동 하며 뒤로|

##### 기본 (키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|1 + U|앞으로 일어나기|1 + D|뒤로 일어나기|
|5+6+U+1|축구 모드(모드변환)|5+6+D+3|격투 모드(모드변환)|
|5+6+L+2|퍼포먼스 모드(모드변환)|-|-|

![](/assets/images/edu/bioloid/gp_rc100_mode_KR.png)

#### U : 축구 모드

![](/assets/images/edu/bioloid/gp_soccer_KR.png)

- 슛 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|2 + U|왼발 전방 슛	|4 + U|오른발 전방 슛|
|2 + D|왼발 후방 슛	|4 + D|오른발 후방 슛|
|2 + L|왼발 좌슛	|4 + L|오른발 좌슛|
|2 + R|왼발 우슛	|4 + R|오른발 우슛|

- 수비 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|3|막기 준비|3 + U|제자리  막기|
|3 + L|좌측 공 막기|3 + R|우측 공 막기|

#### D : 격투 모드

![](/assets/images/edu/bioloid/gp_fight_KR.png)  

- 공격 및 방어 (키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|2 + U|전방공격|3|방어자세|
|2 + L|좌공격|2 + R|우공격|
|4 + U|상몸던지기공격|4 + D|하몸던지기공격|
|4 + L|좌강공격|4 + R|우강공격|

#### L or R : 퍼포먼스 모드

- 퍼포먼스 (키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|2 + U|인사 |2 + R|물구나무|
|2 + D|박수(2번)|3 + U|옆구르기|
|2 + L|박수(337)|3 + D|팔굽혀펴기|

- 조종모드에서 제어기에 IR수신기를 장착하고 RC-100으로 조종할 때, 제어기의 Aux 버튼을 눌러 다음과 같이 리모콘의 채널을 설정할 수 있습니다. 채널을 바꾸면, RC-100의 채널도 같이 바꿔 주어야 합니다. RC-100의 채널 변경은 [RC-100의 채널 변경 방법]을 참고하세요.

### CM-510 IR 채널 설정 (Start + U, L, D, R )

|Buttons|Motion|
|:---:|:---:|
|Start + U|RC-100 채널 1로 설정|
|Start + L|RC-100 채널 2로 설정|
|Start + D|RC-100 채널 3로 설정|
|Start + R|RC-100 채널 4로 설정|

#### 리모컨 조종이 잘 되지 않습니다.
- 리모컨 조종 모드로 설정하세요.
- 조립서를 보고 적외선 수신기가 제대로 연결되었는지 확인하세요.
- 리모컨의 전원이 켜져 있는지 확인하세요. 만약 전원이 켜지지 않는다면 배터리를 교체해 주세요.
- 적외선 수신기를 향해 리모컨을 조종하세요.
- 주위에 로봇을 조종하는 사람이 있지 않나요? (무선 혼선이 생길 수 있습니다.)

#### 여러 대의 로봇으로 축구 경기나 로봇 격투를 하고 싶어요.
- 여러 대의 로봇을 혼선 없이 안정적으로 조종하려면 지그비 무선 모듈([ZIG-110 세트])을 장착해야 합니다.

## [충전하기](#충전하기)

{% include kr/edu/bioloid/stem_charge.md %}


#  [튜토리얼](#튜토리얼)

## [화면 출력하기](#화면-출력하기)

{% include kr/edu/bioloid/screen_output.md %}

## [버튼과 LED](#버튼과-led)

{% include kr/edu/bioloid/button_led.md %}

# [다운로드](#다운로드)

## [기본 프로그램](#기본-프로그램)

|파일 종류|다운로드|
|:---:|
|휴머노이드 기본 태스크 코드|[Download][BIO_GP_Humanoid_KR.tsk]|
|휴머노이드 기본 모션 파일|[Download][BIO_GP_Humanoid_KR.mtn]|
|조립서 PDF 파일|[Download][BIO_GP_Humanoid_ASM_KR.pdf]|


# [참고자료](#참고자료)

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm510_530.md %}

## [다이나믹셀 관리하기](#다이나믹셀-관리하기)


# [참고자료](#참고자료)

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm510_530.md %}

## [다이나믹셀 관리하기](#다이나믹셀-관리하기)

{% include kr/edu/bioloid/dynamixel_management.md %}

{% include kr/parts/communication/zigbee_control.md %}

#### ZIG-110A Set 장착 방법(GP)

![](/assets/images/edu/bioloid/1_kr.png)

![](/assets/images/edu/bioloid/zigbee_gp2_kr.png)

## [여러 대의 로봇 조종하기](#여러-대의-로봇-조종하기)

{% include kr/edu/bioloid/control_multirobot.md %}

## [센서 추가하기](#센서-추가하기)

바이올로이드 프리미엄 혹은 로보티즈 GP 에서는 CM-510의 센서연결부를 통해 [적외선센서], [접촉 센서], [절대 거리 센서]를 추가로 달 수 있습니다.  
각 센서에 대한 자세한 정보는 위의 텍스트에 각 센서에 대한 이름을 클릭하시면 해당 페이지로 이동하여 보실 수 있습니다.

### 적외선 센서

![](/assets/images/edu/bioloid/ir_kr.jpg)  

- 적외선 센서 활용방안  
  - 적외선 센서는 로봇의 앞에 장애물을 감지 할 수 있습니다.    
  - 로봇이 보행이나 이동 할 때 앞에 있는 물체를 감지 하기 하는 용도 등으로 활용  할 수 있습니다.

### 접촉 센서

![](/assets/images/edu/bioloid/touch_kr.jpg)

- 접촉 센서 활용 방안  
  - 접촉 센서는 물체와 로봇이 접촉하는 것을 감지 하는 센서 입니다.  
  - 예를 들어 사람이 로봇의 접촉 센서를 누르게 되면 로봇에 어떤 행동을 하게 하는 등의 용도 등으로 활용 할 수 있습니다.

### 절대 거리 센서(DMS)

![](/assets/images/edu/bioloid/dms_gp_kr.png)


## [사용자 센서 제작](#사용자-센서-제작)
CM-510, CM-530에서는 ADC포트와 OUT포트를 이용하여 간단히 제어가 가능한 사용자 센서를 제작할 수 있습니다.

**주의**: 만약 잘못된 회로를 구성하여 CM-510의 외부 포트에 사용자 장치를 연결하면 회로가 손상될 수 있으므로, 회로에 대한 지식을 먼저 습득하시기 바랍니다. {: .notice--warning}

![](/assets/images/edu/bioloid/mcs_cm510_external_io_kr.png)

-  CM-510의 외부 포트 핀 구성은 다음과 같습니다.
  1. OUT : 5V 출력 가능
  2. VCC (5V)
  3. ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
  4. GND
  5. NC : 사용하지 않음

- CM-530의 외부 포트 핀 구성은 다음과 같습니다.
  1. OUT1 : 3.3V 출력 가능 (최대 허용 전류 0.3A)
  2. VCC (5V)
  3. ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
  4. GND
  5. OUT2 : 3.3V 출력 가능 (최대 허용 전류 0.3A)

참고 : 외부센서 사용시 5핀케이블을 사용해 주세요. [5핀 케이블]은 로보티즈 쇼핑몰에서 구매하실 수 있습니다.  
{: .notice}

### 사용자 장치 제어  

#### 외부 출력 제어
다음과 같은 LED 회로를 구성한다면, 1번 핀을 제어하여 LED를 껐다, 켤 수 있는 장치를 만들 수 있습니다. (제어기종류 및 LED의 종류에 따라 저항의 크기를 조정해야 합니다.)
 
![](/assets/images/edu/bioloid/mcs_led_circuit_kr.png)
 
RoboPlus Task에서 사용자 장치 OUT 포트에 High신호를 주는 방법은 다음과 같습니다.  
1. 먼저 로드, 계산 등의 쓰기 가능 파라미터에 사용자 장치를 선택하고, 장치가 연결된 포트를 설정합니다.
2. 이 후, 읽기 가능 파라미터에 포트 값 상수를 이용하여 High신호를 설정합니다.

  ![](/assets/images/edu/bioloid/mcs_auxuserdevicewrite_kr.png)   

  ![](/assets/images/edu/bioloid/mcs_auxuserdevicehighsignal_kr.png)
 

- 위와 같은 코드가 실행되면, PORT3에 연결된 장치의 OUT 포트에 High 신호가 발생하게 되며, 연결된 LED가 켜집니다.
 
#### ADC값 읽어오기
로봇에서 센서로 사용되는 IR센서, 거리센서 등 여러가지 장치들은 대부분 아날로그 출력을 지원합니다. 이러한 센서들을 외부포트를 지원하는 제어기에 연결하여 이용할 수 있습니다. 물론, 센서는 사용자가 직접 회로를 제작하여 이용할 수 있으며,  시중에서 판매하는 것을 이용할 수도 있습니다.
 
- 다음 그림은 Tilt센서입니다. 5V입력을 받으며, 센서의 기울어짐에 따라 그 값을 아날로그 신호로 출력합니다.
   
  ![](/assets/images/edu/bioloid/mcs_tilt_kr.png)  
 
- Tilt센서의 왼쪽 핀은 5V VCC 입력핀, 가운데 핀은 아날로그 신호 출력핀, 오른쪽은 그라운드핀입니다. CM-510의 외부 포트에 서로 매칭되는 핀을 연결하여 주면 바로 사용할 수 있습니다. CM-510의 외부 포트 핀 정보를 참고하여 다음과 같이 연결하면 됩니 다.  

  ![](/assets/images/edu/bioloid/mcs_cm-510_tilt_kr.png)  
 
- 다음 예제와 같이 센서의 아날로그 출력값을 읽어와 로봇의 동작에 응용할 수 있습니다.  

  ![](/assets/images/edu/bioloid/mcs_userdevice_adc_read_kr.png)

[기본 프로그램]: #기본-프로그램
[충전하기]: #충전하기
[RC-100의 채널 변경 방법]: /docs/kr/parts/communication/rc-100/#적외선-통신채널-설정-방법
[ZIG-110 세트]: /docs/kr/parts/communication/zig-110/
[BIO_GP_Humanoid_KR.tsk]: http://www.robotis.com/service/download.php?no=1248
[BIO_GP_Humanoid_KR.mtn]: http://www.robotis.com/service/download.php?no=1247
[BIO_GP_Humanoid_ASM_KR.pdf]: http://www.robotis.com/download/doc/BIO_GP_Humanoid_ASM_KR.pdf
[적외선센서]: /docs/kr/parts/sensor/irss-10/
[접촉 센서]: /docs/kr/parts/sensor/ts-10/
[절대 거리 센서]: /docs/kr/parts/sensor/dms-80/
[5핀 케이블]: http://www.robotis.com/shop/list.php?ca_id=302090
