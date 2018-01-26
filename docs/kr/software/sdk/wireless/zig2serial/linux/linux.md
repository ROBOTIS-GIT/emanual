# Zigbee SDK for Linux

Linux용 Zigbee SDK를 다운로드 받을 수 있습니다.

`download` [ZIGBEE_SDK_LINUX_ v1_00.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_linux_v1_00.zip)

- 시스템 요구 사항
  - OS : Linux Kernel 2.6.21 이상 권장
  - [USB2Dynamixel] 과 [Zig2Serial]이 반드시 필요


## 폴더 구성

Zigbee SDK for Linux의 폴더 구조는 다음과 같습니다.

/include : Zigbee SDK를 사용하기 위한 헤더 파일이 있습니다.
/src     : Zigbee SDK 소스 파일이 있습니다.
/lib     : 컴파일된 라이브러리 파일이 있습니다.
/example : Zigbee를 제어하는 예제들이 들어있는 곳입니다.

## Zigbee SDK Build

ZigbeeSDK/src 폴더에서 make 명령어로 build 하면 library가 빌드되어 ZigbeeSDK/lib 폴더로 자동으로 복사됩니다.

## 예제 목록

Example 은 Send/Receive를 제공하며, ZigbeeSDK/example 폴더 아래의 Send_Receive 폴더로 이동하여 make 명령어를 통해 빌드하면 됩니다.

모든 예제는 /dev/ttyUSB0 를 기본 device 로 사용하도록 되어 있습니다.

예제는 다음 링크를 참조하십시오.

- [Zigbee SDK linux-gcc Example]

[USB2Dynamixel]: ??
[Zig2Serial]: ??
[Zigbee SDK linux-gcc Example]: ??
