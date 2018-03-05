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
