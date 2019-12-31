---
layout: archive
lang: kr
ref: embedded_c_cm510
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/embedded_sdk/embedded_c_cm510/
sidebar:
  title: 임베디드 C(CM-510/700)
  nav: "embedded_c_cm510"
---

# [개요](#개요)

임베디드 C는 사용자가 직접 제어기 펌웨어를 개발할 수 있는 솔루션입니다. 임베디드 C는 다음과 같은 특징이 있습니다.

- 모든 소스가 C언어로 작성되어 있습니다.
- 제어기 각 부분을 직접 제어하는 예제를 제공합니다.

**참고**: 임베디드 C를 사용하려면 하드웨어 및 소프트웨어에 대한 전문적인 지식이 필요합니다. 초보자의 경우 전문 지식을 별도로 습득한 후, 사용하는 것을 권장합니다.
{: .notice}

**참고**: 임베디드 C를 사용하게 되면 제어기 펌웨어가 바뀌어서 로보플러스를 사용할 수 없게됩니다. 다시 로보플러스를 사용하기 위해서는 로보플러스 매니저로 펌웨어 복구를 시도해야 합니다.
{: .notice}

# [CM-510, CM-700](#cm-510-cm-700)

- `다운로드` [CM-510 SDK]
- `다운로드` [CM-700 SDK]

[CM-510 SDK]: http://support.robotis.com/en/baggage_files/embeded_c/embeded_c(cm510_v1.02).zip
[CM-700 SDK]: http://support.robotis.com/en/baggage_files/embeded_c/embeded_c(cm700_v1.02).zip

## 폴더 구조

- `../include`  : 라이브러리 사용시 필요한 헤더파일이 있습니다.
- `../src`       : 라이브러리 소스가 있습니다.
- `../lib`       : 라이브러리 파일이 있는 곳입니다.
- `../example`   : 제어기에서 실행할 수 있는 예제들입니다.

## [시작하기](#시작하기)

임베디드 C를 시작하기 위한 방법을 설명합니다.

### [WinAVR 설치](#winavr-설치)

WinAVR은 AVR 프로그래밍을 위해서 필요한 프로그램입니다.  
WinAVR은 다음 사이트에서 다운로드 받을 수 있으며, 누구나 무료로 사용 가능합니다.  
[http://winavr.sourceforge.net/](http://winavr.sourceforge.net/)

설치 과정은 다음과 같습니다.

1. 설치 언어를 설정합니다.

    ![](/assets/images/sw/sdk/embedded_001.png)

2. 설치 초기 화면입니다.

    ![](/assets/images/sw/sdk/embedded_002.png)

3. 라이센스 관련 내용입니다. 동의 하여야 설치를 진행할 수 있습니다.

    ![](/assets/images/sw/sdk/embedded_003.png)

4. 설치 폴더를 설정합니다. 사용자가 원하는 곳으로 설정하고 Next버튼을 누릅니다.

    ![](/assets/images/sw/sdk/embedded_004.png)

5. 설치할 프로그램 및 환경 옵션을 선택합니다. 특별한 사유가 없다면 모두 설치하는 것이 좋습니다.

    ![](/assets/images/sw/sdk/embedded_005.png)

6. WinAVR 설치를 시작합니다.

    ![](/assets/images/sw/sdk/embedded_006.png)

7. WinAVR설치가 완료되었습니다.

    ![](/assets/images/sw/sdk/embedded_007.png)

### [Atmel Studio 설치](#atmel-studio-설치)

Atmel Studio는 AVR 프로그래밍을 쉽게 할 수 있도록 여러가지 매크로와 라이브러리 및 통합 환경을 제공합니다.  
Atmel Studio는 다음 사이트에서 다운로드 받을 수 있으며, 누구나 무료로 사용 가능합니다.  
[http://www.atmel.com/dyn/products/tools_card.asp?tool_id=2725](http://www.atmel.com/dyn/products/tools_card.asp?tool_id=2725)

Atmel Studio의 설치 과정은 다음과 같습니다.

1. Atmel Studio설치 시작화면입니다.

    ![](/assets/images/sw/sdk/embedded_008.png)

2. 라이센스 관련 내용입니다. 동의 하여야 설치를 진행할 수 있습니다.

    ![](/assets/images/sw/sdk/embedded_009.png)

3. 설치 폴더를 설정합니다. 사용자가 원하는 곳으로 설정하고 Next버튼을 누릅니다.

    ![](/assets/images/sw/sdk/embedded_010.png)

4. Next를 클릭하여 설치를 진행합니다.

    ![](/assets/images/sw/sdk/embedded_011.png)

5. Atmel Studio 설치를 시작합니다.

    ![](/assets/images/sw/sdk/embedded_012.png)

6. Atmel Studio 설치가 완료되었습니다.

    ![](/assets/images/sw/sdk/embedded_013.png)

### [환경 설정](#환경-설정)

임베디드 C를 사용하려면 설치한 프로그램의 기본적인 환경을 설정해야 합니다.  
WinAVR을 설치하고 Atmel Studio를 설치하면 특별한 경우가 아닌 한 Atmel Studio만을 이용하여 프로그래밍을 할 수 있습니다.  
일반적으로 PC와 제어기가 시리얼 케이블로 연결되어 있으면 기본적인 예제 실행이 가능하며, 예제에 따라 다이나믹셀이 필요하거나, 그 외 외부 장치가 요구될 때도 있습니다.

1. Debug - Options and Settings 를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_014.png)

2. 왼쪽 메뉴에서 Toolchain을 선택합니다. Atmel AVR 8-bit (C language)를 선택합니다. Add Flavour을 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_015.png)

3.  [...]을 클릭하여 20100110버전의 WinAVR이 설치 되어 있는 폴더의 bin폴더를 선택하여 줍니다. 예) c:WinAVR-20100110bin

    ![img](/assets/images/sw/sdk/embedded_016.png)

4. Win AVR 을 선택한후 OK 버튼을 누릅니다.

    ![img](/assets/images/sw/sdk/embedded_017.png)

5. File > Open > Project/Solution 을 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_018.png)

6. 예제 파일을 선택하고 열기를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_019.png)

7. 오른쪽 Solution Explorer에 보이는 c파일을 더블 클릭하여 선택합니다. Project > Properties를 클릭 합니다.  
  Solution Explorer가 보이지 않는다면 View 에서 Solution Explorer를 선택해주세요.

    ![img](/assets/images/sw/sdk/embedded_020.png)

8. 왼쪽 메뉴에서 Toolchain을 클릭합니다. Directories를 클릭합니다. 초록색 +모양의 Add Item을 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_021.png)

9. Include 폴더를 선택하여 줍니다. 예) c:embedded_c(cm700_v1.01)include

    ![img](/assets/images/sw/sdk/embedded_022.png)

10. Include 폴더가 추가된 것을 확인 할 수 있습니다.

    ![img](/assets/images/sw/sdk/embedded_023.png)

11. 오른쪽 Solution Explorer에서 프로젝트 파일을 오른쪽 클릭하여 Add Library를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_024.png)

12. Browse Libraries를 클릭합니다. 오른쪽 하단에 [Browse]를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_025.png)

13. 라이브러리를 선택 하기 위해 예제에 포함되어 있는 lib 폴더를 선택하고 [열기]를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_026.png)

14. 3개의 라이브러리를 추가하기 위해 드래그하여 모두 선택하고 오른쪽 아래 [열기]를 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_027.png)

15. 3개의 라이브러리가 추가된 것을 확인 할 수 있습니다.

    ![img](/assets/images/sw/sdk/embedded_028.png)

16. Build -> Rebuild Solution 을 클릭하여 컴파일하고 아래Output창에 Build Succeeded.가 확인되면 모든 작업이 끝나게 됩니다.

    ![img](/assets/images/sw/sdk/embedded_029.png)

### [로보플러스 복구하기](#로보플러스-복구하기)

임베디드 C로 만들어진 결과물은 제어기 펌웨어(hex 파일) 입니다.  
이것을 설치하면 기존의 제어기 펌웨어가 지워져서 로보플러스를 사용할 수 없게됩니다.  
만약, 로보플러스를 다시 사용하려면 공장 출하시 제어기 펌웨어를 설치해야 합니다.  
로보플러스 매니저를 이용하면 공장 출하시 제어기 펌웨어를 쉽게 설치할 수 있습니다.  
자세한 사항은 로보플러스 매니저의 [펌웨어 복구하기]를 참조하십시오.

## [프로그래밍](#프로그래밍)

### <a name="하드웨어-포트맵"></a>[하드웨어 포트맵](#하드웨어-포트맵)

다음은 제어기의 하드웨어 주요 핀 기능을 표현해 놓은 하드웨어 포트맵입니다.  
각 포트나 내부 기능은 Atmel Studio에서 제공하는 매크로 함수를 통해 간단히 접근하여 제어할 수 있습니다.

#### CM-510

![img](/assets/images/sw/sdk/embedded_030.png)

| Port Name       | Function                         |
|:----------------|:---------------------------------|
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

#### CM-700

![img](/assets/images/sw/sdk/embedded_033.png)

| Port Name       | Function                         |
|:----------------|:---------------------------------|
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

### [기본 프로그래밍](#기본-프로그래밍)

Atmel Studio에서 간단한 임베디드 C 예제를 만드는 방법을 설명합니다.

#### 프로젝트 만들기

프로젝트를 만드는 과정은 다음과 같습니다.

1. File 메뉴에서 New > Project를 선택합니다.

    ![img](/assets/images/sw/sdk/embedded_036.gif)

2. Template은 GCC C Executable Project를 선택하고 Name, Location, Solution name 항목을 설정합니다. 설정이 끝나면 [OK] 버튼을 클릭합니다.

    ![img](/assets/images/sw/sdk/embedded_037.gif)

3. 여러 디바이스 목록 중에서 ATmega2561을 선택합니다.(CM5는 ATmega128 선택) 디바이스를 선택 하였다면 [OK] 버튼을 클릭합니다.

  ![img](/assets/images/sw/sdk/embedded_038.gif)

#### 코드 작성 및 컴파일하기

다음 예제는 가장 기본적인 PORT I/O 제어에 관한 내용입니다.

1. 생성된 프로젝트에 다음과 같은 코드를 작성합니다.
2. Build 메뉴에서 [Build Solution]을 클릭하여 Build 명령을 실행합니다.

    ![img](/assets/images/sw/sdk/embedded_039.gif)

3. 아래 Output 창에 Build succeeded가 나타나면 컴파일이 정상적으로 끝난 경우입니다. 프로젝트 폴더 내의 default 폴더에서 펌웨어 파일인 hex 파일을 찾을 수 있습니다.

    ![img](/assets/images/sw/sdk/embedded_040.gif)

#### hex파일 다운로드 하기

- 제어기에 만든 펌웨어를 설치하기 위해서는 [로보플러스 터미널]과 [제어기 부트로더]를 이용해야 합니다.
- 펌웨어 설치 및 실행에 대한 자세한 내용은 부트로더에서 [프로그램 설치/실행] 부분을 참조하십시오.
- 정상적으로 펌웨어가 설치되면, 모든 LED가 돌아가면서 켜지는 것을 확인할 수 있습니다.

### <a name="부트로더"></a>[부트로더](#부트로더)

부트로더란, 제어기를 사용할 수 있도록 도와주는 프로그램입니다. 부트로더는 사용자가 지울 수 없으며 만약, 이 프로그램이 망가진다면 제어기를 사용할 수 없게됩니다. 부트로더는 공장 출하시 제어기에 설치된 상태로 생산됩니다.

부트로더에서 사용할 수 있는 명령은 'help' 명령으로 확인할 수 있습니다.

![img](/assets/images/sw/sdk/embedded_041.png)

#### 부트로더 진입/나가기

##### 부트로더 진입

부트로더는 키보드의 '#'키(Shift+숫자3키)를 누르고 있는 상태에서 제어기를 켜거나 리셋 스위치를 눌러주면 진입할 수 있습니다.  
성공하면 다음과 같이 화면이 나타납니다

![img](/assets/images/sw/sdk/embedded_044.png)

##### 부트로더 나가기

사용자 작업을 완료하면, GO명령으로 원하는 주소로 점프하거나, 제어기를 리셋하여 부트로더에서 나갈 수 있습니다.

#### APP/SYS 사용법

APP/SYS 명령으로 프로그램 시작 위치를 설정할 수 있습니다. 프로그램 시작 위치가 설정되면, 제어기의 전원을 켜거나 리셋할 때, 설정된 프로그램 시작위치에서 프로그램이 실행됩니다.

Atmega2561을 사용하는 제어기의 메모리맵은 다음과 같습니다.

![img](/assets/images/sw/sdk/embedded_045.png)

- 부트로더로 진입한 후 명령창에 APP 명령을 입력하면, 다음번 리셋 후 유저 어플리케이션 영역부터 실행됩니다.  
  (기본 제공 펌웨어, 사용자 프로그램 등 대부분의 프로그램들은 특별한 이유가 없다면 0번지부터 시작됩니다.)

- 부트로더로 진입한 후 명령창에 SYS 명령을 입력하면, 다음번 리셋 후 부트로더가 실행됩니다.  
  ('#'키를 누르지 않아도 부트로더상태로 시작됩니다.)

#### <a name="프로그램-설치실행"</a>[프로그램 설치/실행]

제어기 펌웨어를 설치하기 위한 준비 작업은 다음과 같습니다.

- 설치할 제어기 펌웨어(hex 파일)를 준비합니다.
- PC와 제어기를 연결합니다.
- 로보플러스 터미널을 실행하여 통신 포트를 설정합니다.
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

## [예제](#예제)

### [LED 제어](#led-제어)

제어기의 각 LED를 제어할 수 있습니다.

- 준비물
  - CM-510 혹은 700

- 이론
  - 제어기의 마이크로 컨트롤러는 I/O포트를 통해 제어기와 연결된 LED등의 주변 장치를 제어할 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 LED를 제어해 볼 수 있습니다.  
  - 예제에서는 제어기의 PORTC를 사용합니다. 제어기 포트맵을 확인하시기 바랍니다.

- 소스

    ```c
    PORTC = ~(1 << i);
    _delay_ms(250);
    ```

  - PORTC를 제어하여 제어기의 LED를 순서대로 켭니다.

- 결과
  - 제어기의 모든 LED가 순차적으로 점등됩니다.

### [버튼](#버튼)

제어기 버튼 입력을 받을 수 있습니다.

- 준비물 : CM-510 혹은 700

- 이론
  - 제어기의 마이크로 컨트롤러의 I/O포트를 통해 제어기와 연결된 장치의 전기적 신호를 읽을 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 스위치의 눌림 상태를 확인할 수 있습니다.  
  - 제에서는 제어기의 PORTC와 PORTE를 사용합니다. 제어기 포트맵을 확인하시기 바랍니다.

- 소스
  - CM-510 예제

    ```c
    if(~PINE & BTN_UP)
      PORTC &= ~LED_MANAGE;
    else if(~PINE & BTN_DOWN)
      PORTC &= ~LED_AUX;
    else if(~PINE & BTN_LEFT)
      PORTC &= ~LED_PROGRAM;
    else if(~PINE & BTN_RIGHT)
      PORTC &= ~LED_PLAY;
    else if(~PIND & BTN_START)
      PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
    else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
    ```

    PORTD와 PORTE를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.  
    PORTD와 PORTE를 통해 입력값을 얻는 방법은 PIND와 PINE 매크로 함수를 사용합니다.  
    PIND와 PINE는 1바이트이며, 각 비트에는 PORTD, PORTE의 핀이 대응되어 있습니다.  
    따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.

  - CM-700 예제

    ```c
    if(~PIND & BTN_START)
      PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
    else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
    ```

    PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.  
    PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.  
    PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.  
    따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.

- 결과 : 버튼을 누르면, 눌린 버튼에 따라 서로 다른 LED가 켜집니다.

### [시리얼 통신](#시리얼-통신)

PC와 제어기가 시리얼 통신을 할 수 있습니다.

- 준비물
  - 제어기의 시리얼 케이블이 PC와 연결된 상태.
  - 예제의 통신 속도는 57600bps로 설정되어 있습니다.

- 이론
  - 시리얼 통신은 제어기의 값을 PC로 전송하여 사용자에게 보여줄 수 있는 가장 기본적인 수단입니다. 이 예제를 통해 제어기와 시리얼 통신을 해볼 수 있습니다.

- 소스

    ```c
    serial_initialize(57600); // USART Initialize
    sei(); // set enable interrupt
    ```

    시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.

    sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.

    ![img](/assets/images/sw/sdk/embedded_046.png)

    ```c
    unsigned char ReceivedData = getchar();
    if(ReceivedData == 'u')
      Value++;
    else if(ReceivedData == 'd')
      Value--;
    printf("%d\r\n", Value);
    ```

    받은 무선 데이터가 u인 경우 1을 더하고, d인 경우 1을 빼서 출력하는 부분입니다.  
    getchar()함수를 이용하여 데이터를 수신합니다. 만약, 데이터가 수신되지 않았으면 대기합니다.

- 결과
  - 키보드로 'u'키를 입력하면 제어기에서 현재 기억된 숫자에 1을 더하여 출력하며, 'd'키를 입력하면 1을 빼서 출력합니다.

    ![img](/assets/images/sw/sdk/embedded_047.png)

### [버저](#버저)

제어기의 버저를 사용할 수 있습니다.

- 준비물
  - CM-510 (CM-700은 버저가 없습니다.)

- 이론
  - 마이크로 컨트롤러의 I/O 포트를 통해 버저 회로의 신호를 제어할 수 있습니다. 버저는 신호 주파수를 조절하여 서로 다른 음계를 연주할 수 있습니다.
  - 예제에서는 제어기의 PORTB와 PORTC, PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.
  - 음계과 주파수의 관계는 다음을 참조하십시오.
  - 시간은 주파수의 역수입니다. 주파수를 시간으로 변환하는 공식은 다음과 같습니다.

    `시간(초) =  1 / (주파수)`

| 옥타브<br>/Scale | 1       | 2        | 3        | 4        | 5        | 6        | 7        | 8        |
|:-------------------------|:--------|:---------|:---------|:---------|:---------|:---------|:---------|:---------|
| C                        | 32.7032 | 65.4064  | 130.8128 | 261.6256 | 523.2511 | 1046.502 | 2093.005 | 4186.009 |
| C#                       | 34.6478 | 69.2957  | 138.5913 | 277.1826 | 554.3653 | 1108.731 | 2217.461 | 4434.922 |
| D                        | 36.7081 | 73.4162  | 146.8324 | 293.6648 | 587.3295 | 1174.659 | 2349.318 | 4698.636 |
| D#                       | 38.8909 | 77.7817  | 155.5635 | 311.1270 | 622.2540 | 1244.508 | 2489.016 | 4978.032 |
| E                        | 41.2034 | 82.4069  | 164.8138 | 329.6276 | 659.2551 | 1318.510 | 2637.020 | 5274.041 |
| F                        | 43.6535 | 87.3071  | 174.6141 | 349.2282 | 698.4565 | 1396.913 | 2793.826 | 5587.652 |
| F#                       | 46.2493 | 92.4986  | 184.9972 | 369.9944 | 739.9888 | 1479.978 | 2959.955 | 5919.911 |
| G                        | 48.9994 | 97.9989  | 195.9977 | 391.9954 | 783.9909 | 1567.982 | 3135.963 | 6271.927 |
| G#                       | 51.9130 | 103.8262 | 207.6523 | 415.3047 | 830.6094 | 1661.219 | 3322.438 | 6644.875 |
| A                        | 55.0000 | 110.0000 | 220.0000 | 440.0000 | 880.0000 | 1760.000 | 3520.000 | 7040.000 |
| A#                       | 58.2705 | 116.5409 | 233.0819 | 466.1638 | 932.3275 | 1864.655 | 3729.310 | 7458.620 |
| G                        | 61.7354 | 123.4708 | 246.9417 | 493.8833 | 987.7666 | 1975.533 | 3951.066 | 7902.133 |

> 단위 : Hz

- 소스
  - CM-510예제입니다. 버저가 없는 CM-700에서는 적용할 수 없습니다.

    ```c
    if(~PIND & SW_START)
    {
      PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
      _delay_ms(1);
      PORTB |= 0x20;
      _delay_ms(1);
      PORTB &= ~0x20;
    }
    else
    {
      PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
      PORTB &= ~0x20;
    }
    ```

  PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTB와 PORTC를 제어하여 LED 및 버저를 켜고 끄는 부분입니다.  
  PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.  
  PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.  
  따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.  
  Start 버튼이 눌린 경우 모든 LED를 켬과 동시에 PORTB를 통해 버저를 울립니다.

- 결과
  - Start 버튼을 누르는 동안 모든 LED가 켜지고 버저에서 같은 음으로 계속 소리가 납니다.

### [마이크](#마이크)

제어기의 마이크를 사용하여 외부 소리를 감지할 수 있습니다.

- 준비물
  - CM-510 (CM-700은 마이크가 없습니다.)

- 이론
  - 마이크 회로는 일정 크기 이상의 소리를 감지하면 마이크로 컨트롤러의 I/O포트에 신호를 발생하게 됩니다. 이 신호를 감지하여 외부 소리를 감지할 수 있습니다.
  - 예제에서는 제어기의 PORTC와 PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

- 소스
  - CM-510예제입니다. **마이크가 없는 CM-700에서는 적용할 수 없습니다.**

    ```c
    if(~PIND & MIC_SIGNAL)
    {
      PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
      _delay_ms(1000);
    }
    else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
    ```

    PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.  
    PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.  
    PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.  
    따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.  
    PORTD를 통해 마이크 신호가 감지되면 모든 LED를  켜고, 1초동안 대기합니다.

- 결과
  - 마이크에 소리가 감지되면, 1초 동안 모든 LED가 켜졌다 꺼집니다.

### [적외선 센서](#적외선-센서)

외부포트의 ADC를 사용하는 법을 배웁니다. (본 예제에서는 적외선 센서를 사용하여 설명합니다.)

- 준비물
  - CM-510 혹은 700, [적외선 센서] (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

- 이론
  - 제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 적외선 센서나 자이로 센서 등의 아날로그 전압값을 읽어올 수 있습니다.
  - 예제에서는 제어기의 PORTA를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  serial_initialize(57600);
  sei();
  ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1); // ADC Enable, Clock 1/64div.
  ADMUX = ADC_PORT_1; // ADC Port 1 Select
  ```

  시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.  
  sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.  
  그외 ADC제어를 위한 레지스터 설정이 있는데, 이는 Atmega2561 데이터 시트를 참조하십시오.  
  데이터시트는 [http://www.atmel.com](http://www.atmel.com/) 에서 다운로드 받을 수 있습니다.

  ![img](/assets/images/sw/sdk/embedded_048.png)

  ```c
  PORTA &= ~0x80; // ADC Port 1 IR ON

  _delay_us(12); // Short Delay for rising sensor signal
  ADCSRA |= (1 << ADIF); // AD-Conversion Interrupt Flag Clear
  ADCSRA |= (1 << ADSC); // AD-Conversion Start

  while( !(ADCSRA & (1 << ADIF)) ); // Wait until AD-Conversion complete

  PORTA = 0xFC; // IR-LED Off

  printf( "%d\r\n", ADC); // Print Value on USART
  _delay_ms(50);
  ```

  PORTA를 통해 감지된 아날로그 신호를 분석하여 시리얼로 전송하는 부분입니다.  
  우선 PORTA의 1번 IR LED를 켜고, 수광된 빛의 양을 디지털값으로 변환을 시작합니다.  
  변환이 끝나면, IR LED를 끄고, 시리얼 통신으로 값을 전송합니다.

- 결과
  - PC와 시리얼로 연결 되어있을 때, 화면에 IR센서값을 출력합니다.

### [다이나믹셀 읽기/쓰기](#다이나믹셀-읽기쓰기)

다이나믹셀의 위치를 읽거나 설정할 수 있습니다. (보다 자세한 사항은 다이나믹셀 SDK를 확인 하세요)

- 준비물
  - 제어기와 다이나믹셀이 연결된 상태
  - 이 예제는 다이나믹셀 ID가 1일 때 동작합니다.

- 이론
  - 다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

- 소스

  ```c
  unsigned short GoalPos[2] = {0, 1023};
  //unsigned short wGoalPos[2] = {0, 4095}; // for EX series
  ```

  EX 106+과 같이 위치 범위가 0~4,095인 액츄에이터는 위쪽 줄을 주석처리 하고, 아래 줄을 주석 해제하여 주십시오.

  ```c
  serial_initialize(57600);
  dxl_initialize( 0, DEFAULT_BAUDNUM ); // Not using device index
  sei(); // Interrupt Enable
  ```

  시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.  
  sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.  
  dxl_initialize() 함수의 경우 인자로 device index와 통신 속도를 넘겨주면, 제어기의 통신 환경을 초기화합니다.  
  DEFAULT_BAUDNUM은 1입니다.  
  특별한 경우가 아니면 device index는 0입니다.

  ```c
  // Check moving done
  bMoving = dxl_read_byte( id, P_MOVING );
  CommStatus = dxl_get_result();
  if( CommStatus == COMM_RXSUCCESS )
  {
    if( bMoving == 0 )
    {
      // Change goal position
      if( index == 0 )
        index = 1;
      else
        index = 0;
      // Write goal position
      dxl_write_word( id, P_GOAL_POSITION_L, GoalPos[index] );
    }
    PrintErrorCode();

    // Read present position
    wPresentPos = dxl_read_word( id, P_PRESENT_POSITION_L );
    printf( "%d   %d\n",GoalPos[index], wPresentPos );
  }
  else
  PrintCommStatus(CommStatus);
  ```
  다이나믹셀을 특정 위치로 보냄과 동시에 현재 위치를 읽어오는 부분입니다.  
  먼저, 현재 움직임 상태를 읽고 모터가 움직이지 않는 상태이면 dxl_write_word()함수를 통해 설정된 위치로 이동 명령을 내립니다.  
  dxl_write_word()함수의 인자는 각각 (연결된 다이나믹셀 id, address, position 값) 입니다.  
  이후, 현재 위치를 읽어와 시리얼 통신으로 전송합니다.

- 결과
  - 다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

### [다이나믹셀 동기 제어](#다이나믹셀-동기-제어)

여러개의 다이나믹셀을 동기화하여 제어할 수 있습니다. (보다 자세한 사항은 [다이나믹셀 SDK]를 확인 하세요)

- 준비물
  - 제어기와 다이나믹셀이 연결된 상태
  - 이 예제는 다이나믹셀 ID가 1부터 순차적으로 3까지 설정되어 있을 때 동작합니다.

- 이론
  - 다이믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

- 소스

  ```c
  int AmpPos = 512;
  //int AmpPos = 2048; // for EX series
  ```

  EX 106+와 같이 위치 범위가 0~4,095인 액츄에이터는 위쪽 줄을 주석처리 하고, 아래 줄을 주석 해제하여 주십시오.

  ```c
  serial_initialize(57600);
  dxl_initialize( 0, DEFAULT_BAUDNUM ); // Not using device index
  sei(); // Interrupt Enable
  ```

  시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.  
  sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.  
  dxl_initialize() 함수의 경우 인자로 device index와 통신 속도를 넘겨주면, 제어기의 통신 환경을 초기화합니다.  
  DEFAULT_BAUDNUM은 1입니다.  
  특별한 경우가 아니면 device index는 0입니다.

  ```c
  for( i=0; i < NUM_ACTUATOR; i++ )
  {
    id[i] = i+1;
    phase[i] = 2*PI * (float)i / (float)NUM_ACTUATOR;
  }
  // Set goal speed
  dxl_write_word( BROADCAST_ID, P_GOAL_SPEED_L, 0 );
  // Set goal position
  dxl_write_word( BROADCAST_ID, P_GOAL_POSITION_L, AmpPos );
  _delay_ms(1000);
  ```

  각 다이나믹셀의 초기 위치를 계산 및 위치 초기화하는 부분입니다.  
  dxl_write_word()함수를 이용해 모든 다이나믹셀의 속도를 최대속도로 설정하고, 위치를 중앙 위치로 설정합니다.

  ```c
  // Make syncwrite packet
  dxl_set_txpacket_id(BROADCAST_ID);
  dxl_set_txpacket_instruction(INST_SYNC_WRITE);
  dxl_set_txpacket_parameter(0, P_GOAL_POSITION_L);
  dxl_set_txpacket_parameter(1, 2);
  for( i=0; i < NUM_ACTUATOR; i++ )
  {
    dxl_set_txpacket_parameter(2+3*i, id[i]);
    GoalPos = (int)((sin(theta+phase[i]) + 1.0) * (float)AmpPos);
    printf( "%d  ", GoalPos );
    dxl_set_txpacket_parameter(2+3*i+1, dxl_get_lowbyte(GoalPos));
    dxl_set_txpacket_parameter(2+3*i+2, dxl_get_highbyte(GoalPos));
  }
  dxl_set_txpacket_length((2+1)*NUM_ACTUATOR+4);
  ```

  패킷 생성 부분입니다. 패킷의 구조는 [다이나믹셀 패킷 구조]를 참조하십시오. 연결된 모든 액츄에이터의 패킷을 생성하고 전송합니다.

  ```c
  printf( "\n" );

  dxl_txrx_packet();
  CommStatus = dxl_get_result();
  if( CommStatus == COMM_RXSUCCESS )
    PrintErrorCode();
  else
    PrintCommStatus(CommStatus);

  theta += STEP_THETA;
  if( theta > 2*PI )
    theta -= 2*PI;
  _delay_ms(CONTROL_PERIOD);
  ```
  결과 패킷 수신 후 에러가 있다면 에러 코드를 출력합니다. 위치 경계값 계산하여, 경계값을 초과하면 증감 방향을 반대로 전환합니다.

- 결과
  - 여러개의 다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

### [RC100과 ZIGBee](#rc100과-zigbee)

RC-100을 이용하여 제어기를 동작시킬 수 있습니다. (보다 자세한 사항은 [Zigbee SDK]를 확인 하세요)

- 준비물
  - CM-510 혹은 700
  - [Zig-100/110] 1쌍
  - [RC-100]

- 이론
  - Zig100이 장착되어있는 RC100 리모컨으로 제어기를 제어할 수 있습니다.
  - 예제에서는 제어기의 PORTC와 PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ![img](/assets/images/sw/sdk/embedded_049.png)

  ZigBee 사용을 위한 환경 설정. PORTD의 환경을 다음과 같이 설정해야 함.

  ```c
  PORTD &= ~0x80; //PORT_LINK_PLUGIN = 0;   // no pull up
  PORTD &= ~0x20; //PORT_ENABLE_RXD_LINK_PC = 0;
  PORTD |= 0x40; //PORT_ENABLE_RXD_LINK_ZIGBEE = 1;
  ```

  ZigBee 통신을 사용하기 위해 초기화 하는 부분입니다. 초기화 함수는 Zigbee 라이브러리에 포함되어 있으며, 인자로 device index를 전달하면 Zigbee가 초기화 됩니다. 특별한 경우가 아니면, device index는 0입니다.  
  sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.

  ```c
  if(zgb_rx_check() == 1)
  {
    RcvData = zgb_rx_data();
    if(RcvData & RC100_BTN_1)
      PORTC &= ~LED_MANAGE;
    else
      PORTC |= LED_MANAGE;
    if(RcvData & RC100_BTN_2)
      PORTC &= ~LED_PROGRAM;
    else
      PORTC |= LED_PROGRAM;
    if(RcvData & RC100_BTN_3)
      PORTC &= ~LED_PLAY;
    else
      PORTC |= LED_PLAY;
  }
  ```

  [zgb_rx_data()]함수를 이용하여 Zigbee모듈에 수신된 데이터를 읽어옵니다.  
  수신 패킷이 RC100버튼이면, RC100의 눌린 버튼에 따라 PORTC를 제어하여 제어기의 LED를 켜거나 끕니다.  

  **주의**: ZigBee와 시리얼통신 라이브러리를 같은 소스에서 사용하면 UART공유로 인해 충돌이 일어납니다. 만약, 동시 사용을 원한다면 소스를 수정해야 합니다.
  {: .notice--warning}

- 결과
  - Zigbee가 정상적으로 연결된 경우, RC-100의 버튼을 누를 때 마다 제어기의 LED가 켜졌다 꺼집니다.

[제어기 포트맵]: #하드웨어-포트맵
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[다이나믹셀 SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[다이나믹셀 패킷 구조]: /docs/kr/dxl/protocol1/
[zgb_rx_data()]: /docs/kr/software/embedded_sdk/zigbee_sdk/#zgb-rx-data
[Zig-100/110]: /docs/kr/parts/communication/zig-110/
[RC-100]: /docs/kr/parts/communication/rc-100/
[CM-510 제어기]: /docs/kr/parts/controller/cm-510/
[CM-700 제어기]: /docs/kr/parts/controller/cm-700/
[로보플러스 터미널]: /docs/kr/software/rplus1/terminal/
[제어기 부트로더]: #부트로더
[부트로더에서 프로그램 설치/실행]: #프로그램-설치실행
[부트로더 진입]: #부트로더
