# Dynamixel SDK for Windows

Windows 용 Dynamixel SDK 를 이하의 링크에서 다운로드 하실 수 있습니다.

- 최신 버전
 통신 1.0 DXL을 사용 할 경우 아래의 SDK를 다운 받습니다.
 <https://github.com/ROBOTIS-GIT/DynamixelSDK>
 통신 2.0 DXL을 사용 할 경우 아래의 SDK를 다운 받습니다.
 <https://github.com/ROBOTIS-GIT/DynamixelSDK>

- 이전 버전
  통신 1.0 DXL을 사용 할 경우 아래의 SDK를 다운 받습니다.
  `다운로드` [DXL_SDK_Win32_ v1_02.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_win32_v1_02.zip)
  `다운로드` [DXL_SDK_Win64_ v1_02.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_win64_v1_02.zip)
  통신 2.0 DXL을 사용 할 경우 아래의 SDK를 다운 받습니다.
  `다운로드`[DXL_SDK_Win32_ v2_02.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_win32_v2_02.zip)
  `다운로드`[DXL_SDK_Win64_ v2_02.zip](http://support.robotis.com/ko/baggage_files/dynamixel_sdk/dxl_sdk_win64_v2_02.zip)

```
로보티즈의 Dynamixel SDK 는 3-clause BSD license 하에 사용하실 수 있습니다.
BSD License 의 내용은 아래를 참조하세요.

Software License Agreement (BSD License)

Copyright (c) 2014, ROBOTIS Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of ROBOTIS nor the names of its contributors may be
      used to endorse or promote products derived from this software
      without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY ROBOTIS "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL ROBOTIS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

- 시스템 요구 사항
   - OS : Windows XP/Vista/7 (32/64bit)
   - [USB2Dynamixel]이 반드시 필요
   - DLL 로딩이 되지 않는 경우 : Microsoft Visual C++ 2005 재배포가능 패키지 설치 필요

## USB2Dynamixel 드라이버 설치

1. PC 에 장치를 연결합니다. 드라이버가 설치되어 있지 않을 경우 새 하드웨어 검색 마법사 시작 창이 뜹니다.
   목록 또는 특정 위치에서 설치(고급)(S) -> 다음(N)
    ![img](/assets/images/sw/sdk/ln101_driverinstall_01.png)
2. 드라이버의 위치를 지정합니다.
   RoboPlus 를 설치한 경우 드라이버는 RoboPlus 설치 폴더의 LN101 폴더에 있습니다.
   또는 최신 버전의 드라이버를 설치하고자 하는 경우 [FTDI Driver Download](http://www.ftdichip.com/Drivers/VCP.htm) 페이지에서 VCP Drivers 의 최신 버전을 받으시면 됩니다.
   `다운로드` [Windows 32bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)
   `download `[Windows 64bit 드라이버 설치](http://www.ftdichip.com/Drivers/CDM/CDM%202.08.24%20WHQL%20Certified.zip)
   ![img](/assets/images/sw/sdk/ln101_driverinstall_02.png)
   ![img](/assets/images/sw/sdk/ln101_driverinstall_03.png)
3. 다음(N) 을 누르면 설치가 진행되며 USB Serial Converter 의 드라이버 설치가 완료됩니다.
   ![img](/assets/images/sw/sdk/ln101_driverinstall_06.png)
4. 동일한 방법으로 USB Serial Port 드라이버도 설치해 줍니다.
   ![img](/assets/images/sw/sdk/ln101_driverinstall_05.png)

## 응답 속도 설정

USB2Dynamixel과 다이나믹셀의 통신 응답속도를 빠르게 하기 위해서는 응답 속도를 재설정 해야합니다.
응답속도 설정 방법은 다음과 같습니다.

1. 제어판 - 시스템 - 장치관리자 로 들어가면 다음과 같이 USB Serial Port를 찾을 수 있습니다.
![img](/assets/images/sw/sdk/timesetting1.png)

2. 등록 정보 화면의 포트 설정 탭에서 고급 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/timesetting2.png)

3. BM관련 설정 부분에 응답 시간 조정을 다음 그림과 같이 1로 설정하고 확인 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/timesetting3.png)

## 폴더 구성

Dynamixel SDK for Windows의 폴더 구조는 다음과 같습니다.

/bin      : 윈도우용 DLL파일이 들어있습니다.
/import   : 프로그래밍할때 필요한 파일들이 있습니다.
/src      : DLL 소스가 들어있습니다.
/example  : 사용자의 프로그래밍 환경에 맞게 다이나믹셀을 제어하는 예제들이 들어있는 곳입니다.



## 환경 변수 설정하기

Dynamixel SDK로 개발된 프로그램이 실행하려면 dynamixel.dll이 반드시 필요합니다.

dynamixel.dll은 Dynamixel SDK안에 bin폴더에 들어있습니다.

Windows의 환경 변수로 dynamixel.dll의 위치를 등록하면 프로그램 실행시 dll이 필요하지 않게 됩니다.
만약, 환경 변수로 dll 위치를 등록하지 않으려면 프로그램과 dll을 같이 배포해야 합니다.

1. 제어판 - 시스템 -  고급 탭에 들어가면 다음과 같이 환경 변수 버튼을 찾을 수 있습니다.
![img](/assets/images/sw/sdk/env1.png)

2. 시스템 변수에서 Path 항목을 찾고, 편집 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/env2.png)

3. 예제 폴더 아래, bin 폴더를 기존 변수값 끝에 세미콜론과 함께 추가합니다.
기존 변수값이 변경되거나 삭제되지 않도록  주의하십시오.
아래 예제는 DLL파일의 위치가 C:\Project\bin이라 가정하고 추가한 내용입니다.
![img](/assets/images/sw/sdk/env3.png)


## 예제 목록

프로그래밍 환경에 따른 예제는 다음 링크를 참조하십시오.

- Dynamixel 통신 1.0
  - [Visual C++]
  - [Visual Basic]
  - [Visual C#]
  - [MATLAB]
  - [LabView]
- Dynamixel 통신 2.0
  - [Visual C++]
  - [Visual C#]


[USB2Dynamixel]: ??
[Visual C++]: ??
[Visual Basic]: ??
[Visual C#]: ??
[MATLAB]: ??
[LabView]: ??
[Visual C++]: ??
[Visual C#]: ??
