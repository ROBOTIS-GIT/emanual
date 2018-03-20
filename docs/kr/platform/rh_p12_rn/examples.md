---
layout: archive
lang: kr
ref: rh_p12_rn_examples
read_time: true
share: true
author_profile: false
permalink: /docs/kr/platform/rh_p12_rn/examples/
sidebar:
  title: RH-P12-RN
  nav: "rh_p12_rn"
---

<div style="counter-reset: h1 5"></div>

# [예제](#예제)

## [장치 설정(RH-P12-RN)](#장치-설정rh-p12-rn)

예제 실행을 위해 아래와 같이 장치의 컨트롤 테이블 값을 변경해야 함.
* ID = 1
* Baudrate = 2 Mbps

장치의 컨트롤 테이블 값을 변경하기 위해서는 윈도우의 경우 [R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) 을
사용할 수 있으며, 리눅스의 경우 Dynamixel SDK 에 예제 중 [DXL Monitor](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/sample_code/cpp_dxl_monitor/#cpp-dxl-monitor) 를 사용할 수 있음.

## [통신포트 설정](#통신포트-설정)
윈도우의 경우 예제의 통신 포트가 기본값으로 "**COM4**"로 되어 있음.  
연결된 통신 장치가 COM4 가 아닐 경우 설정에서 통신 포트를 COM4 로 변경하거나, 소스 상의 DEVICE_NAME 값을 변경해야 함.  
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

## [윈도우즈 예제](#윈도우즈-예제)

### 다운로드
GIT client 프로그램으로 [https://github.com/ROBOTIS-GIT/RH-P12-RN_Example](https://github.com/ROBOTIS-GIT/RH-P12-RN_Example) 다운로드 혹은
[https://github.com/ROBOTIS-GIT/RH-P12-RN_Example/archive/master.zip](https://github.com/ROBOTIS-GIT/RH-P12-RN_Example/archive/master.zip) 파일 다운로드 후 압축 해제

### 빌드 및 실행
윈도우 예제는 Visual Studio 2017 로 작성되었음.  
Visual Studio 를 설치하고, RH-P12-RN_Example\win64\RH-P12-RN-Example.sln 파일을 더블클릭하여 솔루션을 열고, 솔루션 빌드 후 실행.

Windows SDK 버전이 달라서 아래와 같은 에러가 발생할 경우 
```
error MSB8036: Windows SDK 버전 10.0.14393.0을(를) 찾을 수 없습니다. 필요한 버전의 Windows SDK를 설치하거나, 솔루션을 마우스 오른쪽 단추로 클릭하고 [솔루션 대상 변경]을 선택하거나 프로젝트 속성 페이지에서 SDK 버전을 변경하세요.
```

프로젝트의 속성 페이지에서 아래와 같이 Windows SDK 버전을 설치된 버전으로 변경 후 다시 빌드 후 실행.  
![img](/assets/images/platform/rh_p12_rn/windows_sdk_ver.png)


윈도우 예제를 실행하면 아래와 같이 연결된 장치의 포트 이름과 Baudrate 가 표시되며 실행 됨.  
실행에 실패할 경우 실패 메시지를 확인하고, 장치 설정 혹은 통신 포트 설정을 변경해야 함.  

![img](/assets/images/platform/rh_p12_rn/windows_example_execute.png)

장치(RH-P12-RN)가 전류기반 위치 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  

![img](/assets/images/platform/rh_p12_rn/windows_example_position_mode.png)

장치가 전류제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  

![img](/assets/images/platform/rh_p12_rn/windows_example_current_mode.png)

* 위/아래 `방향 커서` 키를 이용하여 입력란을 이동할 수 있음.  
* `스페이스` 키를 이용하여 MODE / TORQUE / CONTROL 을 체크/언체크 할 수 있음.  
* ( ) 안의 단축키를 누르면 해당 위치에서 `스페이스` 키를 누른 것과 동일하게 동작 함.  
* PARAMETERS 값을 변경하기 위해서는 `[` 키와 `]` 키를 이용하여 1 씩 값을 증감시킬 수 있으며, `{` 키와 `}` 키를 이용하여 10 씩 값을 증감시킬 수 있음.  

각 입력란의 동작은 아래와 같음.

`++ MODE ++`
* (C) current control mode : 체크 시 전류제어 모드로 동작
* (P) current based position control mode : 체크 시 전류기반 위치 제어 모드로 동작

`++ TORQUE ++`
* (T) torque ON / OFF : 체크 시 토크 켜짐, 언체크 시 토크 꺼짐

`++ CONTROL ++`
* (O) Open : 체크 시 손가락을 열고, 다시 언체크 됨.
* (L) Close : 체크 시 손가락을 닫고, 다시 언체크 됨.
* (A) Open & Close auto repeat : 체크 시 자동으로 손가락을 열었다 닫았다를 반복함.
* (G) go to goal position : 체크 시 PARAMETERS 의 goal position 값이 변경되면 즉시 반영 됨.

`++ PARAMETERS ++`
* goal current : 값이 변경되면 장치의 goal current 에 해당 값을 write 함.
* goal velocity : 값이 변경되면 장치의 goal velocity 에 해당 값을 write 함.
* goal acceleration : 값이 변경되면 장치의 goal acceleration 에 해당 값을 write 함.
* goal position : 위 (G) go to goal position 이 체크되어 있을 경우 값이 변경되면 장치의 goal position 에 해당 값을 write 함.


## [리눅스 예제](#리눅스-예제)

### 준비
Dynamixel SDK 가 설치되어 있어야 함. 아래와 같이 다운로드 받아 설치할 것.
```
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK
$ cd DynamixelSDK/c++/build/linux64
$ sudo make install
```

/dev/ttyUSB0 의 접근 권한을 얻기 위해 아래 명령을 입력 (USER_ID 를 dialout 그룹에 등록하는 명령)
```
$ sudo usermod -aG dialout USER_ID  
```
이제 리눅스를 재시작하거나 로그아웃 후 다시 로그인 하면 USER_ID 가 dialout 그룹에 등록되어 /dev/ttyUSB0 의 접근 권한을 얻게 됨. 

### 다운로드

```
$ git clone https://github.com/ROBOTIS-GIT/RH-P12-RN_Example
```

### 빌드
```
$ cd RH-P12-RN_Example/linux64
$ make
```

### 실행
```
$ ./rh-p12-rn_example
```

리눅스 예제를 실행하면 아래와 같이 연결된 장치의 포트 이름과 Baudrate 가 표시되며 실행 됨.  
실행에 실패할 경우 실패 메시지를 확인하고, 장치 설정 혹은 통신 포트 설정을 변경해야 함.  

![img](/assets/images/platform/rh_p12_rn/linux_example_execute.png)

장치(RH-P12-RN)가 전류기반 위치 제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  

![img](/assets/images/platform/rh_p12_rn/linux_example_position_mode.png)

장치가 전류제어 모드로 실행 중일 경우 아래와 같은 화면이 표시 됨.  

![img](/assets/images/platform/rh_p12_rn/linux_example_current_mode.png)

각 입력란의 입력 방법 및 동작은 윈도우 예제와 동일함.


## [ROS GUI 예제](#ROS-GUI-예제)

### 준비
/dev/ttyUSB0 의 접근 권한을 얻기 위해 아래 명령을 입력 (USER_ID 를 dialout 그룹에 등록하는 명령)
```
$ sudo usermod -aG dialout USER_ID  
```
이제 리눅스를 재시작하거나 로그아웃 후 다시 로그인 하면 USER_ID 가 dialout 그룹에 등록되어 /dev/ttyUSB0 의 접근 권한을 얻게 됨. 

### 다운로드
```
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework
$ git clone https://github.com/ROBOTIS-GIT/ROBOTIS-Framework-msgs
$ git clone https://github.com/ROBOTIS-GIT/RH-P12-RN
```

### 빌드
```
$ cd ~/catkin_ws
$ catkin_make
```

### 실행
터미널을 띄워 아래 명령으로 manager 실행
```
$ roslaunch rh_p12_rn_manager rh_p12_rn_manager.launch
```
새로운 터미널을 띄워 아래 명령으로 GUI 예제 실행
```
$ rosrun rh_p12_rn_gui rh_p12_rn_gui
```

장치가 전류기반 위치 제어 모드로 실행 중일 경우 ROS GUI 예제 화면은 아래와 같음.  

![img](/assets/images/platform/rh_p12_rn/ros_example_position_mode.png)

장치가 전류제어 모드로 실행 중일 경우 ROS GUI 예제 화면은 아래와 같음.  

![img](/assets/images/platform/rh_p12_rn/ros_example_current_mode.png)

각 입력란의 동작은 윈도우/리눅스 예제와 동일함.
