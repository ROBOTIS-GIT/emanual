---
layout: archive
lang: kr
ref: embedded_c_cm530
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/embedded_sdk/embedded_c_cm530/
sidebar:
  title: 임베디드 C(CM-530)
  nav: "embedded_c_cm530"
---

# [개요](#개요)

임베디드 C는 사용자가 직접 제어기 펌웨어를 개발할 수 있는 솔루션입니다. 임베디드 C는 다음과 같은 특징이 있습니다.

- 모든 소스가 C언어로 작성되어 있습니다.
- 제어기 각 부분을 직접 제어하는 예제를 제공합니다.

**NOTE** : 임베디드 C를 사용하려면 하드웨어 및 소프트웨어에 대한 전문적인 지식이 필요합니다. 초보자의 경우 전문 지식을 별도로 습득한 후, 사용하는 것을 권장합니다. 
{: .notice}

**NOTE** : 임베디드 C를 사용하게 되면 제어기 펌웨어가 바뀌어서 로보플러스를 사용할 수 없게됩니다. 다시 로보플러스를 사용하기 위해서는 로보플러스 매니저로 펌웨어 복구를 시도해야 합니다.
{: .notice}


# [CM-530](#cm-530)

- `다운로드` [CM-530 SDK]

[CM-530 SDK]: http://support.robotis.com/ko/baggage_files/embeded_c/embeddec_c(cm530_v1_02).zip

## 폴더 구조

- `..` : stm32f10x_conf.h, Makefile, stm32.ld 세 파일 및 하기 폴더들이 있습니다.
- `../stm32f10x_lib` : 라이브러리 파일이 있습니다.
- `../APP/inc`     : 라이브러리외 예제완성에 필요한 헤더파일이 있습니다.
- `../APP/src`     : 라이브러리외 예제완성에 필요한 소스파일이 있습니다.

## [시작하기](#시작하기)

**NOTE** : Windows 8.1,10을 사용중 설치에 error 발생경우 여기를 클릭해 다운로드로와 압축 해제가 끝나면 파일을 C:\WinARM\utils\bin 에 복사하십시요. (기존에 있든 파일을 대체하면 됩니다.) **(EX error :/usr/bin/sh: fork: Resource temporarily unavailable)** 
{:. notice}

### [JRE 설치](#jre-설치)

JRE (Java Runtime Enviroment)는 Eclipse 구동을 위해서 필요한 프로그램입니다.  
만약 이미 JRE가 설치되어 있는지 확인 하시려면, 실행 창에서 "java"를 입력하였을 때 다음과 같은 정보가 나온다면 JRE 설치는 넘기셔도 됩니다.

![img](/assets/images/sw/sdk/embedded_050.png)

JRE는 다음 사이트에서 다운로드 받을 수 있습니다.

[http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

![img](/assets/images/sw/sdk/embedded_051.png)

![img](/assets/images/sw/sdk/embedded_052.png)

사용하시는 환경에 맞는 버전을 선택하여 설치해 주시기 바랍니다.

### [WinARM 설치](#winarm-설치)

WinARM은 아래 링크에서 다운로드 받을 수 있습니다.

`다운로드` [WinARM](http://support.robotis.com/en/software/embeded_c/WinARM_20080331_testing.zip)

다운로드된 파일은 압축 파일입니다. C:\WinARM 에 압축을 풀어 주시면 됩니다.

![img](/assets/images/sw/sdk/embedded_053_kor.png)

WinARM이 제대로 동작하려면, 환경변수를 등록해야 합니다.  
제어판 - 시스템 - 고급 탭에서 ‘환경 변수’ 버튼을 누릅니다.

![img](/assets/images/sw/sdk/embedded_054_kor.png)

시스템 변수에 “PATH"라는 변수가 이미 존재한다면 ‘편집’ 버튼을, "PATH“라는 변수가 존재하지 않는다면 ‘새로 만들기’ 버튼을 누릅니다.

![img](/assets/images/sw/sdk/embedded_055_kor.png)

시스템 변수 편집 창에서 변수 값에 아래 항목을 추가합니다.  
새로 만들기가 아니라 편집하는 경우, 기존 문구 맨 마지막에 “;” 가 없으면 “;” 를 추가한 다음 아래 문구를 추가합니다.

```
C:\WinARM\bin;C:\WinARM\utils\bin;
```

![img](/assets/images/sw/sdk/embedded_056_kor.png)

WinARM이 제대로 설치되었는지 확인하려면, 실행 창에서 'arm-eabi-gcc -v'를 입력하여 보시기 바랍니다.  
잘 안 되는 경우 cmd창을 끄고 재실행하고 다시 시도해보시기 바랍니다.

![img](/assets/images/sw/sdk/embedded_057.png)

### [Eclipse 설치](#eclipse-설치)

Eclipse는 다음 사이트에서 다운로드 받을 수 있습니다.

`다운로드` [Eclipse](http://www.eclipse.org/downloads/)

![img](/assets/images/sw/sdk/embedded_058.png)

![img](/assets/images/sw/sdk/embedded_059.png)

Helios packages중 Eclipse IDE for C/C++ Developers 를 다운로드 하시되 사용하시는 환경에 맞는 버전을 선택하여 다운로드 받습니다.  
Eclipse는 따로 설치 과정이 필요 없이 압축을 푸신 후 바로 eclipse.exe를 실행하시면 됩니다.

`link` http://www.eclipse.org/downloads/packages/eclipse-ide-cc-developers/neonr

### [설치 성공여부 확인](#설치-성공여부-확인)

함께 제공되는 [예제 프로젝트]를 열어 보겠습니다. 압축을 풀어주십시오. Root는 관계없습니다.

[예제 프로젝트]: http://support.robotis.com/ko/baggage_files/embeded_c/embeddec_c(cm530_v1_02).zip

![img](/assets/images/sw/sdk/embedded_060.png)

만약 Eclipse 실행 시 다음과 같은 창이 나오게 되면

![img](/assets/images/sw/sdk/eclipse_1.jpg)

바로가기를 만들 후 바로가기의 속성에서 대상에 `-vm “C:\Program Files\Java\jre7\bin\javaw.exe”` 를 뒤에 추가시키면 됩니다.
폴더명에 공백이 있으면 “(겹따옴표)으로 감싸줘야 합니다.

![img](/assets/images/sw/sdk/eclipse_2.jpg)

Eclipse를 처음 실행시키면 아래 그림과 같이Workspace에 대한 설정을 요구합니다.

![img](/assets/images/sw/sdk/embedded_061.gif)

Default 경로 그대로 하면 project를 읽어 올 수 없는 문제가 생길 수 있기에 다른 경로로 변경하시기 바랍니다.  
좌측 하단 박스를 클릭하시면 다음부터 이 창이 뜨지 않습니다.

Eclipse를 실행시키고 ‘File – New – Makefile Project with Existing Code’를 선택합니다.

![img](/assets/images/sw/sdk/embedded_062.png)

'Browse..' 버튼을 누르고, 압축을 풀어 놓은 폴더중 “01 LED”를 선택하고 "확인"을 눌러 완료합니다.

![img](/assets/images/sw/sdk/embedded_063.png)

프로젝트 생성 후에는 ‘Project – Clean, Build’를 한 번씩 실행 해 주십시오.

![img](/assets/images/sw/sdk/embedded_064.png)

위와 같이 실행 후에, Console창에서 제대로 수행 되었는지 확인 할 수 있습니다.  
아래와 다르게 제대로 실행되지 않았을 경우에는, 개발환경 설치를 다시 한번 확인해 주시기 바랍니다.

![img](/assets/images/sw/sdk/embedded_065.png)

**NOTE** : Windows 8.1,10을 사용중 설치에 error 발생경우 여기를 클릭해 다운로드로와 압축 해제가 끝나면 파일을 C:\WinARM\utils\bin 에 복사하십시요. (기존에 있든 파일을 대체하면 됩니다.) **(EX error :/usr/bin/sh: fork: Resource temporarily unavailable)** 
{: .notice}

### [로보플러스 복구하기](#로보플러스-복구하기)

임베디드 C로 만들어진 결과물은 제어기 펌웨어(bin 파일) 입니다. 이것을 설치하면 기존의 제어기 펌웨어가 지워져서 로보플러스를 사용할 수 없게됩니다. 만약, 로보플러스를 다시 사용하려면 공장 출하시 제어기 펌웨어를 설치해야 합니다. 로보플러스 매니저를 이용하면 공장 출하시 제어기 펌웨어를 쉽게 설치할 수 있습니다.

자세한 사항은 로보플러스 매니저의 [펌웨어 복구하기]를 참조하십시오.

[펌웨어 복구하기]: /docs/kr/software/rplus1/manager/#펌웨어-복구

## [프로그래밍](#프로그래밍)

### <a name="하드웨어-포트맵"></a>[하드웨어 포트맵](#하드웨어-포트맵)

다음은 제어기의 하드웨어 주요 핀 기능을 표현해 놓은 하드웨어 포트맵입니다.  
각 포트나 내부 기능은 STM32F10X 라이브러리에서 제공하는 매크로 함수를 통해 간단히 접근하여 제어할 수 있습니다.

#### CM-530

![img](/assets/images/sw/sdk/embedded_066.png)

![img](/assets/images/sw/sdk/embedded_067.png)

| 핀 번호 | 핀 이름 |   NET NAME   |           기능설명           |
|:-------:|:-------:|:------------:|:----------------------------:|
|    1    |  Vbat   |   VCC_33L    |        3.3V 전원 공급        |
|    2    |  PC13   |     LED0     |          LED POWER           |
|    3    |  PC14   |    LED_TX    |            LED TX            |
|    4    |  PC15   |    LED_RX    |            LED RX            |
|    5    | OSC_IN  |    XTAL1     |        크리스탈 INPUT        |
|    6    | OSC_OUT |    XTAL2     |       크리스탈 OUTPUT        |
|    7    |  NRST   |    RESET     |            RESET             |
|    8    |   PC0   |   SIG_ADC0   |          ADC0 INPUT          |
|    9    |   PC1   | ADC_SELECT0  |      ANALOG MUX SELECT0      |
|   10    |   PC2   | ADC_SELECT1  |      ANALOG MUX SELECT1      |
|   11    |   PC3   |   VDD_VOLT   |         입력전압 ADC         |
|   12    |  VSSA   |     VSSA     |      ADC 기준전압 3.3V       |
|   13    |  VDDA   |     VDDA     |       ADC 기준전압 0V        |
|   14    |   PA0   |  SIG_MOT1+   |      1번 외부포트 OUPUT      |
|   15    |   PA1   |  SIG_MOT1-   |      1번 외부포트 OUPUT      |
|   16    |   PA2   |  SIG_MOT2+   |      2번 외부포트 OUPUT      |
|   17    |   PA3   |  SIG_MOT2-   |      2번 외부포트 OUPUT      |
|   18    |  VSS4   |     GND      |         0V 기준전압          |
|   19    |  VDD4   |   VCC_33L    |        3.3V 기준전압         |
|   20    |   PA4   |      NC      |           RESERVED           |
|   21    |   PA5   |   SIG_ADC1   |          ADC1 INPUT          |
|   22    |   PA6   |  SIG_BUZZER  |         버저 OUTPUT          |
|   23    |   PA7   |      NC      |           RESERVED           |
|   24    |   PC4   |   SIG_MIC    |       마이크신호 INPUT       |
|   25    |   PC5   |      NC      |           RESERVED           |
|   26    |   PB0   |      NC      |           RESERVED           |
|   27    |   PB1   |      NC      |           RESERVED           |
|   28    |   PB2   |    BOOT1     |           RESERVED           |
|   29    |  PB10   |    PC_TXD    |          PC 로 전송          |
|   30    |  PB11   |    PC_RXD    |         PC 에서 수신         |
|   31    |  VSS1   |     GND      |         0V 기준전압          |
|   32    |  VDD1   |   VCC_33L    |        3.3V 기준전압         |
|   33    |  PB12   |     LED3     |           LED AUX            |
|   34    |  PB13   |     LED4     |          LED MANAGE          |
|   35    |  PB14   |     LED5     |         LED PROGRAM          |
|   36    |  PB15   |     LED6     |           LED PLAY           |
|   37    |   PC6   |  SIG_MOT3+   |      3번 외부포트 OUPUT      |
|   38    |   PC7   |  SIG_MOT3-   |      3번 외부포트 OUPUT      |
|   39    |   PC8   |  SIG_MOT4+   |      4번 외부포트 OUPUT      |
|   40    |   PC9   |  SIG_MOT4-   |      4번 외부포트 OUPUT      |
|   41    |   PA8   |  SIG_MOT5+   |      5번 외부포트 OUPUT      |
|   42    |   PA9   |      NC      |           RESERVED           |
|   43    |  PA10   |      NC      |           RESERVED           |
|   44    |  PA11   |  SIG_MOT5-   |      5번 외부포트 OUPUT      |
|   45    |  PA12   | ZIGBEE_RESET |      Zigbee 모듈 ENABLE      |
|   46    |  PA13   |  USB_SLEEP   |         USB 연결여부         |
|   47    |  VSS2   |     GND      |         0V 기준전압          |
|   48    |  VDD2   |   VCC_33L    |        3.3V 기준전압         |
|   49    |  PA14   |    SW_RT     |            R 버튼            |
|   50    |  PA15   |    SW_LF     |            L 버튼            |
|   51    |  PC10   |    SW_DN     |            D 버튼            |
|   52    |  PC11   |    SW_UP     |            U 버튼            |
|   53    |  PC12   |  ZIGBEE_TXD  |        Zigbee로 전송         |
|   54    |   PD2   |  ZIGBEE_RXD  |      Zigbee로부터 수신       |
|   55    |   PB3   |   SW_START   |          START 버튼          |
|   56    |   PB4   |  ENABLE_TX   |   다이나믹셀로 전송 ENABLE   |
|   57    |   PB5   |  ENABLE_RX   | 다이나믹셀로부터 수신 ENABLE |
|   58    |   PB6   |   DXL_TXD    |      다이나믹셀로 전송       |
|   59    |   PB7   |   DXL_RXD    |    다이나믹셀로부터 수신     |
|   60    |  BOOT0  |    BOOT0     |           RESERVED           |
|   61    |   PB8   |  SIG_MOT6+   |      6번 외부포트 OUPUT      |
|   62    |   PB9   |  SIG_MOT6-   |      6번 외부포트 OUPUT      |
|   63    |  VSS3   |     GND      |         0V 기준전압          |
|   64    |  VDD3   |   VCC_33L    |        3.3V 기준전압         |

CM-530의 외부 포트 핀 구성은 다음과 같습니다. 외부 포트 눈금 표시로 포트 1 ~ 포트 6을 확인할 수 있습니다. 포트와 관련된 자세한 사항은 [CM-530 제어기] 부분을 참조하십시오.

![img](/assets/images/sw/sdk/embedded_068.png)

![img](/assets/images/sw/sdk/embedded_069.png)

1. OUT1 : 3.3V 출력 가능 (최대 허용 전류 0.3A)
2. VCC (5V)
3. ADC : 사용자가 제작한 센서의 아날로그 신호를 읽을 수 있음.
4. GND
5. OUT2 : 3.3V 출력 가능 (최대 허용 전류 0.3A)

![img](/assets/images/sw/sdk/embedded_070.png)

### [프로젝트 열기](#프로젝트-열기)

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

### [bin 파일 다운로드 하기](#bin-파일-다운로드-하기)

build에 성공하면 bin파일이 예제 폴더에 생성됩니다.
제어기에 만든 펌웨어를 설치하기 위해서는 로보플러스 터미널과 제어기 부트로더를 이용해야 합니다.
펌웨어 설치 및 실행에 대한 자세한 내용은 부트로더에서 [프로그램 설치/실행] 부분을 참조하십시오.

### <a name="부트로더"></a>[부트로더](#부트로더)

부트로더란, 제어기를 사용할 수 있도록 도와주는 프로그램입니다. 부트로더는 사용자가 지울 수 없으며 만약, 이 프로그램이 망가진다면 제어기를 사용할 수 없게됩니다. 부트로더는 공장 출하시 제어기에 설치된 상태로 생산됩니다.

부트로더에서 사용할 수 있는 명령은 'help' 명령으로 확인할 수 있습니다.

![img](/assets/images/sw/sdk/embedded_075.png)

#### 부트로더 진입/나가기

##### 부트로더 진입

부트로더는 키보드의 '#'키(Shift+숫자3키)를 누르고 있는 상태에서 제어기를 켜거나 리셋 스위치를 눌러주면 진입할 수 있습니다.  
성공하면 다음과 같이 화면이 나타납니다

![img](/assets/images/sw/sdk/embedded_076.png)

##### 부트로더 나가기

사용자 작업을 완료하면, GO명령으로 원하는 주소로 점프하거나, 제어기를 리셋하여 부트로더에서 나갈 수 있습니다.

#### APP/SYS 사용법

APP/SYS 명령으로 프로그램 시작 위치를 설정할 수 있습니다. 프로그램 시작 위치가 설정되면, 제어기의 전원을 켜거나 리셋할 때, 설정된 프로그램 시작위치에서 프로그램이 실행됩니다.  
Atmega2561을 사용하는 제어기의 메모리맵은 다음과 같습니다.

![img](/assets/images/sw/sdk/embedded_077.png)

- 부트로더로 진입한 후 명령창에 APP 명령을 입력하면, 다음번 리셋 후 유저 어플리케이션 영역부터 실행됩니다.  
  (기본 제공 펌웨어, 사용자 프로그램 등 대부분의 프로그램들은 특별한 이유가 없다면 0번지부터 시작됩니다.)

- 부트로더로 진입한 후 명령창에 SYS 명령을 입력하면, 다음번 리셋 후 부트로더가 실행됩니다.  
  ('#'키를 누르지 않아도 부트로더상태로 시작됩니다.)

#### <a name="프로그램-설치실행"></a>프로그램 설치/실행

제어기 펌웨어를 설치하기 위한 준비 작업은 다음과 같습니다.

- 설치할 제어기 펌웨어(hex 파일)를 준비합니다.
- PC와 제어기를 연결합니다.
- 로보플러스 터미널을 실행하여 통신 포트를 설정합니다.
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

### [부가설명](#부가설명)

#### 생성파일명

프로젝트를 빌드한 후 생성된 파일의 명칭은 "예제\Makefile" 에서 변경할 수 있습니다. 아래 그림과 같이 "Makefile" 에서 "MAIN_OUT = " 뒤에 원하는 파일명을 적으면 됩니다.

![img](/assets/images/sw/sdk/embedded_080.png)

#### object file list

아래 그림과 같이 "예제\APP\src" 폴더에 있는 확장자가 "c"인 파일들에 해당하는 object file 명칭을 전부 "Makefile" 에 명시해야 합니다.

![img](/assets/images/sw/sdk/embedded_081.png)

#### Firmware 시작 주소

아래의 메모리 맵(일부)와 같이 부트로더 영역과 펌웨어 영역이 나뉘여져 있습니다.

![img](/assets/images/sw/sdk/embedded_077.png)

펌웨어의 시작주소가 기본으로 0X8003000으로 되여있으나 유저가 변경할 수 있습니다.  
아래의 그림은 0X8003000로 설정할 때의 예를 보여줍니다.

1. stm32.ld 변경

    ![img](/assets/images/sw/sdk/embedded_082.png)

2. Vector table 변경

    ![img](/assets/images/sw/sdk/embedded_083.png)


## [예제](#예제)

### [LED 제어](#led-제어)

제어기의 각 LED를 제어할 수 있습니다.

- 준비물
  - CM-530

- 이론
  - 제어기의 마이크로 컨트롤러는 I/O포트를 통해 제어기와 연결된 LED등의 주변 장치를 제어할 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 LED를 제어해 볼 수 있습니다.
  - 포트번호와 핀번호는 "01 LED\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* Configure the GPIO ports */
    GPIO_Configuration();
    SysTick_Configuration();

    while(1)
    {
      GPIO_SetBits(PORT_LED_POWER, PIN_LED_POWER);
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      mDelay(250);
      GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      mDelay(250);
      GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      mDelay(250);
      GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
      mDelay(250);
      GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
      mDelay(250);
      GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
      mDelay(250);
      GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
      GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);
      mDelay(250);
    }
    return 0;
  }
  ```

- 결과
  - 제어기의 모든 LED가 순차적으로 점등됩니다.

### [버튼](#버튼)

제어기 버튼 입력을 받을 수 있습니다.

- 준비물
  - CM-530

- 이론
  - 제어기의 마이크로 컨트롤러의 I/O포트를 통해 제어기와 연결된 장치의 전기적 신호를 읽을 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 스위치의 눌림 상태를 확인할 수 있습니다.
  - 포트번호와 핀번호는 "02 BUTTON\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    GPIO_Configuration();
    /* Configure the GPIO ports */
    NVIC_Configuration();
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      if( GPIO_ReadInputDataBit(PORT_SW_UP, PIN_SW_UP) != SET )
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      else if( GPIO_ReadInputDataBit(PORT_SW_DOWN, PIN_SW_DOWN) != SET )
      GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
      else if( GPIO_ReadInputDataBit(PORT_SW_LEFT, PIN_SW_LEFT) != SET )
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      else if( GPIO_ReadInputDataBit(PORT_SW_RIGHT, PIN_SW_RIGHT) != SET )
      GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      else if( GPIO_ReadInputDataBit(PORT_SW_START, PIN_SW_START) != SET )
      {
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
      }
      else
      {
      GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
      }
    }
    return 0;
  }
  ```

- 결과
  - 버튼을 누르면, 눌린 버튼에 따라 서로 다른 LED가 켜집니다.

### [시리얼 통신](#시리얼-통신)

PC와 제어기가 시리얼 통신을 할 수 있습니다.

- 준비물
  - CM-530과 PC가 USB케이블을 통해 연결된 상태.
  - 예제의 통신 속도는 57600bps로 설정되어 있습니다.

- 이론
  - 시리얼 통신은 제어기의 값을 PC로 전송하여 사용자에게 보여줄 수 있는 가장 기본적인 수단입니다. 이 예제를 통해 제어기와 시리얼 통신을 해볼 수 있습니다.
  - 제어기와 PC사이의 시리얼 통신은 USART3채널을 통해 이루어집니다.
  - 포트번호와 핀번호는 "03 SERIAL COMMUNICATION\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* Configure the GPIO ports */
    GPIO_Configuration();
    SysTick_Configuration();
    /* USART Configuration */
    USART_Configuration(57600);
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      ReceivedData = RxDByte_PC();
      if(ReceivedData == 'w')
      TxDString("Welcome!\r\n");
      else if(ReceivedData == 'g')
      TxDString("Goodbye!\r\n");
    }
    return 0;
  }
  ```

- 결과
  - PC에서 'w' 버튼을 누르면 "Welcome!", 'g'버튼을 누르면 "Goodbye!"가 출력됩니다.

    ![img](/assets/images/sw/sdk/embedded_084.png)

### [버저](#버저)

제어기의 버저를 사용할 수 있습니다.

- 준비물 
  - CM-530

- 이론
  - 마이크로 컨트롤러의 I/O 포트를 통해 버저 회로의 신호를 제어할 수 있습니다. 버저는 신호 주파수를 조절하여 서로 다른 음계를 연주할 수 있습니다.
  - 포트번호와 핀번호는 "04 BUZZER\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.
  - 음계과 주파수의 관계는 다음을 참조하십시오.
  - 시간은 주파수의 역수입니다. 주파수를 시간으로 변환하는 공식은 다음과 같습니다.

    `시간(초) =  1 / (주파수)`

| 옥타브<br>/Scale |    1    |    2     |    3     |    4     |    5     |    6     |    7     |    8     |
|:----------------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|
|        C         | 32.7032 | 65.4064  | 130.8128 | 261.6256 | 523.2511 | 1046.502 | 2093.005 | 4186.009 |
|        C#        | 34.6478 | 69.2957  | 138.5913 | 277.1826 | 554.3653 | 1108.731 | 2217.461 | 4434.922 |
|        D         | 36.7081 | 73.4162  | 146.8324 | 293.6648 | 587.3295 | 1174.659 | 2349.318 | 4698.636 |
|        D#        | 38.8909 | 77.7817  | 155.5635 | 311.1270 | 622.2540 | 1244.508 | 2489.016 | 4978.032 |
|        E         | 41.2034 | 82.4069  | 164.8138 | 329.6276 | 659.2551 | 1318.510 | 2637.020 | 5274.041 |
|        F         | 43.6535 | 87.3071  | 174.6141 | 349.2282 | 698.4565 | 1396.913 | 2793.826 | 5587.652 |
|        F#        | 46.2493 | 92.4986  | 184.9972 | 369.9944 | 739.9888 | 1479.978 | 2959.955 | 5919.911 |
|        G         | 48.9994 | 97.9989  | 195.9977 | 391.9954 | 783.9909 | 1567.982 | 3135.963 | 6271.927 |
|        G#        | 51.9130 | 103.8262 | 207.6523 | 415.3047 | 830.6094 | 1661.219 | 3322.438 | 6644.875 |
|        A         | 55.0000 | 110.0000 | 220.0000 | 440.0000 | 880.0000 | 1760.000 | 3520.000 | 7040.000 |
|        A#        | 58.2705 | 116.5409 | 233.0819 | 466.1638 | 932.3275 | 1864.655 | 3729.310 | 7458.620 |
|        G         | 61.7354 | 123.4708 | 246.9417 | 493.8833 | 987.7666 | 1975.533 | 3951.066 | 7902.133 |

> 단위 : Hz

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* NVIC configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      if( GPIO_ReadInputDataBit(PORT_SW_UP, PIN_SW_UP) != SET )
      {
        GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
        GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
        GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
        GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
        GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
        GPIO_ResetBits(PORT_BUZZER, PIN_BUZZER);
        mDelay(1);
        GPIO_SetBits(PORT_BUZZER, PIN_BUZZER);
        mDelay(1);
      }
      else
      {
        GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
        GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
        GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
        GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
        GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
        GPIO_SetBits(PORT_BUZZER, PIN_BUZZER);
      }
    }
    return 0;
  }
  ```

- 결과
  - Start 버튼을 누르는 동안 전원LED를 제외한 여섯 LED가 켜지고 버저에서 같은 음으로 소리가 납니다.

### [마이크](#마이크)

제어기의 마이크를 사용하여 외부 소리를 감지할 수 있습니다.

- 준비물
  - CM-530

- 이론
  - 마이크 회로는 일정 크기 이상의 소리를 감지하면 마이크로 컨트롤러의 I/O포트에 신호를 발생하게 됩니다. 이 신호를 감지하여 외부 소리를 감지할 수 있습니다.
  - 포트번호와 핀번호는 "05 MIC\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* NVIC configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      if( GPIO_ReadInputDataBit(PORT_MIC, PIN_MIC) != SET)
      {
        GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
        GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
        GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
        GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
        GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
        mDelay(1000);
      }
      else
      {
        GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
        GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
        GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
        GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
        GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
      }
    }
    return 0;
  }
  ```

- 결과
  - 마이크에 소리가 감지되면, 전원LED를 제외한 여섯 LED가 1초간 켜졌다 꺼집니다.

### [올로 서보모터(회전방향 제어)](#올로-서보모터회전방향-제어)

올로 서보모터의 회전방향을 제어하는 방법을 배웁니다.

- 준비물
  - CM-530
  - 올로 서보모터 (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

- 이론
  - 제어기는 마이크로 컨트롤러의 SIG_MOT1+와 SIG+MOT1- 핀을 통해 1번 외부포트의 MOT1+ 와 MOT1-핀의 값을 제어함으로써 올로 서보모터의 회전방향을 제어합니다.

    ![img](/assets/images/sw/sdk/embedded_085.png)

    ![img](/assets/images/sw/sdk/embedded_086.png)

포트번호와 핀번호는 "06 OLLO MOTOR ROTATE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* GPIO configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      GPIO_SetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
      GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
      mDelay(5000);
      GPIO_SetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
      mDelay(5000);
      GPIO_SetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
      GPIO_SetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
      mDelay(2000);
    }

    return 0;
  }
  ```

- 결과
  - 1번 외부포트에 연결된 올로 서보모터는 역시침 방향으로 5초간 회전하고 순시침 방향으로 5초간 회전 한 후 2초간 정지하는 운동을 반복합니다.

### [올로 서보모터(위치값 읽기)](#올로-서보모터위치값-읽기)

올로 서보모터 혼(horn) 위치값을 읽는 방법을 배웁니다.

- 준비물
  - CM-530
  - 올로 서보모터

- 이론
  - 제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 올로 서보모터 혼 위치를 나타내는 아날로그 전압값을 AD 변환할 수 있습니다.
  - 포트번호와 핀번호는 "06 OLLO MOTOR ROTATE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

    ![img](/assets/images/sw/sdk/embedded_087.png)
    
    ![img](/assets/images/sw/sdk/embedded_088.png)

  - ANALOG MUX (74HC4052D) 를 이용한 이유는 외부 임피던스를 차단 하고, 5V -> 3.3V로 레벨 변환을 하기 위해서입니다.
  - 위의 ADC MUX회로에서 ADC_SELECT0, ADC_SELECT1 두 신호값 조합에 의해 SIG_ADC0은 ADC1, ADC2, ADC3 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 SIG_ADC1은 ADC4, ADC5, ADC6 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 마이크로 컨트롤러는 이 아날로그값을 AD변환합니다.

  - 포트번호와 핀번호는 "07 OLLO MOTOR POSITION\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* GPIO configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    /* ADC configuration */
    ADC_Configuration();
    GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    GPIO_ResetBits(PORT_SIG_MOT2P,PIN_SIG_MOT2P);
    GPIO_ResetBits(PORT_SIG_MOT2M,PIN_SIG_MOT2M);
    GPIO_ResetBits(PORT_SIG_MOT3P,PIN_SIG_MOT3P);
    GPIO_ResetBits(PORT_SIG_MOT3M,PIN_SIG_MOT3M);
    GPIO_ResetBits(PORT_SIG_MOT4P,PIN_SIG_MOT4P);
    GPIO_ResetBits(PORT_SIG_MOT4M,PIN_SIG_MOT4M);
    GPIO_ResetBits(PORT_SIG_MOT5P,PIN_SIG_MOT5P);
    GPIO_ResetBits(PORT_SIG_MOT5M,PIN_SIG_MOT5M);
    GPIO_ResetBits(PORT_SIG_MOT6P,PIN_SIG_MOT6P);
    GPIO_ResetBits(PORT_SIG_MOT6M,PIN_SIG_MOT6M);
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
      GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
      mDelay(10);
      /* Start ADC1,ADC2 Software Conversion */
      ADC_SoftwareStartConvCmd(ADC1, ENABLE);
      ADC_SoftwareStartConvCmd(ADC2, ENABLE);
      mDelay(10);
      POT_1 = (ADC_GetConversionValue(ADC1))>>2;
      POT_4 = (ADC_GetConversionValue(ADC2))>>2;
      GPIO_SetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
      GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
      mDelay(10);
      /* Start ADC1,ADC2 Software Conversion */
      ADC_SoftwareStartConvCmd(ADC1, ENABLE);
      ADC_SoftwareStartConvCmd(ADC2, ENABLE);
      mDelay(10);
      POT_2 = (ADC_GetConversionValue(ADC1))>>2;
      POT_5 = (ADC_GetConversionValue(ADC2))>>2;
      GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
      GPIO_SetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
      mDelay(10);
      /* Start ADC1,ADC2 Software Conversion */
      ADC_SoftwareStartConvCmd(ADC1, ENABLE);
      ADC_SoftwareStartConvCmd(ADC2, ENABLE);
      mDelay(10);
      POT_3 = (ADC_GetConversionValue(ADC1))>>2;
      POT_6 = (ADC_GetConversionValue(ADC2))>>2;
      TxDWord16(POT_1);
      TxDByte_PC(' ');
      TxDWord16(POT_2);
      TxDByte_PC(' ');
      TxDWord16(POT_3);
      TxDByte_PC(' ');
      TxDWord16(POT_4);
      TxDByte_PC(' ');
      TxDWord16(POT_5);
      TxDByte_PC(' ');
      TxDWord16(POT_6);
      TxDByte_PC(' ');
      TxDByte_PC('\r');
      TxDByte_PC('\n');
    }
    return 0;
  }
  ```

- 결과
  - 임의의 외부포트에 올로 서보모터를 연결하면 출력되는 화면을 통해 서보모터 혼의 위치값을 알 수 있습니다. 출력값 범위는 0~0x03FF 입니다.
  - 아래 그림은 3번 외부포트에 올로 서보모터를 연결했을 때 출력화면입니다.

    ![img](/assets/images/sw/sdk/embedded_089.png)

### [적외선 센서](#적외선-센서)

적외선 센서를 사용하는 방법을 배웁니다.

- 준비물
  - CM-530과 PC를 USB케이블을 통해 연결합니다.
  - [적외선 센서] (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

- 이론
  - 제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 적외선 센서의 아날로그 전압값을 AD 변환할 수 있습니다.

    ![img](/assets/images/sw/sdk/embedded_087.png)
    
    ![img](/assets/images/sw/sdk/embedded_088.png)

  - ANALOG MUX (74HC4052D) 를 이용한 이유는 외부 임피던스를 차단 하고, 5V -> 3.3V로 레벨 변환을 하기 위해서입니다.
  - 위의 ADC MUX회로에서 ADC_SELECT0, ADC_SELECT1 두 신호값 조합에 의해 SIG_ADC0은 ADC1, ADC2, ADC3 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 SIG_ADC1은 ADC4, ADC5, ADC6 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 마이크로 컨트롤러는 이 아날로그랎을 AD변환합니다.

  - 포트번호와 핀번호는 "08 IR SENSOR\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* GPIO configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    /* ADC configuration */
    ADC_Configuration();
    GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    //GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      GPIO_SetBits(PORT_SIG_MOT1P, PIN_SIG_MOT1P);
      GPIO_ResetBits(PORT_SIG_MOT1M, PIN_SIG_MOT1M);
      GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
      GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
      uDelay(30);
      /* Start ADC1,ADC2 Software Conversion */
      ADC_SoftwareStartConvCmd(ADC1, ENABLE);
      //ADC_SoftwareStartConvCmd(ADC2, ENABLE);
      uDelay(5);
      IR_1 = (ADC_GetConversionValue(ADC1));
      GPIO_ResetBits(PORT_SIG_MOT1P, PIN_SIG_MOT1P);
      GPIO_ResetBits(PORT_SIG_MOT1M, PIN_SIG_MOT1M);
      TxDWord16(IR_1);
      TxDByte_PC('\r');
      TxDByte_PC('\n');
      mDelay(5);
    }
    return 0;
  }
  ```

- 결과
  - 1번 외부포트에 적외선 센서를 연결하면 화면에 적외선 센서값을 출력합니다.

### [다이나믹셀 읽기/쓰기](#다이나믹셀-읽기쓰기)

다이나믹셀의 위치를 읽거나 설정할 수 있습니다. (보다 자세한 사항은 [Dynamixel SDK]를 확인 하세요)

- 준비물
  - CM-530
  - 이 예제는 다이나믹셀 ID가 1일 때 동작합니다.

- 이론
  - 다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.
  - 마이크로 컨트롤러와 다이나믹셀의 통신은 USART1 채널을 통해 이루어집니다

    ![img](/assets/images/sw/sdk/embedded_090.png)

  - 위의 그림은 다이나믹셀과의 통신을 위한 HALF DUPLEX BUFFER 회로 입니다.
  - 포트번호와 핀번호는 "09 DXL READ_WRITE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* GPIO configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    Timer_Configuration();
    dxl_initialize( 0, 1 );
    USART_Configuration(USART_PC, Baudrate_PC);

    while(1)
    {
      bMoving = dxl_read_byte( id, P_MOVING );
      CommStatus = dxl_get_result();
      if( CommStatus == COMM_RXSUCCESS )
      {
      if( bMoving == 0 )
      {
        // Change goal position
        if( INDEX == 0 )
        INDEX = 1;
        else
        INDEX = 0;
        // Write goal position
        dxl_write_word( id, P_GOAL_POSITION_L, GoalPos[INDEX] );
        }
        PrintErrorCode();
        // Read present position
        wPresentPos = dxl_read_word( id, P_PRESENT_POSITION_L );
        TxDWord16(GoalPos[INDEX]);
        TxDString("   ");
        TxDWord16(wPresentPos);
        TxDByte_PC('\r');
        TxDByte_PC('\n');
      }
      else
        PrintCommStatus(CommStatus);
    }
    return 0;
  }
  ```

- 결과
  - 다이나믹셀이 지정된 위치를 왕복하며, 제어기와 PC가 연결 되였을 때 다이나믹셀의 현재 위치를 터미널을 통해 출력합니다.

### [다이나믹셀 동기 제어](#다이나믹셀-동기-제어)

여러개의 다이나믹셀을 동기화하여 제어할 수 있습니다. (보다 자세한 사항은 [Dynamixel SDK]를 확인 하세요)

- 준비물
  - CM-530과 다이나믹셀이 연결된 상태
  - 이 예제는 다이나믹셀 ID가 1부터 순차적으로 3까지 설정되어 있을 때 동작합니다.

- 이론
  - 다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.
  - 마이크로 컨트롤러와 다이나믹셀의 통신은 USART1 채널을 통해 이루어집니다.

    ![img](/assets/images/sw/sdk/embedded_090.png)

  - 위의 그림은 다이나믹셀과의 통신을 위한 HALF DUPLEX BUFFER 회로 입니다.
  - 포트번호와 핀번호는 "10 DXL SYNC WRITE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* GPIO configuration */
    GPIO_Configuration();
    SysTick_Configuration();
    Timer_Configuration();
    dxl_initialize( 0, 1 );
    USART_Configuration(USART_PC, Baudrate_PC);
    for( i=0; i < NUM_ACTUATOR; i++ )
    {
      id[i] = i+1;
    }
    // Set goal speed
    dxl_write_word( BROADCAST_ID, P_GOAL_SPEED_L, 0 );
    // Set goal position
    dxl_write_word( BROADCAST_ID, P_GOAL_POSITION_L, AmpPos );
    mDelay(1000);

    while(1)
    {
      // Make syncwrite packet
      dxl_set_txpacket_id(BROADCAST_ID);
      dxl_set_txpacket_instruction(INST_SYNC_WRITE);
      dxl_set_txpacket_parameter(0, P_GOAL_POSITION_L);
      dxl_set_txpacket_parameter(1, 2);
      for( i=0; i<NUM_ACTUATOR; i++ )
      {
        dxl_set_txpacket_parameter(2+3*i, id[i]);
        dxl_set_txpacket_parameter(2+3*i+1, dxl_get_lowbyte(GoalPos));
        dxl_set_txpacket_parameter(2+3*i+2, dxl_get_highbyte(GoalPos));
        TxDByte_PC('\r');
        TxDByte_PC('\n');
        TxDWord16(GoalPos);
      }
      dxl_set_txpacket_length((2+1)*NUM_ACTUATOR+4);
      dxl_txrx_packet();
      CommStatus = dxl_get_result();
      if( CommStatus == COMM_RXSUCCESS )
        PrintErrorCode();
      else
        PrintCommStatus(CommStatus);
        GoalPos += 100;
      if( GoalPos > MAX_POSITION )
        GoalPos -= MAX_POSITION;
      mDelay(CONTROL_PERIOD);
    }
    return 0;
  }
  ```

- 결과
  - 여러개의 다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

### [RC100과 ZIGBee](#rc100과-zigbee)

RC-100을 이용하여 제어기를 동작시킬 수 있습니다. (보다 자세한 사항은 [Zigbee SDK] 를 확인 하세요)

- 준비물
  - CM-530
  - [Zig-100/110] 1쌍
  - [RC-100]

- 이론
  - Zig100이 장착되어있는 RC100 리모컨으로 제어기를 제어할 수 있습니다.
  - 마이크로 컨트롤러와 RC100의 통신은 UART5 채널을 통해 이루어집니다.

    ![img](/assets/images/sw/sdk/embedded_091.png)

  - 위 그림은 Zigbee 커넥터와 Zigbee의 전원공급회로입니다.
  - 포트번호와 핀번호는 "11 RC100 ZIGBEE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

- 소스

  ```c
  int main(void)
  {
    /* System Clocks Configuration */
    RCC_Configuration();
    /* NVIC configuration */
    NVIC_Configuration();
    /* Configure the GPIO ports */
    GPIO_Configuration();
    SysTick_Configuration();
    zgb_initialize(0);
    USART_Configuration(USART_PC, 57600);
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

    while(1)
    {
      if(zgb_rx_check() == 1)
      {
        RcvData = zgb_rx_data();
        TxDWord16(RcvData);
        TxDByte_PC('\r');
        TxDByte_PC('\n');
        if(RcvData & RC100_BTN_1)
        GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      else
        GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
        if(RcvData & RC100_BTN_2)
        GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        else
        GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
        if(RcvData & RC100_BTN_3)
          GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
        else
          GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      }
    }
    return 0;
  }
  ```

- 결과
  - Zigbee가 정상적으로 연결된 경우, RC-100의 버튼을 누를 때 마다 제어기의 LED가 켜졌다 꺼집니다.

[제어기 포트맵]: #하드웨어-포트맵
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[Dynamixel SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[Zigbee SDK]: /docs/kr/software/embedded_sdk/zigbee_sdk/
[Zig-100/110]: /docs/kr/parts/communication/zig-110/
[RC-100]: /docs/kr/parts/communication/rc-100/
[CM-530 제어기]: /docs/kr/parts/controller/cm-530/
[프로그램 설치/실행]: #프로그램-설치실행
[부트로더 진입]: #부트로더
