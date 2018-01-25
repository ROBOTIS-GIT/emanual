# Visual C#

Visual C#용 예제입니다.
이 예제는 Visual Studio 2010에서 테스트 되었습니다.

## 환경 설정

예제를 실행하기 위해서는 C++에서 환경 설정을 해주어야 합니다.

### 경로 등록하기

Visual Studio 프로젝트에서 사용 할 API의 위치를 등록해 주어야 합니다.

1. 메뉴에서 프로젝트 -> 속성을 선택합니다.
![img](/assets/images/sw/sdk/visual_2.gif)

2. 구성 속성 -> VC++ 디렉터리 선택합니다.
![img](/assets/images/sw/sdk/visual_3.gif)

3. 포함 디렉터리를 편집합니다.
![img](/assets/images/sw/sdk/visual_1.gif)

4. 포함 디렉터리에 Dynamixel SDK가 설치된 폴더의 import 폴더를 추가해 줍니다.
(상대경로 또는 절대경로 모두 가능)

    > (예 : ..\..\..\import 또는 C:\DynamixelSKD\import)

    ![img](/assets/images/sw/sdk/visual_4.gif)

5. 같은 방법으로 라이브러리 디렉터리에도 import 폴더를 추가해 줍니다.
  최종적으로 아래와 같이 됩니다.
![img](/assets/images/sw/sdk/visual_5.gif)

### Dynamixel API 사용하기

![img](/assets/images/sw/sdk/visual_6.gif)

### 환경 변수 설정하기 혹은 DLL 복사

환경 변수 설정하기에 dynamixel2_win32.dll 혹은 dynamixel2_win64.dll 파일의 위치를 PATH 항목에 추가하지 않았다면, 실행 파일이 있는 폴더에 해당 dll 파일을 복사해 주어야 실행이 가능합니다.
