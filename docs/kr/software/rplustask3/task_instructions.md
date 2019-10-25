---
layout: archive
lang: kr
ref: task_instructions
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplustask3/task_instructions/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 3
---

<div style="counter-reset: h1 3"></div>

# [태스크 명령어](#태스크-명령어)

## [시작과 끝](#시작과-끝)

프로그램의 기본적인 시작과 끝, 명령어의 유효 구간을 설정하는 명령어입니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3_kr/task3_026.png)

### [프로그램 시작](#프로그램-시작)

- 프로그램 시작 명령은 줄 번호와 상관 없이 실행됩니다.
- 한 프로그램에 두 개 이상의 프로그램 시작이 있을 수 없습니다.
- 명령 묶음 구간이 반드시 필요합니다.
- 프로그램 시작 명령 구간의 끝을 만나면 프로그램이 종료됩니다.
- C언어의 main()함수와 같은 기능을 합니다.
- 아래는 내부가 비어있는 프로그램 시작 함수입니다.

![](/assets/images/sw/rplus_task3_kr/task3_027.png)

### [프로그램 끝](#프로그램-끝)

- 프로그램을 끝내고 싶은 지점을 수동으로 지정합니다.
- 사용하지 않을 경우 프로그램 시작의 구간을 모두 수행한 후 자연 종료 됩니다.
- 아래는 프로그램 시작의 구간을 모두 수행하여 “자연 종료”되는 경우 입니다.

![](/assets/images/sw/rplus_task3_kr/task3_028.png)

- 아래는 프로그램 끝을 만나 “강제 종료”되는 경우입니다.

![](/assets/images/sw/rplus_task3_kr/task3_029.png)

### [구간 시작/구간 끝](#구간-시작구간-끝)

- 구간이란 여러 개의 명령문을 묶어놓은 것을 의미합니다.
- 구간의 시작과 끝은 항상 짝이 맞아야 합니다.
- 만약 실행문이 한줄일 경우에는 구간기호가 생략될 수 있습니다.
- C언어의 ‘{‘, ‘}’와 같은 기능을 합니다.
- 아래는 “프로그램 시작”, “무조건 반복”의 구간을 나타낸 그림입니다.

![](/assets/images/sw/rplus_task3_kr/task3_030.png)

- 아래는 “프로그램 시작”, “만약”의 구간을 나타낸 그림입니다.

![](/assets/images/sw/rplus_task3_kr/task3_031.png)

- 아래 그림과 같이 실행문이 한줄일 경우에는 구간기호가 생략될 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/task3_032.png)

### [주석](#주석)

- 프로그램의 설명이 필요한 경우 해당 줄에 주석(메모)을 추가할 수 있습니다.
- "//" 기호가 삽입되면 더블 클릭하여 내용을 수정할 수 있습니다.
- 주석을 작성하던 도중에 “취소”(혹은 ESC)버튼을 클릭하면 입력 전의 내용으로 복구됩니다.
- 아래는 코드에 주석을 추가해 해석을 돕는 예제입니다.

![](/assets/images/sw/rplus_task3_kr/task3_033.png)

## [실행문](#실행문)

장치에 명령을 내리거나 수학적인 계산을 수행하는 명령어입니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3_kr/task3_034.png)

### [계산](#계산)

- 두 값을 연산하여 하나의 결과를 내는 명령어입니다. (C = A + B)

![](/assets/images/sw/rplus_task3_kr/task3_035.png)

- 덧셈( + ), 뺄셈( - ), 곱셈( * ), 나눗셈( / ), MOD(%), AND( & ), OR( \| )을 선택할 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/task3_036.png)

  - 덧셈( + ) : 두 값을 더합니다.
  - 뺄셈( - ) : 앞에서 뒤의 값을 뺍니다.
  - 곱셈( * ) : 두 값을 곱합니다.
  - 나눗셈( / ) : 앞에서 뒤의 값을 나눈 몫을 나타냅니다. (나머지는 사라지고 몫만 결과로 나옵니다.)
  - MOD( % ) : 앞에서 뒤에 값을 나눈 나머지를 나타냅니다. (몫은 사라지고 나머지만 결과로 나옵니다.)
  - AND( & ) : 두 비트를 AND연산 합니다.
  - OR( \| ) : 두 비트를 OR연산 합니다.

- 아래는 계산 명령어를 사용한 예제입니다.

![](/assets/images/sw/rplus_task3_kr/task3_037.png)

### [로드](#로드)

- 하나의 값을 다른 하나로 대입하는 명령어입니다.

![](/assets/images/sw/rplus_task3_kr/task3_038.png)

- 변수의 값을 읽거나 쓸 때 사용합니다.
- 아래는 “속도”라는 변수에 값을 쓰고, 변수 값을 읽어 감속모터에 설정하는 예제 입니다.

![](/assets/images/sw/rplus_task3_kr/task3_039.png)

- 장치의 값을 읽거나 쓸 때 사용합니다.
- 아래는 포트2번에 연결된 감속모터에 속도 값을 설정하는 예제입니다.

![](/assets/images/sw/rplus_task3_kr/task3_040.png)

### [다중 수식](#다중-수식)

- 복잡한 계산식을 실행할 때 사용하는 명령어입니다.
- 수식 내부에서는 변수 또는 상수만 사용이 가능하며, 아래 그림과 같이 그 밖의 값은 변수에 대입하여 사용해야 합니다.


![](/assets/images/sw/rplus_task3_kr/multiple_expression_1.png)


- 다중 수식을 사용하게 되면 제어기 내부에 임시 변수가 생성되기 때문에 태스크에서 사용된 변수와 문법 검사 결과의 변수 갯수가 다를 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/multiple_expression_2.png)

- 잘못된 수식을 입력하면 오류창이 나타납니다.

![](/assets/images/sw/rplus_task3_kr/multiple_expression_3.png)



### [레이블/점프](#레이블점프)

- 프로그램의 분기를 위해 사용되는 명령어입니다.
- 레이블은 분기할 위치를 지정합니다.
- 점프를 통해 미리 지정한 레이블부터 실행할 수 있습니다.
- C언어의 label / goto문과 같은 개념입니다.
- 아래는 점프할 대상에 따라 프로그램이 분기되는 예제입니다.
- 왼쪽 그림은 “작동모드1”로 점프하여 “작동모드2”에 해당하는 코드만 실행됩니다.
- 오른쪽 그림은 “작동모드2”로 점프하여 “작동모드2”에 해당하는 코드만 실행됩니다.

![](/assets/images/sw/rplus_task3_kr/task3_041.png)

- 레이블과 점프는 반드시 하나의 함수 구간 내에 존재해야 합니다.

![](/assets/images/sw/rplus_task3_kr/task3_042.png)


## [조건문](#조건문)

조건절의 결과가 참이냐 거짓이냐에 따라 프로그램의 흐름을 분기하는 명령어입니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3_kr/task3_043.png)

### [조건절이란?](#조건절이란)

- 조건절이란 연산의 결과가 반드시 참 또는 거짓을 내는 수식입니다.
- 괄호( ) 안에서 사용할 수 있는 비교 연산자는 다음과 같습니다.

| 비교연산자 |            설명             |
|:----------:|:---------------------------:|
|     ==     |     좌변과 우변이 같다      |
|     !=     |    좌변과 우변이 다르다     |
|     \>     |    좌변이 우변보다 크다     |
|    \>=     | 좌변이 우변보다 크거나 같다 |
|     <      |    좌변이 우변보다 작다     |
|     <=     | 좌변이 우변보다 작거나 같다 |

- 여러 개의 조건을 만족해야 하는 경우 아래 그림과 같이 복합 조건절을 사용할 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/task3_044.png)

- 복합 조건절 사용시 사용할 수 있는 논리 연산자는 다음과 같습니다.

| 논리연산자 |                            설명                             |
|:----------:|:-----------------------------------------------------------:|
|    then    | 아무 조건절도 연결하지 않습니다. 하나의 조건절만 사용합니다 |
|     &&     |                 두 조건절을 AND연산 합니다                  |
|     \      |    |                           두 조건절을 OR연산 합니다    |

![](/assets/images/sw/rplus_task3_kr/task3_045.png)

### [만약](#만약)

- 조건절의 내용이 참이면 해당 구문을 실행합니다.
- C언어의 if문과 같은 개념입니다.
- 아래는 만약을 사용하여 “변수 값이 100과 같으면?”을 판단하는 예제입니다.

![](/assets/images/sw/rplus_task3_kr/task3_046.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/task3_047.png)

### [아니면 만약](#아니면-만약)

- “만약”에 이어서 또 다른 조건을 검사할 때 사용합니다.
- 반드시 처음 조건으로 "만약" 구문이 존재해야 합니다.
- C언어의 else if와 같은 개념입니다.
- 아래는 만약과 아니면 만약을 사용하여 “변수 값이 100과 같으면?”과 “변수 값이 50과 같으면?”을 모두 판단하는 예제입니다.

![](/assets/images/sw/rplus_task3_kr/task3_048.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

![](/assets/images/sw/rplus_task3_kr/task3_049.png)

### [아니면](#아니면)

- “만약”과 “아니면 만약”의 조건 어디에도 해당되지 않을 경우 실행합니다.
- 반드시 처음 조건으로 만약 구문이 존재해야 합니다.
- C언어의 else와 같은 개념입니다.
- 아래는 만약과 아니면 을 사용하여 “변수 값이 100과 같으면?”과 “변수 값이 100과 다르면”을 모두 판단하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_050.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_051.png)

## [반복문](#반복문)

프로그램에서 여러 번 반복적인 수행이 필요한 경우 사용하는 명령어입니다. 반복 구간과 반복 조건을 설정하여 다양한 방법으로 반복을 설정할 수 있습니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3_kr/task3_052.png)

### [무조건 반복](#무조건-반복)

- 무조건 반복의 구간 시작과 끝 사이를 계속해서 반복 실행합니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- C언어의 while(1)과 같은 개념입니다.
- 아래는 무조건 반복을 사용하여 화면에 숫자 100을 출력하는 예제입니다. 무조건 반복의 구간 내에서 화면 출력을 진행하기 때문에 멈추지 않고 실행됩니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_053.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_054.png)

### [조건 반복](#조건-반복)

- 조건절이 만족하는 동안 구간 시작과 끝 사이를 반복 실행합니다.
- 조건절에는 조건문과 마찬가지로 복합 조건절을 사용할 수 있습니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- C언어의 while(조건절)과 같은 개념입니다.
- 아래는 조건 반복을 활용하여 1.024초 동안만 화면에 숫자 100을 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_055.png)

- 아래는 조건 반복과 변수를 활용하여 10회 동안만 화면에 숫자 100을 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_056.png)

### [횟수 반복](#횟수-반복)

- 구간 시작과 끝 사이를 정해진 횟수만큼 반복 실행합니다.
- 구간의 끝에 도달할 때마다 설정한 변수의 값이 1씩 증가됩니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- 반복 횟수 수식 : 반복 횟수 = 끝 값 – 시작 값 + 1
- C언어의 for와 같은 개념입니다.
- 아래는 횟수 반복을 사용하여 10번동안 화면에 숫자를 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_057.png)

- 아래는 횟수 반복에 사용한 변수를 실행구간 내부에서 사용한 예제입니다. 반복횟수가 1부터 10까지 증가함에 따라 화면 출력 값이 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000으로 변경됩니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_058.png)

### [조건 대기](#조건-대기)

- 조건절이 만족하는 동안 프로그램 수행을 멈춥니다.
- C언어의 내부가 비어있는 while(조건절)과 같은 개념입니다.
- 아래는 조건 대기와 타이머를 사용하여 1.024초 동안 대기하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_059.png)

- 아래는 조건 대기를 사용하여 재생되는 모션이 끝날 때까지 기다리는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_060.png)

- 아래는 조건 대기를 사용하여 재생되는 멜로디가 끝날 때까지 기다리는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_061.png)

### [반복 끝내기](#반복-끝내기)

- 반복문이 수행되는 도중에 반복을 멈추고 싶을 때 사용합니다.
- 무조건 반복, 조건 반복, 횟수 반복의 구간 내에서만 사용할 수 있습니다.
- C언어의 break와 같은 개념입니다.
- 아래는 무조건 반복에서 무선데이터가 도착하면 구문을 빠져 나오는 예제입니다. 무조건 반복에서 빠져나오면 바로 다음 구문이 실행됩니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_062.png)

## [함수(서브루틴)](#함수서브루틴)

동일한 코드가 반복되거나 특정 코드 영역을 역할 단위로 구분하여 표기하고 싶을 경우, 그 내용을 하나의 덩어리로 묶을 수 있으며 이를 함수라고 부릅니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3_kr/task3_063.png)

### [함수/호출](#함수호출)

- 동일한 코드가 중복 사용되거나 특정 코드 영역을 역할 단위로 구분하여 표기하고 싶을 경우, 그 내용을 “함수”로 만들어 사용합니다.
- 적절한 함수 사용은 코드를 간결하고 읽기 편하게 만들어줍니다.
- 작성한 함수는 필요할 시에 “호출”을 통해 사용할 수 있습니다.
- 함수는 반드시 메인 프로그램 루틴 밖에 작성하여야 합니다.
- 태스크에서 함수는 입력 인자와 출력 인자를 설정할 수 없습니다.
- C언어의 함수와 같은 개념입니다.
- 아래는 LED를 깜박이는 기능을 함수로 만들어 사용한 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_064.png)

- 아래는 함수를 사용하기 위해 호출할 함수를 선택하는 과정입니다

  ![](/assets/images/sw/rplus_task3_kr/task3_065.png)

- 함수 내에서 자기 자신을 호출할 수 없습니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_066.png)

### [복귀](#복귀)

- 함수가 실행되는 도중에 실행하던 함수를 빠져나가는 기능을 합니다.
- 일반 함수와 콜백 함수의 내부에서만 사용할 수 있습니다.
- C언어의 return과 같은 개념입니다.
- 아래는 “복귀”를 사용하지 않고 함수를 끝까지 실행한 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_067.png)

- 아래는 “복귀”를 사용하여 함수가 실행되는 도중에 복귀한 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_068.png)

### [콜백](#콜백)

- 메인 프로그램 루틴과 독립적으로 동작하는 함수로 일정한 시간마다 스스로 실행됩니다.
- 콜백은 반드시 메인 프로그램 루틴 밖에 작성하여야 합니다.
- 과도한 실행 시간을 요하는 코드를 넣을 수 없어, 콜백 내에서는 반복문 사용 / 변수 사용량 / 파라미터 호출 횟수 / 코드 용량의 제한이 있습니다.
- 콜백 함수 사용시 다음과 같은 제한사항을 지켜야 합니다.
  - 반복문, 레이블, 점프, 호출을 사용할 수 없습니다.
  - 외부 장치와의 통신 횟수가 최대 2회로 제약이 있습니다.
  - 콜백 함수의 작성에 있어 코드크기가 512bytes를 넘을 수 없습니다.

- 아래는 콜백 함수를 사용하여 받은 무선 데이터를 “수신데이터” 변수에 저장하는 예제입니다.

  ![](/assets/images/sw/rplus_task3_kr/task3_069.png)


[제어기 호환표]: /docs/kr/parts/controller/controller_compatibility/
[접촉 센서 부품 정보]: /docs/kr/parts/sensor/ts-10/
[적외선 센서 부품 정보]: /docs/kr/parts/sensor/irss-10/
[컬러 센서 부품 정보]: /docs/kr/parts/sensor/cs-10/
[자석 센서 부품 정보]: /docs/kr/parts/sensor/mgss-10/
[온도 센서 부품 정보]: /docs/kr/parts/sensor/tps-10/
[절대 거리 센서 부품 정보]: /docs/kr/parts/sensor/dms-80/
[조도 센서 부품 정보]: /docs/kr/parts/sensor/cds-10/
[온습도 센서 부품 정보]: /docs/kr/parts/sensor/tms-10/
[동작감지 센서 부품 정보]: /docs/kr/parts/sensor/pir-10/
[사용자 센서 제작]: /docs/kr/edu/bioloid/premium/#사용자-센서-제작
[CM-50]: /docs/kr/parts/controller/cm-100/
[CM-100A]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCM 7.0]: /docs/kr/parts/controller/opencm7/
[R+ Smart 컨트롤 테이블]: /docs/kr/software/mobile_app/rplussmart/#r-smart-control-table
[ROBOTIS DREAM]: /docs/kr/edu/dream/dream1-1/
[ROBOTIS SMART]: /docs/kr/edu/smart/smart1-1/
[ROBOTIS STEM]: /docs/kr/edu/bioloid/stem/
[ROBOTIS PREMIUM]: /docs/kr/edu/bioloid/premium/
[ROBOTIS GP]: /docs/kr/edu/bioloid/gp/
[ROBOTIS MINI]: /docs/kr/edu/mini/
[OpenCM 9.04]: /docs/kr/parts/controller/opencm904/
[BT-110]: /docs/kr/parts/communication/bt-110/
[BT-210]: /docs/kr/parts/communication/bt-210/
[BT-410]: /docs/kr/parts/communication/bt-410/
[제어기펌웨어 업데이트]: /docs/kr/software/rplus2/manager/getting_started/#펌웨어-업데이트
