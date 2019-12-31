바이올로이드 초급/종합 키트에서 사용되는 제어기인 [CM-5] 에 로보플러스 프로그램을 사용하기 위해서는 반드시 펌웨어 업데이트가 필요합니다. 펌웨어 업데이트 방법은 로보프러스 매니저의 펌웨어 업데이트를 참고하세요.

### 태스크 코드 다운로드 준비

1. 다운로드 할 태스크 코드 파일(\*.tsk)을 RoboPlus Task에서 불러 옵니다.
- 태스크 코드 파일을 더블클릭하여 열 수 있습니다.
- RoboPlus Task 의 파일 열기 기능으로 열 수 있습니다.
- 마우스를 이용하여 파일을 RoboPlus Task 위로 드래그 앤 드롭(Drag & Drop)을 통해 열 수 있습니다.
2. [USB2DYNAMIXEL]을 이용하여 PC 와 제어기를 연결합니다.
3. 제어기의 전원을 켭니다. (전원을 켜는 방법은 각 제어기 정보를 참고하세요.)

![CM-5_to_PC-01](/assets/images/parts/controller/cm-5/cm_5_connect_pc_01.png)

### 태스크 코드 다운로드

1. PC 와 제어기가 연결되어야 합니다.  
  태스크 코드를 다운로드하기 위해서는 PC 와 제어기가 연결되어야 합니다. (연결 방법은 각 제어기 정보를 참고하세요.)

2. 사용할 통신 포트를 선택해야 합니다.  
  자동 찾기 기능을 이용하면 쉽게 통신 포트를 설정할 수 있습니다.

    ![](/assets/images/edu/bioloid/select_port.png)

    - RoboPlus Task 가 제어기를 찾지 못하면 아래와 같은 에러 메시지가 나타납니다.

    ![](/assets/images/edu/bioloid/cannot_find_controller.png)

    - PC 와 제어기가 연결되어 있는지 확인합니다. (연결 방법은 각 제어기 정보를 참고하세요.)
    - 제어기의 전원이 켜져 있는지 확인합니다.
    - 제어기가 연결된 통신 포트가 바르게 선택되어 있는지 확인합니다.

3. 다운로드 메뉴를 선택합니다.

    ![](/assets/images/edu/bioloid/download_button.png)

    만약, 프로그램에 오류가 있다면 오류를 찾아 수정해야 합니다. (룰 체크 에러 메시지 확인)

4. 다운로드를 진행합니다.

    ![](/assets/images/edu/bioloid/download_progress_bar.png)

    만약 다운로드에 실패했다면 처음부터 다시 시도합니다.

5. 태스크 코드(Task Code)를 실행합니다. 로봇의 동작을 실행 합니다.  
  제어기를 켜고 다운로드 한 태스크 코드를 실행합니다. (태스크 코드 실행 방법은 각 제어기 정보를 참고하세요.)

[CM-5]: /docs/kr/parts/controller/cm-5/
[펌웨어 업데이트]: /docs/kr/software/rplus1/manager/#펌웨어-업데이트
[USB2DYNAMIXEL]: /docs/kr/parts/interface/usb2dynamixel/
