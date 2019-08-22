---
layout: archive
lang: en
ref: task_programming
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/task_programming/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 2
---

<div style="counter-reset: h1 2"></div>

<!--[dummy Header 1]>
  <h1 id="rplustask3"><a href="#rplustask3">rplustask3</a></h1>
<![end dummy Header 1]-->


# [Task Programming](#task-programming)

## [Create New File](#create-new-file)

1. Move to Home Tab (Home Tab is the default screen at start up).
2. Click the `New` button.  
  ![](/assets/images/sw/rplus_task3/task3_008.png)

3. Choose the controller and Protocol Version.
4. Click `Confirm` button to create a new Task file.  
  ![](/assets/images/sw/rplus_task3/task3_009.png)

## [Open Task File](#open-task-file)

1. Move to Home Tab (Home Tab is the default screen at start up).
2. Click the `Example` button.
3. Select the product and example.
4. Click `Confirm` button to open the Task file.  
  ![](/assets/images/sw/rplus_task3/task3_010.png)

## [Insert/Change Instruction](#insertchange-instruction)

1. Click the `Instructions` tab on the right (or double-click the location you wish to insert the instruction).
2. Select the instruction.
3. Double click the item or
4. Drag and drop the item into the code.  
  ![](/assets/images/sw/rplus_task3/task3_011.png)

## [Select Multiple Lines](#select-multiple-lines)

1. Multiple lines can be selected by dragging the line numbers on the left.  
  ![](/assets/images/sw/rplus_task3/task3_012.png)

2. Click on the source code to cancel the selection.  
  ![](/assets/images/sw/rplus_task3/task3_013.png)

## [Insert/Delete Line](#insertdelete-line)

1. Select the code where to insert (or delete) the line. Click the right mouse button to show the option menu.
2. Click `Insert Line` to insert a new line above the selected line (keyboard shortcut : `Space`)
3. Click `Delete Line` to delete the selected line (keyboard shortcut : `Delete`)
4. Click `Erase Line` to erase the code and keep the line (keyboard shortcut : `Backspace`)  
  ![](/assets/images/sw/rplus_task3/task3_014.png)

## [Enable/Disable Line](#enabledisable-line)

1. Select the line which you wish to enable/disable with the left mouse button.
2. Click `Enable/Disable` to switch the enabled/disabled status of the selected line (keyboard shortcut : `Ctrl` + `E`)  
  ![](/assets/images/sw/rplus_task3/task3_015.png)

3. Disabled code will be shown in gray text and will be excluded from compilation.  
  ![](/assets/images/sw/rplus_task3/task3_016.png)

## [Copy/Cut/Paste](#copycutpaste)

1. Select the line to copy (or cut).
2. Click `Copy` (or `Cut`) to copy the code into the clipboard.  
  `Cut` option will copy the code into the clipboard and delete the code line.

3. `Copy` (or `Cut`) buttons from the toolbar on top can be used (keyboard shortcut : `Ctrl` + `C`, `Ctrl` + `X`)  
  ![](/assets/images/sw/rplus_task3/task3_017.png)

4. Right click on the line to paste the code to show the option menu.
5. Select `Paste` to place the code in the clipboard.
6. `Paste` button from the toolbar on top can be used (keyboard shortcut : `Ctrl` + `V`)  
  ![](/assets/images/sw/rplus_task3/task3_018.png)

7. The code will be inserted as shown below.  
  ![](/assets/images/sw/rplus_task3/task3_019.png)

## [Undo/Redo](#undoredo)

1. Select `Undo` from the option menu or
2. Click the `Undo` button from the toolbar to revert the last change in the code (keyboard shortcut : `Ctrl` + `Z`)  
  ![](/assets/images/sw/rplus_task3/task3_020.png)

3. Select `Redo` from the option menu or
4. Click the `Redo` button from the toolbar to cancel the reverted change (keyboard shortcut : `Ctrl` + `Shift` + `Z`)  
  ![](/assets/images/sw/rplus_task3/task3_021.png)

## [Download Task Code](#download-task-code)

1. Click `Device` button. (keyboard shortcut : `Shift` + `F5`)
2. Select the port that is connected to the robot and click `Connect` button.
3. If the robot is connected, click `Download` button to download the task code to the robot controller.  
  ![](/assets/images/sw/rplus_task3/task3_022.png)

4. When download is completed, the controller will execute the task (some controllers may be turned off instead of executing the task).  
  ![](/assets/images/sw/rplus_task3/task3_023.png)

## [Print Output](#print-output)


Select the device connected to the robot
Click the Confirm button
When the window closes, click the “Start” button

1. Move to Debugging Tab.
2. Click the `Device` button. (keyboard shortcut : `Shift` + `F5`)
3. Select the port that is connected to the robot and click `Connect` button.
4. If the robot is connected, click `Terminal Start / Stop` button (keyboard shortcut : `Ctrl` + `F6`).  
  ![](/assets/images/sw/rplus_task3/task3_024.png)

5. If the robot is connected, `Output Monitor` and `Virtual Remote Controller` is enabled.  
  ![](/assets/images/sw/rplus_task3/task3_025.png)


# [Task Instructions](#task-instructions)

## [Start/End](#startend)

This instruction establishes the overall beginning and end of a program, and the valid block for the instruction.

![](/assets/images/sw/rplus_task3/task3_026.png)

### [Start Program](#start-program)

- The Start Program instruction is executed regardless of the line number.
- There cannot be more than one Start Program instruction in one program.
- The Start Program instruction must be enclosed with a set of opening and closing brackets properly.
- When program reaches at the end of the Start Program instruction, the program will be terminated.
- The Start Program instruction can be compared to the main() function in C programming language.

The following image is an empty Start Program instruction.

![](/assets/images/sw/rplus_task3/task3_027.png)

### [End Program](#end-program)

- 프로그램을 끝내고 싶은 지점을 수동으로 지정합니다.
- 사용하지 않을 경우 프로그램 시작의 구간을 모두 수행한 후 자연 종료 됩니다.
- 아래는 프로그램 시작의 구간을 모두 수행하여 “자연 종료”되는 경우 입니다.

![](/assets/images/sw/rplus_task3/task3_028.png)

- 아래는 프로그램 끝을 만나 “강제 종료”되는 경우입니다.

![](/assets/images/sw/rplus_task3/task3_029.png)

### [구간 시작/구간 끝](#구간-시작구간-끝)

- 구간이란 여러 개의 명령문을 묶어놓은 것을 의미합니다.
- 구간의 시작과 끝은 항상 짝이 맞아야 합니다.
- 만약 실행문이 한줄일 경우에는 구간기호가 생략될 수 있습니다.
- C언어의 ‘{‘, ‘}’와 같은 기능을 합니다.
- 아래는 “프로그램 시작”, “무조건 반복”의 구간을 나타낸 그림입니다.

![](/assets/images/sw/rplus_task3/task3_030.png)

- 아래는 “프로그램 시작”, “만약”의 구간을 나타낸 그림입니다.

![](/assets/images/sw/rplus_task3/task3_031.png)

- 아래 그림과 같이 실행문이 한줄일 경우에는 구간기호가 생략될 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_032.png)

### [주석](#주석)

- 프로그램의 설명이 필요한 경우 해당 줄에 주석(메모)을 추가할 수 있습니다.
- "//" 기호가 삽입되면 더블 클릭하여 내용을 수정할 수 있습니다.
- 주석을 작성하던 도중에 “취소”(혹은 ESC)버튼을 클릭하면 입력 전의 내용으로 복구됩니다.
- 아래는 코드에 주석을 추가해 해석을 돕는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_033.png)

## [실행문](#실행문)

장치에 명령을 내리거나 수학적인 계산을 수행하는 명령어입니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3/task3_034.png)

### [계산](#계산)

- 두 값을 연산하여 하나의 결과를 내는 명령어입니다. (C = A + B)

![](/assets/images/sw/rplus_task3/task3_035.png)

- 덧셈( + ), 뺄셈( - ), 곱셈( * ), 나눗셈( / ), MOD(%), AND( & ), OR( \| )을 선택할 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_036.png)

  - 덧셈( + ) : 두 값을 더합니다.
  - 뺄셈( - ) : 앞에서 뒤의 값을 뺍니다.
  - 곱셈( * ) : 두 값을 곱합니다.
  - 나눗셈( / ) : 앞에서 뒤의 값을 나눈 몫을 나타냅니다. (나머지는 사라지고 몫만 결과로 나옵니다.)
  - MOD( % ) : 앞에서 뒤에 값을 나눈 나머지를 나타냅니다. (몫은 사라지고 나머지만 결과로 나옵니다.)
  - AND( & ) : 두 비트를 AND연산 합니다.
  - OR( \| ) : 두 비트를 OR연산 합니다.

- 아래는 계산 명령어를 사용한 예제입니다.

![](/assets/images/sw/rplus_task3/task3_037.png)

### [로드](#로드)

- 하나의 값을 다른 하나로 대입하는 명령어입니다.

![](/assets/images/sw/rplus_task3/task3_038.png)

- 변수의 값을 읽거나 쓸 때 사용합니다.
- 아래는 “속도”라는 변수에 값을 쓰고, 변수 값을 읽어 감속모터에 설정하는 예제 입니다.

![](/assets/images/sw/rplus_task3/task3_039.png)

- 장치의 값을 읽거나 쓸 때 사용합니다.
- 아래는 포트2번에 연결된 감속모터에 속도 값을 설정하는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_040.png)

### [다중 수식](#다중-수식)

- 복잡한 계산식을 실행할 때 사용하는 명령어입니다.
- 수식 내부에서는 변수 또는 상수만 사용이 가능하며, 아래 그림과 같이 그 밖의 값은 변수에 대입하여 사용해야 합니다.


![](/assets/images/sw/rplus_task3/multiple_expression_1.png)


- 다중 수식을 사용하게 되면 제어기 내부에 임시 변수가 생성되기 때문에 태스크에서 사용된 변수와 문법 검사 결과의 변수 갯수가 다를 수 있습니다.

![](/assets/images/sw/rplus_task3/multiple_expression_2.png)

- 잘못된 수식을 입력하면 오류창이 나타납니다.

![](/assets/images/sw/rplus_task3/multiple_expression_3.png)



### [레이블/점프](#레이블점프)

- 프로그램의 분기를 위해 사용되는 명령어입니다.
- 레이블은 분기할 위치를 지정합니다.
- 점프를 통해 미리 지정한 레이블부터 실행할 수 있습니다.
- C언어의 label / goto문과 같은 개념입니다.
- 아래는 점프할 대상에 따라 프로그램이 분기되는 예제입니다.
- 왼쪽 그림은 “작동모드1”로 점프하여 “작동모드2”에 해당하는 코드만 실행됩니다.
- 오른쪽 그림은 “작동모드2”로 점프하여 “작동모드2”에 해당하는 코드만 실행됩니다.

![](/assets/images/sw/rplus_task3/task3_041.png)

- 레이블과 점프는 반드시 하나의 함수 구간 내에 존재해야 합니다.

![](/assets/images/sw/rplus_task3/task3_042.png)


## [조건문](#조건문)

조건절의 결과가 참이냐 거짓이냐에 따라 프로그램의 흐름을 분기하는 명령어입니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3/task3_043.png)

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

![](/assets/images/sw/rplus_task3/task3_044.png)

- 복합 조건절 사용시 사용할 수 있는 논리 연산자는 다음과 같습니다.

| 논리연산자 |                            설명                             |
|:----------:|:-----------------------------------------------------------:|
|    then    | 아무 조건절도 연결하지 않습니다. 하나의 조건절만 사용합니다 |
|     &&     |                 두 조건절을 AND연산 합니다                  |
|     \      |    |                           두 조건절을 OR연산 합니다    |

![](/assets/images/sw/rplus_task3/task3_045.png)

### [만약](#만약)

- 조건절의 내용이 참이면 해당 구문을 실행합니다.
- C언어의 if문과 같은 개념입니다.
- 아래는 만약을 사용하여 “변수 값이 100과 같으면?”을 판단하는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_046.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_047.png)

### [아니면 만약](#아니면-만약)

- “만약”에 이어서 또 다른 조건을 검사할 때 사용합니다.
- 반드시 처음 조건으로 "만약" 구문이 존재해야 합니다.
- C언어의 else if와 같은 개념입니다.
- 아래는 만약과 아니면 만약을 사용하여 “변수 값이 100과 같으면?”과 “변수 값이 50과 같으면?”을 모두 판단하는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_048.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_049.png)

### [아니면](#아니면)

- “만약”과 “아니면 만약”의 조건 어디에도 해당되지 않을 경우 실행합니다.
- 반드시 처음 조건으로 만약 구문이 존재해야 합니다.
- C언어의 else와 같은 개념입니다.
- 아래는 만약과 아니면 을 사용하여 “변수 값이 100과 같으면?”과 “변수 값이 100과 다르면”을 모두 판단하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_050.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

  ![](/assets/images/sw/rplus_task3/task3_051.png)

## [반복문](#반복문)

프로그램에서 여러 번 반복적인 수행이 필요한 경우 사용하는 명령어입니다. 반복 구간과 반복 조건을 설정하여 다양한 방법으로 반복을 설정할 수 있습니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3/task3_052.png)

### [무조건 반복](#무조건-반복)

- 무조건 반복의 구간 시작과 끝 사이를 계속해서 반복 실행합니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- C언어의 while(1)과 같은 개념입니다.
- 아래는 무조건 반복을 사용하여 화면에 숫자 100을 출력하는 예제입니다. 무조건 반복의 구간 내에서 화면 출력을 진행하기 때문에 멈추지 않고 실행됩니다.

  ![](/assets/images/sw/rplus_task3/task3_053.png)

- 그림과 같이 실행할 코드가 한 줄일 경우 구간 기호를 생략할 수 있습니다.

  ![](/assets/images/sw/rplus_task3/task3_054.png)

### [조건 반복](#조건-반복)

- 조건절이 만족하는 동안 구간 시작과 끝 사이를 반복 실행합니다.
- 조건절에는 조건문과 마찬가지로 복합 조건절을 사용할 수 있습니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- C언어의 while(조건절)과 같은 개념입니다.
- 아래는 조건 반복을 활용하여 1.024초 동안만 화면에 숫자 100을 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_055.png)

- 아래는 조건 반복과 변수를 활용하여 10회 동안만 화면에 숫자 100을 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_056.png)

### [횟수 반복](#횟수-반복)

- 구간 시작과 끝 사이를 정해진 횟수만큼 반복 실행합니다.
- 구간의 끝에 도달할 때마다 설정한 변수의 값이 1씩 증가됩니다.
- “반복 끝내기”를 사용하여 반복 도중에 빠져나올 수 있습니다.
- 반복 횟수 수식 : 반복 횟수 = 끝 값 – 시작 값 + 1
- C언어의 for와 같은 개념입니다.
- 아래는 횟수 반복을 사용하여 10번동안 화면에 숫자를 출력하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_057.png)

- 아래는 횟수 반복에 사용한 변수를 실행구간 내부에서 사용한 예제입니다. 반복횟수가 1부터 10까지 증가함에 따라 화면 출력 값이 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000으로 변경됩니다.

  ![](/assets/images/sw/rplus_task3/task3_058.png)

### [조건 대기](#조건-대기)

- 조건절이 만족하는 동안 프로그램 수행을 멈춥니다.
- C언어의 내부가 비어있는 while(조건절)과 같은 개념입니다.
- 아래는 조건 대기와 타이머를 사용하여 1.024초 동안 대기하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_059.png)

- 아래는 조건 대기를 사용하여 재생되는 모션이 끝날 때까지 기다리는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_060.png)

- 아래는 조건 대기를 사용하여 재생되는 멜로디가 끝날 때까지 기다리는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_061.png)

### [반복 끝내기](#반복-끝내기)

- 반복문이 수행되는 도중에 반복을 멈추고 싶을 때 사용합니다.
- 무조건 반복, 조건 반복, 횟수 반복의 구간 내에서만 사용할 수 있습니다.
- C언어의 break와 같은 개념입니다.
- 아래는 무조건 반복에서 무선데이터가 도착하면 구문을 빠져 나오는 예제입니다. 무조건 반복에서 빠져나오면 바로 다음 구문이 실행됩니다.

  ![](/assets/images/sw/rplus_task3/task3_062.png)

## [함수(서브루틴)](#함수서브루틴)

동일한 코드가 반복되거나 특정 코드 영역을 역할 단위로 구분하여 표기하고 싶을 경우, 그 내용을 하나의 덩어리로 묶을 수 있으며 이를 함수라고 부릅니다. 자세한 설명은 하위 항목을 참고하세요.

![](/assets/images/sw/rplus_task3/task3_063.png)

### [함수/호출](#함수호출)

- 동일한 코드가 중복 사용되거나 특정 코드 영역을 역할 단위로 구분하여 표기하고 싶을 경우, 그 내용을 “함수”로 만들어 사용합니다.
- 적절한 함수 사용은 코드를 간결하고 읽기 편하게 만들어줍니다.
- 작성한 함수는 필요할 시에 “호출”을 통해 사용할 수 있습니다.
- 함수는 반드시 메인 프로그램 루틴 밖에 작성하여야 합니다.
- 태스크에서 함수는 입력 인자와 출력 인자를 설정할 수 없습니다.
- C언어의 함수와 같은 개념입니다.
- 아래는 LED를 깜박이는 기능을 함수로 만들어 사용한 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_064.png)

- 아래는 함수를 사용하기 위해 호출할 함수를 선택하는 과정입니다

  ![](/assets/images/sw/rplus_task3/task3_065.png)

- 함수 내에서 자기 자신을 호출할 수 없습니다.

  ![](/assets/images/sw/rplus_task3/task3_066.png)

### [복귀](#복귀)

- 함수가 실행되는 도중에 실행하던 함수를 빠져나가는 기능을 합니다.
- 일반 함수와 콜백 함수의 내부에서만 사용할 수 있습니다.
- C언어의 return과 같은 개념입니다.
- 아래는 “복귀”를 사용하지 않고 함수를 끝까지 실행한 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_067.png)

- 아래는 “복귀”를 사용하여 함수가 실행되는 도중에 복귀한 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_068.png)

### [콜백](#콜백)

- 메인 프로그램 루틴과 독립적으로 동작하는 함수로 일정한 시간마다 스스로 실행됩니다.
- 콜백은 반드시 메인 프로그램 루틴 밖에 작성하여야 합니다.
- 과도한 실행 시간을 요하는 코드를 넣을 수 없어, 콜백 내에서는 반복문 사용 / 변수 사용량 / 파라미터 호출 횟수 / 코드 용량의 제한이 있습니다.
- 콜백 함수 사용시 다음과 같은 제한사항을 지켜야 합니다.
  - 반복문, 레이블, 점프, 호출을 사용할 수 없습니다.
  - 외부 장치와의 통신 횟수가 최대 2회로 제약이 있습니다.
  - 콜백 함수의 작성에 있어 코드크기가 512bytes를 넘을 수 없습니다.

- 아래는 콜백 함수를 사용하여 받은 무선 데이터를 “수신데이터” 변수에 저장하는 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_069.png)


# [태스크 파라미터](#태스크-파라미터)

R+ Task 3.0에서 사용하는 파라미터를 설명합니다. 각 장치에 따라 사용할 수 있는 파라미터를 분류하여 설명합니다. 자세한 사용법은 각 항목의 설명과 예제 코드를 참고하세요.

## [포트 닉네임 변경](#포트-닉네임-변경)

제어기의 주변장치 포트에 연결되는 장치의 별명을 지정할 수 있습니다.

  ![](/assets/images/sw/rplus_task3/port_nickname_01.png)  

아래는 포트 닉네임이 적용된 예제입니다.  

  ![](/assets/images/sw/rplus_task3/port_nickname_02.png)  
  ![](/assets/images/sw/rplus_task3/port_nickname_03.png)

## [제어기 장치](#제어기-장치)

### [주변 장치](#주변-장치)

#### 감속모터
- 제어기에 연결된 감속모터를 제어하기 위해 사용합니다.
- 제어기마다 연결할 수 있는 장치가 다릅니다. 제어기 호환표를 참고하세요. [제어기 호환표]
- 방향 : CW(Clock Wise : 시계 방향), CCW(Counter Clock Wise : 반시계 방향)
- 출력 : 값 범위는 0~1023이며, 0일 때 정지, 1023일 때 100% 출력으로 설정됩니다.  
  ![](/assets/images/sw/rplus_task3/task3_070.png)

- 아래는 감속 모터를 제어하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_071.png)

- 아래는 감속 모터를 사용하여 로봇을 전진 시키는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_072.png)

#### 서보모터 속도/위치

- 제어기에 연결된 서보모터를 제어하기 위해 사용합니다.
- 제어기마다 연결할 수 있는 장치가 다릅니다. 제어기 호환표를 참고하세요. [제어기 호환표]
- 서보모터 동작모드 : 속도모드와 관절모드를 선택할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/servo_mode_selection.png)

- 속도모드 : 서보모터의 이동속도를 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_073.png)

- 관절모드 : 서보모터의 위치를 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_074.png)

- 아래는 서보모터를 바퀴형태로 제어하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/servo_velocity.png)

- 아래는 서보모터를 관절형태로 제어하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/servo_joint.png)

- CM-550은 서보모터를 속도모드와 관절모드로 선택해서 사용할 수 있습니다. 그러므로 다른 제어기와 같이 동작모드에 속도모드 또는 관절모드를 지정해줄 필요없이 바로 사용가능합니다.  
  ![](/assets/images/sw/rplus_task3/cm550_servo_selection.png)  
  ![](/assets/images/sw/rplus_task3/cm550_servo_ex.png)


#### LED 모듈

- 제어기에 연결된 LED 모듈을 제어하기 위해 사용합니다.
- 제어기마다 연결할 수 있는 장치가 다릅니다. 제어기 호환표를 참고하세요. [제어기 호환표]
- LED 모듈의 오른쪽 LED와 왼쪽 LED를 켜거나 끌 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_077.png)

- 아래는 LED 모듈을 제어하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_078.png)

#### 여러가지 센서

제어기에 연결된 여러 센서를 제어하기 위해 사용합니다. 제어기마다 연결할 수 있는 장치가 다릅니다. 제어기 호환표를 참고하세요. [제어기 호환표]

##### 접촉센서
접촉센서의 접촉 여부를 읽어오기 위해 사용합니다. (True일 때 접촉됨, False일 때 접촉되지 않음)
- [접촉 센서 부품 정보]
- 아래는 접촉 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_079.png)

##### 적외선 센서
물체와의 거리를 읽어오기 위해 사용합니다. (값 범위 0 ~ 1023, 값이 0에 가까울수록 물체와의 거리가 멉니다.)
- [적외선 센서 부품 정보]
- 아래는 적외선 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_080.png)

##### 절대 거리 센서
물체와의 거리를 읽어오기 위해 사용합니다.  (값 범위 0~ 1023, 값이 0에 가까울수록 물체와의 거리가 멉니다.)
- [절대 거리 센서 부품 정보]
- 아래는 절대 거리 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_081.png)

##### 컬러 센서
물체의 색상을 읽어오기 위해 사용합니다.
- 컬러 센서가 감지하는 색은 아래와 같습니다.  
  ![](/assets/images/sw/rplus_task3/task3_082.png)

- [컬러 센서 부품 정보]
- 아래는 컬러 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_083.png)

##### 자석 센서
자석이나 물체의 자력을 읽어오기 위해 사용합니다. (True일 때 자석이 감지됨, False일 때 자석이 감지되지 않음)
- [자석 센서 부품 정보]
- 아래는 자석 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_084.png)

##### 온도 센서
물체의 온도를 읽어오기 위해 사용합니다. (온도 범위 : -20~120&deg;C)
- [온도 센서 부품 정보]
- 아래는 온도 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_085.png)

##### 동작감지 센서
물체의 움직임을 감지하기 위해 사용합니다.
- [동작감지 센서 부품 정보]
- 아래는 동작감지 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_086.png)

##### 온습도 센서
물체의 온도와 습도를 읽어오기 위해 사용합니다. (온도 범위 : -20~120&deg;C, 습도 범위 : 0~100%)
- [온습도 센서 부품 정보]
- 아래는 온습도 센서를 사용한 예제입니다.

  ![](/assets/images/sw/rplus_task3/task3_087.png)

##### 조도 센서
장소의 밝기를 감지하기 위해 사용합니다. (값 범위 0~ 1023, 값이 0에 가까울수록 주위가 어둡습니다.)
- [조도 센서 부품 정보]
- 아래는 조도 센서를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_088.png)

##### 사용자 장치
사용자가 제작한 센서의 값을 읽어오거나 쓸 때 사용합니다.
- [사용자 센서 제작]
- 아래는 사용자 장치를 사용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_089.png)

### [모션 제어](#모션-제어)
- 제어기에 다운로드된 모션을 실행하기 위한 파라미터입니다.
- 특정 제어기에서만 사용할 수 있습니다.  
  (지원 제어기 : [CM-200], [CM-5], [CM-510], [CM-530], [CM-550], [CM-700], [OpenCM 9.04])

#### 모션 호출 번호
모션의 호출 번호를 쓰면 해당 모션이 실행됩니다.  
모션이 실행되는 도중이라면 현재 실행 중인 모션 번호를 읽어올 수 있습니다. 모션의 번호를 호출할 때, 해당 모션이름을 확인하며 넣어줄 수 있습니다.

![](/assets/images/sw/rplus_task3/motion_control_namelist.png)

- 아래는 모션 호출 번호를 이용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_090.png)

#### 모션 상태
모션이 실행되고 있으면 True, 모션이 실행되고 있지 않으면 False값을 반환합니다.
- 아래는 모션 상태를 이용하여 모션이 종료될 때까지 대기하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_091.png)

#### 관절 오프셋
모션이 실행될 때 -255~255 값을 모든 관절에 더해줍니다.  
관절 오프셋이 -50이고 모션 데이터의 위치 값이 300 -> 400 -> 500으로 설정된 경우라면, 250 -> 350 -> 450으로 변경되어 실행됩니다.
- 아래는 특정 관절에 오프셋 값을 적용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_092.png)

- 아래는 특정 관절에 모션 데이터 값의 영향을 받지 않도록 설정하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_093.png)

#### 관절 LED 자동 켜기
모션이 실행되는 동안 다이나믹셀의 LED를 켜거나 끌 수 있습니다. (True일 때 RGB LED 사용, False일 때 RGB LED 사용안함)  
해당 기능은 OpenCM 9.04에서만 지원합니다.
- 아래는 모션 실행 시 “관절 LED 자동 켜기” 기능을 활용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_094.png)

- 아래는 제어기에 저장된 모션을 실행하는 예제입니다. 리모컨 버튼 눌림에 따라 해당하는 모션이 실행됩니다.  
  ![](/assets/images/sw/rplus_task3/task3_095.png)

### [내장 센서](#내장-센서)
제어기에 내장된 각종 센서를 사용할 수 있습니다.

#### 시작 버튼 눌림 횟수
최초 제어기를 켤 때 연속적으로 시작버튼을 누른 횟수를 읽어올 때 사용합니다. 시작 버튼 눌림 횟수의 값의 범위는 0 ~ 255 입니다.
- 지원 제어기 : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM 7.0], [OpenCM 9.04]
- 아래는 시작 버튼 눌림 횟수를 사용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_099.png)

#### 제어기 버튼 / 버튼
제어기의 버튼 상태를 읽어올 때 사용합니다. 제어기에 따라 사용할 수 있는 버튼이 달라집니다.
- 지원 제어기 : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM 7.0], [OpenCM 9.04]
- 아래는 CM-5, CM-510, CM-530 제어기의 버튼을 사용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_100.png)

- 아래는 OpenCM9.04의 버튼을 사용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_101.png)

#### 컨트롤러 버튼 릴리즈 이벤트
CM-550 제어기의 시작버튼이 눌렸다가 떨어질 때 1(True)이 되며, 값을 읽으면 0(False)으로 리셋됩니다.

#### 버튼 눌림 시간
CM-550 제어기의 버튼을 누르고 있으면 버튼 눌림 시간이 ms 단위로 증가합니다.

#### 버튼 눌림 1초 타이머
CM-550 제어기의 버튼을 누르고 있으면 버튼 눌림 시간이 1초 단위로 증가합니다.

#### 최종 소리 감지 횟수
제어기에 내장된 마이크를 사용하여 일정 수준 이상의 큰 소리가 날 경우 1회씩 카운트하는 기능입니다. 대표적인 예로 박수 소리를 카운트하여 로봇을 동작시킬 때 많이 사용합니다.  
감지된 소리 횟수를 누적하여 카운트합니다. 초기화가 필요한 경우 0값을 직접 입력해야 합니다.  
제어기마다 지원하는 센서의 종류가 다릅니다. 각 제어기의 매뉴얼을 참고하세요.
- 지원 제어기 : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-550], [CM-700], [OpenCM 7.0], [OpenCM 9.04]
- 아래는 최종 소리감지 횟수를 이용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_096.png)

#### 실시간 소리 감지 횟수
제어기에 내장된 마이크를 사용하여 일정 수준 이상의 큰 소리가 날 경우 1회씩 카운트하는 기능입니다. 대표적인 예로 박수 소리를 카운트하여 로봇을 동작시킬 때 많이 사용합니다.  
실시간으로 감지된 소리 횟수를 카운트합니다. 0.8초간 소리가 입력되지 않으면 0으로 초기화 됩니다.
- 아래는 실시간 소리감지 횟수를 이용한 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_097.png)

#### 적외선 센서
- 제어기에 내장된 적외선 센서 값을 읽어오기 위해 사용합니다.
- 적외선 센서의 값 범위는 0 ~ 1,023 입니다. 물체와의 거리가 가까울수록 큰 값을 가지며, 거리가 멀수록 작은 값을 가집니다.
- 제어기마다 내장된 센서의 종류가 다릅니다. 각 제어기의 매뉴얼을 참고하세요.
  - 지원 제어기 : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200]

- 아래는 제어기의 적외선 센서 값을 사용하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_098.png)

##### 왼쪽 적외선 센서
제어기 왼쪽 하단에 위치한 적외선 센서의 값을 읽어올 때 사용합니다.

##### 중앙 적외선 센서
제어기 전면 중앙에 위치한 적외선 센서의 값을 읽어올 때 사용합니다.

##### 오른쪽 적외선 센서
제어기 오른쪽 하단에 위치한 적외선 센서의 값을 읽어올 때 사용합니다.

#### 현재 입력 전압
제어기에 입력되는 전압을 읽어오기 위해 사용합니다.

#### 제어기 온도
CM-550 제어기의 현재 온도를 측정하기 위해 사용합니다.

#### 제어기 IMU 방향
CM-550 제어기의 장착 상태에 따라 제어기에 내장된 IMU 센서의 방향을 설정해 주어야 합니다.
제어기를 세워서 사용하거나 눕혀서 사용할 경우에 따라 아래와 같이 설정합니다.

|  제어기 장착 상태   | 설정값 |
|:----------------:|:----:|
| 수직으로 세워서 장착 |   0  |
| 수평으로 눕혀서 장착 |   1  |

#### Roll X / Pitch Y / Yaw Z
CM-550 제어기에 내장된 IMU 센서의 Roll / Pitch / Yaw 축 데이터를 읽어올 때 사용합니다. (단위 : 0.01&deg;)

#### Gyro X / Y / Z
CM-550 제어기에 내장된 IMU 센서의 자이로 X / Y / Z 축 데이터를 읽어올 때 사용합니다. (단위 : 0.01&deg;/s)

#### Accel X / Y / Z
CM-550 제어기에 내장된 IMU 센서의 가속도계 X / Y / Z 축 데이터를 읽어올 때 사용합니다. (단위 : 0.001G)

### [버저](#버저)

#### 버저 종류 / 버저 울림 시간

- 제어기에 내장된 버저를 통해 음계나 멜로디를 연주할 때 사용합니다.
- 버저 울림 시간을 먼저 설정한 후 버저 종류를 설정해야 설정에 맞게 소리가 납니다.
- 아래는 버저 종류를 설정하는 그림입니다.  
  ![](/assets/images/sw/rplus_task3/task3_102.png)

- 아래는 제어기의 음계를 연주하는 예제입니다. 음계 연주 시 “버저 울림 시간”을 0~5초로 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_103.png)

- 아래는 제어기의 멜로디를 연주하는 예제입니다. 멜로디 연주 시 “버저 울림 시간”을 멜로디 연주 시간(특수 멜로디 연주)으로 설정해야 합니다.  
  ![](/assets/images/sw/rplus_task3/task3_104.png)

### [리모컨](#리모컨)

#### 받은 무선 데이터, 보낼 무선 데이터 / 무선 ID / RC-100채널

- 제어기에 연결된 무선 통신 모듈(블루투스, 적외선, 지그비)을 통해 외부와 데이터를 주고 받는 파라미터입니다.
- 일반적으로 RC-100, 스마트폰 가상 리모컨으로 로봇을 조종할 때 사용되며, 그 외에 사용자가 만든 임의의 SW와 통신을 위해 사용될 수 있습니다.
- 주고 받는 데이터의 값 범위는 0~65535로 제한됩니다. (2bytes)
- 받은 무선 데이터 : 제어기가 외부로부터 데이터를 전달받을 때 사용합니다.  
  ![](/assets/images/sw/rplus_task3/task3_105.png)

##### 보낼 무선 데이터
제어기가 외부로 데이터를 내보낼 때 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_106.png)

##### 새 무선 데이터 도착
제어기에 외부로부터 데이터가 전달되었을 때 값이 True가 됩니다.  
![](/assets/images/sw/rplus_task3/task3_107.png)

##### 내 로봇 무선 ID
지그비를 사용할 때 지그비 ID를 확인합니다.  
![](/assets/images/sw/rplus_task3/task3_108.png)

##### 상대로봇 무선 ID
지그비를 사용할 때 패어링할 지그비의 ID를 설정합니다.  
![](/assets/images/sw/rplus_task3/task3_109.png)

##### RC-100 채널
적외선 수신기를 사용할 때 채널 값을 설정합니다. (값이 255일경우 블루투스/지그비 모드로 동작합니다.)  
![](/assets/images/sw/rplus_task3/task3_110.png)

- 아래는 제어기에서 받은 무선 데이터를 처리하는 예제입니다.
  ![](/assets/images/sw/rplus_task3/task3_111.png)

- 아래는 제어기가 외부로 데이터를 내보내는 예제입니다.
  ![](/assets/images/sw/rplus_task3/task3_112.png)


### [타이머](#타이머)
- 타이머와 정밀 타이머는 제어기에 자동으로 카운트 다운 되는 타이머의 값을 설정할 때 사용합니다.

#### 타이머
제어기에 자동으로 카운트 다운 되는 타이머의 값을 사용할 때 설정합니다. 타이머의 값 범위는 0~255이며, 단위는 0.128초 입니다.  
- 아래는 타이머를 사용하여 약 1초(1.024초)만큼 대기하는 예제입니다.
  ![](/assets/images/sw/rplus_task3/task3_113.png)

#### 정밀 타이머
타이머와 같은 기능을 하며 시간을 더 정밀하게 카운트 합니다. 정밀 타이머의 값 범위는 0 ~ 65,535이며, 단위는 0.001초 입니다.  
- 아래는 정밀 타이머를 사용하여 정확히 1초(1.000초)만큼 대기하는 예제입니다.
  ![](/assets/images/sw/rplus_task3/task3_114.png)

#### 딜레이
CM-550에서는 타이머와 조건대기가 결합된 딜레이 기능을 사용할수 있습니다.  
![](/assets/images/sw/rplus_task3/cm550_delay_01.png)  
![](/assets/images/sw/rplus_task3/cm550_delay_02.png)  

- 아래 태스크 코드 중 우측의 코드는 CM-550에서 딜레이를 간단하게 사용할 수 있는 예시입니다.  
  ![](/assets/images/sw/rplus_task3/cm550_delay_03.png)

#### 자동꺼짐 타이머
제어기의 절전 모드 기능을 사용할 때 설정합니다.
- '자동꺼짐 타이머'의 실제 값은 0 ~ 255 사이의 숫자를 사용합니다.
- 숫자 1 은 시간 값 1분을 의미합니다.
- 제어기 작동 시 '자동꺼짐 타이머'의 기본 설정 값은 5분 입니다.
- 대부분의 제어기에서 자동꺼짐 타이머 값을 0분으로 설정하면 자동꺼짐 기능이 동작하지 않습니다 (OpenCM7.0은 60분으로 설정됨).
- 자동꺼짐 타이머의 남은 시간은 항상 '분' 단위로 읽혀집니다. 즉, 50초가 남아 있어도 1분으로 읽혀집니다.
- 자동꺼짐 타이머의 설정은 아래 표와 같으며, 타이머를 사용하지 않는 경우 배터리가 방전될 위험이 있으니 주의하시기 바랍니다.

|  설정값  |       OpenCM7.0의 타이머 시간       |      기타 제어기의 타이머 시간      |
|:--------:|:-----------------------------------:|:-----------------------------------:|
|    0     |                60분                 | 타이머 사용안함(배터리 방전에 주의) |
|  1 ∼ 60  |              1 ∼ 60분               |              1 ∼ 60분               |
| 61 ∼ 254 |                60분                 |              61 ∼254분              |
|   255    | 타이머 사용안함(배터리 방전에 주의) |                255분                |

**주의**: OpenCM7.0은 설정값이 다르므로 주의하시기 바랍니다.
{: .notice--warning}

- 아래는 자동꺼짐 타이머를 이용하여 제어기의 절전 모드를 설정하는 예제입니다. 5분내에 새 무선 데이터가 도착하면 자동꺼짐 타이머 값을 다시 초기화합니다.

  ![](/assets/images/sw/rplus_task3/task3_115.png)


### [제어기: 기타](#제어기-기타)

#### 임의의 숫자
0 ~ 255 범위에서 임의의 숫자(Random Value)를 생성합니다.  
값을 설정하여 최대값의 범위를 조절할 수 있습니다.
- 아래는 임의의 숫자를 사용하여 임의의 모션을 실행하는 예제입니다. 0 ~ 15까지의 임의의 숫자를 생성하여 해당 모션을 실행합니다.  
  ![](/assets/images/sw/rplus_task3/task3_116.png)

#### 내장 LED
제어기의 내장 LED(Aux LED)를 제어하기 위해 사용합니다.
- 아래는 내장 LED를 사용하는 예제입니다. 0.512초 간격으로 내장 LED를 켜고 끕니다.  
  ![](/assets/images/sw/rplus_task3/task3_117.png)

#### 화면 출력
태스크 코드의 결과값을 터미널 창에서 확인하고 싶을 때 사용합니다.

#### 화면 출력 후 줄바꿈
태스크 코드의 결과값을 터미널 창에서 확인하고 싶을 때 사용합니다. 출력 후 자동으로 다음 줄로 변경됩니다.  
- 아래는 “화면 출력”과 “화면 출력 후 줄바꿈”을 사용하여 센서 값을 출력하는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_118.png)  
  ![](/assets/images/sw/rplus_task3/task3_119.png)

### [제어기: 직접 입력](#제어기-직접-입력)

- 제어기의 특정 주소에 직접 접근하여 읽기와 쓰기 작업을 진행할 수 있습니다.
- 사용자가 지정한 주소를 Byte(1바이트), Word(2바이트), DWord(4바이트) 단위로 선택하여 읽거나 씁니다.
- 각 제어기 매뉴얼 내의 컨트롤 테이블을 참고하세요.

## [다이나믹셀 장치](#다이나믹셀-장치)

다이나믹셀 액추에이터의 컨트롤 테이블 값을 읽거나 쓰기 위한 파라미터 입니다. 자세한 정보는 다이나믹셀의 컨트롤 테이블을 참고하세요.

### [다이나믹셀](#다이나믹셀)

- DX / RX / AX 시리즈에서 사용 가능한 파라미터  
  토크 켜기 / 끄기, LED, CW margin / CCW margin, CW slope / CCW slope, 목표 위치, 이동 속도, 토크 한계, 현재 위치, 현재 속도, 현재 하중, 현재 전압, 현재 온도, 움직임 유무,
- MX 시리즈에서 사용 가능한 파라미터  
  토크 켜기 / 끄기, LED, PID gain, 목표 위치, 이동 속도, 토크 한계, 현재 위치, 현재 속도, 현재 하중, 현재 전압, 현재 온도, 움직임 유무
- X 시리즈에서 사용 가능한 파라미터(XL 라인업은 일부 파라미터 미적용)  
  토크 켜기 / 끄기, LED, PID gain, 목표 위치, 목표 속도, 목표 전류, 목표 PWM, 프로파일 가속도, 프로파일 속도, 토크 한계, 현재 위치, 현재 속도, 현재 전류, 현재 PWM, 현재 하중, 현재 전압, 현재 온도, 움직임 유무

#### 작동 모드
다이나믹셀의 동작 모드를 설정합니다. 자세한 내용은 다이나믹셀의 Operating Mode를 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_216.png)

#### 토크 켜기 / 끄기
다이나믹셀의 토크를 켜거나 끄기 위해 사용합니다. True일 때 토크 켜짐, False일 때 토크 꺼짐으로 동작합니다.  
- 아래는 제어기의 버튼을 누르면 ID가 1인 다이나믹셀의 토크를 켜는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_120.png)

#### LED
다이나믹셀의 LED를 켜거나 끄기 위해 사용합니다. True일 때 LED 켜짐, False일 때 LED 꺼짐으로 동작합니다.

#### CW margin / CCW margin
다이나믹셀의 Margin 설정값을 읽어오거나 설정하기 위해 사용합니다. 값 범위는 0~ 254이며 가급적 기본값(1)을 바꾸지 않는 것이 좋습니다.  
자세한 설명은 해당 다이나믹셀의 컨트롤 테이블을 참고하세요.

#### CW slope / CCW slope
다이나믹셀의 Slope 설정값을 읽어오거나 설정하기 위해 사용합니다. 총 7단계로 설정가능하며 아래 표에 따라 대표값이 설정됩니다.  
자세한 설명은 해당 다이나믹셀의 컨트롤 테이블을 참고하세요.

| 단계 |       Data 값       | Data 대표 값 |
|:----:|:-------------------:|:------------:|
|  1   | 0 (0x00) ~ 3(0x03)  |   2 (0x02)   |
|  2   |  4(0x04) ~ 7(0x07)  |   4 (0x04)   |
|  3   |  8(0x08)~15(0x0F)   |   8 (0x08)   |
|  4   |  16(0x10)~31(0x1F)  |  16 (0x10)   |
|  5   |  32(0x20)~63(0x3F)  |  32 (0x20)   |
|  6   | 64(0x40)~127(0x7F)  |  64 (0x40)   |
|  7   | 128(0x80)~254(0xFE) |  128 (0x80)  |

#### PID Gains
다이나믹셀의 PID 설정값을 읽어오거나 설정하기 위해 사용합니다.  
P gain은 Proportional Gain으로 작은 값일수록 유격이 커지고, 목표위치 근처에서의 출력정도가 약해집니다.  
I gain은 Integral Gain 이며, D gain은 Derivative Gain 입니다.

#### 목표 위치
다이나믹셀의 목표 위치값을 읽어오거나 설정하기 위해 사용합니다.  
- 아래 그림과 같이 `모터 위치 값` 컨트롤을 사용하여 각도 위치를 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_121.png)

#### 목표 속도
다이나믹셀의 이동 속도를 읽어오거나 설정하기 위해 사용합니다.  
- 아래 그림과 같이 `모터 제어 값` 컨트롤을 사용하여 회전 방향과 출력 값을 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_122.png)

#### 프로파일 가속도
다이나믹셀 X 시리즈에서 프로파일의 가속도를 설정합니다. 자세한 내용은 X 시리즈의 [Profile Acceleration(108)](/docs/kr/dxl/x/xm430-w210/#profile-acceleration)을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_214.png)

#### 프로파일 속도
다이나믹셀 X 시리즈가 Position Control 또는 Extended Position Control 모드일 때 프로파일의 최대 속도를 설정합니다. 자세한 내용은 X 시리즈의 [Profile Velocity(112)](/docs/kr/dxl/x/xm430-w210/#profile-velocity)을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_215.png)

#### 목표 전류 / 토크
다이나믹셀의 전류 / 토크 한계를 설정하기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_207.png)

#### 현재 위치
다이나믹셀의 현재 위치를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_208.png)

#### 현재 속도
다이나믹셀의 현재 속도를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_209.png)

#### 현재 하중
다이나믹셀의 출력축이 받고있는 하중값과 하중의 방향을 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_210.png)

#### 현재 입력 전압
다이나믹셀의 내부 전압을 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_211.png)

#### 현재 온도
다이나믹셀의 내부 온도를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_212.png)

#### 움직임 유무
다이나믹셀의 움직임 유무를 읽어오기 위해 사용합니다. True일 때 움직이는 상태, False일 때 움직이지 않는 상태를 나타냅니다.  
![](/assets/images/sw/rplus_task3/task3_213.png)

### [SyncWrite](#syncwrite)

CM-550 제어기를 사용할 경우 [프로토콜 2.0 - SyncWrite](/docs/kr/dxl/protocol2/#sync-write) 명령어를 사용할 수 있습니다.

#### SyncWrite Command

SyncWrite 명령어를 사용합니다. 아래와 같이 지정된 파라미터에 따른 동작을 합니다.

| 파라미터 |           동작           |                         예시                         |
|:--------:|:------------------------:|:----------------------------------------------------:|
|    0     | SyncWrite 패킷 시작하기 | ![](/assets/images/sw/rplus_task3/sync_write_01.png) |
|    1     | SyncWrite 패킷 입력하기 | ![](/assets/images/sw/rplus_task3/sync_write_02.png) |
|    2     | SyncWrite 패킷 전송하기 | ![](/assets/images/sw/rplus_task3/sync_write_03.png) |

#### SyncWrite Address

데이터가 전송될 주소를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_04.png)  
> 데이터가 전송될 시작주소를 116번지로 설정합니다.

#### SyncWrite Length

전송될 데이터의 길이를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_05.png)  
> 전송될 데이터의 길이를 4바이트로 설정합니다.

#### SyncWrite ID

데이터가 적용될 ID를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_06.png)  
> 데이터를 수신받을 다이나믹셀의 ID를 2로 설정합니다.

#### SyncWrite Data

전송될 데이터를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_07.png)  
> 10진수 값 2048을 전송할 데이터로 설정합니다.

#### SyncWrite 사용 예

다음은 SyncWrite 명령어를 이용해서 다이나믹셀 ID 2번과 3번의 116번 주소에 각각 2048의 값을 전달하는 방법입니다.

![](/assets/images/sw/rplus_task3/sync_write_example.png)

### [적외선 센서 어레이](#적외선-센서-어레이)

- 적외선 센서 값 (1~7번) : 적외선 센서 어레이의 적외선 센서 값을 읽어오기 위해 사용합니다. 벽이나 물체의 표면 색, 질감에 따라 측정값에 차이가 생길 수 있으며, 해당 센서는 0~5cm 이내에서 사용하도록 최적화 되었습니다.
- 적외선 감지 기준 값 (1~7번) : 적외선 센서 어레이가 흰색/검정색을 판단하는 기준 값입니다.

|                  | 검은색 감지 유무 | LED |
|:----------------:|:----------------:|:---:|
| 센서값 <= 기준값 |    해당 BIT 1    | ON  |
| 센서값 > 기준값  |    해당 BIT 0    | OFF |

- 버저 종류 : 적외선 센서 어레이의 버저 종류를 설정하기 위해 사용합니다.
- 버저 울림 시간 : 적외선 센서 어레이의 버저 사용시 소리가 지속될 시간을 설정하는데 사용합니다. 저 울림 시간을 먼저 설정한 후 버저 종류를 설정해야 설정에 맞게 소리가 납니다.
- 감지 기준 값 자동 설정 : 검정색 감지 기준값 자동 찾기의 시작과 마침을 결정하는데 사용합니다. 자세한 사용법은 아래 예제를 참고하세요.
- 적외선 물체 감지 유무 : 적외선 센서 어레이에 물체가 감지되었는지를 읽어오기 위해 사용합니다.

| 2 진수 값 | 10 진수 값 |        검은색 감지 유무        |
|:---------:|:----------:|:------------------------------:|
|  0000001  |     1      | 1번 적외선 센서에 검은 색 감지 |
|  0000010  |     2      | 2번 적외선 센서에 검은 색 감지 |
|  0000100  |     4      | 3번 적외선 센서에 검은 색 감지 |
|  0001000  |     8      | 4번 적외선 센서에 검은 색 감지 |
|  0010000  |     16     | 5번 적외선 센서에 검은 색 감지 |
|  0100000  |     32     | 6번 적외선 센서에 검은 색 감지 |
|  1000000  |     64     | 7번 적외선 센서에 검은 색 감지 |

아래 그림과 같이 그림을 보며 값을 체크할 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_123.png)

### [다이나믹셀 장치: 직접 입력](#다이나믹셀-장치-직접-입력)

- 다이나믹셀 등의 외부 장치의 주소를 직접 접근하여 읽기와 쓰기 작업을 진행할 수 있습니다.
- 사용자가 지정한 주소를 Byte(1바이트), Word(2바이트), DWord(4바이트) 단위로 선택하여 읽거나 씁니다.
- 각 다이나믹셀 매뉴얼 내의 컨트롤 테이블을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_217.png)

## [스마트 장치](#스마트-장치)

제어기와 블루투스로 연결된 앱(R+ Smart, R+ IoT, R+ ENGINEER)의 컨트롤 테이블 값을 읽거나 쓰기 위한 파라미터 입니다.

### [카메라](#카메라)

스마트 기기의 카메라 기능을 사용하기 위한 파라미터입니다.

#### 카메라 선택
스마트 기기에 내장된 카메라 중 사용할 카메라를 선택합니다. 아래 예제는 후면 카메라와 전면 카메라를 번갈아 선택하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_124.png)  
![](/assets/images/sw/rplus_task3/task3_125.png)

#### 카메라 확대
스마트 기기의 카메라를 확대할 때 사용합니다 (값의 범위는 0~255 입니다).  
아래는 카메라를 1.024초에 한번씩 확대하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_126.png)  
![](/assets/images/sw/rplus_task3/task3_127.png)![](/assets/images/sw/rplus_task3/task3_128.png)

#### 카메라 센서
스마트 기기의 카메라를 센서모드로 동작시키기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_129.png)

**참고**: 카메라 센서의 자세한 사용법은 [비전](#비전)을 참고하세요.
{: .notice}

#### 사진 촬영
스마트 기기의 카메라로 사진을 촬영할 때 사용합니다. (True일 때 촬영, False일 때 촬영정지)  
아래는 스마트 기기의 후면 카메라를 이용하여 사진을 촬영하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_130.png)  
![](/assets/images/sw/rplus_task3/task3_131.png)

### [비전](#비전)

스마트 기기의 카메라를 “카메라 센서”로 설정시 사용하는 파라미터입니다.

#### 감지된 색상
“카메라 센서”의 “색상 감지 모드”를 사용하는 경우, 화면 가운데 부분에 표시되는 색상을 확인하기 위해 사용합니다.  
아래는 감지된 색상 값을 사용하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_132.png)

#### 감지할 라인 색상
“카메라 센서”의 “라인 감지 모드”를 사용하는 경우, 감지할 라인의 색상을 설정하기 위해 사용합니다.

#### 라인 감지 영역
“카메라 센서”의 “라인 감지 모드”를 사용하는 경우, 감지된 라인의 위치를 확인하기 위해 사용합니다.  
아래는 녹색 라인이 감지되면 해당 라인에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_133.png)  
![](/assets/images/sw/rplus_task3/task3_134.png)

#### 얼굴 감지 영역
“카메라 센서”의 “얼굴 감지 모드”를 사용하는 경우, 감지된 얼굴의 위치를 확인하기 위해 사용합니다.  
아래는 얼굴이 감지되면 해당 위치에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_135.png)  
![](/assets/images/sw/rplus_task3/task3_136.png)

#### 동작 감지 영역
“카메라 센서”의 “동작 감지 모드”를 사용하는 경우, 감지된 동작의 위치를 확인하기 위해 사용합니다.  
아래는 동작이 감지되면 해당 위치에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_137.png)  
![](/assets/images/sw/rplus_task3/task3_138.png)

### [표시](#표시)

스마트 기기의 화면에 배경, 그림, 도형, 문자, 숫자를 표시하기 위해 사용합니다.

#### 화면 회전
스마트 기기의 화면 방향을 설정할 때 사용합니다.  
아래는 스마트 기기의 화면 방향을 1.024초마다 번갈아 변경하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_139.png)  
![](/assets/images/sw/rplus_task3/task3_140.png)![](/assets/images/sw/rplus_task3/task3_141.png)

#### 배경 표시
스마트 기기의 화면에 그림 배경을 설정할 때 사용합니다.(스마트 기기 앱에 미리 등록해놓은 배경만 사용할 수 있습니다.)  
아래는 스마트 기기의 그림 배경을 아이템1로 설정하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_142.png)  
![](/assets/images/sw/rplus_task3/task3_143.png)

#### 그림 표시
스마트 기기의 화면에 그림을 배치할 때 사용합니다.(스마트 기기 앱에 미리 등록해놓은 그림만 사용할 수 있습니다.)  
아래는 스마트 기기의 위치2,3과 위치 4,3에 그림을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_144.png)  
![](/assets/images/sw/rplus_task3/task3_145.png)

#### 감지된 얼굴 그림 표시
“카메라 센서”의 “얼굴 감지 모드”를 사용할 경우, 감지된 얼굴에 덮어씌울 그림을 설정할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 그림만 사용할 수 있습니다.)  
아래는 스마트 기기의 카메라를 이용하여 얼굴을 감지한 후 감지된 얼굴 위에 그림을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_146.png)  
![](/assets/images/sw/rplus_task3/task3_147.png)

#### 도형 표시
스마트 기기의 화면에 도형을 배치할 때 사용합니다. (1 : 원, 2 : 사각형, 3 : 삼각형)  
아래는 위치3,3에 파란색 원형과 회색 삼각형을 번갈아 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_148.png)  
![](/assets/images/sw/rplus_task3/task3_149.png)![](/assets/images/sw/rplus_task3/task3_150.png)

#### 문자 표시
스마트 기기의 화면에 문자를 배치할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 문자만 사용할 수 있습니다.)  
아래는 위치1,3~5,3에 차례로 문자를 표시했다가 지우는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_151.png)  
![](/assets/images/sw/rplus_task3/task3_152.png)
![](/assets/images/sw/rplus_task3/task3_153.png)
![](/assets/images/sw/rplus_task3/task3_154.png)
![](/assets/images/sw/rplus_task3/task3_155.png)

#### 숫자 표시
스마트 기기의 화면에 숫자를 배치할 때 사용합니다. (별도의 문자 등록 없이 0~255 사이의 숫자를 사용할 수 있습니다.)  
아래는 위치3,3에 숫자를 증가하며 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_156.png)  
![](/assets/images/sw/rplus_task3/task3_157.png)![](/assets/images/sw/rplus_task3/task3_158.png)

### [멀티미디어](#멀티미디어)

스마트 기기의 화면과 스피커를 사용하여 영상을 출력하거나, 소리를 출력하기 위해 사용합니다.

#### 문자음성 자동변환(TTS)
스마트 기기의 문자음성 자동변환 서비스를 활용할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 문자만 사용할 수 있습니다.)  
아래는 문자아이템2, 문자아이템3을 번갈아 음성으로 변환하여 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_159.png)

#### 악기 연주
스마트 기기로 악기 소리를 낼 때 사용합니다.  
아래는 어쿠스틱 피아노로 도, 레, 미를 반복해서 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_160.png)

#### 오디오 재생
스마트 기기의 오디오 파일을 재생할 때 사용합니다.  
오디오 재생1과 오디오 재생2는 독립적으로 동작합니다. (스마트 기기 앱에 미리 등록해놓은 오디오 파일만 사용할 수 있습니다.)

#### 볼륨
스마트 기기의 사운드 볼륨을 설정할 때 사용합니다.  
값 범위는 0~255이며, 값이 클수록 볼륨이 커집니다. 기기에 따라 값의 범위가 다를 수 있습니다.  
아래는 오디오 재생1, 오디오 재생2, 볼륨을 이용하여 스마트 기기의 음원을 재생하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_161.png)

#### 동영상 재생
스마트 기기의 동영상 파일을 재생할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 동영상만 사용할 수 있습니다.)

#### 동영상 일시정지
스마트 기기에서 동영상 파일이 재생되고 있을 때 일시 정지하기 위해 사용합니다.  
아래는 동영상 재생과 동영상 일시정지를 사용하여 화면을 터치하고 있는 동안 동영상 재생을 일시정지하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_162.png)

### [센서](#센서)

스마트 기기에 내장된 여러 가지 센서를 활용하기 위해 사용합니다.

#### 흔들림 센서
스마트 기기의 흔들림 센서를 활용하기 위해 사용합니다. 스마트 기기의 흔들림 정도에 따라 0~255사이 값이 출력됩니다.  
아래는 스마트 기기의 흔들림 정도를 읽어 값이 80이상일 때 화면에 표시한 도형의 색상을 바꾸는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_163.png)  
![](/assets/images/sw/rplus_task3/task3_164.png)![](/assets/images/sw/rplus_task3/task3_165.png)

#### 기울기 센서
스마트 기기의 기울기 센서를 활용하기 위해 사용합니다. (왼쪽), (오른쪽), (위쪽), (아래쪽)의 기울기를 각각 0~90도로 출력됩니다.  
아래는 스마트 기기의 기울기에 따라 화면에 기울어진 방향에 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_166.png)  
![](/assets/images/sw/rplus_task3/task3_167.png)![](/assets/images/sw/rplus_task3/task3_168.png)![](/assets/images/sw/rplus_task3/task3_169.png)

#### 조도 센서
스마트 기기의 조도 센서를 활용하기 위해 사용합니다. 주위 밝기에 따라 0~65535의 값이 출력됩니다. 기기에 따라 값의 범위가 다를 수 있습니다.  
아래는 조도를 측정하여 주위가 어두우면 회색 원을, 주위가 밝으면 흰색 원을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_170.png)  
![](/assets/images/sw/rplus_task3/task3_171.png)![](/assets/images/sw/rplus_task3/task3_172.png)

#### 자기장 센서
스마트 기기의 자기장 센서를 활용하기 위해 사용합니다. 주위 자기장에 따라 0~65535의 값이 출력됩니다.  
아래는 스마트 기기 주위의 자기장을 측정하여 값을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_173.png)  
![](/assets/images/sw/rplus_task3/task3_174.png)![](/assets/images/sw/rplus_task3/task3_175.png)

#### 방향 센서
스마트 기기의 방향 센서를 활용하기 위해 사용합니다. 방향에 따라 각도 단위로 0~359 사이의 값을 출력합니다. (0:북, 90:동, 180:남, 270:서)  
아래는 스마트 기기의 방향 값을 10으로 나누어 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_176.png)  
![](/assets/images/sw/rplus_task3/task3_177.png)

#### 소음 센서
스마트 기기의 소음 센서를 활용하기 위해 사용합니다. 소음에 따라 dB 단위로 0~255 사이의 값을 출력합니다.  
아래는 소음의 크기에 따라 도형을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_178.png)  
![](/assets/images/sw/rplus_task3/task3_179.png)![](/assets/images/sw/rplus_task3/task3_180.png)

#### 음성 인식
스마트 기기의 음성 인식 기능을 켜거나 끄기 위해 사용합니다. True일 때 “음성 인식 시작”, False일 때 “음성 인식 정지”로 동작합니다.  

#### 음성 인식 결과
“음성 인식”기능을 사용할 때, 인식된 결과를 확인하기 위해 사용합니다.  
인식된 결과가 숫자로 표시됩니다. 0일 때 “결과값 없음”, 1~199일 때 해당 문자아이템과 일치.  
아래는 음성 인식과 음성 인식 결과를 사용하여 화면을 터치했을 때 음성을 인식하여 인식된 결과를 화면 중앙에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_181.png)  
![](/assets/images/sw/rplus_task3/task3_182.png)![](/assets/images/sw/rplus_task3/task3_183.png)

#### 터치 위치
스마트 기기의 화면 터치 위치를 활용하기 위해 사용합니다. 터치 위치1은 첫 번째로 터치된 손가락을 의미하며 터치 위치2는 두 번째로 터치된 손가락을 의미합니다.  
아래는 터치한 위치에 도형을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_184.png)  
![](/assets/images/sw/rplus_task3/task3_185.png)![](/assets/images/sw/rplus_task3/task3_186.png)

#### 제스처 인식
스마트 기기의 제스처 인식 기능을 활용하기 위해 사용합니다.  
아래는 제스처를 인식하여 해당 제스처의 번호를 화면에 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_187.png)  
![](/assets/images/sw/rplus_task3/task3_188.png)![](/assets/images/sw/rplus_task3/task3_189.png)

### [스마트 장치: 기타](#스마트-장치-기타)
스마트 기기의 부가 기능을 활용하기 위해 사용합니다.

#### 디버그 정보 표시
스마트 기기의 주요기능들의 값을 화면에 표시하여 확인하기 위해 사용합니다.  
하위 비트(우측)부터 1로 설정 시 다음의 정보를 스마트 기기의 화면에 표시할 수 있습니다.

| 비트(Bit)  | 정보                                       |
|:---------:|:------------------------------------------|
| 1번째 비트  | 비전 관련 위치, 색상 표시 (정수 입력 시 : 1)     |
| 2번째 비트  | 흔들림 값 표시 (정수 입력 시 : 2)              |
| 3번째 비트  | 기울기 상하좌우 값 표시 (정수 입력 시 : 4)       |
| 4번째 비트  | 조도 값 표시 (정수 입력 시 : 8)               |
| 5번째 비트  | 자기장 값 표시 (정수 입력 시 : 16)             |
| 6번째 비트  | 방향 값 표시 (정수 입력 시 : 32)              |
| 7번째 비트  | 소음 값 표시 (정수 입력 시 : 64)              |
| 8번째 비트  | 터치 위치 1, 2값 표시 (정수 입력 시 : 128)     |
| 9번째 비트  | 음성입력 결과 값 표시 (정수 입력 시 : 256)      |
| 10번째 비트 | SMS 관련 전화번호, 내용 표시(정수 입력 시 : 512) |

아래는 디버그 정보 표시 기능을 이용하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_190.png)  
![](/assets/images/sw/rplus_task3/task3_191.png)

#### 화면 출력
태스크 코드에서 특정 값을 눈으로 확인하고 싶을 때 사용합니다. (스마트 앱 화면에 표시됩니다.)

#### 화면 출력 후 줄바꿈
태스크 코드에서 특정 값을 눈으로 확인하고 싶을 때 사용합니다. 출력 후 자동으로 다음 줄로 변경됩니다. (스마트 앱 화면에 표시됩니다.)  
아래는 스마트 기기의 화면출력 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_192.png)

#### 스마트 타이머
스마트 기기의 타이머를 설정하기 위해 사용합니다.

#### 진동 시간
스마트 기기의 진동 기능을 켤 때 사용합니다.

#### 진동 상태
스마트 기기가 현재 진동 중인지 확인하기 위해 사용합니다.  
아래는 스마트 타이머와 진동 시간을 이용하여 10초마다 1초 진동하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_193.png)

#### 현재 시간
스마트 기기로부터 현재시간을 읽어오기 위해 사용합니다.  
아래는 현재시간을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_194.png)  
![](/assets/images/sw/rplus_task3/task3_195.png)

#### 플래시 LED
스마트 기기의 카메라 플래시 LED를 켜거나 끄기 위해 사용합니다.  
아래는 조도센서로 주위 밝기를 측정하여 어두우면 플래시 LED를 켜는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_196.png)

#### 앱 실행하기
스마트 기기에 설치된 앱을 실행하기 위해 사용합니다.  
아래는 화면을 터치하면 등록된 앱을 실행하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_197.png)

#### E-Mail 기능
촬영한 사진이나 동영상을 E-Mail로 발송하기 위해 사용합니다.

#### E-Mail 전송 상태
현재 E-Mail이 전송 중인지 확인하기 위해 사용합니다.  
아래는 E-Mail 전송 기능과 E-Mail 전송 상태를 사용하여 촬영된 사진을 메일로 보내는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_202.png)

#### 화면 넓이 / 화면 높이
스마트 기기 화면의 넓이와 높이를 읽기 위해 사용합니다.

### [사용자 데이터](#사용자-데이터)
스마트 기기의 특정 주소영역에 사용자의 데이터를 읽거나 쓸 수 있습니다.  

### [스마트 장치: 직접 입력](#스마트-장치-직접-입력)

- 스마트 기기의 주소를 직접 접근하여 읽기와 쓰기 작업을 진행할 수 있습니다.
- 사용자가 지정한 주소를 Byte 또는 Word, DWord 단위로 선택하여 읽거나 씁니다.
- 제품과 함께 사용되는 앱의 컨트롤 테이블을 참고하세요. [R+ Smart 컨트롤 테이블]

## [공통](#공통)

모든 장치에서 사용할 수 있는 기본적인 변수와 상수입니다.

### [변수](#변수)

- 프로그램 내부의 저장공간으로 여러 가지 데이터를 저장하거나 읽을 수 있습니다.
- 숫자를 기억하고 있어야 하는 경우나 공통된 값을 한꺼번에 변경해야 하는 경우 변수를 사용하면 유용합니다.
- 아래는 변수를 사용하는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_203.png)

### [숫자](#숫자)

- 프로그램 내부에서 숫자를 직접 입력해야 하는 경우 사용합니다.
- 대체로 조건절에서 값을 비교할 때 사용합니다.
- 값 범위는 -2,147,483,648 ~ 4,294,967,295 입니다.

![](/assets/images/sw/rplus_task3/task3_204.png)

### [참/거짓](#참거짓)

- 프로그램 내부에서 참 / 거짓(True / False)를 직접 입력해야 하는 경우 사용합니다.
- 대체로 조건절에서 상태를 비교할 때 사용합니다.
- 값 범위는 0~1 입니다. False일 때 0, True일 때 1.

![](/assets/images/sw/rplus_task3/task3_205.png)

### [2진수 숫자](#2진수-숫자)

- 프로그램 내부에서 숫자를 직접 입력해야 하는 경우 사용합니다.
- 대체로 비트 연산을 해야한 경우 사용되며, 2진수로 표기됩니다.
- 값 범위는 0 ~ 4,294,967,295 입니다. (Hex : 00 00 00 00 ~ FF FF FF FF)  
![](/assets/images/sw/rplus_task3/task3_206.png)

### [모터 모드](#모터-모드)
SM-10 서보모터의 속도모드, 관절모드를 전환할 경우 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_219.png)

## [모션 목록](#모션-목록)
모션 예제가 열려있는 경우 해당 예제의 모션 목록이 여기에 나타납니다.  
모션 예제가 열려있지 않은 경우 이 항목은 메뉴에 표시되지 않습니다.  
![](/assets/images/sw/rplus_task3/task3_218.png)

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
