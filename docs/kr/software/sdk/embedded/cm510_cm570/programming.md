# 프로그래밍

## 하드웨어 포트맵

다음은 제어기의 하드웨어 주요 핀 기능을 표현해 놓은 하드웨어 포트맵입니다.
각 포트나 내부 기능은 Atmel Studio에서 제공하는 매크로 함수를 통해 간단히 접근하여 제어할 수 있습니다.

### CM-510

![img](/assets/images/sw/sdk/embedded_030.png)


| Port Name       | Function                         |
| --------------- | -------------------------------- |
| PORTF1 ~ PORTF6 | ADC                              |
| PORTD0          | Start Button                     |
| PORTD1          | MIC.                             |
| PORTD2 ~ PORTD3 | Tx, Rx                           |
| PORTA2 ~ PORTA7 | External Output ( 5 Pin Port)    |
| PORTC0 ~ PORTC6 | Controller LED ( Status, Power ) |
| PORTB5          | Buzzer Control Port              |
| PORTE4 ~ PORTE7 | Direction Button (U, D, L, R)    |
| PORTD4 ~ PORTD6 | Communication Control Port       |

CM-510의 외부 포트 핀 구성은 다음과 같습니다. 외부 포트 눈금 표시로 포트 1 ~ 포트 6을 확인할 수 있습니다.

포트와 관련된 자세한 사항은 [CM-510 제어기] 부분을 참조하십시오.

- 아래와 같이 5개의 핀 중, 3번 ADC핀이 마이크로 컨트롤러의 PORTF1 ~ PORTF6과 대응되어 있습니다.
  예를 들어, 아래의 외부포트 3에 대응되는 ADC핀은 마이크로 컨트롤러의 PORTF3과 연결되어 있습니다.
- 아래와 같이 5개의 핀 중, 1번 OUT핀이 마이크로 컨트롤러의 PORTA2 ~ PORTA7과 대응되어 있습니다.
  예를 들어, 아래의 외부포트 3에 대응되는 OUT핀은 마이크로 컨트롤러의 PORTA4과 연결되어 있습니다.

![img](/assets/images/sw/sdk/embedded_031.png)

1. OUT : 5V 출력 가능
2. VCC (5V)
3. ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
4. GND
5. NC : 사용하지 않음

![img](/assets/images/sw/sdk/embedded_032.png)

### CM-700

![img](/assets/images/sw/sdk/embedded_033.png)

| Port Name       | Function                         |
| --------------- | -------------------------------- |
| PORTF1 ~ PORTF6 | ADC                              |
| PORTD0          | Start Button                     |
| PORTD1 ~ PORTD2 | Tx, Rx                           |
| PORTA2 ~ PORTA7 | External Output ( 5 Pin Port)    |
| PORTC0 ~ PORTC6 | Controller LED ( Status, Power ) |

CM-700의 외부 포트 핀 구성은 다음과 같습니다. Sub보드의 아래면에 표시된 문자로 포트 1 ~ 포트 6을 확인할 수 있습니다.

포트와 관련된 자세한 사항은 [CM-700 제어기] 부분을 참조하십시오.

- 아래와 같이 5개의 핀 중, 3번 ADC핀이 마이크로 컨트롤러의 PORTF1 ~ PORTF6과 대응되어 있습니다.
- 아래와 같이 5개의 핀 중, 1번 OUT핀이 마이크로 컨트롤러의 PORTA2 ~ PORTA7과 대응되어 있습니다.
 ![img](/assets/images/sw/sdk/embedded_034.jpg)

1. OUT : 5V 출력 가능
2. VCC (5V)
3. ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
4. GND
5. NC : 사용하지 않음
![img](/assets/images/sw/sdk/embedded_035.png)

## 기본 프로그래밍

Atmel Studio에서 간단한 임베디드 C 예제를 만드는 방법을 설명합니다.

### 프로젝트 만들기

프로젝트를 만드는 과정은 다음과 같습니다.

1. File 메뉴에서 New -> Project를 선택합니다.
![img](/assets/images/sw/sdk/embedded_036.gif)

2. Template은 GCC C Executable Project를 선택하고 Name, Location, Solution name 항목을 설정합니다. 설정이 끝나면 [OK] 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/embedded_037.gif)

3. 여러 디바이스 목록 중에서 ATmega2561을 선택합니다.(CM5는 ATmega128 선택) 디바이스를 선택 하였다면 [OK] 버튼을 클릭합니다.
![img](/assets/images/sw/sdk/embedded_038.gif)

### 코드 작성 및 컴파일하기

다음 예제는 가장 기본적인 PORT I/O 제어에 관한 내용입니다.

1. 생성된 프로젝트에 다음과 같은 코드를 작성합니다.
2. Build 메뉴에서 [Build Solution]을 클릭하여 Build 명령을 실행합니다.
![img](/assets/images/sw/sdk/embedded_039.gif)

3. 아래 Output 창에 Build succeeded가 나타나면 컴파일이 정상적으로 끝난 경우입니다.
프로젝트 폴더 내의 default 폴더에서 펌웨어 파일인 hex 파일을 찾을 수 있습니다.
![img](/assets/images/sw/sdk/embedded_040.gif)

### hex파일 다운로드 하기

- 제어기에 만든 펌웨어를 설치하기 위해서는 [로보플러스 터미널]과 [제어기 부트로더]를 이용해야 합니다.
- 펌웨어 설치 및 실행에 대한 자세한 내용은 [부트로더에서 프로그램 설치/실행] 부분을 참조하십시오.
- 정상적으로 펌웨어가 설치되면, 모든 LED가 돌아가면서 켜지는 것을 확인할 수 있습니다.

## 부트로더

부트로더란, 제어기를 사용할 수 있도록 도와주는 프로그램입니다. 부트로더는 사용자가 지울 수 없으며 만약, 이 프로그램이 망가진다면 제어기를 사용할 수 없게됩니다. 부트로더는 공장 출하시 제어기에 설치된 상태로 생산됩니다.

부트로더에서 사용할 수 있는 명령은 'help' 명령으로 확인할 수 있습니다.
![img](/assets/images/sw/sdk/embedded_041.png)

#### 부트로더 진입/나가기

#### 부트로더 진입

부트로더는 키보드의 '#'키(Shift+숫자3키)를 누르고 있는 상태에서 제어기를 켜거나 리셋 스위치를 눌러주면 진입할 수 있습니다.

성공하면 다음과 같이 화면이 나타납니다

![img](/assets/images/sw/sdk/embedded_044.png)

#### 부트로더 나가기

사용자 작업을 완료하면, GO명령으로 원하는 주소로 점프하거나, 제어기를 리셋하여 부트로더에서 나갈 수 있습니다.

#### APP/SYS 사용법

APP/SYS 명령으로 프로그램 시작 위치를 설정할 수 있습니다. 프로그램 시작 위치가 설정되면, 제어기의 전원을 켜거나 리셋할 때, 설정된 프로그램 시작위치에서 프로그램이 실행됩니다.

Atmega2561을 사용하는 제어기의 메모리맵은 다음과 같습니다.

![img](/assets/images/sw/sdk/embedded_045.png)

- 부트로더로 진입한 후 명령창에 APP 명령을 입력하면, 다음번 리셋 후 유저 어플리케이션 영역부터 실행됩니다.
(기본 제공 펌웨어, 사용자 프로그램 등 대부분의 프로그램들은 특별한 이유가 없다면 0번지부터 시작됩니다.)

- 부트로더로 진입한 후 명령창에 SYS 명령을 입력하면, 다음번 리셋 후 부트로더가 실행됩니다.
('#'키를 누르지 않아도 부트로더상태로 시작됩니다.)

### 프로그램 설치/실행

제어기 펌웨어를 설치하기 위한 준비 작업은 다음과 같습니다.

- 설치할 제어기 펌웨어(hex 파일)를 준비합니다.
- PC와 제어기를 연결합니다.
- 로보플러스 터미널을 실행하여 [통신 포트를 설정])합니다.
- 제어기 부트로더를 실행합니다. ([부트로더 진입] 방법 참고)

준비가 완료되면 다음과 같은 절차로 제어기 펌웨어를 설치할 수 있습니다.

1. 부트로더에서 L명령(혹은 Load)을 입력합니다.
![img](/assets/images/sw/sdk/embedded_042.png)

2. 로보플러스 터미널의 Files메뉴에서 Transmit file을 선택하고, 준비된 펌웨어(hex 파일)를 선택합니다.
![img](/assets/images/sw/sdk/embedded_043.png)

3. 파일이 전송됩니다. 파일이 전송되는 도중 제어기의 전원이 꺼지거나, 케이블이 빠지지 않도록 주의하십시오.

4. 파일 전송이 완료되면, **GO 명령을 사용하여 프로그램을 실행할 수 있습니다.**

- GO명령만 입력한 경우 0번지에서 프로그램을 실행하게 됩니다.
- G [Address] 와 같이 G 명령 뒤에 실행 주소(16진수)를 입력하면 그 위치부터 프로그램을 실행합니다.

[CM-510 제어기]: ??
[CM-700 제어기]: ??
[로보플러스 터미널]: ??
[제어기 부트로더]: ??
[부트로더에서 프로그램 설치/실행]: ??
[통신 포트를 설정]: ??
[부트로더 진입]: ??
