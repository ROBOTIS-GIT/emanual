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

# [동영상](#동영상)

## 로보플러스 프로그램 다운로드 (CM-100)

<iframe width="560" height="315" src="https://www.youtube.com/embed/3mDP9BW-Q0E" frameborder="0" allowfullscreen></iframe>

## 포트 설정 및 셋팅하기

<iframe width="560" height="315" src="https://www.youtube.com/embed/UlD4C1XMsgo" frameborder="0" allowfullscreen></iframe>

[CM-100]: /docs/kr/parts/controller/cm-100/
[LN-101]: /docs/kr/parts/interface/ln-101/
[룰 체크 에러 메시지]: /docs/kr/software/rplus1/task/task_misc/#룰-체크
[제어기 정보]: /docs/kr/parts/controller/controller_compatibility/

[img_01]: /assets/images/edu/task_download_01.jpg
[img_02]: /assets/images/sw/rplus1/task/select_port.png
[img_03]: /assets/images/sw/rplus1/task/cannot_find_controller.png
[img_04]: /assets/images/sw/rplus1/task/download_button.png
[img_05]: /assets/images/sw/rplus1/task/download_progress_bar.png
