---
layout: archive
lang: kr
ref: bioloid-premium
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/bioloid/premium/
sidebar:
  title: 로보티즈 프리미엄
  nav: "bioloid-premium"
---

# [개요](#개요)

![](/assets/images/edu/bioloid/premium-01_KR.png)

1. 우수한 보행 성능의 휴머노이드 예제 (보행 중 스스로 자세 보정)
2. 자이로 센서, 절대 거리 센서, 적외선 센서 등 다양한 센서 탑재
3. 무선 리모컨 포함 (적외선 통신 기본 내장, 지그비 추가 가능)
4. 업그레이드 된 전용 프로그래밍 소프트웨어 [로보플러스] 제공
5. 특수 디자인 된 반투명의 휴머노이드 전용 스킨
6. 디지털 패킷 통신, Daisy Chain 으로 간단한 배선 정리
7. 만능 결합 구조로 다양한 형태의 로봇을 손쉽게 제작 가능

![](/assets/images/edu/bioloid/bp_example_KR.png)

# [시작하기](#시작하기)

## [부품 목록](#부품-목록)

![](/assets/images/edu/bioloid/premiumkit_partlist-01_KR.png)

![](/assets/images/edu/bioloid/premiumkit_partlist-02_KR.png)

- [CM-530]
- [AX-12A]
- [거리 센서]
- [적외선 센서]
- [자이로 센서]
- [USB2Dynamixel]

## [작동하기](#작동하기)
### 프로그램 다운로드
- 제어기에는 최초 출하 시 **A 타입**에 맞는 프로그램이 기본적으로 탑재되어 있습니다.
- [기본 프로그램] 항목에서 동작시키고자 하는 타입에 맞는 태스크 코드와 모션 파일을 로봇에 다운로드 합니다.

{% include kr/parts/controller/cm510_530_turnon.md %}

### 조립 확인하기

- 로봇이 아래와 같이 기본 자세를 취합니다. (각 타입 별 기본 자세와 멜로디를 확인하세요)
- 기본 자세를 취한 후, 1초간 안정된 상태로 로봇을 유지시킵니다.
  > 이는 보행 시 자세 보정을 위해 자이로 센서의 기준값을 설정하는 것입니다.

- 팔과 다리의 각도를 확인합니다.만약 그림과 다르다면, 아래 로봇 작동하기의 조립 확인 모드에서 로봇의 조립 상태를 확인하세요.
- 케이블이 다리 바깥으로 연결되었는지 확인하세요.

  ![](/assets/images/edu/bioloid/bp_act_3_1_KR.jpg)

  로봇에 손상을 줄 정도로 심각하게 조립이 잘못되었을 경우 경고음이 울립니다. 이와 동시에 문제가 있는 모터의 힘이 풀리며 LED가 켜집니다. 이는 로봇의 손상을 막기위한 안전장치가 작동하는 것입니다.
  {: .notice}

  ![](/assets/images/edu/bioloid/bp_act_3_2_KR.jpg)

#### 로봇의 기본 자세가 이상하고, 동작이 비정상적입니다.
- 기본 자세가 이상할 경우
  > 조립 확인 모드로 들어가서 각 관절별로 조립 상태를 확인합니다.

- 자율 주행 모드에서 장애물을 인식하지 못할 경우
  > 절대 거리 센서의 케이블이 제대로 연결되어 있는지 확인합니다.

#### 로봇이 보행 중 쉽게 넘어지거나 걸음걸이가 불안합니다.
- 로봇의 자세를 감지하는 자이로 센서가 제대로 동작하지 않습니다.
  > 조립서를 보고 자이로 센서가 올바르게 조립되었는지 확인합니다.

#### 경고음이 울리며 일부 모터의 LED 가 켜지고, 토크가 풀려 있습니다.
- 모터의 프레임을 정해진 위치에 올바로 조립하지 않았거나, 로봇의 관절이 제대로 움직이지 못할 때, 로봇의 심각한 손상을 방지하기 위해 안전장치가 작동하는 것입니다.
  > LED 가 켜진 모터를 찾아 조립서를 보고 제대로 조립되었는지 확인합니다.
  > 전선이나 다른 물체가 관절에 끼어 있지 않은지 살펴봅니다. (조립 확인 모드를 참고하세요.)

- 로봇이 기본 자세를 취할 때, 로봇의 타입과 해당 멜로디가 일치하지 않습니다.
  > 모터의 ID 7, 8, 9, 10번을 정해진 위치에 제대로 조립했는지, 배선이 빠져 있지 않은지 확인하세요.

|로봇 타입|"도" |"도레"|"도레미"|"도레미" 반복|
| :---: | :---: | :---: | :---: |
|TYPE A|O<bR/>(올바르게 조립 됨)|ID 9, 10의 배선을 확인|ID 7, 8의 배선을 확인|일부 모터의 케이블이 빠져 있습니다. 조립서를 보고 배선을 다시 확인하세요.|
|TYPE B|-|O<BR/>(올바르게 조립 됨)|ID 9, 10번 모터를 연결해야 할 곳에 7, 8이 잘못 연결됨|일부 모터의 케이블이 빠져 있습니다. 조립서를 보고 배선을 다시 확인하세요.|
|TYPE C|-|ID 7, 8번 모터를 연결해야 할 곳에 9, 10이 잘못 연결 됨|O<BR/>(올바르게 조립 됨)|일부 모터의 케이블이 빠져 있습니다. 조립서를 보고 배선을 다시 확인하세요.|

### 로봇 조종하기
로봇을 켜고 PLAY 모드를 실행 한 후, R / D / L / U 버튼을 누르면 다음 모드가 실행 됩니다.

- `R` 리모콘 조종 모드
- `D` 데모 모드
- `L` 자율 보행 모드
- `U` 조립 확인 모드

![](/assets/images/edu/bioloid/bp_act_4_1_KR.jpg)

**참고**: 모드를 선택하지 않고, 리모컨(RC-100) 버튼을 누르면 리모컨 조종 모드로 동작합니다.
{: .notice}

#### 리모콘 조종 모드

리모컨 (RC-100) 으로 로봇을 조종할 수 있습니다.

##### 리모컨(RC-100A) 작동 방법
1. POWER/MODE 버튼을 1초 이상 누르면 전원이 켜집니다.
2. 리모컨의 버튼을 눌러 로봇을 조종합니다.
  - 보행 ( 방향 버튼 : U / L / D / R )
  - 자세 바꿈 ( 1 + 방향 버튼 : U / L / D / R )
  - 데모 동작 ( 2 + 방향 버튼 : U / L / D / R )
  - 축구 동작 ( 3 + 방향 버튼 : U / L / D / R )
  - 격투 동작 ( 4 + 방향 버튼 : U / L / D / R )

    ![](/assets/images/edu/bioloid/bp_act_4_2_KR.jpg)

##### 보행 ( 방향 버튼 : U / L / D / R )

|Buttons|Motion|
|:---:|:---:|
|U|앞으로 가기|
|D|뒤로 가기|
|L|왼쪽으로 회전|
|R|오른쪽으로 회전|
|U + L|전진하며 왼쪽으로 회전|
|D + L|왼쪽 옆걸음|
|U + R|전진하며 오른쪽으로 회전|
|D + R|오른쪽 옆걸음|

##### 자세 바꿈 ( 1 + 방향 버튼 )

|Buttons|Motion|
|:---:|:---:|
|1 + U|엎드려 일어나기(등을 보이고 넘어졌을 때)|
|1 + D|누워 일어나기(가슴을 보이고 넘어졌을 때)|
|1 + L|팔굽혀 펴기|
|1 + R|물구나무 서기|

##### 데모 동작 ( 2 + 방향 버튼 )

|Buttons|Motion|
|:---:|:---:|
|2 + U|가슴 치기|
|2 + D|머리 긁기|
|2 + L|두 손 올려 환호하기|
|2 + R|허리 숙여 인사하기|

##### 축구 동작 ( 3 + 방향 버튼 )

|Buttons|Motion|
|:---:|:---:|
|3 + U|오른쪽 막기 (눌렀다가 떼면 동작 원위치)|
|3 + D|왼쪽 막기 (눌렀다가 떼면 동작 원위치)|
|3 + L|왼발 슛|
|3 + R|오른발 슛|

##### 격투 동작 ( 4 + 방향 버튼 )

|Buttons|Motion|
|:---:|:---:|
|4 + U|전방 공격|
|4 + D|방어 (눌렀다가 떼면 동작 원위치)|
|4 + L|왼쪽 공격|
|4 + R|오른쪽 공격|

로봇의 관절 동작 범위에 따라 동작이 제한될 수 있습니다.
{: .notice}

##### CM-530 IR 채널 설정 ( Start + U, L, D, R )
조종모드에서 CM-530에 IR수신기를 장착하고 RC-100으로 조종할 때, 제어기의 Aux 버튼을 눌러 다음과 같이 리모콘의 채널을 설정할 수 있습니다. 채널을 바꾸면, RC-100의 채널도 같이 바꿔 주어야 합니다. RC-100의 채널 변경은 RC-100의 채널 변경 방법을 참고하세요.

|Buttons|Motion|
|:---:|:---:|
|Start + U|RC-100 채널 1로 설정|
|Start + D|RC-100 채널 3로 설정|
|Start + L|RC-100 채널 2로 설정|
|Start + R|RC-100 채널 4로 설정|

- 일정 시간 동안 로봇을 조종하지 않으면, 로봇은 앉은 자세에서 대기합니다.

|![](/assets/images/edu/bioloid/bp_act_3_3_kr.jpg)|![](/assets/images/edu/bioloid/bp_act_3_4_kr.jpg)|
|:---:|:---:|
|리모컨으로 로봇을 조종함|앉아서 리모컨 신호를 기다림|

##### 리모컨 조종이 잘 되지 않습니다.
- 리모컨 조종 모드로 설정하세요.
- 조립서를 보고 적외선 수신기가 제대로 연결되었는지 확인하세요.
- 리모컨의 전원이 켜져 있는지 확인하세요. 만약 전원이 켜지지 않는다면 배터리를 교체해 주세요.
- 적외선 수신기를 향해 리모컨을 조종하세요.
- 주위에 로봇을 조종하는 사람이 있지 않나요? (무선 혼선이 생길 수 있습니다.)

##### 여러 대의 로봇으로 축구 경기나 로봇 격투를 하고 싶어요.
- 여러 대의 로봇을 혼선 없이 안정적으로 조종하려면 블루투스 무선 모듈([BT-410 세트]) 또는 지그비 무선 모듈([ZIG-110 세트])을 장착해야 합니다.
- BT-410 세트 및 ZIG-110 세트(현재단종)는 [로보티즈 쇼핑몰]에서 별도로 구매하실 수 있습니다.
- 장착 방법은 각 [제어기] 설명페이지와 리모컨([RC-100]) 설명 페이지를 확인하세요.

#### 데모 모드

박수를 쳐 주면, 로봇은 그 횟수만큼 박수를 따라 칩니다. DMS센서에 물체가 감지되면 인사를 합니다. 일정시간 소리나 물체가 감지되지 않으면 로봇은 스스로 움직이며 여러 가지 동작을 보여줍니다.

|![](/assets/images/edu/bioloid/bp_act_4_3_KR.jpg)|![](/assets/images/edu/bioloid/bp_act_4_4_KR.jpg)|
|:---:|:---:|
|박수를 따라 침|다양한 동작을 보여 줌|

#### 자율 보행 모드

로봇이 장애물을 피하며 걸어갑니다. 절대 거리 센서에 물체가 감지되면 보행을 멈추고 물체가 감지되지 않을 때 까지 왼쪽으로 회전합니다. 보행중 넘어지면 넘어진 방향을 감지하여 스스로 일어납니다.

![](/assets/images/edu/bioloid/bp_act_4_6_KR.jpg)

#### 조립 확인 모드

조립 확인 모드에서는 로봇이 제대로 조립되었는지 확인할 수 있습니다. 모터를 하나씩 선택하여 로봇의 기본 자세와 비교하세요.

1. 조립 확인 모드를 실행하면 모든 모터의 힘이 풀립니다.
2. U / D 버튼을 눌러 모터를 하나씩 선택합니다. 이 때, 선택된 모터는 LED 가 켜지며 기본 위치로 돌아갑니다.( U : ID 를 1 씩 증가시킴. D : ID 를 1 씩 감소시킴)
3. LED 가 켜진 모터의 ID 와 조립서의 ID 를 비교하세요.
    > 해당 ID 의 모터가 로봇에 존재하지 않을 경우 경고음이 울립니다.
4. 실제로 모터가 멈춰있는 위치와 기본 자세에 해당하는 관절의 모습을 서로 비교하세요.
    >  LED는 켜져 있지만 모터에 힘이 풀려 있다면, 모터의 조립 상태나 주변의 케이블 등을 다시 살펴보세요.

## [충전하기](#충전하기)

{% include kr/edu/bioloid/stem_charge.md %}

# [튜토리얼](#튜토리얼)

## [화면 출력하기](#화면-출력하기)

{% include kr/edu/bioloid/screen_output.md %}

## [버튼과 LED](#버튼과-led)

{% include kr/edu/bioloid/button_led.md %}

## [보행 머신](#보행-머신)

`보행 머신` 의 사용 방법을 알아 봅시다. 보행 머신이란 특정 패턴으로 만들어진 보행 모션 파일과 이 모션 파일에 들어있는 보행 모션들 간의 연결을 부드럽게 이어주는 역할을 하는 태스크 코드를 합쳐서 부르는 말입니다.

- `다운로드` 보행 모션 파일 : [BIO_PRM_WalkingMachineExam_KR.mtn]
- `다운로드` 태스크 코드 : [BIO_PRM_WalkingMachineExam_KR.tsk]

보행 머신을 사용하여 보행 모션 간의 전환을 부드럽게 이어주는 방법에 대해 알아 봅시다.

### 보행 모션 파일 살펴보기

#### 보행 모션 파일

![](/assets/images/edu/bioloid/bp_tutorial_walking_1.png)

보행 머신에서 사용되는 보행 모션 파일은 31 페이지부터 224 페이지 사이에 보행에 필요한 모션들이 모여 있습니다.
몇 개의 모션 페이지들이 모여서 연속적으로 반복 실행되면서 하나의 보행 패턴(전진, 후진 등)을 형성하도록 되어 있으며, 각 페이지는 다른 보행 패턴의 모션 페이지로 전환하기 용이하도록 맞춰서 만들어져 있습니다.

#### 보행 모션 파일에 작성되어 있는 보행 패턴
보행 머신에 사용되는 보행 모션 파일에는 다음과 같은 16가지 보행 패턴이 포함되어 있습니다.

|전진|후진|제자리 좌회전|제자리 우회전|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_02.png)|![](/assets/images/edu/bioloid/premium_tutorial_03.png)|![](/assets/images/edu/bioloid/premium_tutorial_04.png)|![](/assets/images/edu/bioloid/premium_tutorial_05.png)|

|왼쪽 옆걸음|오른쪽 옆걸음|전진하며 좌회전|전진하며 우회전|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_06.png)|![](/assets/images/edu/bioloid/premium_tutorial_07.png)|![](/assets/images/edu/bioloid/premium_tutorial_08.png)|![](/assets/images/edu/bioloid/premium_tutorial_09.png)|

|후진하며 좌회전|후진하며 우회전|좌로 회피|우로 회피|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_10.png)|![](/assets/images/edu/bioloid/premium_tutorial_11.png)|![](/assets/images/edu/bioloid/premium_tutorial_12.png)|![](/assets/images/edu/bioloid/premium_tutorial_13.png)|

|좌측 대각선 전진|우측 대각선 전진|좌측 대각선 후진|우측 대각선 후진|
|:---:|:---:|:---:|:---:|
|![](/assets/images/edu/bioloid/premium_tutorial_14.png)|![](/assets/images/edu/bioloid/premium_tutorial_15.png)|![](/assets/images/edu/bioloid/premium_tutorial_16.png)|![](/assets/images/edu/bioloid/premium_tutorial_17.png)|

### 보행 머신 태스크 코드 살펴보기
보행 머신 태스크 코드에는 `보행초기화` 함수와 `보행실행` 함수가 포함되어 있으며, 이 두 가지 함수를 사용하여 리모컨으로 로봇을 조종하는 예제가 들어 있습니다.

#### 보행초기화 함수
`보행초기화` 함수는 보행 머신을 사용하기 전에 각종 변수값을 초기화 하고, 로봇을 초기 자세로 만들어 주는 함수입니다.

![](/assets/images/edu/bioloid/bp_tutorial_walking_2_kr.png)

#### 보행실행 함수

`보행실행` 함수는 보행 명령에 따른 보행 패턴을 실행시켜주고, 각 보행 패턴 사이의 전환을 매끄럽게 연결시켜 주는 함수입니다.

![](/assets/images/edu/bioloid/bp_tutorial_walking_3_kr.png)

#### 보행명령 번호

|번호|보행 패턴|번호|보행 패턴|번호|보행 패턴|번호|보행 패턴|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|1|전진	|2|후진	|3|제자리 좌회전	|4|제자리 우회전|
|5|왼쪽 옆걸음	|6|오른쪽 옆걸음	|7|전진하며 좌회전	|8|전진하며 우회전|
|9|후진하며 좌회전	|10|후진하며 우회전	|11|좌로 회피	|12|우로 회피|
|13|좌측 대각선 전진	|14|우측 대각선 전진	|15|좌측 대각선 후진	|16|우측 대각선 후진|

#### 프로그램 시작
리모컨으로 보행 조종 시 `보행초기화` 함수와 `보행실행` 함수를 사용하여 각 보행 패턴간의 전환을 이어주는 방법에 대해 간단한 `프로그램 시작` 예제를 작성해 봅시다.

![](/assets/images/edu/bioloid/bp_tutorial_walking_4_kr.png)

1. 먼저 `보행초기화` 함수를 호출하여 변수를 초기화 하고, 로봇을 초기 자세로 만들어 줍니다.
2. `보행명령` 이라는 변수에 0 ~ 16 에 해당하는 보행 패턴 번호를 선택하여 입력하고, `보행실행` 함수를 호출하면 선택한 보행 패턴이 실행됩니다.
3. `보행명령` 변수에 다른 보행 패턴 번호를 입력하고 다시 `보행실행` 함수를 호출하면 자동적으로 최대한 자연스럽게 보행 패턴의 전환이 이루어 집니다.

보행머신의 태스크 코드 파일에는 위와 같은 방식으로 16 가지의 보행 패턴을 리모컨으로 조종하기 위한 예제 코드가 들어가 있습니다. `프로그램 시작` 함수를 적절히 수정하여 본인에게 맞는 보행 조종 알고리즘을 만들어 보세요.

## [자이로 센서를 이용한 보정](#자이로-센서를-이용한-보정)

- 선행 학습 : [보행 머신]

본 학습에 사용된 태스크 코드는 [보행 머신]에서 사용된 태스크 코드에 자이로 센서 관련 코드를 추가한 것으로, 선행 학습 부분을 먼저 학습 후 보시면 이해하기가 더 쉽습니다.
{: .notice}

- 학습 목표 : 자이로 센서를 이용하여 휴머노이드의 자세를 보정하는 방법을 알아봅시다.
- 각속도(1 초당 각도의 변화량)를 검출할 수 있는 자이로 센서(Gyro Sensor)를 이용하여 로봇이 기울어져 특정 방향으로 각속도가 가해지게 되면 그 반대 방향으로 서보모터 값을 보정하여 자세를 바로 잡는 방법에 대하여 알아봅시다.

- `Downlaod` 태스크 코드 : [BIO_PRM_GyroSensorExam_KR.tsk]


### 준비 사항
- 자이로 센서는 x축 센서 값이 CM-510/CM-530 의 3번 포트에, y축 센서 값이 4번 포트에 연결되어 있어야 합니다.
- 그 외의 경우 태스크 코드를 자신의 로봇에 맞게 수정하여 사용하세요.

### 개념 정리
- [콜백(Callback) 함수]
  자이로 센서를 이용한 휴머노이드의 자세 보정 값은 [콜백(Callback) 함수]를 이용하여 구합니다.
  콜백 함수는 메인 프로그램 루틴과는 독립적으로 동작하는 함수로, 일정 시간마다 스스로 실행되는 함수입니다. 따라서 일정 시간마다 자이로 센서 값을 이용하여 보정 값을 계산한 후 그 값으로 자세를 보정하도록 콜백 함수를 작성해 주면 메인 프로그램 루틴과 상관 없이 로봇은 자이로 센서를 이용하여 스스로 자세를 보정하게 됩니다.

- [관절 오프셋]
  휴머노이드의 자세를 보정하기 위해 자이로 센서를 이용하여 구한 보정 값은 [관절 오프셋]을 이용하여 로봇에 적용합니다.
  관절 오프셋은 모션 실행 시 특정 관절의 관절 위치 값에 오프셋을 주는 파라미터입니다. 즉, 관절 오프셋이 설정된 관절은 모션 파일에 지정된 위치값 + 관절 오프셋 값으로 모션이 실행되게 됩니다.

### 태스크 코드 살펴 보기

1. `자이로초기화` 함수 호출

    ![](/assets/images/edu/bioloid/bp_tutorial_gyro_01_kr.png)

2. 관절 오프셋 적용을 위한 밸런스페이지 실행
  관절 오프셋이 적용되기 위해서는 모션이 실행되어야 합니다. 따라서 아무런 모션도 실행되고 있지 않은 상태에서는 자이로 센서에 의한 보정 값이 관절 오프셋에 입력되어도 적용이 되지 않기 때문에 밸런스페이지를 만들어서 아무런 모션도 실행되지 않을 때 실행하여 관절 오프셋이 항상 적용되도록 합니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gyro_05_kr.png)

3. `자이로초기화` 함수
    - 자이로초기화 함수에는 약 0.128초 주기로 10번의 자이로 센서 값을 읽어와서 그 평균 값을 자이로 센서 기준값으로 저장합니다. (약 250 정도가 일반적인 기준값 임.)
    - 만약 자이로 센서 값이 230 보다 작거나 270 보다 큰 경우에는 자이로 센서가 없는 것으로 간주하고 보정을 사용하지 않도록 설정합니다. (자이로 센서가 없거나 초기화 중 로봇이 많이 흔들린 경우)

    ![](/assets/images/edu/bioloid/bp_tutorial_gyro_02_kr.png)

4. 콜백 함수에서 보정값 계산
    - 일정 주기로 자동 실행되는 콜백 함수에서 현재 자이로 센서 값을 읽어와서 기준값과 비교하여 변동량을 계산한 후 그 값에 따라 보정 값을 계산합니다.
    - 이 때 `자이로보정사용` 변수가 FALSE 이면 보정을 사용하지 않습니다. 따라서 메인 루틴에서 자이로 보정을 사용하지 않으려는 곳에 `자이로보정사용` 변수를 FALSE 로 설정하면 됩니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gyro_03_kr.png)

    - 계산된 보정 값을 관절 오프셋에 적용하여 로봇의 자세를 보정합니다. 앞/뒤 기울어짐을 보정하기 위해서는 무릎과 발목의 13, 14, 15, 16 번 관절을 사용하고, 좌/우 기울어짐을 보정하기 위해서는 발목과 허리의 9, 10, 17, 18 번 관절을 사용합니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gyro_04_kr.png)

### 보정 테스트

- 태스크 코드를 로봇에 다운로드하고 실행합니다.
- 자이로 초기화를 위해 태스크 코드 실행 후 약 1.5초 이상 평평한 곳에 로봇을 세워 두어야 합니다. 만약 자이로 초기화 시 급격한 흔들림이 있거나, 자이로 센서가 연결되어 있지 않으면 자이로 보정을 하지 않습니다.
- 가만히 서 있는 상태에서 충격을 받아 자세가 흐트러지면 보정을 시도하는지 확인하세요.
- 경사면 등에서 자이로를 이용한 보정을 하지 않을 때와, 보정을 할 때 각각 어떻게 다른지 확인하세요.

## [사용자 모션 추가(모션 만들기)](#사용자-모션-추가모션-만들기)

- 선행 학습 : [보행 머신]

본 학습은 [보행 머신]에서 사용된 모션 파일에 몇 가지 모션을 추가하는 방법에 대해 학습합니다. 따라서 선행 학습 부분을 먼저 학습 후 보시면 이해하기가 더 쉽습니다.
{: .notice}

- 학습 목표 : RoboPlus Motion 을 사용하여 모션 추가하기
RoboPlus Motion 프로그램을 사용하여 아래와 같은 4 가지 모션을 추가하는 방법을 학습해 봅시다.

|모션 페이지 번호|동작 설명|모션 페이지 번호|동작 설명|
|:---:|:---:|:---:|:---:|
|14|오른쪽 공 막기	|27|엎드려 일어나기|
|16|왼쪽 공 막기	|28|누워 일어나기|

- `다운로드` 모션 파일 : [BIO_PRM_UserMotionExam_KR.mtn]

### "오른쪽 공 막기" 모션 만들기

1. RoboPlus Motion 을 실행하고 제어기와 연결합니다. (로봇 연결하기 참조)

    ![](/assets/images/edu/bioloid/walking_01_kr.png)

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_01_kr.jpg)

2. 14번 페이지에 공 막기 모션을 추가하기 위해 이름을 입력하고 스텝을 추가합니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_02_kr.jpg)

3. 로봇의 모든 모터가 꺼져 있는 상태에서 로봇의 포즈를 설정해 줍니다. 다음은 오른쪽 공 막기 포즈입니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_10_kr.jpg)

4. 위와 같이 로봇의 포즈를 설정하고 토크 온 버튼을 누르면 현재 로봇의 관절 값이 <로봇의 포즈> 에 자동으로 입력됩니다. 왼쪽 화살표 버튼을 누르면 현재 입력된 로봇의 관절 값을 <스텝의 포즈> 로 읽어올 수 있습니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_03_kr.jpg)

5. 멈춤 시간과 실행 시간을 조절합니다. ([스텝 멈춤/실행 시간의 자세한 정보는 여기를 참조하세요.])

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_04_kr.jpg)

6. 막기 포즈를 유지하기 위하여 NEXT 페이지를 자기 자신으로 지정하여 무한 반복 모션으로 만듭니다. 무한 반복 모션을 빠져나올 때 적절한 모션을 취하도록 하기 위해 EXIT 페이지도 지정해 줍니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_05_kr.jpg)

7. EXIT 페이지로 지정한 15번 페이지에 기본 자세로 돌아가기 위한 모션을 만들어 줍니다. 위의 오른쪽 공 막기 포즈와 같이 15번 모션 페이지에 스텝 3 개를 추가하여 각각 아래와 같은 포즈를 추가합니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_06_kr.jpg)

8. 추가 설정([반복 횟수, 재생 배속] 등). 각 페이지의 반복 횟수나 전체 속도 등을 추가로 설정할 수 있습니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_addmotion_07_kr.jpg)

### "왼쪽 공 막기" 모션 만들기

- 위 STEP 1 에서 만든 것과 동일한 방법으로 16 ~ 17번 모션 페이지에 반대 방향인 왼쪽 공 막기 모션을 만들어 줍니다

### "엎드려 일어나기"와 "누워 일어나기" 모션 만들기

- 27 ~ 28번 모션 페이지에 아래와 같이 스텝을 추가하여 "엎드려 일어나기" 와 "누워 일어나기" 모션을 만들어 줍니다.

#### 엎드려 일어나기

![](/assets/images/edu/bioloid/bp_tutorial_addmotion_08_kr.jpg)

#### 누워 일어나기

![](/assets/images/edu/bioloid/bp_tutorial_addmotion_09_kr.jpg)

### 저장하기
- "저장(S)" 명령으로 로봇에 현재까지 작업한 내용을 저장합니다. 또는 "다른 이름으로 저장(A)" 을 통해 PC 에 .mtn 파일로 저장합니다.

  ![](/assets/images/edu/bioloid/walking_14_kr.png)


## [사용자 모션 추가(태스크 코드)](#사용자-모션-추가태스크-코드)

- 선행 학습 : [자이로 센서를 이용한 보정], [사용자 모션 추가(모션 만들기)]
  본 학습에 사용된 태스크 코드는 "자이로 센서를 이용한 보정" 에서 사용된 태스크 코드에 사용자가 추가한 모션을 실행시키는 코드를 추가한 것이며, 모션 파일은 "사용자 모션 추가하기1 - 모션만들기" 의 결과물입니다. 따라서 선행 학습 부분을 먼저 학습 후 보시면 이해하기가 더 쉽습니다.


- 학습 목표 : 사용자가 추가한 모션을 실행하는 태스크 코드를 작성해 봅시다.
  앞서 "사용자 모션 추가하기1 - 모션만들기" 에서 추가한 모션을 리모컨(RC-100)으로 실행하는 방법에 대해 학습해 봅시다.

- `다운로드` 모션 파일 : [BIO_PRM_UserMotionExam_KR.mtn]
- `다운로드` 태스크 코드 : [BIO_PRM_UserMotionExam_KR.tsk]

### 태스크 코드 살펴보기
"자이로 센서를 이용한 보정" 에서 작성한 태스크 코드에 사용자 모션을 실행하는 코드를 추가한 태스크 코드입니다.

![](/assets/images/edu/bioloid/bp_tutorial_usermotion2_01_kr.png)

1. `보행명령` 에 0번을 실행하여 로봇을 정지 상태로 만듭니다.
2. 사용자가 추가한 모션의 경우 자이로 센서가 수평을 유지해야 하는 모션이 아니라면 자이로 센서에 의한 보정을 꺼 놓아야 오프셋에 의한 모션의 변형이 일어나지 않습니다. 따라서 `자이로보정사용` 을 FALSE 로 만들어 줍니다. 그 후 `EXIT페이지실행후모션종료대기` 함수를 호출하여 로봇이 완전히 멈출 때까지 기다립니다.
3. 모션 페이지 27 과 28 에 추가한 모션은 "일어나기" 모션으로 한 번만 실행되는 모션입니다. 따라서 리모컨 버튼 값에 따라 지정된 모션 페이지를 실행시키고, 모션이 종료될 때까지 기다립니다.
4. 모션 페이지 14 와 16 에 추가한 모션은 "공 막기" 모션으로 무한 반복 모션입니다. 따라서 모션을 중지하기 위해서는 EXIT 페이지의 실행이 필요합니다. `조건 대기` 명령어를 통해 동일한 버튼을 계속 누르고 있는 것이 아닐 경우 `EXIT페이지실행후모션종료대기` 함수를 호출하여 EXIT 페이지를 실행하며 모션을 종료합니다.(["모션 페이지" 파라미터에 대한 자세한 설명은 여기를 참고하세요.])
5. 사용자 모션의 실행이 완료되었으면 `자이로보정사용` 변수를 TRUE 로 변경하여 다시 자이로 보정을 사용하도록 복구해 줍니다.

## [그리퍼 제어](#그리퍼-제어)

- 선행 학습 : [사용자 모션 추가(모션 만들기)], [사용자 모션 추가(태스크 코드)]  
  본 학습에 앞서 선행 학습에 해당하는 부분을 먼저 학습하시면 이해하기가 더 쉽습니다.

- 학습 목표 : 모션과 별개로 그리퍼를 제어하는 방법을 학습해 봅시다.
  - 로봇에 그리퍼를 달게 되면 모션에 관계 없이 그리퍼를 달아 놓은 팔은 고정시킬 필요가 있습니다. 이럴 경우 기존의 모션에서 팔을 고정시키도록 수정하지 않고, 특정 관절들만 모션 데이터에 의한 제어가 되지 않도록 하여 모션과 별개로 태스크 코드에서 그리퍼를 제어하는 방법에 대해 학습해 봅시다.
  - 본 학습에서는 그리퍼에 2 개의 다이나믹셀이 사용되므로 휴머노이드 B 타입에 그리퍼를 달아 사용합니다.

- `다운로드` 태스크 코드 : [BIO_PRM_GripperExam_KR.tsk]
- `다운로드` B타입 모션 파일 : [BIO_PRM_HumanoidTypeB_KR.mtn]

### 배경 지식
모션과 그리퍼를 별도 제어하기 위한 제어 우선순위 설정

- 일반적인 제어 우선 순위
  일반적으로 다이나믹셀의 제어에 대한 우선 순위는 모션 데이터에 의한 제어가 우선 순위가 가장 높으며, 다음으로 태스크 코드에 의한 제어입니다. 따라서 일반적인 경우 모션이 실행되면 태스크 코드에 의해 일부 다이나믹셀만 별도 제어하는 것은 불가능합니다.

- 제어 우선 순위 변경
  그리퍼와 같이 모션 실행 시 일부 모터(그리퍼를 포함한 팔 전체)만 모션과 상관없이 태스크 코드를 이용하여 제어하려면 다음과 같은 두 가지 방법이 있습니다.
  1. 모션 데이터에서 해당 관절의 ID 를 "사용 유무" 체크를 해제 하는 방법
  2. 해당 관절의 "관절 오프셋" 파라미터의 값을 1024 로 설정하는 방법

  1번 방법의 경우 전체 페이지에서 해당 관절을 사용하지 않도록 하는 것으로, 해당 관절을 필요로 하는 모션이 있을 경우 모션 데이터에 의해 해당 관절을 제어할 방법이 없으므로, 필요에 따라 특정 관절에 대한 모션 데이터 적용을 활성화 / 비활성화 할 수 있는 2번 방법을 사용하는 것이 좋습니다.

### 그리퍼 장착
- 로봇에 그리퍼를 장착하는 방법은 유용한 정보의 [그리퍼 장착]을 참고하세요.

### 태스크 코드 작성

1. 그리퍼 제어 초기화
  그리퍼 제어를 위해 양 팔에 해당하는 관절들의 "관절 오프셋"에 1024 를 입력하여 모션 재생 시 양 팔 관절은 모션 데이터에 의한 제어를 받지 않도록 설정합니다. 그 외에 팔과 그리퍼의 움직임 속도, 그리퍼의 잡는 힘과 유연성 등의 값을 초기화 해 주고, 팔의 초기 자세를 잡아줍니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gripper_01_kr.png)

2. 콜백 함수(자이로 보정) 수정
  콜백 함수에서 자이로 보정 값 적용 등을 위해 관절 오프셋을 사용하는 경우 그리퍼에 사용된 관절에 관절 오프셋을 설정하지 않도록 합니다. STEP 1 에서 그리퍼 제어 초기화를 위해 관절 오프셋을 1024 로 변경해 놓았는데, 이 값이 바뀌는 것을 막기 위함입니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gripper_04_kr.png)

3. 그리퍼/팔 제어 함수
  그리퍼와 팔을 제어하는 함수를 아래와 같이 작성합니다. 이 함수는 필요에 따라 모션 상태와 상관없이 호출하게 되면 그리퍼와 팔의 움직임을 제어합니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gripper_02_kr.png)

    왼팔과 그리퍼 역시 위와 동일한 방법으로 함수를 작성해 줍니다.

4. 리모컨으로 팔 및 그리퍼 제어
  그리퍼 및 팔 제어 함수를 이용하여 리모컨으로 조종하는 코드를 추가합니다. 아래 코드는 [사용자 모션 추가(태스크 코드)] 부분을 참조하시면 도움이 됩니다.

    ![](/assets/images/edu/bioloid/bp_tutorial_gripper_03_kr.png)

### 다운로드 및 결과 확인
- STEP 2 에서 작성한 태스크 코드를 제어기에 다운로드 합니다. ([다운로드 방법 참조])
- 조종기로 로봇의 모션을 조종할 때 그리퍼와 팔이 모션과 상관 없이 고정되는지 확인합니다.
- 조종기로 그리퍼를 조종해 봅니다.


# [다운로드](#다운로드)

## [기본 프로그램](#기본-프로그램)

### [태스크 코드 다운로드 방법](#태스크-코드-다운로드-방법)

로보티즈 초급/종합 키트에서 사용되는 제어기인 CM-5 에 RoboPlus 프로그램을 사용하기 위해서는 반드시 펌웨어 업데이트가 필요합니다. 펌웨어 업데이트 방법은 RoboPlus Manager 의 펌웨어 업데이트를 참고하세요.
{: .notice}

#### 태스크 코드 다운로드 준비

1. 다운로드 할 태스크 코드 파일(\*.tsk)을 RoboPlus Task에서 불러 옵니다.
  - 태스크 코드 파일을 더블클릭하여 열 수 있습니다.
  - RoboPlus Task 의 파일 열기 기능으로 열 수 있습니다.
  - 마우스를 이용하여 파일을 RoboPlus Task 위로 드래그 앤 드롭(Drag & Drop)을 통해 열 수 있습니다.

2. USB2Dynamixel을 이용하여 PC 와 제어기를 연결합니다.
3. 제어기의 전원을 켭니다. (전원을 켜는 방법은 각 제어기 정보를 참고하세요.)

    ![](/assets/images/edu/bioloid/cm510_pc.jpg)

#### 태스크 코드 다운로드

1. PC와 제어기가 연결되어야 합니다.
  태스크 코드를 다운로드하기 위해서는 PC와 제어기가 연결되어야 합니다. (연결 방법은 각 제어기 정보를 참고하세요.)

2. 사용할 통신 포트를 선택해야 합니다.
  자동 찾기 기능을 이용하면 쉽게 통신 포트를 설정할 수 있습니다.

    ![](/assets/images/edu/bioloid/select_port.png)

    RoboPlus Task 가 제어기를 찾지 못하면 아래와 같은 에러 메시지가 나타납니다.

    ![](/assets/images/edu/bioloid/cannot_find_controller.png)

    - PC와 제어기가 연결되어 있는지 확인합니다. (연결 방법은 각 제어기 정보를 참고하세요.)
    - 제어기의 전원이 켜져 있는지 확인합니다.
    - 제어기가 연결된 통신 포트가 바르게 선택되어 있는지 확인합니다.

3. 다운로드 메뉴를 선택합니다.

    ![](/assets/images/edu/bioloid/download_button.png)

    만약 프로그램에 오류가 있다면 오류를 찾아 수정해야 합니다. (룰 체크 에러 메시지 확인)

4. 다운로드를 진행합니다.

    ![](/assets/images/edu/bioloid/download_progress_bar.png)

    만약 다운로드에 실패했다면 처음부터 다시 시도합니다.

5. 태스크 코드(Task Code)를 실행한뒤 로봇의 동작을 실행 합니다.
  제어기를 켜고 다운로드 한 태스크 코드를 실행합니다. (태스크 코드 실행 방법은 각 제어기 정보를 참고하세요.)


<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [모션 파일 다운로드 방법](#모션-파일-다운로드-방법)

- 로보플러스 모션 1.0의 [모션 다운로드](/docs/kr/software/rplus1/motion/#모션-다운로드)를 참고하세요.

|타입|파일 종류|다운로드|
|:---:|
|조립서|PDF 파일|[Download][BIO_PRM_Humanoid_ASM.pdf]|
|A 타입|휴머노이드 기본 태스크 코드<br />휴머노이드 기본 모션 파일|[Download][BIO_PRM_HumanoidTypeA_KR.tsk]<br />[Download][BIO_PRM_HumanoidTypeA_KR.mtn]|
|B 타입|휴머노이드 기본 태스크 코드<br />휴머노이드 기본 모션 파일|[Download][BIO_PRM_HumanoidTypeB_KR.tsk]<br />[Download][BIO_PRM_HumanoidTypeB_KR.mtn]|
|C 타입|휴머노이드 기본 태스크 코드<br />휴머노이드 기본 모션 파일|[Download][BIO_PRM_HumanoidTypeC_KR.tsk]<br />[Download][BIO_PRM_HumanoidTypeC_KR.mtn]|

### 휴머노이드 활용 예제
기본예제로 로보티즈 프리미엄에 제공되는 보행 속도의 2배 이상의 속도를 내는 보행 동작과 격투 경기용 동작이 포함되어 있습니다.
보행 모션 페이지만 별도로 복사하여 사용하실 수도 있습니다.

A타입에만 적용 가능하며, B와 C타입에 적용시에는, [로보플러스 모션]에서 로봇의 양쪽 골반과 발목 관절의 옵셋을 수정하여 흐트러진 로봇의 무게중심을 수정하는 절차를 진행하셔야 합니다.
{: .notice}

### [휴머노이드 격투](#휴머노이드-격투)

#### 휴머노이드 격투 예제 파일

|타입|파일 종류|다운로드|
|:---:|
|A 타입|휴머노이드 격투 태스크 파일|[Download][BIO_PRM_FightTypeA_KR.tsk]|
|A 타입|휴머노이드 격투 모션 파일|[Download][BIO_PRM_FightTypeA_KR.mtn]|

#### 로봇 조종하기
로봇을 작동하기 위한  키 정보 입니다.

##### 보행 ( 방향 버튼 : U / L / D / R )

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|U|앞으로 가기|U + L|전진하며 왼쪽으로 회전|
|L|왼쪽으로 회전|U + R|전진하며 오른쪽으로 회전|
|D|왼쪽 공격|L + 5|좌 이동|
|R|오른쪽으로 회전|L + 5 + 6|빠른 좌 이동|
|L + U + 5|좌 이동하며 앞으로|R + 5 + 6|빠른 우 이동|
|L + D + 5|좌 이동하며 뒤로|R + U + 5|우 이동하며 앞으로|
|R + 5|우 이동|R + D + 5|우  이동 하며 뒤로|

##### 공격 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|1 + L|왼쪽 대각선 공격|6 + 2|좌 공격 (강)|
|1 + R|오른쪽 대각선 공격|6 + 4|우 공격 (강)|
|2 + U|전 공격|6 + 1|전 공격 (강)|
|2 + L|좌 공격|4 + U|잡기|
|2 + R|우 공격|4 + D|잡기 2|
|3|양쪽 공격|4 + L|잡기|
|-|-|4 + R|잡기 2|

##### 기타 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|5+6+D+3|토크 오프|5+6+U+1|토크 온|
|1 + U|앞으로 일어나기|1 + D|뒤로 일어나기|

**참고**: 4+U 와 4+L 은 같은 동작입니다.  마찬가지로 4+D와 4+R은 같은 동작입니다.
{: .notice}

### [휴머노이드 축구](#휴머노이드-축구)

|타입|파일 종류|다운로드|
|:---:|
|A 타입|휴머노이드 축구 태스크 파일|[Download][BIO_PRM_SoccerTypeA_KR.tsk]|
|A 타입|휴머노이드 축구 모션 파일|[Download][BIO_PRM_SoccerTypeA_KR.mtn]|

#### 로봇 조종하기

로봇을 작동하기 위한  키 정보 입니다.

##### 보행 ( 방향 버튼 : U / L / D / R )

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|U|앞으로 가기|D|뒤로 가기|
|L|왼쪽으로 회전|R|오른쪽으로 회전|
|U + L|전진하며 왼쪽으로 회전|U + R|전진하며 오른쪽으로 회전|
|L + 5|좌 이동|R + 5|우 이동|
|L + 5 + 6|빠른 좌 이동|R + 5 + 6|빠른 우 이동|
|L + U + 5|좌 이동하며 앞으로|R + U + 5|우 이동하며 앞으로|
|L + D + 5|좌 이동하며 뒤로|R + D + 5|우  이동 하며 뒤로|

##### 공격 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|2 + U|앞으로 차기 (왼발)|2 + D|뒤로 차기|
|2 + L|왼쪽으로 차기|2 + R|오른쪽으로 차기|
|2 + 6 + U|앞으로 세게 차기|4 + 6 + U|앞으로 세게 차기|
|4 + U|앞으로 차기 (오른발)|4 + D|뒤로 차기|
|4 + L|왼쪽으로 차기|4 + R|오른쪽으로 차기|

##### 수비 ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|3|막기 준비|3 + U|전방 막기|
|3 + L|좌측 공 막기|3 + R|우측 공 막기|

##### 기타  ( 키 + 키)

|Buttons|Motion|Buttons|Motion|
|:---:|:---:|:---:|:---:|
|5+6+D+3|토크 오프|5+6+U+1|토크 온|
|1 + U|앞으로 일어나기|1 + D|뒤로 일어나기|
|1 + L|가슴 치기|1 + R|환호|

## [예제](#예제)

### [초급 응용 로봇](#초급-응용-로봇)

각 로봇의 조립서는 인터넷이 연결되어 있어야 다운로드 받으실 수 있습니다.
{:. notice}

|Examples|Description|
|:---:|:---|
|1. 차단바 <br />![](/assets/images/edu/bioloid/prm_crossinggate_kr.jpg)| [Download][BIO_PRM_CrossingGate_ASM.pdf] 조립서<br />[Download][BIO_PRM_CrossingGate_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/r3j2ozjljrdmog3/BIO_PRM_CrossingGate.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 조건 대기<br />`알고리즘`	제어기의 버튼으로 다이나믹셀 위치 제어<br />`동작 방법`<br />- 제어기의 U 버튼을 누르면 차단바가 열립니다.<br />- 제어기 의 D 버튼을 누르면 차단바가 닫힙니다.|
|2. 다목적 계기판  <br />![](/assets/images/edu/bioloid/prm_universalgauge_kr.jpg)|[Download][BIO_PRM_Universalgauge_ASM.pdf] 조립서<br />[Download][BIO_PRM_Universalgauge_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/2ymcu5boposrkx0/BIO_PRM_UniversalGauge.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1) , AX-12+(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 복귀, 로드, 계산, 무조건 반복, 만약, 아니면 만약<br />`알고리즘`	제어기의 버튼으로 다이나믹셀 속도 제어<br />`동작 방법`<br />- 제어기의 U 버튼을 누르고 있으면, 게이지의 속도가 점점 빨라집니다.<br />- 제어기의 D 버튼을 누르고 있으면, 게이지의 속도가 점점 느려집니다.|
|3. 악어 입  <br />![](/assets/images/edu/bioloid/prm_crocodilemouth_kr.jpg)|  [Download][BIO_PRM_CrocodileMouth_ASM.pdf] 조립서<br />[Download][BIO_PRM_CrocodileMouth_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/5amlfqbs8bp111n/BIO_PRM_CrocodileMouth.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1) , AX-12+(1), 적외선 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면 만약, 조건 대기<br />`알고리즘`	적외선 센서와 타이머 값에 따라 다이나믹셀 위치 및 버저 제어<br />`동작 방법`<br />- 센서의 전방에 손을 대면 입을 벌리고, 손을 떼면 입을 다뭅니다.<br />- 만약, 입을 다물 때 입 사이에 물체가 있으면, 다시 입을 벌립니다.<br/>10초 동안 물체가 감지되지 않으면 멜로디 소리를 냅니다.|
|4. 팬틸트 장치  <br />![](/assets/images/edu/bioloid/prm_pantilt_kr.jpg)| [Download][BIO_PRM_Pantilt_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Pantilt_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/z5jxto4zdwnsefx/BIO_PRM_PanTilt.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(2)(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1], ID[2] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면 만약, 조건 대기<br />`알고리즘`	제어기 버튼으로 팬틸트 제어<br />`동작 방법`<br />- 제어기의 U 버튼을 누르면 틸트(위,아래) 관절이 위로 움직입니다.<br />- 제어기의 D 버튼을 누르면 틸트(위,아래) 관절이 아래로 움직입니다.<br/>제어기의 R 버튼을 누르면 팬(좌,우) 관절이 우로 움직입니다.<br/>제어기의 L 버튼을 누르면 팬(좌,우) 관절이 좌로 움직입니다.|
|5. 차량 출입 통제기   <br />![](/assets/images/edu/bioloid/prm_parkinggate_kr.jpg)| [Download][BIO_PRM_Parkinggate_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Parkinggate_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/sn6li7gu68jw0es/BIO_PRM_ParkingGate.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(2), 적외선 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1], ID[2] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면 만약, 조건 대기<br />`알고리즘`	적외선 센서와 다이나믹셀 하중 값에 따라 다이나믹셀 위치 제어<br />`동작 방법`<br />- 센서에 물체가 감지되면, 차단바가 수직으로 열립니다.<br />- 센서에 물체가 감지되고 동시에 차단바가 밀리면, 차단바가 수평으로 열립니다.<br/>센서에 물체가 감지되지 않으면, 차단바가 닫힙니다.|
|6.스마트카  <br />![](/assets/images/edu/bioloid/prm_smartcar_kr.jpg)|  [Download][BIO_PRM_Smartcar_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Smartcar_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/pa6u6brs4nhebud/BIO_PRM_SmartCar.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(4), 적외선 센서(2)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[4] : 바퀴모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 점프, 레이블, 무조건 반복, 만약, 아니면 만약, 조건 대기<br />`알고리즘`	제어기의 버튼에 따라 모드 설정을 하고, 버튼과 센서 값에 따라 다이나믹셀 회전 방향 제어<br />`동작 방법`<br />- 제어기의 스타트버튼과 U버튼을 누르면 조종모드로 됩니다.<br />- 제어기의 스타트버튼과 D버튼을 누르면 자율모드로 됩니다.<br/>조종모드시 L버튼을 누르면 전진, R버튼을 누르면 후진, U버튼을 누르면 우회전, D버튼을 누르면 좌회전을 합니다. 움직일때마다 멜로디가 나옵니다.<br/>자율모드시 전방센서가 감지되면 우회합니다. 하단센서가 감지되면 낭떠러지를 피해 우회합니다.|
|7. 박수치는 꽃게    <br />![](/assets/images/edu/bioloid/prm_clappingcrab_kr.jpg)|  [Download][BIO_PRM_ClappingCrab_ASM.pdf] 조립서 <br />[Download][BIO_PRM_ClappingCrab_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/k8vlerjsmw80fse/BIO_PRM_ClappingCrab.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(2)<br />`다이나믹셀 설정 값` AX-12+ ID[1],  ID[2] : 관절모드<br />`RoboPlus 문법`	로드, 계산, 무조건 반복, 만약, 횟수만큼 반복, 조건 대기<br />`알고리즘`	마이크 센서 소리 감지 횟수에 따라 다이나믹셀 위치 제어<br />`동작 방법`<br />- 로봇은 팔을 벌린채 대기합니다.<br/>소리감지시 감지 횟수 만큼 박수를 따라칩니다.|
|8.공격하는 오리     <br />![](/assets/images/edu/bioloid/prm_attackingduck_kr.jpg)|  [Download][BIO_PRM_AttackingDuck_ASM.pdf] 조립서 <br />[Download][BIO_PRM_AttackingDuck_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/ogfmctvc2zcnjs5/BIO_PRM_AttackingDuck.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(3), 적외선 센서(2)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[3] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 조건 반복, 조건 대기<br />`알고리즘`	센서 감지에 따라 다이나믹셀 제어<br />`동작 방법`<br />- 로봇은 좌우 이동을 반복하며 감시합니다.<br/>센서감지기 감지된 센서 방향쪽으로 따라가고 두개의 센서가 모두 감지시 공격을 합니다.|
|9.거리측정기 <br />![](/assets/images/edu/bioloid/prm_distancelevelmeter_kr.jpg)|  [Download][BIO_PRM_DistanceLevelMeter_ASM.pdf] 조립서 <br />[Download][BIO_PRM_DistanceLevelMeter_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/g4z6ucy58pr28cg/BIO_PRM_DistanceLevelMeter.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(1), 거리 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복<br />`알고리즘`	센서 감지 거리에 따라 다이나믹셀 위치 제어<br />`동작 방법`<br />- 센서의 감지거리에 따라 높이바가 움직입니다.|
|10.라인트레이서     <br />![](/assets/images/edu/bioloid/prm_linetracer_kr.jpg)|  [Download][BIO_PRM_Linetracer_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Linetracer_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/bi4c81e79hup3vu/BIO_PRM_LineTracer.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(2), 적외선 센서(2)<br />`다이나믹셀 설정 값` AX-12+ ID[1],  ID[2] : 바퀴모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기<br />`알고리즘`	센서 감지 값에 따라 라인트레이서 제어<br />`동작 방법`<br />- 로봇은 검은색 라인을 따라 주행합니다.|
|11. 보행드로이드         <br />![](/assets/images/edu/bioloid/prm_walkingdroid_kr.jpg)|  [Download][BIO_PRM_WalkingDroid_ASM.pdf] 조립서 <br />[Download][BIO_PRM_WalkingDroid_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_WalkingDroid_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/v2ujjwfd5zsvkpx/BIO_PRM_WalkingDroid.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(4), 적외선 센서(1)<br />`다이나믹셀 설정 값` AAX-12+ ID[1]~ ID[4] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 조건 반복, 조건 대기<br />`알고리즘`	적외선 센서 값에 따라 다양한 모션 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 보행 드로이드를 작동시킵니다.<br/>장애물을 피해가면서 보행하는 것을 확인합니다.|

### [중급 응용 로봇](#중급-응용-로봇)

각 로봇의 조립서는 인터넷이 연결되어 있어야 다운로드 받으실 수 있습니다.
{: .notice}

|Examples|Description|
|:---:|:---|
|1.집게탐사차  <br />![](/assets/images/edu/bioloid/prm_provingrobot_kr.jpg)|  [Download][BIO_PRM_ProbingRobot_ASM.pdf] 조립서 <br />[Download][BIO_PRM_ProbingRobot_KR.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/nb5zqfhfcfr1hqq/BIO_PRM_ProvingRobot.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(7), 적외선 센서(1), 거리 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[4] : 바퀴모드<br />AX-12+ ID[5]~ ID[7] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 복귀, 로드, 계산, 무조건 반복, 만약, 아니면, 조건 대기, 반복 끝내기<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 장애물 인식 및 처리<br />`동작 방법`<br />- 제어기의 U 버튼을 누르면 차단바가 열립니다.<br />- 주행 경로 상에 여러 크기의  장애물을 설치해 놓고 집게 탐사차를 작동시킵니다.<br/>장애물이 너무 크면 피해서 주행하는 것을 확인합니다.<br/>장애물이 적당한 크기면 들어서 옆으로 치워 놓고 주행하는 것을 확인합니다.|
|2.포크레인   <br />![](/assets/images/edu/bioloid/prm_excavator_kr.jpg)|  [Download][BIO_PRM_Excavator_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Excavator_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_Excavator_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/mvw9ng07h7qpsq2/BIO_PRM_Excavator.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8), 적외선 센서(1), 거리 센서(1)<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면, 조건 대기<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 다이나믹셀 위치 제어<br />`동작 방법`<br />- 주행 경로 상에 장애물을 설치해 놓고 포크레인을 작동시킵니다.<br />- 전방에 물체가 감지되면 굴삭 작업을 하는 것을 확인합니다.<br/>물체를 든 상태에서 센서에 장애물이 감지되면, 감지된 방향으로 회전한 후 물체를 내려놓는 것을 확인합니다.|
|3.로봇꽃    <br />![](/assets/images/edu/bioloid/prm_robotflower_kr.jpg)|  [Download][BIO_PRM_RobotFlower_ASM.pdf] 조립서 <br />[Download][BIO_PRM_RobotFlower_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_RobotFlower_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/pkcxzr2vckeqph0/BIO_PRM_RobotFlower.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(6)<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면, 조건 대기  <br />`알고리즘`	소리 감지 횟수에 따라 모션 제어<br />`동작 방법`<br />- 전원을 켜면 꽃잎을 펴고 춤추듯이 천천히 움직입니다.<br />- 박수 소리가 한번나면 꽃입을 천천히 오므립니다.<br/>박수 소리가 여러번나면 꽃입을 빨리 오므립니다.|
|4.아기사슴   <br />![](/assets/images/edu/bioloid/prm_fawn_kr.jpg)|  [Download][BIO_PRM_Fawn_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Fawn_KR.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_Fawn_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/fo4kmsk7hk8p1oi/BIO_PRM_Fawn.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(7), 적외선 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[7] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기<br />`알고리즘`	적외선 센서 값에 따라 물체 인식<br />`동작 방법`<br />- 아무 변화가 없을 때, 아기 사슴은 앉아서 두리번거립니다.<br />- 얼굴에 물체를 대면, 그 물체를 계속 쫓아옵니다.|
|5.거북이    <br />![](/assets/images/edu/bioloid/prm_tuttle_kr.jpg)|  [Download][BIO_PRM_Turtle_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Turtle_KR.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_Turtle_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/fwco6p5wifs41vm/BIO_PRM_Turtle.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8), 적외선 센서(2), 거리 센서(1)<br />`다이나믹셀 설정 값`AX-12+ ID[1]~ ID[8] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 장애물 회피<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 거북이를 작동시킵니다.<br />- 거북이가 기어가다가 전방에 장애물을 만나면 피해가는 것을 확인합니다.|
|6.거웍(GerWalk)     <br />![](/assets/images/edu/bioloid/prm_gerwalk_kr.jpg)|  [Download][BIO_PRM_GerWalk_ASM.pdf] 조립서 <br />[Download][BIO_PRM_GerWalk_KR.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_GerWalk_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/wnv2kuu0y1lj0ia/BIO_PRM_GerWalk.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(7), 적외선 센서(2), 거리 센서(1)<br />`다이나믹셀 설정 값`AX-12+ ID[1]~ ID[7] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 반복<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 새의 보행 패턴 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 거웍을 작동시킵니다.<br />- 보행 중 전방 및 좌우에 장애물이 감지되면 피해갑니다.|
|7. 배틀드로이드      <br />![](/assets/images/edu/bioloid/prm_battledroid_kr.jpg)|  [Download][BIO_PRM_BattleDroid_ASM.pdf] 조립서 <br />[Download][BIO_PRM_BattleDroid_KR.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_BattleDroid_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/e39178yae2wo4wh/BIO_PRM_BattleDroid.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8), 적외선 센서(1)<br />`다이나믹셀 설정 값`AX-12+ ID[1]~ ID[8] : 관절모드<br />`RoboPlus 문법`	변수, 함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기<br />`알고리즘`	적외선 센서 값에 따라 다이나믹셀 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 배틀 드로이드를 작동시킵니다.<br />- 보행 중에 장애물을 만나면 양 팔로 공격합니다.<br/>배틀 드로이드가 넘어졌을 때 전, 후면을 구분하여 스스로 일어납니다.|
|8.4족로봇       <br />![](/assets/images/edu/bioloid/prm_quadrupedwalkingrobot_kr.jpg)|  [Download][BIO_PRM_QuadrupedWalkingRobot_ASM.pdf] 조립서 <br />[Download][BIO_PRM_QuadrupedWalkingRobot_KR.tsk.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_QuadrupedWalkingRobot_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/i15yq60h7en23n1/BIO_PRM_QuadrupedWalkingRobot.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8), 적외선 센서(1), 거리 센서(1)`다이나믹셀 설정 값`AX-12+ ID[1]~ ID[8] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 조건 대기<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 4족 보행 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 4족로봇을 작동시킵니다.<br />- 보행 중 전방에 장애물이 감지되면 피해갑니다.|
|9.보행머신        <br />![](/assets/images/edu/bioloid/prm_bipedwalkingrobot_kr.jpg)|  [Download][BIO_PRM_BipedWalkingRobot_ASM.pdf] 조립서 <br />[Download][BIO_PRM_BipedWalkingRobot_KR.tsk] 데모용 태스크 코드<br/>[Download][BIO_PRM_BipedWalkingRobot_KR.mtn] 데모용 모션 파일<br />[Download](https://www.dropbox.com/s/vvkgnrvj6kmbf3s/BIO_PRM_BipedWalkingRobot.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8), 적외선 센서(1), 거리 센서(1)`다이나믹셀 설정 값`AX-12+ ID[11]~ ID[18] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기, 조건 반복<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 2족 보행 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 보행머신을 작동시킵니다.<br />- 보행 중 전방 및 좌우에 장애물이 감지되면 피해갑니다.|
|10.로봇팔        <br />![](/assets/images/edu/bioloid/prm_robotarm_kr.jpg)|  [Download][BIO_PRM_RobotArm_ASM.pdf] 조립서 <br />[Download][BIO_PRM_RobotArm_KR.tsk.tsk] 데모용 태스크 코드<br />[Download](https://www.dropbox.com/s/pqxbqhq1mb4b0dk/BIO_PRM_RobotArm.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(8)<br/>`다이나믹셀 설정 값`AX-12+ ID[1]~ ID[8] : 관절모드<br />`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면, 조건 반복<br />`알고리즘`	다이나믹셀간 위치값 통신<br />`동작 방법`<br />- 제어 모터를 움직이면 반응모터가 따라 움직이는지 확인 합니다.|

### [고급 응용 로봇](#고급-응용-로봇)

각 로봇의 조립서는 인터넷이 연결되어 있어야 다운로드 받으실 수 있습니다.
{: .notice}

|Examples|Description|
|:---:|:---|
|1.공룡   <br />![](/assets/images/edu/bioloid/prm_dinosaur_kr.jpg)|  [Download][BIO_PRM_Dinosaur_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Dinosaur_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_Dinosaur_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/wf4vg932jsg63g6/BIO_PRM_Dinosaur.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(15), 적외선 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[15] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 복귀, 로드, 계산, 무조건 반복, 만약, 아니면, 조건 대기, 반복 끝내기<br />`알고리즘`	적외선 센서 값에 따라 장애물 감지 및 모션 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 공룡 로봇을 작동시킵니다.<br />- 공룡 로봇이 장애물을 공격하는 것을 확인합니다.<br/>장애물이 너무 크면 피해서 주행하는 것을 확인합니다.<br/>장애물이 없어지면 계속 걸어 갑니다.|
|2.강아지   <br />![](/assets/images/edu/bioloid/prm_puppy_kr.jpg)|  [Download][BIO_PRM_Puppy_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Puppy_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_Puppy_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/z844sld7e55xqjr/BIO_PRM_Puppy.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(17), 적외선 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[17] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 로드, 레이블, 점프, 만약, 아니면 만약, 조건 대기<br />`알고리즘`	적외선 센서와 타이머, 소리감지에 따라 4족 응용 모션 제어<br />`동작 방법`<br />- 보행 경로 상에 장애물을 설치해 놓고 강아지를 작동시킵니다.<br />- 소리가 나면 장애물을 피해가면서 보행하는 것을 확인합니다.<br/>입을 만져주면 재롱을 부립니다.<br/>(박수 소리 횟수에 따라 재롱이 달라집니다.)<br/>일정 시간이 지나도록 아무 변화가 없으면 앉아서 잠을 잡니다.|
|3.킹스파이더    <br />![](/assets/images/edu/bioloid/prm_kingspider_kr.jpg)|  [Download][BIO_PRM_KingSpider_ASM.pdf] 조립서 <br />[Download][BIO_PRM_KingSpider_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_KingSpider_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/cqiku4w55jfsu8w/BIO_PRM_KingSpider.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(18), 적외선 센서(2)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[18] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 로드, 레이블, 점프, 만약, 조건 대기<br />`알고리즘`	적외선 센서와 타이머에 따라 6족 응용 모션 제어<br />`동작 방법`<br />- 보행 중 장애물을 만나면 피해서 돌아다닙니다.<br />- 전방에 가까운 곳에서 물체가 감지되면 공격합니다.<br/>-위쪽에서 물체가 접근하면 몸을 움츠립니다.<br/>-일정 시간 동안 아무 변화가 없으면 잠을 잡니다.|
|4.전갈     <br />![](/assets/images/edu/bioloid/prm_scorpion_kr.jpg)|  [Download][BIO_PRM_Scorpion_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Scorpion_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_Scorpion_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/xi794k7suepm72q/BIO_PRM_Scorpion.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(18), 거리 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[18] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 로드, 레이블, 점프, 만약, 아니면 만약, 횟수만큼 반복, 조건 대기<br />`알고리즘`	소리 감지 횟수와 거리 센서 값에 따라 6족 응용 모션 제어<br />`동작 방법`<br />- 시작하면 잠을 잡니다.<br />- 박수를 치면 깨어납니다.<br/>-센서에 손을 가까이 가져가면 꼬리로 위협합니다.<br/>-센서에 손을 더 가까이 가져가면 공격합니다.|
|5.도마뱀   <br />![](/assets/images/edu/bioloid/premium_lizard.jpg)|  [Download][BIO_PRM_Lizard_ASM.pdf] 조립서 <br />[Download][BIO_PRM_Lizard_KR.tsk] 데모용 태스크 코드<br />[Download][BIO_PRM_Lizard_KR.mtn] 데모용 모션 파일<br/>[Download](https://www.dropbox.com/s/za3th47u4gyei4d/BIO_PRM_Lizard.wmv?dl=0) 동영상<br />`사용된 장치` CM-510/CM-530(1), AX-12+(14), 적외선 센서(1), 거리 센서(1)<br />`다이나믹셀 설정 값` AX-12+ ID[1]~ ID[14] : 관절모드<Br/>`RoboPlus 문법`	함수, 호출, 로드, 계산, 무조건 반복, 만약, 아니면 만약, 아니면, 조건 대기<br />`알고리즘`	적외선 센서와 거리 센서 값에 따라 4족 장애물 회피 모션 제어<br />`동작 방법`<br />- 시작하면 기어가다가 전방에 장애물을 만나면 잠시 멈추었다가  피해갑니다.<br />- 꼬리를 잡히면 도망가려 합니다.|


# [참고자료](#참고자료)

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm510_530.md %}

## [다이나믹셀 관리하기](#다이나믹셀-관리하기)

{% include kr/edu/bioloid/dynamixel_management.md %}

{% include kr/parts/communication/zigbee_control.md %}

## [여러 대의 로봇 조종하기](#여러-대의-로봇-조종하기)

{% include kr/edu/bioloid/control_multirobot.md %}

## [로봇 꾸미기](#로봇-꾸미기)

로보티즈 프리미엄에 새롭게 제공되는 반투명 스킨을 이용하여 나만의 휴머노이드를 꾸밀 수 있습니다.

### 반투명 전용 스킨 꾸미기
#### 전용 스킨 도색 샘플
가슴 부분 전용 스킨을 도색하여 꾸민 샘플 사진들 입니다.


|![](/assets/images/edu/bioloid/pre_skin_1_kr.jpg)|![](/assets/images/edu/bioloid/pre_skin_2_kr.jpg)|
|:---:|
|![](/assets/images/edu/bioloid/pre_skin_3_kr.jpg)|![](/assets/images/edu/bioloid/pre_skin_4_kr.jpg)|
|![](/assets/images/edu/bioloid/pre_skin_5_kr.jpg)|![](/assets/images/edu/bioloid/pre_skin_6_kr.jpg)|

#### 로봇 머리 부분 스킨 샘플
로봇 머리 부분을 도색하여 꾸민 샘플 사진 입니다.

![](/assets/images/edu/bioloid/pre_skin_h1_kr.jpg)

![](/assets/images/edu/bioloid/pre_skin_h2_kr.jpg)

#### 스킨 장착한 로봇 샘플
사용자가 직접 꾸민 스킨 로봇들의 샘플 사진들 입니다.

|![](/assets/images/edu/bioloid/pre_skinrobot6_kr.jpg)|![](/assets/images/edu/bioloid/pre_skinrobot2_kr.jpg)|![](/assets/images/edu/bioloid/pre_skinrobot3_kr.jpg)|
|:---:||:---:||:---:|
|![](/assets/images/edu/bioloid/pre_skinrobot4_kr.jpg)|![](/assets/images/edu/bioloid/pre_skinrobot5_kr.jpg)|![](/assets/images/edu/bioloid/pre_skinrobot1_kr.jpg)|

## [센서 추가하기](#센서-추가하기)

로보티즈 프리미엄 혹은 로보티즈 GP 에서는 CM-530의 센서연결부를 통해 [적외선 센서]와 [접촉 센서]를 추가로 달 수 있습니다.
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

## [사용자 센서 제작](#사용자-센서-제작)

CM-510, CM-530에서는 ADC포트와 OUT포트를 이용하여 간단히 제어가 가능한 사용자 센서를 제작할 수 있습니다.

**주의**: 만약 잘못된 회로를 구성하여 CM-510의 외부 포트에 사용자 장치를 연결하면 회로가 손상될 수 있으므로, 회로에 대한 지식을 먼저 습득하시기 바랍니다.
{: .notice--warning}

### 핀 구성 정보

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

참고 : 외부센서 사용시 5핀케이블을 사용해 주세요. 5핀 케이블은 로보티즈 쇼핑몰에서 구매하실 수 있습니다.
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
 
- Tilt센서의 왼쪽 핀은 5V VCC 입력핀, 가운데 핀은 아날로그 신호 출력핀, 오른쪽은 그라운드핀입니다. CM-530의 외부 포트에 서로 매칭되는 핀을 연결하여 주면 바로 사용할 수 있습니다. CM-530의 외부 포트 핀 정보를 참고하여 다음과 같이 연결하면 됩니다.

  ![](/assets/images/edu/bioloid/mcs_cm-510_tilt_kr.png)
 
- 다음 예제와 같이 센서의 아날로그 출력값을 읽어와 로봇의 동작에 응용할 수 있습니다.

  ![](/assets/images/edu/bioloid/mcs_userdevice_adc_read_kr.png)

## [그리퍼 장착](#그리퍼-장착)
- 휴머노이드 로봇을 사용자의 용도에 맞게 그리퍼를 달아서 사용할 수 있습니다.
- 그리퍼는 로봇이 물건을 집거나 던지거나 할 때 유용하게 사용할 수 있습니다.

### 그리퍼 재료
- 로보티즈 프리미엄을 이용하여 휴머노이드  B타입과 C타입은 AX-12+가 2개의 여유가 생깁니다.
- 이것을 이용하여 그리퍼를 제작 할 수 있습니다.
- 그리퍼를 만들 수 있는 주요 프레임과 AX-12+의 사진입니다.

  ![](/assets/images/edu/bioloid/gripper_materials_kr.png)

### 그리퍼 만들기

![](/assets/images/edu/bioloid/gripper1_kr.jpg)

> 프레임과 AX-12+를 이용하여 그리퍼를 만드는 사진입니다. 두손에 장착 할 때에는 두 개를 만드세요.

### 그리퍼 추가

그리퍼 로봇을 만들어 자신이 원하는 동작을 제어 할 수 있습니다.
그리퍼 로봇을 제어하는 방법에 대한 자세한 내용은 그리퍼 제어를 통해 확인 할 수 있습니다.
B 타입 로봇에 그리퍼를 장착한 모습입니다.
그리퍼에 사용된 AX-12+의 ID는 오른쪽 9번, 왼쪽 10번 입니다.

![](/assets/images/edu/bioloid/gripper_KR.png)


[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[AX-12A]: /docs/kr/dxl/ax/ax-12a/
[거리 센서]: /docs/kr/parts/sensor/dms-80/
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[자이로 센서]: /docs/kr/parts/sensor/gs-12/
[USB2Dynamixel]: /docs/kr/parts/interface/usb2dynamixel/
[기본 프로그램]: #기본-프로그램
[BT-410 세트]: /docs/kr/parts/communication/bt-410/
[ZIG-110 세트]: /docs/kr/parts/communication/zig-110/
[로보티즈 쇼핑몰]: http://www.robotis.com/shop/
[제어기]: /docs/kr/parts/controller/controller_compatibility/
[RC-100]: /docs/kr/parts/communication/rc-100/
[태스크 코드 다운로드 방법]: /docs/kr/faq/download_task_code/
[모션 파일 다운로드 방법]: /docs/kr/software/rplus1/motion/#download-motion
[보행 머신]: #보행-머신
[콜백(Callback) 함수]: /docs/kr/software/rplus1/task/programming_01/#콜백-함수
[관절 오프셋]: /docs/kr/software/rplus1/task/programming_02/#관절-오프셋

[BIO_PRM_CrossingGate_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_CrossingGate_ASM.pdf
[BIO_PRM_CrossingGate_KR.tsk]: http://www.robotis.com/service/download.php?no=1290
[BIO_PRM_Universalgauge_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Universalgauge_ASM.pdf
[BIO_PRM_Universalgauge_KR.tsk]: http://www.robotis.com/service/download.php?no=1332
[BIO_PRM_CrocodileMouth_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_CrocodileMouth_ASM.pdf
[BIO_PRM_CrocodileMouth_KR.tsk]: http://www.robotis.com/service/download.php?no=1289
[BIO_PRM_Pantilt_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Pantilt_ASM.pdf
[BIO_PRM_Pantilt_KR.tsk]: http://www.robotis.com/service/download.php?no=1315
[BIO_PRM_Parkinggate_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Parkinggate_ASM.pdf
[BIO_PRM_Parkinggate_KR.tsk]: http://www.robotis.com/service/download.php?no=1316
[BIO_PRM_Smartcar_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Smartcar_ASM.pdf
[BIO_PRM_Smartcar_KR.tsk]: http://www.robotis.com/service/download.php?no=1327
[BIO_PRM_ClappingCrab_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_ClappingCrab_ASM.pdf
[BIO_PRM_ClappingCrab_KR.tsk]: http://www.robotis.com/service/download.php?no=1288
[BIO_PRM_AttackingDuck_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_AttackingDuck_ASM.pdf
[BIO_PRM_AttackingDuck_KR.tsk]: http://www.robotis.com/service/download.php?no=1249
[BIO_PRM_DistanceLevelMeter_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_DistanceLevelMeter_ASM.pdf
[BIO_PRM_DistanceLevelMeter_KR.tsk]: http://www.robotis.com/service/download.php?no=1293
[BIO_PRM_Linetracer_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Linetracer_ASM.pdf
[BIO_PRM_Linetracer_KR.tsk]: http://www.robotis.com/service/download.php?no=1312
[BIO_PRM_WalkingDroid_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_WalkingDroid_ASM.pdf
[BIO_PRM_WalkingDroid_KR.tsk]: http://www.robotis.com/service/download.php?no=1336
[BIO_PRM_WalkingDroid_KR.mtn]: http://www.robotis.com/service/download.php?no=1335
[BIO_PRM_ProbingRobot_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_ProbingRobot_ASM.pdf
[BIO_PRM_ProbingRobot_KR.tsk]: http://www.robotis.com/service/download.php?no=1317
[BIO_PRM_Excavator_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Excavator_ASM.pdf
[BIO_PRM_Excavator_KR.tsk]: http://www.robotis.com/service/download.php?no=1295
[BIO_PRM_Excavator_KR.mtn]: http://www.robotis.com/service/download.php?no=1294
[BIO_PRM_RobotFlower_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_RobotFlower_ASM.pdf
[BIO_PRM_RobotFlower_KR.tsk]: http://www.robotis.com/service/download.php?no=1324
[BIO_PRM_RobotFlower_KR.mtn]: http://www.robotis.com/service/download.php?no=1323
[BIO_PRM_Fawn_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Fawn_ASM.pdf
[BIO_PRM_Fawn_KR.tsk]: http://www.robotis.com/service/download.php?no=1297
[BIO_PRM_Fawn_KR.mtn]: http://www.robotis.com/service/download.php?no=1296
[BIO_PRM_Turtle_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Turtle_ASM.pdf
[BIO_PRM_Turtle_KR.tsk]: http://www.robotis.com/service/download.php?no=1331
[BIO_PRM_Turtle_KR.mtn]: http://www.robotis.com/service/download.php?no=1330
[BIO_PRM_GerWalk_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_GerWalk_ASM.pdf
[BIO_PRM_GerWalk_KR.tsk]: http://www.robotis.com/service/download.php?no=1301
[BIO_PRM_GerWalk_KR.mtn]: http://www.robotis.com/service/download.php?no=1300
[BIO_PRM_BattleDroid_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_BattleDroid_ASM.pdf
[BIO_PRM_BattleDroid_KR.tsk]: http://www.robotis.com/service/download.php?no=1251
[BIO_PRM_BattleDroid_KR.mtn]: http://www.robotis.com/service/download.php?no=1250
[BIO_PRM_QuadrupedWalkingRobot_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_QuadrupedWalkingRobot_ASM.pdf
[BIO_PRM_QuadrupedWalkingRobot_KR.tsk]: http://www.robotis.com/service/download.php?no=1321
[BIO_PRM_QuadrupedWalkingRobot_KR.mtn]: http://www.robotis.com/service/download.php?no=1320
[BIO_PRM_BipedWalkingRobot_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_BipedWalkingRobot_ASM.pdf
[BIO_PRM_BipedWalkingRobot_KR.tsk]: http://www.robotis.com/service/download.php?no=1253
[BIO_PRM_BipedWalkingRobot_KR.mtn]: http://www.robotis.com/service/download.php?no=1252
[BIO_PRM_RobotArm_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_RobotArm_ASM.pdf
[BIO_PRM_RobotArm_KR.tsk]: http://www.robotis.com/service/download.php?no=1322
[BIO_PRM_Dinosaur_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Dinosaur_ASM.pdf
[BIO_PRM_Dinosaur_KR.tsk]: http://www.robotis.com/service/download.php?no=1292
[BIO_PRM_Dinosaur_KR.mtn]: http://www.robotis.com/service/download.php?no=1291
[BIO_PRM_Puppy_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Puppy_ASM.pdf
[BIO_PRM_Puppy_KR.tsk]: http://www.robotis.com/service/download.php?no=1319
[BIO_PRM_Puppy_KR.mtn]: http://www.robotis.com/service/download.php?no=1318
[BIO_PRM_KingSpider_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_KingSpider_ASM.pdf
[BIO_PRM_KingSpider_KR.tsk]: http://www.robotis.com/service/download.php?no=1311
[BIO_PRM_KingSpider_KR.mtn]: http://www.robotis.com/service/download.php?no=1310
[BIO_PRM_Scorpion_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Scorpion_ASM.pdf
[BIO_PRM_Scorpion_KR.tsk]: http://www.robotis.com/service/download.php?no=1326
[BIO_PRM_Scorpion_KR.mtn]: http://www.robotis.com/service/download.php?no=1325
[BIO_PRM_Lizard_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Lizard_ASM.pdf
[BIO_PRM_Lizard_KR.tsk]: http://www.robotis.com/service/download.php?no=1314
[BIO_PRM_Lizard_KR.mtn]: http://www.robotis.com/service/download.php?no=1313
[BIO_PRM_WalkingMachineExam_KR.mtn]: http://www.robotis.com/service/download.php?no=1337
[BIO_PRM_WalkingMachineExam_KR.tsk]: http://www.robotis.com/service/download.php?no=1338
[BIO_PRM_GyroSensorExam_KR.tsk]: http://www.robotis.com/service/download.php?no=1303
[BIO_PRM_UserMotionExam_KR.tsk]: http://www.robotis.com/service/download.php?no=1334
[BIO_PRM_UserMotionExam_KR.mtn]: http://www.robotis.com/service/download.php?no=1333
[BIO_PRM_GripperExam_KR.tsk]: http://www.robotis.com/service/download.php?no=1302
[BIO_PRM_FightTypeA_KR.tsk]: http://www.robotis.com/service/download.php?no=1299
[BIO_PRM_FightTypeA_KR.mtn]: http://www.robotis.com/service/download.php?no=1298
[BIO_PRM_Humanoid_ASM.pdf]: http://www.robotis.com/download/doc/BIO_PRM_Humanoid_ASM.pdf
[BIO_PRM_HumanoidTypeA_KR.tsk]: http://www.robotis.com/service/download.php?no=1305
[BIO_PRM_HumanoidTypeA_KR.mtn]: http://www.robotis.com/service/download.php?no=1304
[BIO_PRM_HumanoidTypeB_KR.tsk]: http://www.robotis.com/service/download.php?no=1307
[BIO_PRM_HumanoidTypeB_KR.mtn]: http://www.robotis.com/service/download.php?no=1306
[BIO_PRM_HumanoidTypeC_KR.tsk]: http://www.robotis.com/service/download.php?no=1309
[BIO_PRM_HumanoidTypeC_KR.mtn]: http://www.robotis.com/service/download.php?no=1308
[BIO_PRM_SoccerTypeA_KR.tsk]: http://www.robotis.com/service/download.php?no=1329
[BIO_PRM_SoccerTypeA_KR.mtn]: http://www.robotis.com/service/download.php?no=1328
[스텝 멈춤/실행 시간의 자세한 정보는 여기를 참조하세요.]: http://emanual.robotis.com/docs/kr/software/rplus1/motion/#스텝-멈춤-시간
[반복 횟수, 재생 배속]: http://emanual.robotis.com/docs/kr/software/rplus1/motion/#페이지-반복속도-설정
[자이로 센서를 이용한 보정]: #자이로-센서를-이용한-보정
[사용자 모션 추가(모션 만들기)]: #사용자-모션-추가모션-만들기
[사용자 모션 추가(태스크 코드)]: #사용자-모션-추가태스크-코드
["모션 페이지" 파라미터에 대한 자세한 설명은 여기를 참고하세요.]: http://emanual.robotis.com/docs/kr/software/rplus1/task/programming_02/#모션-파라미터
[그리퍼 장착]: #그리퍼-장착
[다운로드 방법 참조]: #태스크-코드-다운로드-방법
[RC-100 채널 바꾸는 방법 링크가기]: http://emanual.robotis.com/docs/kr/parts/communication/rc-100/#적외선-통신채널-설정-방법
[Zig2Serial 채널 바꾸는 방법 링크가기]: http://emanual.robotis.com/docs/kr/parts/communication/zig2serial/#broadcast-채널-선택
[접촉 센서]: /docs/kr/parts/sensor/ts-10/
