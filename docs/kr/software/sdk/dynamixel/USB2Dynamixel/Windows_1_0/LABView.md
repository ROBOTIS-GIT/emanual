# LabView

LabView용 예제입니다.
본 예제는 LabView 2009에서 테스트 되었으며, 소스는 LabView 8.0 호환용으로 작성되었습니다.

## 환경 설정

이 예제를 실행하기 위해서는 LabView에서 다이나믹셀 제어 명령을 사용할 수 있도록 DLL파일을 반입해야 합니다. DLL파일 반입 과정은 다음과 같습니다.

### DLL 반입

Dynamixel SDK를 LabView에서 사용하기 위해서는Library 반입 과정을 거쳐야 합니다. 다음과 같은 방법으로 LabView에 Library를 반입할 수 있습니다.

1. LabView 초기 실행 화면에서 Tools - Import - Shared Library (.dll)... 메뉴를 선택합니다.
![img](/assets/images/sw/sdk/labview02.png)

2. Create VIs for a shared library를 선택하고 Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview03.png)

3. Dynamixel SDK 폴더 안에 있는 dynamixel.dll과 dynamixel.h를 선택합니다.
![img](/assets/images/sw/sdk/labview07.png)

4. Next 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview08.png)

5. Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview09.png)

6. 특별한 이유가 없다면 다음과 같이 기본값을 그대로 둔 상태로 Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview10.png)

7. Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview11.png)

8. 특별한 이유가 없다면 다음과 같이 기본값을 그대로 둔 상태로 Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview12.png)

9. 생성될 내용을 나타냅니다. Next버튼을 클릭합니다.
![img](/assets/images/sw/sdk/labview13.png)

10. 지금까지 설정한 내용을 바탕으로 vi파일을 생성합니다.
![img](/assets/images/sw/sdk/labview14.png)

11. Dynamixel SDK의 vi파일 생성이 완료되었습니다.
![img](/assets/images/sw/sdk/labview15.png)

12. 다음과 같이 LabView User Libraries 메뉴를 통해 Dynamixel SDK 함수를 호출할 수 있습니다.
![img](/assets/images/sw/sdk/labview16.png)

## Read/Write Example

다이나믹셀의 Read / Write예제입니다.

### 준비

USB2Dynamixel의 통신 모드를 환경에 맞게 선택합니다.

![img](/assets/images/sw/sdk/u2d_select.png)

스위치 위치에 따른 통신 모드에 대한 정보는 다음과 같습니다.

1 - TTL Mode

AX-Series, MX(TTL)-Series 와 같은 3핀 케이블을 사용하는 장치와 통신할 수 있습니다.

2 - RS485 Mode

DX-Series, RX-Series, EX-Series, MX(RS485)-Series 등 4핀 케이블을 사용하는 장치와 통신할 수 있습니다.

3 - RS232 Mode

CM-5, CM-510 등과 같이 시리얼 케이블을 사용하는 장치와 통신할 수 있습니다.

1개의 다이나믹셀이 USB2Dynamixel에 연결되어 있어야 합니다.
사용하는 다이나믹셀은 ID 는 1, 통신 속도는 1Mbps로 설정되어야 합니다.

### 소스

사용자의 환경에 맞게 포트 번호를 맞춰야 합니다. 기본 값은 COM3으로 설정되어 있습니다.

![img](/assets/images/sw/sdk/labviewexample1.png)

### 결과

버튼을 눌러 시작한 후, 다이얼을 돌리면 모터가 움직이며 현재 위치 값이 게이지로 표현됩니다.

![img](/assets/images/sw/sdk/example01.png)

## Sync Write Example

### 준비

3개의 다이나믹셀이 USB2Dynamixel에 연결되어야 합니다.
각  다이나믹셀은 ID는 1,2,3이고 통신 속도는 1Mbps로  설정 되어야 합니다.

### 소스

사용자의 환경에 맞게 포트 번호를 맞춰야 합니다. 기본 값은 COM3으로 설정되어 있습니다.

![img](/assets/images/sw/sdk/labviewexample2.png)

### 결과

버튼을 눌러서 시작하면, 3개의 모터가 서로 위상차를 보이며 Sine곡선으로 제어됩니다.

![img](/assets/images/sw/sdk/example02.png)
