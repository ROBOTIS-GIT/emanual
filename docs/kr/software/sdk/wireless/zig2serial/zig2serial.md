# Zigbee SDK for Windows

Windows용 Zigbee SDK를 다운로드 받을 수 있습니다.

`download` [ZIGBEE_SDK_Win32_ v1_02.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_win32_v1_02.zip)
`download` [ZIGBEE_SDK_Win64_ v1_02.zip](http://support.robotis.com/ko/baggage_files/zigbee_sdk/zigbee_sdk_win64_v1_02.zip)

- 시스템 요구 사항
  - OS : Windows XP /Vista /7 (32/64bit)
  - [Zig2Serial]이 반드시 필요
  - DLL 로딩이 되지 않는 경우 : Microsoft Visual C++ 2005 재배포가능 패키지 설치 필요

## 폴더 구성

Zigbee SDK for Windows의 폴더 구조는 다음과 같습니다.

/bin      : 윈도우용 DLL파일이 들어있습니다.
/import   : 프로그래밍할때 필요한 파일들이 있습니다.
/src      : DLL 소스가 들어있습니다.
/example  : 사용자의 프로그래밍 환경에 맞게 Zigbee를  제어하는 예제들이 들어있는 곳입니다.

## 환경 변수 설정하기

Zigbee SDK로 개발된 프로그램이 실행하려면 zigbee.dll이 반드시 필요합니다.

zigbee.dll은 Zigbee SDK안에 bin폴더에 들어있습니다.

Windows의 환경 변수로 zigbee.dll의 위치를 등록하면 프로그램 실행시 dll이 필요하지 않게 됩니다.
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

- [Visual C++]
- [Visual Basic]
- [Visual C#]

[Zig2Serial]: ??
[Visual C++]: ??
[Visual Basic]: ??
[Visual C#]: ??
