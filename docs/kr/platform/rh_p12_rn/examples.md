# [예제](#예제)

## [준비](#준비)

### 장치 (RH-P12-RN) 설정

예제 실행을 위해 아래와 같이 장치의 컨트롤 테이블 값을 변경해야 함.
* ID = 1
* Baudrate = 2 Mbps

장치의 컨트롤 테이블 값을 변경하기 위해서는 윈도우의 경우 [R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) 을
사용할 수 있으며, 리눅스의 경우 Dynamixel SDK 에 예제 중 [DXL Monitor](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/sample_code/cpp_dxl_monitor/#cpp-dxl-monitor) 를 사용할 수 있음.

### 통신 포트 설정
윈도우의 경우 예제의 통신 포트가 기본값으로 "**COM4**"로 되어 있음.
연결된 통신 장치가 COM4 가 아닐 경우 설정에서 통신 포트를 COM4 로 변경하거나,
소스 상의 DEVICE_NAME 값을 변경해야 함.  
리눅스의 경우 예제의 통신 포트가 "**/dev/ttyUSB0**"로 되어 있음.
연결된 통신 장치가 /dev/ttyUSB0 가 아닐 경우 소스 상에서 DEVICE_NAME 값을 변경해야 함.

> RH-P12-RN_Example/rh-p12-rn.cpp

```cpp
...

#if defined(__linux__)
#define DEVICE_NAME             "/dev/ttyUSB0"
#elif defined(_WIN32) || defined(_WIN64)
#define DEVICE_NAME             "COM4"
#endif

...
```

## [윈도우 예제](#윈도우-예제)

윈도우 예제를 실행하면 아래와 같이 연결된 장치의 포트 이름과 Baudrate 가 표시되며 실행 됨.  
실행에 실패할 경우 실패 메시지를 확인하고, 장치 설정 혹은 통신 포트 설정을 변경해야 함.  
![img](/assets/images/platform/rh_p12_rn/windows_example_run.png)

장치(RH-P12-RN)가 전류기반 위치 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  
![img](/assets/images/platform/rh_p12_rn/windows_example_position_mode.png)

장치가 토크 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  
![img](/assets/images/platform/rh_p12_rn/windows_example_torque_mode.png)

- 위/아래 방향 커서 키를 이용하여 입력란을 이동할 수 있음.  
- 스페이스 키를 이용하여 MODE / TORQUE / CONTROL 을 체크/언체크 할 수 있음.  
- ( ) 안의 단축키를 누르면 해당 위치에서 스페이스 키를 누른 것과 동일하게 동작 함.  
- PARAMETERS 값을 변경하기 위해서는 '[' 키와 ']' 키를 이용하여 1 씩 값을 증감시킬 수 있으며, "{" 키와 "}" 키를 이용하여 10 씩 값을 증감시킬 수 있음.  

각 입력란의 동작은 아래와 같음.

++ MODE ++
* (C) torque control mode : 체크 시 토크 제어 모드로 동작
* (P) current based position control mode : 체크 시 전류기반 위치 제어 모드로 동작

++ TORQUE ++
* (T) torque ON / OFF : 체크 시 토크 켜짐, 언체크 시 토크 꺼짐

++ CONTROL ++
* (O) Open : 체크 시 손가락을 열고, 다시 언체크 됨.
* (L) Close : 체크 시 손가락을 닫고, 다시 언체크 됨.
* (A) Open & Close auto repeat : 체크 시 자동으로 손가락을 열었다 닫았다를 반복함.
* (G) go to goal position : 체크 시 PARAMETERS 의 goal position 값이 변경되면 즉시 반영 됨.

++ PARAMETERS ++
* goal torque : 값이 변경되면 장치의 goal torque 에 해당 값을 write 함.
* goal velocity : 값이 변경되면 장치의 goal velocity 에 해당 값을 write 함.
* goal acceleration : 값이 변경되면 장치의 goal acceleration 에 해당 값을 write 함.
* goal position : 위 (G) go to goal position 이 체크되어 있을 경우 값이 변경되면 장치의 goal position 에 해당 값을 write 함.


# [리눅스 예제](#리눅스-예제)

리눅스 예제를 실행하면 아래와 같이 연결된 장치의 포트 이름과 Baudrate 가 표시되며 실행 됨.  
실행에 실패할 경우 실패 메시지를 확인하고, 장치 설정 혹은 통신 포트 설정을 변경해야 함.  
![img](/assets/images/platform/rh_p12_rn/linux_example_run.png)

장치(RH-P12-RN)가 전류기반 위치 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  
![img](/assets/images/platform/rh_p12_rn/linux_example_position_mode.png)

장치가 토크 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  
![img](/assets/images/platform/rh_p12_rn/linux_example_torque_mode.png)

각 입력란의 입력 방법 및 동작은 윈도우 예제와 동일함.


# [ROS GUI 예제](#ROS-GUI-예제)

장치가 전류기반 위치 제어 모드로 실행 중일 경우 ROS GUI 예제 화면은 아래와 같음.  
![img](/assets/images/platform/rh_p12_rn/ros_example_position_mode.png)

장치가 토크 제어 모드로 실행 중일 경우 ROS GUI 예제 화면은 아래와 같음.  
![img](/assets/images/platform/rh_p12_rn/ros_example_torque_mode.png)

각 입력란의 동작은 윈도우/리눅스 예제와 동일함.
