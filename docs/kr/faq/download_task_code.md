---
layout: archive
lang: kr
ref: download_task_code
read_time: true
share: true
author_profile: false
permalink: /docs/kr/faq/download_task_code/
sidebar:
  title: 태스크 코드 다운로드
  nav: "download_task_code"
---

# [태스크 코드 다운로드](#태스크-코드-다운로드)

## [CM-5](#cm-5)

{% include kr/edu/bioloid/download_task.md %}

## [CM-100](#cm-100)

### 준비
1. 다운로드 할 태스크 코드 파일(\*.tsk)을 RoboPlus Task에서 불러 옵니다.
  - 태스크 코드 파일을 더블클릭하여 열 수 있습니다.
  - RoboPlus Task 의 파일 열기 기능으로 열 수 있습니다.
  - 마우스를 이용하여 파일을 RoboPlus Task 위로 드래그 앤 드롭(Drag & Drop)을 통해 열 수 있습니다.

2. USB 다운로더([LN-101])를 이용하여 PC 와 제어기([CM-100])를 연결합니다.
3. 건전지(AA)2개 를 연결후 제어기(CM-100)의 전원을 켭니다.

  ![img_01][img_01]

### 다운로드

1. PC 와 제어기가 연결되어야 합니다.  
  태스크 코드를 다운로드하기 위해서는 PC 와 제어기가 연결되어야 합니다. (연결 방법은 각 [제어기 정보]를 참고하세요.)

2. 사용할 통신 포트를 선택해야 합니다.  
  자동 찾기 기능을 이용하면 쉽게 통신 포트를 설정할 수 있습니다.

    ![img_02][img_02]

    RoboPlus Task 가 제어기를 찾지 못하면 아래와 같은 에러 메시지가 나타납니다.

    ![img_03][img_03]

    - PC 와 제어기가 연결되어 있는지 확인합니다. (연결 방법은 각 제어기 정보를 참고하세요.)
    - 제어기의 전원이 켜져 있는지 확인합니다.
    - 제어기가 연결된 통신 포트가 바르게 선택되어 있는지 확인합니다.

3. 다운로드 메뉴를 선택합니다.

    ![img_04][img_04]

    만약, 프로그램에 오류가 있다면 오류를 찾아 수정해야 합니다. ([룰 체크 에러 메시지] 확인)

4. 다운로드를 진행합니다.

    ![img_05][img_05]

    만약 다운로드에 실패했다면 처음부터 다시 시도합니다.

5. 태스크 코드(Task Code)를 실행하고 로봇의 동작을 실행 합니다.  
  제어기를 켜고 다운로드 한 태스크 코드를 실행합니다. (태스크 코드 실행 방법은 각 [제어기 정보]를 참고하세요.)


## [CM-150](#cm-150)

### 준비
1. PC에 R+Task 2.0 소프트웨어가 설치되어 있어야 합니다.  
    [R+Task 2.0 다운로드]

2. 다운로드할 태스크 코드 파일(\*.tsk)을 R+Task 에서 불러옵니다.
  - 태스크 코드 파일을 더블클릭하여 열 수 있습니다.
  - R+Task의 파일열기 기능으로 열 수 있습니다.

3. 제어기([CM-150])를 충전배터리(LB-041)와 연결한 후 제어기의 전원을 켭니다.

4. 마이크로 USB케이블 사용해 PC와 제어기([CM-150])을 연결합니다.

  ![tcdown0][tcdown0]

### 다운로드

1. PC와 제어기가 마이크로 USB로 연결되어 있는지 확인합니다.

2. 제어기([CM-150])의 전원이 켜져 있는지 확인합니다.

3. 아래 그림을 참고하여 장치 `1`를 선택합니다.

    ![tcdown1][tcdown1]

4. 목록에서 검색된 장치 `2`를 선택하고 `3`를 누릅니다.
  - 목록에서 장치가 나타나지 않을 경우 위의 1, 2 항목을 다시 체크합니다.  

    ![tcdown2][tcdown2]  

5. 다운로드 `4`를 선택합니다.

    ![tcdown3][tcdown3]

6. 아래와 같이 진행된 후 다운로드가 완료됩니다.

    ![tcdown4][tcdown4]

    ![tcdown5][tcdown5]  


## [CM-530](#cm-530)

### 준비

1. RoboPlus 소프트웨어가 PC에 설치되어 있어야 합니다.  
    [Roboplus 다운로드]

2. 배터리의 충전상태를 확인합니다.

3. 사용할 예제 파일을 PC에 미리 다운로드합니다.  
   [예제 파일 다운로드]


### 다운로드

1. 미니 USB 케이블을 이용하여 PC와 제어기([CM-530])을 연결합니다.

    ![cm530_0][cm530_0]

2. PC에서 RoboPlus를 실행하고 'RoboPlus Task'를 선택합니다.

    ![cm530_kr1][cm530_kr1]

3. 아래 창이 나올 경우 펌웨어 1.0을 체크하고 제어기([CM-530])를 선택합니다.

    ![cm530_kr2][cm530_kr2]

4. 제어기([CM-530])의 전원을 켜고 통신포트를 선택합니다. **자동 찾기**를 선택하면 쉽게 포트를 찾을 수 있습니다.

    ![cm530_kr3][cm530_kr3]

    - 제어기([CM-530])를 찾지 못할 경우 아래와 같은 메시지가 나타납니다.

    ![cm530_kr4][cm530_kr4]

    - 위 오류 내용을 확인하여 수정하고 다시 포트를 연결합니다.


5. 제어기([CM-530])에 다운로드 할 예제 파일을 RoboPlus에서 불러옵니다.

    ![cm530_kr5][cm530_kr5]

6. 아래 표시된 다운로드 버튼을 눌러 예제 프로그램을 제어기에 다운로드합니다.

   ![cm530_kr6][cm530_kr6]

7. 아래와 같은 메시지가 나타나고 다운로드가 완료됩니다.

   ![cm530_kr7][cm530_kr7]



# [동영상](#동영상)

## 로보플러스 프로그램 다운로드 (CM-100)

<iframe width="560" height="315" src="https://www.youtube.com/embed/3mDP9BW-Q0E" frameborder="0" allowfullscreen></iframe>

## 포트 설정 및 셋팅하기

<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>



[CM-100]: /docs/kr/parts/controller/cm-100/
[LN-101]: /docs/kr/parts/interface/ln-101/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-530]: /docs/kr/parts/controller/cm-530/
[룰 체크 에러 메시지]: /docs/kr/software/rplus1/task/task_misc/#룰-체크
[제어기 정보]: /docs/kr/parts/controller/controller_compatibility/
[R+Task 2.0 다운로드]: http://www.robotis.com/service/downloadcenter.php
[Roboplus 다운로드]: http://www.robotis.com/service/downloadcenter.php
[예제 파일 다운로드]: /docs/kr/edu/bioloid/stem/#다운로드




[img_01]: /assets/images/edu/task_download_01.jpg
[img_02]: /assets/images/sw/rplus1/task/select_port.png
[img_03]: /assets/images/sw/rplus1/task/cannot_find_controller.png
[img_04]: /assets/images/sw/rplus1/task/download_button.png
[img_05]: /assets/images/sw/rplus1/task/download_progress_bar.png
[tcdown0]: /assets/images/faq/tcdown0.jpg
[tcdown1]: /assets/images/faq/tcdown1.jpg
[tcdown2]: /assets/images/faq/tcdown2.jpg
[tcdown3]: /assets/images/faq/tcdown3.jpg
[tcdown4]: /assets/images/faq/tcdown4.jpg
[tcdown5]: /assets/images/faq/tcdown5.jpg
[cm530_0]: /assets/images/faq/cm530_0.png
[cm530_kr1]: /assets/images/faq/cm530_kr1.png
[cm530_kr2]: /assets/images/faq/cm530_kr2.png
[cm530_kr3]: /assets/images/faq/cm530_kr3.png
[cm530_kr4]: /assets/images/faq/cm530_kr4.png
[cm530_kr5]: /assets/images/faq/cm530_kr5.png
[cm530_kr6]: /assets/images/faq/cm530_kr6.png
[cm530_kr7]: /assets/images/faq/cm530_kr7.png
