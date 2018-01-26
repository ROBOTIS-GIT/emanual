# 프로그래밍

## CM-530 하드웨어 포트맵

다음은 제어기의 하드웨어 주요 핀 기능을 표현해 놓은 하드웨어 포트맵입니다.

각 포트나 내부 기능은 STM32F10X 라이브러리에서 제공하는 매크로 함수를 통해 간단히 접근하여 제어할 수 있습니다.

### CM-530

![img](/assets/images/sw/sdk/embedded_066.png)
![img](/assets/images/sw/sdk/embedded_067.png)

| 핀 번호 | 핀 이름  | NET NAME    | 기능설명      	    | 핀 번호 | 핀 이름  | NET NAME   | 기능설명               |
| ----  | -------| ----------- | ------------------ | ----  | ----- | ------------| ------------------   |
| 1     | Vbat   | VCC_33L     | 3.3V 전원 공급       | 33    | PB12  | LED3         | LED AUX              |
| 2     | PC13   | LED0        | LED POWER          | 34   | PB13  | LED4         | LED MANAGE           |
| 3     | PC14   | LED_TX      | LED TX             | 35   | PB14  | LED5         | LED PROGRAM          |
| 4     | PC15   | LED_RX      | LED RX             | 36   | PB15  | LED6         | LED PLAY             |
| 5     | OSC_IN | XTAL1       | 크리스탈 INPUT        | 37   | PC6   | SIG_MOT3+    | 3번 외부포트 OUPUT      |
| 6     | OSC_OUT| XTAL2       | 크리스탈 OUTPUT       | 38   | PC7   | SIG_MOT3-    | 3번 외부포트 OUPUT      |
| 7     | NRST   | RESET       | RESET              | 39   | PC8   | SIG_MOT4+    | 4번 외부포트 OUPUT       |
| 8     | PC0    | SIG_ADC0    | ADC0 INPUT         | 40   | PC9   | SIG_MOT4-    | 4번 외부포트 OUPUT       |
| 9     | PC1    | ADC_SELECT0 | ANALOG MUX SELECT0 | 41   | PA8   | SIG_MOT5+    | 5번 외부포트 OUPUT       |
| 10    | PC2    | ADC_SELECT1 | ANALOG MUX SELECT1 | 42   | PA9   | NC           | RESERVED              |
| 11    | PC3    | VDD_VOLT    | 입력전압 ADC          | 43   | PA10  | NC           | RESERVED              |
| 12    | VSSA   | VSSA        | ADC 기준전압 3.3V     | 44   | PA11  | SIG_MOT5-    | 5번 외부포트 OUPUT       |
| 13    | VDDA   | VDDA        | ADC 기준전압 0V       | 45   | PA12  | ZIGBEE_RESET | Zigbee 모듈 ENABLE     |
| 14    | PA0    | SIG_MOT1+   | 1번 외부포트 OUPUT     | 46   | PA13  | USB_SLEEP    | USB 연결여부            |
| 15    | PA1    | SIG_MOT1-   | 1번 외부포트 OUPUT     | 47   | VSS2  | GND          | 0V 기준전압             |
| 16    | PA2    | SIG_MOT2+   | 2번 외부포트 OUPUT     | 48   | VDD2  | VCC_33L      | 3.3V 기준전압           |
| 17    | PA3    | SIG_MOT2-   | 2번 외부포트 OUPUT     | 49   | PA14  | SW_RT        | R 버튼                 |
| 18    | VSS4   | GND         | 0V 기준전압           | 50   | PA15  | SW_LF        | L 버튼                 |
| 19    | VDD4   | VCC_33L     | 3.3V 기준전압         | 51   | PC10  | SW_DN        | D 버튼                 |
| 20    | PA4    | NC          | RESERVED           | 52   | PC11  | SW_UP        | U 버튼                  |
| 21    | PA5    | SIG_ADC1    | ADC1 INPUT         | 53   | PC12  | ZIGBEE_TXD   | Zigbee로 전송            |
| 22    | PA6    | SIG_BUZZER  | 버저 OUTPUT         | 54   | PD2   | ZIGBEE_RXD   | Zigbee로부터 수신         |
| 23    | PA7    | NC          | RESERVED           | 55   | PB3   | SW_START     | START 버튼              |
| 24    | PC4    | SIG_MIC     | 마이크신호 INPUT      | 56   | PB4   | ENABLE_TX    | 다이나믹셀로 전송 ENABLE    |
| 25    | PC5    | NC          | RESERVED           | 57   | PB5   | ENABLE_RX    | 다이나믹셀로부터 수신 ENABLE |
| 26    | PB0    | NC          | RESERVED           | 58   | PB6   | DXL_TXD      | 다이나믹셀로 전송           |
| 27    | PB1    | NC          | RESERVED           | 59   | PB7   | DXL_RXD      | 다이나믹셀로부터 수신        |
| 28    | PB2    | BOOT1       | RESERVED           | 60   | BOOT0 | BOOT0        | RESERVED               |
| 29    | PB10   | PC_TXD      | PC 로 전송           | 61   | PB8   | SIG_MOT6+    | 6번 외부포트 OUPUT        |
| 30    | PB11   | PC_RXD      | PC 에서 수신          | 62   | PB9   | SIG_MOT6-    | 6번 외부포트 OUPUT        |
| 31    | VSS1   | GND         | 0V 기준전압           | 63   | VSS3  | GND          | 0V 기준전압              |
| 32    | VDD1   | VCC_33L     | 3.3V 기준전압         | 64   | VDD3  | VCC_33L      | 3.3V 기준전압            |


 CM-530의 외부 포트 핀 구성은 다음과 같습니다. 외부 포트 눈금 표시로 포트 1 ~ 포트 6을 확인할 수 있습니다.

포트와 관련된 자세한 사항은 [CM-530 제어기] 부분을 참조하십시오.

![img](/assets/images/sw/sdk/embedded_068.png)
![img](/assets/images/sw/sdk/embedded_069.png)

1.OUT1 : 3.3V 출력 가능 (최대 허용 전류 0.3A)
2.VCC (5V)
3.ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
4.GND
5.OUT2 : 3.3V 출력 가능 (최대 허용 전류 0.3A)

![img](/assets/images/sw/sdk/embedded_070.png)

## 프로젝트 열기

함께 제공되는 '01 LED' 프로젝트를 열어 보겠습니다.

Eclipse를 실행시키고 ‘File – New – Makefile Project with Existing Code’를 선택합니다.
![img](/assets/images/sw/sdk/embedded_071.png)

'Browse..' 버튼을 누르고, 압축을 풀어 놓은 폴더중 “01 LED”를 선택하고 "확인"을 눌러 완료합니다.
![img](/assets/images/sw/sdk/embedded_072.png)

프로젝트 생성 후에는 ‘Project – Clean, Build’를 한 번씩 실행 해 주십시오.
![img](/assets/images/sw/sdk/embedded_073.png)

위와 같이 실행 후에, Console창에서 제대로 수행 되었는지 확인 할 수 있습니다.
아래와 다르게 제대로 실행되지 않았을 경우에는, 개발환경 설치를 다시 한번 확인해 주시기 바랍니다.
![img](/assets/images/sw/sdk/embedded_074.png)

## bin 파일 다운로드 하기

build에 성공하면 bin파일이 예제 폴더에 생성됩니다.
제어기에 만든 펌웨어를 설치하기 위해서는 로보플러스 터미널과 제어기 부트로더를 이용해야 합니다.
펌웨어 설치 및 실행에 대한 자세한 내용은 부트로더에서 [프로그램 설치/실행] 부분을 참조하십시오.

## 부트로더

부트로더란, 제어기를 사용할 수 있도록 도와주는 프로그램입니다. 부트로더는 사용자가 지울 수 없으며 만약, 이 프로그램이 망가진다면 제어기를 사용할 수 없게됩니다. 부트로더는 공장 출하시 제어기에 설치된 상태로 생산됩니다.

부트로더에서 사용할 수 있는 명령은 'help' 명령으로 확인할 수 있습니다.
![img](/assets/images/sw/sdk/embedded_075.png)

### 부트로더 진입/나가기

#### 부트로더 진입

부트로더는 키보드의 '#'키(Shift+숫자3키)를 누르고 있는 상태에서 제어기를 켜거나 리셋 스위치를 눌러주면 진입할 수 있습니다.

성공하면 다음과 같이 화면이 나타납니다

![img](/assets/images/sw/sdk/embedded_076.png)

#### 부트로더 나가기

사용자 작업을 완료하면, GO명령으로 원하는 주소로 점프하거나, 제어기를 리셋하여 부트로더에서 나갈 수 있습니다.

### APP/SYS 사용법

APP/SYS 명령으로 프로그램 시작 위치를 설정할 수 있습니다. 프로그램 시작 위치가 설정되면, 제어기의 전원을 켜거나 리셋할 때, 설정된 프로그램 시작위치에서 프로그램이 실행됩니다.

Atmega2561을 사용하는 제어기의 메모리맵은 다음과 같습니다.

![img](/assets/images/sw/sdk/embedded_077.png)

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
![img](/assets/images/sw/sdk/embedded_078.png)

2. 로보플러스 터미널의 Files메뉴에서 Transmit file을 선택하고, 준비된 펌웨어(hex 파일)를 선택합니다.
![img](/assets/images/sw/sdk/embedded_079.png)

3. 파일이 전송됩니다. 파일이 전송되는 도중 제어기의 전원이 꺼지거나, 케이블이 빠지지 않도록 주의하십시오.

4. 파일 전송이 완료되면, **GO 명령을 사용하여 프로그램을 실행할 수 있습니다.**

- GO명령만 입력한 경우 0번지에서 프로그램을 실행하게 됩니다.
- G [Address] 와 같이 G 명령 뒤에 실행 주소(16진수)를 입력하면 그 위치부터 프로그램을 실행합니다.

## 부가설명

### 생성파일명

프로젝트를 빌드한 후 생성된 파일의 명칭은 "예제\Makefile" 에서 변경할 수 있습니다. 아래 그림과 같이 "Makefile" 에서 "MAIN_OUT = " 뒤에 원하는 파일명을 적으면 됩니다.
![img](/assets/images/sw/sdk/embedded_080.png)

### object file list

아래 그림과 같이 "예제\APP\src" 폴더에 있는 확장자가 "c"인 파일들에 해당하는 object file 명칭을 전부 "Makefile" 에 명시해야 합니다.
![img](/assets/images/sw/sdk/embedded_081.png)

### Firmware 시작 주소

아래의 메모리 맵(일부)와 같이 부트로더 영역과 펌웨어 영역이 나뉘여져 있습니다.
![img](/assets/images/sw/sdk/embedded_077.png)

펌웨어의 시작주소가 기본으로 0X8003000으로 되여있으나 유저가 변경할 수 있습니다.  
아래의 그림은 0X8003000로 설정할 때의 예를 보여줍니다.

1. stm32.ld 변경
![img](/assets/images/sw/sdk/embedded_082.png)

2. Vector table 변경
![img](/assets/images/sw/sdk/embedded_083.png)


[CM-530 제어기]: ??
[프로그램 설치/실행]: ??
[통신 포트를 설정]: ??
[부트로더 진입]: ??
