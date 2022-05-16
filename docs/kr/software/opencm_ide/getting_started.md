---
layout: archive
lang: kr
ref: opencmide_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/opencm_ide/getting_started/
sidebar:
  title: OpenCM IDE
  nav: "opencmide"
---

# [개요](#개요)

`ROBOTIS OpenCM`은 OpenCM9.04 임베디드 보드를 쉽게 프로그래밍하고 다운로드 할 수 있는 통합개발환경 소프트웨어 입니다.

ROBOTIS OpenCM에서 사용된 오픈 소스의 라이선스는 원저작자의 라이선스를 따르고 (주)로보티즈에 의해 새로 만들어지거나 변형된 코드의 저작권은 (주)로보티즈에 있으며 GNU GPL 혹은 LGPL을 따릅니다.

자세한 사항은 OpenCM9.04의 e-Manual Appendix의 라이선스 부분을 참고하세요

- [GNU GPL](http://opensource.org/licenses/gpl-license.php)
- [GNL LGPL](http://opensource.org/licenses/lgpl-license.php)

**주의** : OpenCM IDE는 더이상 업데이트되지 않습니다. [Arduino IDE](/docs/kr/software/arduino_ide/)사용을 권장드립니다.
{: .notice--warning}

## ROBOTIS OpenCM 소프트웨어 다운로드

사용 중인 OS에 따라 아래의 링크를 통해 다운로드 받을 수 있습니다.

- [Windows XP, Vista, 7, 8] 32bit/64bit : [Download](http://www.robotis.com/service/download.php?no=47)
- [Mac OS X] Tested in OS X 10.12.2 : [Download](http://www.robotis.com/service/download.php?no=48)
- [Linux 64bit] Tested in Ubuntu 12.04 : [Download](http://www.robotis.com/service/download.php?no=49)
- [Linux 32bit] Tested in Ubuntu 10.10 : [Dowload](http://www.robotis.com/service/download.php?no=50)

# [시작하기](#시작하기)

## [소프트웨어 설치](#소프트웨어-설치)

### [윈도우즈 환경 설치](#윈도우즈-환경-설치)

#### OpenCM9.04와 USB 케이블 준비

USB 케이블은 반드시 안드로이드 폰/패드 Micro-B 타입 USB케이블을 준비합니다.(B타입에는 구성품으로 포함되어 있고 A타입의 경우 악세사리 키트를 통해 구입가능합니다. 안드로이드 스마트폰 케이블 호환됩니다.)

![img](/assets/images/sw/opencm_ide/opencm9.04_windows1.jpg)

> 마이크로B USB 케이블 : 안드로이드 스마트폰과 동일

#### ROBOTIS OpenCM 개발환경 Windows 릴리즈 다운로드

[로보티즈 다운로드 사이트](http://www.robotis.com/service/downloadcenter.php)에서 최신 버전을 다운로드 받고 압축 파일을 적당한 디렉토리에 풀면 아래와 같이 `ROBOTIS_OpenCM.exe` 실행파일과 USB 드라이버 폴더 `\drivers`가 나타납니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows2.png)

> 압축을 풀었을 때 나타나는 디렉토리 구조

참고로 ROBOTIS OpenCM은 별도의 설치 과정이 없이 압축만 풀면 실행할 수 있는 형태의 무설치 프로그램입니다. 제거하고 싶으시면 간단히 디렉토리를 말끔히 지워버리면 됩니다.

#### OpenCM9.04를 PC와 연결

USB 드라이버 설치를 위해서 간단히 아래와 같이 PC와 OpenCM9.04를 USB 케이블을 통해 연결합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows3.png)          

> 그림 2.4.1-4 OpenCM9.04를 PC와 연결

단 USB 허브에서 다수의 USB 장치와 함께 연결하는 경우는 되도록 피하고 가급적 PC와 직접 연결하는 방법을 추천합니다. 간혹 허브에서 전류가 충분하지 않으면 다운로드를 실패하는 경우가 발생합니다.

#### 드라이버 설치

Window8,10의 경우 "시작설정-> 업데이트 복구-> 복구-> 고급시작옵션-> 문제해결-> 고급옵션-> 시작설정-> 다시시작-> 7)드라이버 서명 하지 않음 선택 후 재부팅" 설정 후 관리자 권한으로 설치 하시기 바랍니다.

이전 단계에서 OpenCM 보드와 PC를 연결하면 아래와 같이 장치관리자에서 “ROBOTIS Virtual COM Port”라는 장치가 나타납니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows4.png)

그 장치를 선택하고 “마우스 오른쪽 버튼  드라이버 소프트웨어 업데이트”를 실행 합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows5.png)

다음으로 “컴퓨터에서 드라이버 소프트웨어 찾아보기”를 선택한다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows6.png)

“찾아보기”를 클릭해서 위에서 압축을 해제한 디렉토리(ROBOTIS\drivers)를 지정한다

![img](/assets/images/sw/opencm_ide/opencm9.04_windows7.png)

다음을 클릭하면 설치가 진행된다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows8.png)

성공적으로 USB 드라이버를 설치하였다면 아래와 같이 “드라이버 소프트웨어를 업데이트했습니다”라는 창이 나타난다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows9.png)

여기서 중요한 점은 장치관리자에서 방금 설치하였던 ROBOTIS Virtual COM Port가 COM 포트가 몇 번인지 확인해야 한다.  
다른 USB의 포트에 연결하면 COM포트의 번호가 변경될 수 있으니 다른 포트에 연결했다면 다시 확인하고 다운로드를 해야한다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows10.png)

#### ROBOTIS OpenCM.exe 실행

압축을 푼 디렉토리(\ROBOTIS)에 ROBOTIS_OpenCM.exe 파일을 더블클릭 한다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows11.png)

그러면 아래와 같이 ROBOTIS OpenCM 툴이 실행된다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows12.png)

##### Blink 예제를 Open

파일 → 예제 → 01.Basics → b_Blinlk 순으로 선택한다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows13.png)

##### 보드 선택

도구 → 보드에서 ROBOTIS OpenCM9.04를 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows14.png)

##### 시리얼 포트 선택

반드시 이전 단계에서 확인했던 COM 포트 번호를 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows15.png)

##### 다운로드 수행

아래에서 표시된 다운로드 버튼을 클릭합니다. 다운로드가 시작되는 동안 보드의 녹색 LED가 계속 켜집니다. 다운로드가 끝나면 보드가 리셋되고 Blink 예제가 실행되면서 LED가 깜빡입니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_windows16.png)

**참고**: 만약에 다운로드 버튼을 클릭하고도 보드의 녹색 Status LED가 켜지지 않는다면 User button을 누른상태에서 USB를 PC와 연결하십시요. 보드 전원이 들어오면서 녹색 LED가 계속 켜지면 다운로드를 다시 시작하십시요. 자세한 설명은 긴급 복구 모드(강제 다운로드)편을 참조하세요.
{: .notice}

![img](/assets/images/sw/opencm_ide/opencm9.04_26.jpg)

### [맥킨토시 환경 설치](#맥킨토시-환경-설치)

#### ROBOTIS OpenCM Mac OS X release 다운로드

E-manual에서 Mac OS X용 설치 이미지 파일(dmg)을 다운로드 받습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac1.png)

다운로드가 완료되면 아래 dmg파일을 더블 클릭해서 Mount를 진행합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac2.png)

마운트 후 설치창이 뜨면 마우스로 ROBOTIS 아이콘을 Application 쪽으로 드래그 합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac3.png)

그러면 다음과 같이 설치가 진행됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac4.png)

#### ROBOTIS OpenCM 실행

Finder를 이용해서 Application 폴더를 보면 ROBOTIS.app 응용프로그램 패키지가 있고 이것을 더블클릭해서 실행합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac5.png)

아래와 같은 그림에서 Open 버튼을 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac6.png)

아래와 같이 ROBOTIS OpenCM이 실행됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac7.png)

#### Blink 예제 Open

파일 → Examples → 01. Basics → b_Blink 순으로 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac8.png)

#### 보드 선택

ROBOTIS OpenCM9.04를 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac9.png)

#### 시리얼 포트 선택

tty.usbmodemXXX로 선택합니다. 뒤의 숫자는 PC마다 다릅니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_mac10.png)

#### 다운로드 수행

아래 그림에서 다운로드 버튼을 클릭합니다. 다운로드가 시작되는 동안 보드의 녹색 LED가 계속 켜집니다. 다운로드가 끝나면 보드가 리셋되고 Blink 예제가 실행되면서 LED가 깜빡입니다.

**참고**: 만약에 다운로드 버튼을 클릭하고도 보드의 녹색 Status LED가 켜지지 않는다면 User button을 누른상태에서 USB를 PC와 연결하십시요. 보드 전원이 들어오면서 녹색 LED가 계속 켜지면 다운로드를 다시 시작하십시요. 자세한 설명은 긴급 복구 모드(강제 다운로드)편을 참조하세요.
{: .notice}

![img](/assets/images/sw/opencm_ide/opencm9.04_mac11.png)

![img](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/images/product/opencm/904/opencm9.04_26.jpg)

그 외에 사용법은 윈도우즈 버전과 동일합니다.

### [리눅스 환경 설치](#리눅스-환경-설치)

#### ROBOTIS OpenCM Linux release 다운로드

사용 중인 Linux가 32bit라면 Linux 32 bit 패키지를 다운로드 받고 64bit이면 Linux 64 bit 패키지를 e-Manual에서 다운로드 받습니다.

다운로드 받고 난 뒤 아래의 커맨드로 압축을 해제합니다. 아래는 32비트 기준으로 설명합니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_027.png)

압축을 풀면 아래와 같이 ROBOTIS 폴더가 생성됩니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_028.png)

#### JRE(Java Runtime Environment)설치

아두이노와 마찬가지로 ROBOTIS OpenCM 툴도 Java로 만들어진 프로그램이므로 JRE(Java Runtime Environment)가 필요합니다. 윈도우 패키지는 JRE가 패키지에 포함되어 있지만 리눅스 버전은 제외가 되어 있다.

설치가 되어 있으면 다음으로 진행합니다. JRE 설치 확인은 아래와 같이 터미널에서 java –version으로 확인할 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_029.png)

위와 같은 응답이 나온다면 JAVA JRE(Java Runtime Environment) 또는 JDK를 설치해야 합니다.  
여기서는 openjdk-7-jre-headless를 설치하는 방법을 소개합니다.

```
sudo apt-get install openjdk-7-jre
```

![img](/assets/images/sw/opencm_ide/opencm_ide_030.png)

Java JRE가 성공적으로 설치되었으며 이제 ROBOTIS OpenCM을 실행할 수 있습니다.

#### i386 라이브러리 설치하기(Linux 64bit)
Linux 64비트 OS에서 사용하기 위해서는 ia32-libs를 설치해야 합니다.

```
$sudo dpkg –add-architecture i386
$sudo apt-get update
$sudo apt-get install ia32-libs
```

성공적으로 설치가 끝나면 아래와 같이 Processing trigger가 제대로 실행됩니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_031.png)

#### ROBOTIS OpenCM 실행

아래와 같이 ROBOTIS_OpenCM를 더블 클릭하거나 터미널에서 ./ROBOTIS_OpenCM을 입력후 엔터를 하면 실행합니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_032.png)

실행 버튼을 클릭합니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_033.png)

그러면 아래와 같이 실행됩니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_034.png)

#### Blink 예제 열기

파일 → 예제 → 01. Basics → b_Blink 순으로 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_035.png)

#### 보드선택

도구 → 보드에서 ROBOTIS OpenCM9.04를 선택합니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_036.png)

#### 시리얼 포트 선택

시리얼 포트는 ttyACMX로 표시되는데 X는 사용자 PC에 따라 다른 숫자로 표시됩니다.

리눅스/Mac OS X 릴리즈는 커널에 USB CDC드라이버가 포함되어 있으므로 윈도우와 달리 별도의 드라이버를 설치할 필요 없이 바로 사용할 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_037.png)

#### 다운로드 수행

아래 그림에서 가리키는 다운로드 버튼을 클릭합니다.  
다운로드가 시작되는 동안 보드의 녹색 LED가 계속 켜집니다. 다운로드가 끝나면 보드가 리셋되고 Blink 예제가 실행되면서 LED가 깜빡입니다

**참고**: 만약에 다운로드 버튼을 클릭하고도 보드의 녹색 Status LED가 켜지지 않는다면 User button을 누른상태에서 USB를 PC와 연결하십시요. 보드 전원이 들어오면서 녹색 LED가 계속 켜지면 다운로드를 다시 시작하십시요. 자세한 설명은 긴급 복구 모드(강제 다운로드)편을 참조하세요.
{:. notice}

![img](/assets/images/sw/opencm_ide/opencm_ide_038.png)

![img](/assets/images/sw/opencm_ide/opencm9.04_26.jpg)

그 외에 사용방법은 윈도우즈 버전과 동일합니다.

## [프로그램 실행](#프로그램-실행)

프로그램을 실행하면 다음과 같은 화면이 나타납니다.

![img](/assets/images/sw/opencm_ide/opencm_ide_039.png)

|항목|설명|
|:---:|:---:|
|Menu |  파일, 편집, 스케치, 도구, 도움말 선택 할 수 있는 영역 입니다.|
|Toolbar | 자주 쓰는 버튼을 단축 아이콘으로 표시한 영역 입니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_040.gif) | 컴파일만 수행하고 실패하거나 성공할 경우 상태바 또는 콘솔에 해당 메시지가 출력됩니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_041.gif) | 컴파일을 수행한 후 곧바로 다운로드를 수행합니다. 보드가 반드시 연결된 상태로 실행해야 합니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_042.gif) | 새 파일을 시작합니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_043.gif) |파일 불러오기를 수행합니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_044.gif) |현재 상태를 저장합니다.|
|![img](/assets/images/sw/opencm_ide/opencm_ide_045.gif) |시리얼 모니터를 실행 합니다.|
|에디터(Editor) | 소스를 편집하는 영역 입니다.|
|상태바(Status Bar) | 요청된 기능에 대한 진행 상황을 시각적으로 표시하는 영역 입니다.|
|콘솔(Console) | 현재 커서가 위치한 곳의 라인번호와 선택된 보드와 COM포트를 보여줍니다.|
|탭메뉴(Tab Menu) | 탭을 추가하거나 삭제할 때 선택하는 메뉴 입니다.|

### 예제 살펴보기

ROBOTIS OpenCM 개발환경(IDE)은 OpenCM 하드웨어 보드가 제공하는 기능별로 쉬운 예제를 제공하고 있으며, 파일 (예제)Examples 메뉴를 보면 다음과 같이 다양한 예제를 볼 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide2.png)

### 코드 편집 기능

#### Auto Highliht 기능
코드 타이핑을 할 때 등록된 키워드는 아래와 같이 검정색에서 노란색 또는 파란색으로 자동으로 하이라이트(highlight)가 됩니다.
등록된 API라면 아래와 같이 색상이 변하므로 사용하려는 API 이름이 제대로 타이핑 되었는지 확인 할 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide3.png)

그리고 이러한 자동 하이라이트(Auto highlight) 기능은 아래 경로의 keyword.txt 파일을 이용해서 얼마든지 수정하거나 추가할 수 있습니다,

![img](/assets/images/sw/opencm_ide/opencm9.04_ide4.png)

![img](/assets/images/sw/opencm_ide/opencm9.04_ide5.png)

#### 자동포맷 기능 사용
도구 →자동포맷 기능을 활용하면 뒤죽박죽으로 타이핑한 코드들이 보기 좋게 정렬이 됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide6.jpg)

아래와 같은 코드가 Ctrl+T만 누르면 한번에 보기 좋게 코드가 정렬이 됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide7.jpg)

#### 주석 처리 및 해제
아래 편집→주석추가/주석삭제를 선택하거나 단축키 Ctrl+/를 누르면 주석처리가 되고 다시 한번 더 누르면 주석이 해제 됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide8.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04_ide9.png)

위와 같이 블록 처리를 하고 나서 Ctrl+/를 누르면 아래와 같이 주석 처리가 됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide10.png)

다시 Ctrl+/를 누르면 주석이 해제 됩니다.
#### 들여쓰기 추가 및 삭제
편집→들여쓰기 추가/삭제를 누르면 현재 커서에서 들여쓰기 단계를 조절 할 수 있습니다. 마찬가지로 Ctrl+}를 누르면 오른쪽으로 한 탭씩 이동하고 Ctrl+}를 누르면 한탭씩 들어갑니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide11.jpg)

Ctrl+}를 계속해서 눌러보면 아래와 같이 오른쪽으로 한 탭씩 이동합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide12.png)

### 컴파일 및 다운로드 하기

코드를 작성하고 나면 컴파일 메뉴를 이용해 자신이 구현한 코드가 문법에 맞는지 오류가 없는지 체크하면서 프로그래밍을 하는 것이 좋습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide13.png)

> 빌드가 성공하게 되면 아래 상태 창에 빌드한 바이너리 사이즈에서 최대 바이너리 사이즈, 그리고 사이즈 대비 점유율이 0%로 나옵니다.

만약에 아래 경로의 Core 경로에 있는 코드들을 수정하였다면 반드시 미리 만들어진 Object 파일들을 지워주어야 한다.

> ROBOTIS\hardware\robotis\cores\robotis

도구 > Clean Objects 메뉴를 클릭하고 새로 빌드를 하면된다. 이 경우 처음은 약간 오래 걸리지만 두번째 부터는 처음에 빌드한 Object 파일들을 재활용하기 때문에 다시 빨라진다.

![img](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/images/product/opencm/904/opencm9.04_27.jpg)

Object 파일들은 아래의 Core 경로에 각각의 보드 디렉토리에 저장되어서 재활용된다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide15.png)

모든 코드가 에러 없이 컴파일이 잘된다면 다운로드를 해보자. 간단히 아래쪽 방향의 화살표를 누르면 컴파일과 다운로드를 한번에 수행하게 된다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide16.jpg)

다운로드가 성공적으로 끝나면 상태바에 Done downloading이라는 메시지와 함께 다운로드한 코드가 OpenCM9.04에서 바로 실행된다.

![img](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/images/product/opencm/904/opencm9.04_28.jpg)

### 시리얼 모니터 사용하기

ROBOTIS OpenCM에는 윈도우즈의 하이퍼 터미널이나 TeraTerm과 같은 터미널 프로그램을 Add-on 프로그램으로 기본 제공을 합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide19.jpg)

선택된 COM1번 포트를 통해 통신하고 싶다면 툴바 상단 오른쪽 시리얼 모니터 아이콘을 클릭하면 시리얼 모니터가 실행된다. 참고로 Ctrl + Shift + M 단축키를 눌러서 실행시킬 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_ide20.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04_ide21.jpg)

### 시리얼 모니터 주의사항

OpenCM9.04가 다운로드 중일때는 따로 USB 통신을 할 수 없습니다. 다운로드 중일 때는 시리얼 모니터를 열지 마세요.( 다른 COM포트라면 관계 없습니다.)

#### 환경설정(Preference)

파일 > 환경설정(Preference)를 통해 환경설정을 수행합니다.

![img](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/images/product/opencm/904/opencm9.04_29.jpg)

![img](https://robotis.s3.ap-northeast-2.amazonaws.com/support/ko/images/product/opencm/904/opencm9.04_30.jpg)

1. 스케치북 위치 : 사용자 기본 작업 디렉토리입니다. 기본적인 스케치 파일의 저장하기 및 불러오기 경로입니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_ide24.png)

2. Editor language: 글꼴을 변경합니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_ide25.png)

3. 다음 동작중 자세한 출력 보이기 : compilation에 체크를 하면 컴파일 과정중에 자세한 출력을 합니다.  
    Download에 체크를 하면 컴파일 후 다운로드 과정을 자세히 출력합니다.  
    컴파일 및 다운로드가 느려질 수 있으니 꼭 필요하지 않다면 선택하지 않는 것을 추천합니다.

## [라이브러리 사용하기](#라이브러리-사용하기)

### 라이브러리 설치하기

라이브러리 설치 방법은 아두이노와 동일합니다. 라이브러리의 경로는 IDE 폴더에서 libraries 입니다.  

```
ROBOTIS\libraries
```

![img](/assets/images/sw/opencm_ide/opencm9.04lib1.png)

Mac의 경우 아래의 경로로 접근하세요

```
 Documents/ROBOTIS/libraries
```

OpenCM의 모든 라이브러리는 다음 RC100 라이브러리 구조와 같은 구조로 등록합니다. 참고로 현재 널리 쓰이고 있는 아두이노 라이브러리들도 아래와 같은 구조로 되어 있으니 OpenCM으로 포팅하기 수월합니다.

(단 Arduino 함수나 헤더파일 이름을 OpenCM에 맞게 수정해야 합니다.)

![img](/assets/images/sw/opencm_ide/opencm9.04lib2.png)

![img](/assets/images/sw/opencm_ide/opencm9.04lib3.png)

위와 같이 libraries폴더 내에 RC100이라는 폴더 이름과 동일한 이름으로 RC100.cpp, RC100.h 파일을 구성합니다. utility 폴더에는 C파일로 짜여진 코드를 넣을 수 있습니다.

examples 폴더에는 해당 라이브러리로 구성된 스케치 예제가 들어갑니다. 예제도 폴더 단위로 구성되며 폴더 이름과 ino파일 이름이 동일하게 해야 인식합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04lib4.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04lib5.png)

## [복구 모드](#복구-모드)

아래와 같이 Board is not responding 이라는 메시지와 함께 다운로드가 되지 않으면 복구모드를 활용해서 강제로 다운로드 가능합니다.  
이렇게 정상 예제를 다운로드를 한번 하고 나면 복구가 되어서 다시 정상적인 다운로드가 됩니다.

![img](/assets/images/sw/opencm_ide/opencm9.04restore1.png)

OpenCM9.04의 User Button을 누른상태에서 USB 케이블로 PC와 직접 연결합니다. 다른 전원 소스는 모두 제거하고 오로지 User Button을 누른 채 USB로만 연결합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_26.jpg)

> OpenCM9.04는 User Button으로 복구 모드 진입을 할 수 있습니다.

아래 그림과 같이 복구모드로 진입할 경우 녹색 LED가 계속 켜진상태로 있습니다. 정상적으로 다운로드가 끝나면 보드가 리셋되면서 LED는 꺼집니다.

![img](/assets/images/sw/opencm_ide/opencm9.04restore2.jpg)

계속 다운로드 불능상태가 지속되면 작성하신 코드에서 USB 인터럽트를 방해할 만한 코드들을 제거하셔야 합니다.

# [예제](#예제)

## [센서 사용법](#센서-사용법)

로보티즈 센서 모듈들은 모두 5핀 포트와 연결될 수 있습니다. 연결 방법은 OpenCM9.04 하드웨어 설명을 참고하시면 됩니다.  
참고로 A타입의 경우 5핀 커넥터를 따로 납땜해야 하고 B타입, C타입은 미리 5핀 커넥터가 달려 있습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_sensor.jpg)

주의할 점은 5핀에 할당된 핀들이 양쪽 40핀 IO에도 공유가 되어 있으므로 아래 쓰고 있는 포트에 할당된 IO핀은 헤더에서 쓰지 않아야 합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_sensor1.jpg)

예를 들면 1번 포트에 IR센서를 연결하면 2번, 6번, 7번핀은 헤더에서 쓸 수 없습니다.

### [IR 센서 모듈](#ir-센서-모듈)

1. 연결도
    동작원리는 E-manual에서 처럼 SIG2(MOT+)에 High를 주면 발광 LED가 켜져서 생기는 적외선이 수광 LED에 감지가 되어서 ADC로 나타납니다.  
    적외선 센서 모듈은 최대한 SIG2번에 트랜지스터 회로가 있는 포트1, 4번에 연결하세요. 2번, 3번 포트는 ADC값이 작게 나옵니다.  
    아래는 포트1번에 연결된 그림입니다. 커넥터 방향은 회색선이 USB쪽으로 연결하시면 됩니다.  
    ADC값은 약 10~15us 뒤에 읽으면 최대값을 읽을 수 있습니다. 그리고 거리에 따라 감지할 수 있는 ADC값의 특성이 아래와 같기 때문에 이 점을 잘 고려해서 활용을 해야 합니다.  
    최대 15cm 이상 떨어진 물체는 감지할 수 없으며 지나치게 가까운 물체는 적외선이 반사되어 수광부로 들어오는 각도가 맞지 않아서 센서 값이 떨어지는 구간이 생깁니다.(0~1.5cm사이 구간에 해당)

2. 동작 확인
    ROBOTIS OpenCM의 예제 --> 07. Sensors --> IR_Read 를 오픈합니다.  
    다운로드 후에 시리얼 모니터를 열고 물체(흰색에서 최대입니다)를 갖다 대면 아래와 같이 ADC값을 볼 수 있습니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor4.png)

3. 동작 코드
    IR 센서는 SIG2번에 해당하는 핀과 ADC포트만 제어하면 IR센싱을 할 수 있습니다. 올로 라이브러리는 이러한 원리로 미리 코딩이 되어 있습니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor5.png)

    포트1번에 할당된 핀들이 2,6,7번을 확인합니다. setup()에서 SIG1,2번에 해당하는 6,7번 핀을 모두 LOW로 초기화 하고 2번을 아날로그 입력으로 초기화합니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor6.png)

    readIR이라는 함수에서 SIG2(7번핀)에서 HIGH를 주어서 발광LED를 ON하고  15us뒤에 아날로그 값을 읽으면 최적의 ADC값을 읽을 수 있습니다.  
    그리고 다시 SIG2번을 LOW로 주면 한 사이클이 끝납니다. 뒤에 30us는 없어도 상관 없습니다.  
    참고로 올로 라이브러리는 이와 같은 원리로 미리 코딩이 되어 있으므로 편리하게 이용할 수 있습니다.

### [DMS 센서 모듈](#dms-센서-모듈)

1. 연결도
    기본적으로 5핀중에 가운데 3핀만으로 전압 인가 후 ADC값을 읽어서 간단히 활용합니다.  
    적외선 센서와 비교해서 색과 반사율이 변해도, 거리에 따른 출력값 변화가 거의 없는 것이 장점입니다.  
    OpenCM9.04의 5핀 센서 포트 중에 아무 포트나 연결해도 무방합니다.  
    DMS 센서는 SIG1, 2번을 쓰지 않기 때문에 포트를 가리지 않습니다. 아래는 포트2번에 연결하였고 예제 코드도 2번 포트를 기준으로 설명합니다.

2. 동작 확인
    파일 --> 예제 --> 07. Sensors 예제 중에 OLLO_DMS_Read 예제를 다운로드 후 시리얼 모니터를 통해 확인 가능합니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor8.jpg)

3. 동작 코드
    DMS 센서 모듈과 같이 5핀 중에 3핀으로 구성된 센서는 그냥 아날로그 입력 핀만 계속 Read하면 됩니다. 별다른 초기 코드가 필요 없습니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor9.png)

### [Gyro 센서](#gyro-센서)

1. 연결도 및 센서 내부 구조
    로보티즈 자이로 센서도 마찬가지로 OpenCM9.04의 5핀 포트에 연결해서 X, Y 각속도(회전 가속도)를 측정할 수 있습니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor3.png)

    Gyro 센서 모듈을 OpenCM9.04의 5핀 포트 1번, 2번에 각각 연결한다. 아래 연결도처럼 포트1번에 X축 핀을 연결하고 포트2번에 Y축 포트를 연결한다.

2. 동작 코드
    예제-> 07. Sensors -> OLLO_Gyro_Read 예제를 다운로드 한 뒤 시리얼 모니터를 열면 아래와 같이 X, Y축 회전 가속도 값을 ADC로 확인 할 수 있습니다.  

    X축핀이 연결된 포트1번과 Y축핀이 연결된 포트2를 초기화하고 루프에서 60ms 주기로 X, Y축의 회전 가속도를 ADC값으로 읽습니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor13.png)

    DMS 센서 모듈과 동일하게 루프에서 단순히 아날로그 핀값을 읽기만 하면 됩니다.

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor14.jpg)

### [LED 모듈](#led-모듈)

1. 연결도 및 내부구조
    LED 모듈은 센서 모듈이 아닌 단순히 LED 2개를 디스플레이 형식으로 활용하기 위한 모듈입니다.  
    회로도를 보면 MOT+-가 각각 HIGH이면 OFF, LOW이면 ON이되는 Current Sink방식으로 제어를 하고 있음을 알 수 있습니다.  
    OpenCM9.04의 5핀 포트 1번, 4번의 SIG2핀은 LOW가 되지 않기 때문에 LED 모듈 사용에 제약이 있으므로 5핀 포트 2번, 3번을 사용하세요. 아래 그림은 포트 3번을 통해 LED 모듈을 연결하였습니다.

2. 동작 확인
    파일 -> 예제 -> 07. Sensors 예제 중에 OLLO_LED_Blink 를 다운로드 후 실행하면 양쪽 LED가 교대로 깜빡이는 것을 확인할 수 있습니다.  
    LED 모듈은 ADC 핀이 필요 없으므로 SIG1, 2번 핀만 활용하면 됩니다. 아래와 같이 setup()에서 포트 3번을 초기화하면 LED 모듈을 사용할 수 있습니다.  

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor15.png)

### [접촉 센서](#접촉-센서)

1. 연결도 및 연결도
    접촉 센서는 단순한 버튼과 비슷합니다. 접촉 센서는 윗부분을 눌렀을 때 버튼처럼 동작해서 접촉 유무를 감지합니다.
    회로도 역시 자주 쓰는 버튼회로에 지나지 않습니다. 버튼을 누르면 HIGH가 인가되고 떼면 LOW가 인가되는 구조입니다.  
    연결은 OpenCM9.04의 포트2번에 연결합니다.

2. 동작 코드
    OLLO 라이브러리의 OLLO_TOUCH_Read를 다운로드 한 뒤 시리얼 모니터를 오픈하면 결과를 확인 할 수 있습니다. 1이면 버튼이 누르지 않은 상태이고 버튼을 누르면 0값이 출력됩니다.  
    터치 센서 역시 5핀 중에 가운데 3개의 핀만 활용합니다. ADC 핀은 디지털 입력으로 선언해서 사용하는 것을 추천합니다.  
    터치 센서 내부적으로 Pull-down회로가 없기 때문에 Pull-down 옵션으로 INPUT_PULLDOWN을 선언해야 합니다.   OLLO 라이브러리는 내부적으로 이러한 방식으로 5핀센서의 핀을 초기화합니다.  

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor16.png)

    ![img](/assets/images/sw/opencm_ide/opencm9.04_sensor17.png)

## [디지털 입출력](#디지털-입출력)

### 핀13번에 LED를 연결해봅니다.

아래와 같이 OpenCM9.04에 LED와 저항을 연결합니다. 포트는 13번에 연결합니다.

![opencm9.04_digita1.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita1.jpg)

디지털 출력을 위해서는 반드시 setup()에서 pinMode(13, OUTPUT)을 통해 13번 핀을 OUTPUT으로 설정합니다.  
그리고 digitalWrite()함수로 HIGH/LOW 값을 지정합니다.  

```c
digitalWrite(13, HIGH); //13번핀에 HIGH를 출력합니다.
digitalWrite(13,LOW); //13번핀에 LOW를 출력합니다.
```

핀 13번이 LOW일 때 GND(-극)이 되어서 전류가 흐르기 때문에 LED가 켜집니다. 반대로 핀 13번이 HIGH일 때는 3.3V가 되어 전류가 흐를수 없기 때문에 LED가 꺼집니다.
이러한 원리로 LED가 깜빡이는 스케치 코드를 작성합니다.

```c
void setup(){
  pinMode(13, OUTPUT);
}

void loop(){
  digitalWrite(13, HIGH);
  delay(100); //0.1 초 지연
  digitalWrite(13, LOW);
  delay(100); //0.1 초 지연
}
```

0.1초 마다 깜빡거리는 LED를 확인하실 수 있습니다.

### Status LED를 깜박이게 만들어 봅시다.
OpenCM9.04에는 위의 예제처럼 LED를 연결하지 않고도 보드에 내장된 녹색의 Status LED를 가지고 테스트할 수 있습니다.

![opencm9.04_digita2.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita2.jpg)

> Status LED 위치

Status LED는 핀 14번과 연결되어 있고 미리 선언된 BOARD_LED_PIN을 사용해서 제어할 수 있습니다.  
BOARD_LED_PIN을 가지고 스케치 코드를 작성하면 보드가 바뀌어도 코드를 수정할 필요가 없는 장점이 있습니다.  
파일 --> 예제 --> Basic --> b_Blink 예제를 오픈합니다.

![opencm9.04_digita9.png](/assets/images/sw/opencm_ide/opencm9.04_digita9.png)

다운로드 하면 녹색의 Status LED가 깜박입니다.

### 핀7번에 디지털 입력을 받아봅니다.

아래와 같이 버튼과 풀다운 저항을 연결합니다. 포트는 7번을 이용해서 디지털 입력을 받습니다.

![opencm9.04_digita3.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita3.jpg)

> 풀다운 회로로 구성된 버튼 연결

OpenCM9.04의 IO핀에 디지털 입력을 위해서는 반드시 setup()에서 pinMode(7, INPUT)을 통해 7번 핀을 INPUT으로 설정이 필요합니다.  
그리고 아래와 같이 digitalRead() 함수로 HIGH/LOW 값을 받습니다.

```c
int value = digitalRead(7); // 7번핀을 읽어서 value변수에 할당함
```

전체 코드를 통해 확인합니다. 버튼이 눌리면 HIGH가 감지되고 스위치가 떨어지면 LOW가 감지됩니다.
버튼이 떨어졌을 때 LOW가 감지되는 것은 풀다운 저항과 연결된 GND가 있기 때문입니다.

```c
void setup(){   
  pinMode(7, INPUT);
  SerialUSB.begin();
}  
void loop(){  
  int value = digitalRead(7);
  if ( value == HIGH)
    SerialUSB.println(“HIGH Detected!”);
  else
    SerialUSB.println(“LOW Detected!”);
  delay(100);  
}  
```

위의 회로를 아래와 같이 풀업 회로로 변경하면 반대로 동작합니다. 버튼이 눌러지면 LOW가 감지되고 떨어지면 HIGH가 감지됩니다.  
버튼이 떨어졌을 때 HIGH가 감지되는 것은 풀업 저항과 연결된 3.3V전압이 때문입니다.  

![opencm9.04_digita4.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita4.jpg)

> 풀업 회로로 구성된 버튼 연결

### 풀업, 풀다운 저항 없이 디지털 입력을 받아 봅시다.

OpenCM9.04는 디지털 입력에서 풀다운이나 풀업 저항이 없이 스위치 회로 구성이 가능합니다.  
OpenCM9.04의 26개 GPIO핀들은 내부적으로 입력 Pull-up/Pull-down 저항을 가지고 있고 소프트웨어적으로 설정할 수 있습니다.  
만약 내부 풀업이 필요하면 pinMode(7, INPUT_PULLUP)으로 설정하시고 풀다운 회로가 필요하면 pinMode(7, INPUT_PULLDOWN)으로 합니다.  
INPUT으로 선언하면 플로팅 된 디지털 입력을 의미하기 때문에 외부에 풀업이나 풀다운 회로가 있어야 합니다. 예를 들어 봅시다.  
아래 회로는 핀 7을 통해 디지털 입력을 받는 회로인데 버튼이 바로 GND와 연결됩니다. 이런 경우 7번핀을 INPUT_PULLUP으로 선언하면 정상적으로 버튼이 동작하게 됩니다.  

![opencm9.04_digita5.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita5.jpg)

이 경우 버튼이 눌리면 LOW가 감지되고 떨어지면 내부 풀업에 의해 HIGH가 감지됩니다.

```c
void setup(){   
  pinMode(7, INPUT_PULLUP);
  SerialUSB.begin();
}  
void loop(){  
  int value = digitalRead(7);
  if ( value == HIGH)
    SerialUSB.println(“HIGH Detected!”);
  else
    SerialUSB.println(“LOW Detected!”);
  delay(100);  
}
```

반대의 경우 아래 연결도처럼 버튼을 3.3V에 바로 연결합니다.

![opencm9.04_digita6.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita6.jpg)

이 경우 버튼이 눌러지면 HIGH가 감지되고 떨어지면 내부 풀다운에 의해 LOW가 감지됩니다.

```c
void setup(){   
  pinMode(7, INPUT_PULLDOWN);
  SerialUSB.begin();
}  
void loop(){  
  int value = digitalRead(7);
  if ( value == HIGH)
    SerialUSB.println(“HIGH Detected!”);
  else
    SerialUSB.println(“LOW Detected!”);
  delay(100);  
}
```

### User Button을 이용해서 입력 받아 봅시다.

버튼도 Status LED처럼 내장된 User Button을 가지고 따로 버튼 회로를 만들 필요가 없이 사용할 수 있습니다.  
회로도를 보면 내장된 풀다운 입력을 사용하는 것을 알 수 있습니다.

![opencm9.04_digita7.jpg](/assets/images/sw/opencm_ide/opencm9.04_digita7.jpg)

User Button은 23번 핀으로 연결되어 있으므로 23번핀을 직접 지정해도 되고 BOARD_BUTTON_PIN을 써도 됩니다.

```c
void setup(){   
  pinMode(BOARD_BUTTON_PIN, INPUT_PULLDOWN);
  SerialUSB.begin();
}  
void loop(){  
  int value = digitalRead(BOARD_BUTTON_PIN);
  if ( value == HIGH)
    SerialUSB.println(“HIGH Detected!”);
  else
    SerialUSB.println(“LOW Detected!”);
  delay(100);  
}
```

다운로드 해보면 유저 버튼이 눌리면 HIGH가 입력되고 떨어지면 내부 풀다운 회로에 의해서 LOW가 입력됩니다.

### Status LED를 토글 시켜봅니다.
1번 핀의 현재 출력이 HIGH이면 LOW가 되고, LOW이면 HIGH로 반전 시킵니다.  

```c
digitalWrite(1, HIGH); // 1번핀이 HIGH가 됩니다.
togglePin(1); // HIGH 상태였던 1번핀이 다시 LOW가 됩니다.
```

이러한 원리로 LED Blink 예제를 매우 간단하게 작성할 수 있습니다. 간단히 Status LED 를 가지고 togglePin()을 사용해 봅니다.

```c
void setup(){   
  pinMode(BOARD_LED_PIN, OUTPUT);
}  
void loop(){   
  togglePin(BOARD_LED_PIN);
  delay(100); //0.1 초 지연
}
```

0.1초 간격으로 LED가 깜빡입니다. 참고로 BOARD_LED_PIN만 토글하는 toggleLED()를 써도 같은 동작을 수행합니다.

![opencm9.04_digita8.png](/assets/images/sw/opencm_ide/opencm9.04_digita8.png)

## [아날로그 입출력](#아날로그-입출력)

아날로그 입력은 반드시 OpenCM9.04 실크스크린의 ANALOG IN 영역에 위치한 0번~9번핀만 아날로그 입력이 됩니다.  
아날로그 출력은 TIMER를 활용한 PWM출력을 통해 아날로그 출력을 대신합니다.

![opencm9.04_analog1.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog1.jpg)

### 핀3번에 가변저항으로 아날로그 입력을 받습니다.

아래와 같이 3번핀에 가변저항을 연결하고 전압은 3.3V를 연결합니다.

![opencm9.04_analog2.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog2.jpg)

![opencm9.04_analog3.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog3.jpg)

3번 핀의 아날로그 입력을 위해서는 pinMode(3, INPUT_ANALOG)를 통해 아날로그 입력으로 핀모드 설정을 해주시면 준비는 끝납니다.  
설정된 3핀으로 아날로그 값을 읽기 위해서는 analogRead()를 사용합니다.

```c
int value = analogRead(3);  // 0번 핀에서 아날로그 입력받아서 value 변수에 할당합니다.
```

여기서 value에 할당되는 값은 12bit ADC 값으로 0~ 4,095값이 됩니다. 전체 코드를 통해 읽은 ADC값을 출력해봅니다.

```c
void setup(){
  pinMode(3, INPUT_ANALOG);  
}
void loop(){
  int value = analogRead(3);
  SerialUSB.println(value);   // value값을 출력합니다.
  delay(100); //delay time for USB transfer
}
```

### 핀6번에 아날로그 출력(PWM)을 합니다.

핀 6번에서 출력되는 PWM을 이용해서 LED를 제어합니다. 아래와 같이 브레드 보드를 이용해서 LED와 저항을 연결하고 핀6과 연결합니다.

![opencm9.04_analog4.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog4.jpg)

![opencm9.04_analog5.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog5.jpg)

6번 핀의 아날로그 pinMode(6, PWM)으로 설정합니다.  
설정된 6번핀을 통해 PWM 출력은 analogWrite()를 이용합니다.  

```c
analogWrite(6, 10000);
```

PWM출력을 통해 아날로그 출력을 대신합니다. PWM의 Duty cycle은 두 번째 인자를 통해 제어합니다. 여기서는 10000이지만 0~ 65535 범위의 값으로 듀티 사이클을 지정할 수 있습니다.  
0이면 0% 듀티 사이클이고 65535일 경우 100%듀티 사이클을 나타냅니다.

![opencm9.04_analog6.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog6.jpg)

전체 코드를 확인합니다.

```c
void setup(){
  pinMode(6, PWM);
}  
void loop(){
  for(int i=1; i < 7; i++){
    analogWrite(6, i*10000);//generate pwm as 10000 ~ 60000 scale
    delay(100);
  }
}   
```

analogWrite()의 두번째 인자를 통해 아래와 같은 다양한 Duty Cycle의 PWM을 구현할 수 있습니다.

### Status LED를 천천히 꺼지도록 Dimming 시켜봅니다.

Status LED는 핀 14번과 연결되어 있고 핀 14번 역시 PWM 출력이 가능합니다. 파일 --> 예제 --> 01. Basic --> f_Led_Fadin을 오픈합니다.

![opencm9.04_analog7.jpg](/assets/images/sw/opencm_ide/opencm9.04_analog7.jpg)

OpenCM9.04에 다운로드 해보면 Status LED가 반복적으로 천천히 켜졌다가 꺼지는 동작을 합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_analog8.png)

## [시리얼 통신](#시리얼-통신)

OpenCM9.04는 총 4개의 시리얼 장치가 있습니다. Serial1, Serial2, Serial3, SerialUSB가 있고 Serial1은 다이나믹셀 통신포트 전용으로 할당되어 있어서 사용상의 제한이 따릅니다.  
BT-210, BT-110A 같은 4핀 포트를 가진 블루투스 장치를 Serial2를 통해 사용할 수 있습니다. Serial3은 TX3(24), RX3(25)으로 PCB 뒷면에 표시되어 있습니다.

![opencm9.04_serial1.jpg](/assets/images/sw/opencm_ide/opencm_ide_107.png)

> Serial3 위치

SerialUSB는 OpenCM9.04에서 매우 중요합니다. ROBOTIS OpenCM에서 펌웨어 다운로드를 수행하고 Serial1, 2, 3 장치처럼 데이터 통신도 수행합니다. 사용법은 Serial1,2,3과 거의 동일합니다.

### 시리얼 장치를 이용해서 데이터를 전송합니다.

아래와 같이 4핀 통신포트에 LN-101을 이용해 PC와 연결합니다. PC에는 RoboPlus Terminal이나 시리얼 모니터를 이용해서 COM포트를 오픈합니다.

![opencm9.04_serial2.jpg](/assets/images/sw/opencm_ide/opencm_ide_108.png)

반드시 아래와 같이 Serial2 장치에 대한 초기화를 수행한 뒤에 loop()에서 아래의 예제를 수행합니다.

```c
void setup(){
  Serial2.begin(57600);
}
void loop(){
  //테스트 예제 코드
}
```

데이터 전송은 print()와 println() 메소드를 통해 전송하고 print()메소드는 줄바꿈이 없는 출력을 의미하고 println()은 줄바꿈이 있는 출력을 수행합니다.

```c
Serial2.print(“Hello World This is OpenCM9.04”);
```

“Hello World” 스트링을 Serial2(TX2, RX2)장치를 통해 출력합니다.

```c
Serial2.print(“OpenCM9.04 is the first product of OpenCM Series”);
Serial2.println(“ println() ends this line”);
Seirla2.println(“This is new line”);
```

println()은 줄바꿈을 하고 새로운 라인으로 출력을 수행합니다. 아래와 같은 출력을 확인할 수 있습니다.

![opencm9.04_serial3.png](/assets/images/sw/opencm_ide/opencm_ide_109.png)

```c
Serial2.print(12);
```

> 10진수 12를 출력합니다.

```c
int abc = 128;
Seial2.print(abc);
```

> abc변수의 값 128을 출력합니다.

```c
Serial2.print(abc, 16);
```

> abc변수의 값 128을 16진수 출력합니다. 0x80이 출력됩니다.

```c
Serial2.print(abc, 2);
```

> abc변수의 값 128을 2진수 출력을 합니다. 마찬가지로 8진수는 두 번째 인자에 8을 지정하면 되고 두 번째 인자가 없으면 기본적으로 10진수를 출력합니다.

```c
Serial2.println(3.14);
```

> 소수점(double) 타입의 3.14를 출력하고 줄바꿈 합니다. 소수점 2자리까지 출력합니다. double 변수를 선언해서 출력할 수도 있습니다.

```c
double  var = 1.234;
Serial2.println(var);
```

> 핀0번, 1번, 2번에서 읽은 아날로그 입력값을 Serial2를 통해 차례로 출력해봅니다. 여러 개의 print()와 println()을 이용하면 아래와 같이 보기 좋게 출력할 수 있습니다.

```c
int sensorValue0=0;
int sensorValue1=0;
int sensorValue2=0;
sensorValue0 = analogRead(0);
sensorValue1 = analogRead(1);
sensorValue2 = analogRead(2);
Serial2.print(“Sensor0 = “); Serial2.print(sensorValue0);
Serial2.print(“ Sensor1 = “); Serial2.print(sensorValue1);
Serial2.print(“ Sensor2 = “); Serial2.println(sensorValue2);
```

> 마지막 sensorValue2 출력만 println()메소드를 이용해서 줄바꿈하면 3개의 아날로그 입력에 대한 깔끔한 출력을 얻을 수 있습니다.

![opencm9.04_serial4.png](/assets/images/sw/opencm_ide/opencm_ide_110.png)

### 시리얼 장치를 이용해 데이터를 받습니다.
시리얼 장치로 Echo 기능을 구현해 봅니다.  
char형 변수 temp를 통해 Serial2장치에 데이터가 오면 read()메소드로 데이터를 저장하고 바로 print() 메소드로 출력하면 Echo 기능이 구현 됩니다.

```c
char temp = 0;
loop(){
  if ( Serial2.available() ){
    temp = Serial2.read();
    Serial2.print(temp);
  }  
}  
```

전체 소스는 아래와 같습니다.

```c
void setup(){
  Serial2.begin(57600);
}
byte temp = 0;  

void loop(){
if ( Serial2.available() ){
    temp = Serial2.read();
    Serial2.print(temp);
  }
}
```

아래와 같이 인터럽트 방식으로 구현해 봅니다. Serial장치의 인터럽트는 아래와 같이 반환형이 없고 byte형 인자가 하나 있는 함수를 구현합니다. 여기서 바로 print()메소드로 넘어오는 데이터를 출력하면 Echo 기능이 됩니다.  
따로 프로토타입 선언 없이 아무 위치에나 구현해서 사용합니다.

```c
void serialInterrupt(byte buffer){  
  Serial2.print(buffer);
}  
```

이렇게 구현한 serialInterrupt()를 함수 포인터 형태로setup() 내에서 attachInterrupt()를 통해 설정해 줍니다.

```c
Serial2.attachInterrupt(serialInterrupt);   
```

인터럽트를 활용한 Serial2 장치의 데이터 입력에 대한 전체 코드는 아래와 같습니다.

```c
void setup(){
  Serial2.begin(57600);
  Serial2.attachInterrupt(serialInterrupt);
}

void serialInterrupt(byte buffer){  
  Serial2.print(buffer);
}  

void loop(){
  //코드가 없어도 됩니다.
}
```

### SerialUSB 장치를 이용해 데이터를 출력합니다.
아래와 같이 OpenCM9.04의 Micro-B USB 커넥터를 이용해서 바로 PC와 연결합니다.  
이번 예제는 LN-101과 같인 장치 없이 OpenCM9.04만으로 PC와 데이터 통신을 수행합니다.  

![opencm9.04_serial5.jpg](/assets/images/sw/opencm_ide/opencm_ide_111.png)

아래와 같이 SerialUSB 장치에 대한 초기화를 수행한 뒤에 loop()에서 아래의 예제를 수행합니다. Baud rate에 대한 지정은 없습니다.

```c
void setup(){
  SerialUSB.begin();
}

void loop(){
//테스트 예제 코드
}
```

Serial 장치와 사용법이 거의 같습니다. print(), println()메소드를 통해 같은 방식으로 제어 하면 됩니다.

```c
SerialUSB.print(“CM-900 is the first product of CM-9 Series”);  
SerialUSB.println(“ println() ends this line”);  
SeirlaUSB.println(“This is new line”);  
```

10진수 12를 출력해봅니다.

```c
SerialUSB.print(12);  
```

int형 변수를 통해 출력해봅니다.

```c
int abc = 128;  
SerialUSB.print(abc);  
```

이번엔 abc 변수의 값을 16진수로 출력합니다.

```c
SerialUSB.print(abc, 16);  
```

abc변수의 값 128이 16진수 형태인 0x80이 출력됩니다.

```c
SerialUSB.print(abc, 2);  
```

abc변수의 값 128을 2진수 출력을 합니다. 마찬가지로 8진수는 두 번째 인자에 8을 지정하면 되고 두 번째 인자가 없으면 기본적으로 10진수를 출력합니다.

```c
SerialUSB.println(3.14);  
```

소수점(double) 타입의 3.14를 출력하고 줄바꿈 합니다. 소수점 2자리까지 출력합니다. double 변수를 선언해서 출력해 봅니다.

```c
double  var = 1.234;  
SerialUSB.println(var);  
```

### 시리얼 USB장치를 이용해 데이터를 입력 받습니다.

시리얼 USB 장치로 Echo 기능을 구현해 봅니다.  
char형 변수 temp를 통해 Serial USB장치에 데이터가 오면 read()메소드로 데이터를 저장하고 바로 print() 메소드로 출력하면 Echo 기능이 구현 됩니다

```c
char temp = 0;  
loop(){  
  if ( SerialUSB.available() ){  
    temp = SerialUSB.read();
    SerialUSB.print(temp);
  }  
}  
```

전체 소스는 아래와 같습니다.

```c
void setup(){
  SerialUSB.begin();
}

byte temp = 0;  
void loop(){

if ( SerialUSB.available() ){
    temp = SerialUSB.read();
    SerialUSB.print(temp);
  }
}
```

아래와 같이 인터럽트 방식으로 구현해 봅니다.  
Serial USB의 인터럽트는 아래와 같이 반환형이 없고 byte형 인자와 byte* 인자가 있는 함수로 구현합니다. 여기서 바로 print() 메소드로 넘어오는 데이터를 출력하면 Echo 기능이 됩니다.  
PC의 터미널로 USB COM 포트에 데이터를 쓰면 1바이트 씩 전송되기 때문에 nCount =1이고 buffer 의 index 0번 데이터만 Echo하면 충분합니다.

```c
void usbInterrupt(byte nCount, byte* buffer){
  SerialUSB.print(buffer[0]);
}
```

이렇게 구현한 usbInterrupt()를 함수 포인터 형태로setup() 내에서 attachInterrupt()를 통해 설정해 줍니다.

```c
SerialUSB.attachInterrupt(usbInterrupt);
```

loop()함수는 아래와 같이 빈 함수로 두어도 괜찮습니다.

```c
void loop(){
}
```

SerialUSB 장치의 인터럽트 활용한 전체 코드는 아래와 같습니다.

```c
void setup(){
  SerialUSB.begin();
  SerialUSB.attachInterrupt(usbInterrupt);
}

void usbInterrupt (byte nCount, byte* buffer){  
  SerialUSB.print(buffer[0]);
}  

void loop(){
  //코드가 없어도 됩니다.
}
```

## [외부 인터럽트](#외부-인터럽트)

7번핀에 입력되는 신호가 변할 때 LED를 껏다 켜는 코드를 만들어 봅니다. 아래와 같이 3.3V와 연결된 스위치를 7번핀과 연결합니다.  
외부 풀다운회로 없이 내부 입력 풀다운 옵션을 활용합니다. 그리고 LED와 저항을 마찬가지로 3.3V와 연결하고 포트는 13번에 연결합니다. LED방향에 주의합니다.  

![opencm9.04_interruption1.jpg](/assets/images/sw/opencm_ide/opencm9.04_interruption1.jpg)

![opencm9.04_interruption2.jpg](/assets/images/sw/opencm_ide/opencm9.04_interruption2.jpg)

전역변수 하나로 플래그를 만들어서 7번핀의 신호가 변할 때 마다 인터럽트 루틴에서 플래그를 토글시키는 방법을 응용합니다.

```c
volatile int state = LOW;
```

setup()에서 외부 인터럽트는 attachInterrupt() 함수로 설정하고 관련된 핀 7번은 pinMode에서 INPUT_PULLDOWN으로 선언합니다.

```c
pinMode(7, INPUT_PULLDOWN);
attachInterrupt(7, LedChange, CHANGE);
```

LedChange ()를 구현합니다. void LedChange (void) 타입으로 구현합니다.

```c
void LedChange (){
  if(state == HIGH)
    state = LOW;
  else  
    state= HIGH;
}  
loop(){  
  digitalWrite(BOARD_LED_PIN, state);
}  
```

전체 소스는 아래와 같습니다.

![opencm9.04_interruption3.png](/assets/images/sw/opencm_ide/opencm9.04_interruption3.png)

## [다이나믹셀 사용법](#다이나믹셀-사용법)

아래의 예제에 사용된 다이나믹셀은 ID=1번, 통신 속도는 모두 1M bps로 초기화를 전제로 합니다.  
다이나믹셀 클래스 선언은 명시되어 있지 않더라도 아래와 같이 미리 선언되어 있다고 가정합니다.

```c
Dynamixel Dxl(1); // Dynamixel Bus on Serial1(USART1)
```

### AX-12A의 모델 넘버와 펌웨어 버전을 읽습니다.

E-manual에서 AX-12A의 Control Table에서 모델넘버와 펌웨어 버전에 해당하는 주소값은 아래와 같습니다.

![opencm9.04_dynamixel.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel.png)

ID가 1번인 AX-12A에서 모델 넘버의 하위바이트에 해당하는 0번 주소와 펌웨어 버전 정보에 해당하는 2번주소를 읽어보겠습니다.  
모두 1바이트이므로 byte형 타입의 변수를 쓰면 됩니다.

```c
byte nModel = Dxl.readByte(1, 0); // 모델 번호를 읽고
byte vFirmware = Dxl.readByte(1, 2); // 펌웨어 버전을 읽습니다.
```

아래와 같이 출력합니다.

```c
SerialUSB.print(“Model Number : “);SerialUSB.print(nModel);
SerialUSB.print(“ Firmware Ver : “);SerialUSB.println(vFirmware);
```

![opencm9.04_dynamixel1.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel1.png)

> 출력 확인

###  ID가 1인 AX-12A의 현재 내부 온도를 읽어봅니다.

Control Table에서 AX-12A의 내부온도에 해당하는 주소는 아래와 같습니다.

![opencm9.04_dynamixel2.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel2.png)

같은 방식으로 readByte()로 한바이트 읽어 봅니다.

```c
byte temp = Dxl.readByte(1, 43);
SerialUSB.print(“Current Temperature : “);
SerialUSB.println(temp);
```

### AX-12의 ID를 2로 설정합니다.

다이나믹셀 ID에 해당하는 3번 주소에 writeByte() 메소드로 1바이트 기록합니다.

![opencm9.04_dynamixel3.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel3.png)

```c
void setup(){
  Dxl.begin(1);
  delay(1000);  // 1초정도 딜레이를 주는 것이 좋습니다.
  Dxl.writeByte(1, 3, 2); //1번 ID의 다이나믹셀을 2번 ID로 변경
}
void loop(){
  Dxl.writeByte(2, 25, 1);  //변경된 ID로 LED Blinking
  delay(100);
  Dxl.writeByte(2, 25, 0);
  delay(100);
}
```

성공적으로 ID변경이 완료되면 다이나믹셀의 LED가 깜빡이게 될 것 입니다.

### Baud Rate를 57600 bps로 변경합니다.
다이나믹셀의 통신속도는 4번 주소의 Baud rate를 이용해 변경 가능합니다. ID 변경과 마찬가지로 writByte() 메소드를 활용합니다.  
57,600bps는 다이나믹셀 속도 계산을 활용하면 index 값이 34가 나옵니다. 다이나믹셀 2.0 프로토콜의 경우는 새로운 Baud rate 테이블을 참고하세요.   57,600bps의 경우 1이 됩니다.

![opencm9.04_dynamixel4.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel4.png)

```c
void setup(){
  Dxl.begin(1);
  delay(1000);  // 1초정도 딜레이를 주는 것이 좋습니다.
  Dxl.writeByte(1, 4, 34); // 34 = 57600 bps
  Dxl.begin(34); // 변경되 Baud rate로 새롭게 초기화
  delay(1000);
}
void loop(){
  Dxl.writeByte(1, 25, 1);  
  delay(100);
  Dxl.writeByte(1, 25, 0);
  delay(100);
}
```

Baud rate가 변경되었으므로 새롭게 Dxl.begin(34)로 버스를 새롭게 초기화해야 합니다.

### ID가 1인 다이나믹셀의 움직임 유무를 확인합니다.

Control Table에서 46(0x2E)값을 이용해 현재 AX-12A의 움직임 여부를 확인할 수 있습니다.

![opencm9.04_dynamixel5.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel5.png)

```c
byte bMoving = Dxl.readByte(1, 46);
```

ID 1번 다이나믹셀이 현재 움직이고 있다면 bMoving이라는 변수에 1이 반환되고 움직임이 없다면 0을 반환합니다.

### AX-12A 다이나믹셀을 150도 위치로 움직여 봅니다.

다이나믹셀을 목표 위치(150도)로 움직이려면 Goal Position에 해당하는 주소에 원하는 이동 위치를 넣어주면 됩니다.  
아래와 같이 하위, 상위 2바이트로 이루어져 있으며 각각 접근하는 것 보다는 하위 바이트 30(0x1E)에 writeWord() 메소드를 통해 2바이트(1워드)를 기록하는 것을 추천합니다.

![opencm9.04_dynamixel6.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel6.png)

E-manual에서 150도에 해당하는 위치는 아래의 그림과 같이 512 와 매칭됨을 확인할 수 있습니다.   

![opencm9.04_dynamixel7.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel7.png)

```c
Dxl.writeWord(1, 30, 512);
Dxl.getResult() 함수로 통신 성공 여부를 확인하시길 바랍니다.
```

### 각각의 RX-64에 대해서 각각 다음의 위치와 속도로 이동합니다.

이동이 완료되면 모두 0위치로 원위치합니다. 계속 반복적으로 이와 같은 동작을 수행합니다.

![opencm9.04_dynamixel8.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel8.png)

각 다이나믹셀에 보내기 위한 Sync Write 패킷 데이터를 만듭니다. 0위치에 대한 Sync Write 패킷 데이터와 목표위치와 속도를 저장한 패킷 데이터를 만듭니다.

```c
#define PACKET_LEN 12
#define NUM_OF_DATA 2

int SyncPage1[PACKET_LEN]=
{  1, 010, 150,
  2, 220, 360,
  3, 020, 170
  4, 220, 380};

int SyncPage2[PACKET_LEN]=
{  1, 0, 0,
  2, 0, 0,
  3, 0, 0
  4, 0, 0};

void loop(){
  Dxl.syncWrite(30, NUM_OF_DATA, SyncPage1, PACKET_LEN);
  delay(1000);
  Dxl.syncWrite(30, NUM_OF_DATA, SyncPage2, PACKET_LEN);
  delay(1000);
}
```

### 동작각을 0~150도로 제한합니다.

CCW Angle Limit이 0x3FF일 경우 300도 이므로 150도에 해당하는 0x200을 writeByte() 메소드를 이용해 전송합니다.  

**주의**: 8번 CCW Angle Limit을 0으로 할 경우 바퀴모드로 변경되어서 Goal position 제어가 되지 않으니 주의하세요.
{: .notice--warning}

![opencm9.04_dynamixel9.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel9.png)

```c
Dxl.writeWord(1, 8, 0x200);
if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크…}
```

### 동작전압을 10V ~ 17V로 설정합니다.

10V의 데이터는 100(0x64), 17V는 170(0xAA) 이므로 각각 writeByte() 메소드를 통해 하한, 상한을 기록합니다.  
컨트롤 테이블 주소는 각각 하한 범위 전압 = 12(0x0C), 상한 범위 전압 = 13(0x0D) 입니다.

![opencm9.04_dynamixel10.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel10.png)

```c
Dxl.writeByte(1, 12, 100);
Dxl.writeByte(1, 13, 170);

if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크…}
```

### 토크를 최대값의 50%만 발휘하도록 합니다.

MAX Torque 값을 최대값인 0x3FF의 50%인 0x1FF로 설정합니다. Max Torque 하위 바이트 주소 14(0x0E)에 writeByte()이용해 데이터를 씁니다.

![opencm9.04_dynamixel11.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel11.png)

```c
Dxl.writeByte(1, 14, 0x1FF);   
if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크…}
```

전원을 off 한 뒤 다시 전원을 공급해야만 Max Torque가 변경됩니다.

### 57RPM의 속도로 Position 180도에 위치시킵니다.

```c
Moving Speed( Address 32(0x20) ) = 512(0x200)
Goal Position( Address 30(0x1E) ) = 512 (0x200)
```

로 설정합니다. 아래와 같이 word단위 데이터로 접근합니다.

```c
Dxl.writeWord(1, 32, 512);  // 57 RPM의 속도 설정
Dxl.writeWord(1, 30, 512);   // 180도 위치로 이동

if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크…}
```

### ID가 0인 AX-12는 0&deg;에 ID가 1인 AX-12는 위치 300&deg;에 위치시킵니다.
두 개의 AX-12 를 똑같은 시점에서 구동.  
Syncwrite와 마찬가지로 직접 setTxPacketXXX() 메소드를 활용해서 Packet을 만듭니다.  
이 경우 INST_REG_WRITE와 INST_ACTION을 이용해서 Packet을 만들어 봅니다.  
참고로 위치 0도는 0에 해당하고 300도는 1023(0x3FF)에 해당합니다.

```c
ID=0, Instruction = INST_REG_WRITE, Address = 30(0x1E), Data = 0
ID=1, Instruction = INST_REG_WRITE, Address = 30(0x1E), Data = 1023

Dxl.setTxPacketId(0); // 0번 ID 제어를 명시합니다.
Dxl.setTxPacketInstruction(INST_REG_WRITE);
Dxl.setTxPacketParameter(0, 30); // Goal Position Address
Dxl.setTxPacketParameter(1, Dxl.getLowByte(0)); // Low Byte
Dxl.setTxPacketParameter(2, Dxl.getHighByte(0)); // High Byte
Dxl.setTxPacketLength(5);  //전체 데이터 길이 = 데이터 길이 + 3
Dxl.txrxPacket();

if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크}
```

![opencm9.04_dynamixel12.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel12.png)

두 번째 다이나믹셀에 대한 패킷 전송

```c
Dxl.setTxPacketId(1);
Dxl.setTxPacketInstruction(INST_REG_WRITE);
Dxl.setTxPacketParameter(0, 30); // Goal Position Address
Dxl.setTxPacketParameter(1, Dxl.getLowByte(1023)); //Low Byte
Dxl.setTxPacketParameter(2, Dxl.getHighByte(1023)); //High Byte
Dxl.setPacketLength(5);
Dxl.txrxPacket();

if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크}
```

![opencm9.04_dynamixel13.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel13.png)

0번과 1번 다이나믹셀의 레지스터에 대기중인 Instruction을 바로 실행하려면 INST_ACTION  Packet을 전송합니다.

```c
Dxl.setTxPacketId(BROADCAST_ID);
Dxl.setTxPacketInstruction(INST_ACTION);
Dxl.setTxPacketLength(2);
Dxl.txrxPacket();    
if( Dxl.getResult() == COMM_RXSUCCESS ){ // 통신 성공 여부 체크}
```

![opencm9.04_dynamixel14.png](/assets/images/sw/opencm_ide/opencm9.04_dynamixel14.png)

각각 Packet을 만들어서 전송할 때마다 통신 성공 여부를 체크하는 것이 좋습니다.

## [RC-100 라이브러리](#rc-100-라이브러리)

**RC100을 이용한 OpenCM9.04 연결방법**

OpenCM의 RC100라이브러리를 활용하면 OpenCM9.04를 원격으로 조종할 수 있습니다. 아래는 OpenCM9.04와 RC100 사이에 연결할 수 있는 다양한 무선 연결을 나타냅니다.  
RC100라이브러리는 OpenCM9.04의 4핀 통신포트에 통신 모듈이 연결되었을 경우만 정상 동작합니다.  
RC-100 통신 패킷에 대해서는 [RC-100](/docs/kr/parts/communication/rc-100/)을 참고하세요

### RC-100B + BT-100 or BT-210 을 이용한 블루투스 연결

![img](/assets/images/sw/opencm_ide/opencm9.04_rc100_2.jpg)

> 블루투스를 이용해서 RC100 조종기와 연결하기

### RC-100B + ZIG-100/ZIG-110A를 이용한 지그비 연결

![img](/assets/images/sw/opencm_ide/opencm9.04_20.png)

> 지그비를 활용해서 OpenCM9.04와 RC100 조종기와 연결하기

### RC-100B + IR Receiver OIR-10을 이용한 적외선 연결
RC-100A 또는 RC-100B의 적외선 통신 방법에 대해서는 IR-10을 참고하세요

### 안드로이드 스마트폰 + BT-210 을 이용한 블루투스 연결
안드로이드 스마트폰의 경우 R+ m.Task 어플리케이션의 RC100 시뮬레이션을 이용하면 RC-100 패킷을 보낼 수 있습니다. R+m.Task는 구글 Play를 통해서 다운받을 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm904_04.png)

![img](/assets/images/sw/opencm_ide/opencm9.04_rc100_4.png)

> 블루투스로 OpenCM9.04와 스마트폰 연결하기 – R+m.Task의 RC100 기능 활용

### RC100의 버튼 1을 눌렀을 때 OpenCM9.04의 Status LED를 깜빡이게 해봅니다.

OpenCM9.04에서 RC100 패킷을 처리하기 위해서는 RC100 라이브러리를 사용합니다.  
RC100 라이브러리는 무선통신 모드와 적외선 통신 모드의 2가지 모드로 시작할 수 있습니다.

- 무선 통신 모드(1) : 블루투스 모듈(BT-210/BT-110A), 지그비 모듈(ZIG-110A)
- 적외선 통신모드(2) : 적외선 수신기(OIR-10)

무선통신 모드로 RC100 라이브러리로 초기화 합니다.

```c
#include <RC100.h>
RC100 Controller;
Controller.begin(1);  //RC100 init as remote mode
```

RC100의 각 버튼에 대한 define은 아래를 참조하세요

```c
#define RC100_BTN_U (1)
#define RC100_BTN_D (2)
#define RC100_BTN_L (4)
#define RC100_BTN_R (8)
#define RC100_BTN_1 (16)
#define RC100_BTN_2 (32)
#define RC100_BTN_3 (64)
#define RC100_BTN_4 (128)
#define RC100_BTN_5 (256)
#define RC100_BTN_6 (512)
```

RC100라이브러리를 이용해 읽은 패킷 데이터가 버튼 1일 경우에 Status LED를 LOW로 출력시킵니다.

```c
if(Controller.available()){
  RcvData = Controller.readData()
  if(RcvData & RC100_BTN_1)
    digitalWrite(BOARD_LED_PIN, LOW);
}
```
전체 소스는 아래와 같고 파일 -> 예제 -> RC100 -> RC100_LED_Control 을 열면 동일한소스가 나타납니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_rc100_5.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04_rc100_6.png)

마찬가지로 OIR-10 적외선 수신기를 이용해서 Status LED를 깜빡이도록 해봅니다. 적외선 통신 모드는 아래와 같이 숫자 2로 초기화를 수행합니다.

```c
#include <RC100.h>

RC100 Controller;
Controller.begin(2);  //RC100 init as IR mode
```

나머지 동작의 이전 예제와 동일합니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_rc100_7.png)

## [BKP Library](#bkp-library)

BKP메모리는 전원이 계속 유지된 상태에서는 항상 데이터를 유지하기 때문에 사용자 데이터나 중요 데이터를 임시로 저장해서 리셋 복귀 후에 다시 데이터를 참조할 때 유용하게 사용할 수 있다.  
OpenCM 보드에서는 외부 라이브러리로 BKP메모리에 대한 API를 제공한다. 아래와 같이 파일 -> 예제 ->  BKP -> ReadWrite 를 선택한다.

![img](/assets/images/sw/opencm_ide/opencm9.04_bkp1.jpg)

예제를 선택하면 아래와 같은 코드가 나타납니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_bkp2.jpg)

### 예제 설명

setup()에서 BKP 메모리를 초기화 하고 Serial2 장치를 57,600bps로 초기화 합니다. 그리고 “Start OpenCM9.04 BKP Memory Test”를 Serial2를 통해 출력하고 loop()를 시작합니다.  
OpenCM의 STM32F103CB는 16bit 레지스터가 총 10개인 BKP 메모리로 구성되어 있습니다.  
loop()에서는 1초 주기로 주소 1에서 10까지 데이터를 출력하다가 Serial2에 어떤 데이터가 들어오면 BKP메모리의 주소 1부터 10까지 데이터를 기록합니다.

```c
#include "BKP.h"
BKP BKP_MEMORY;
int i;
void setup(){
  /* Initialize clock and registers for BKP*/

  BKP_MEMORY.begin();
  Serial2.begin(57600);
  Serial2.println("Start OpenCM9.04 BKP Memory Test");
}
void loop(){
  delay(1000);
  for(i=1; i<11;i++){
    Serial2.print("BKP Memory Read = ");
    Serial2.println(BKP_MEMORY.read(i));
  }
  if(Serial2.available()){    
    BKP_MEMORY.enable();
    for(i=1; i<11;i++){
      BKP_MEMORY.write(i,i*10);
    }    
    BKP_MEMORY.disable();
  }
}
```

BKP메모리의 중요한 특성은 리셋을 눌러서 CPU가 다시 시작해도 BKP메모리 값은 그대로 유지합니다.  
그러나 전원을 뽑았다가 다시 꽂으면 데이터가 사라집니다. 아래는 그 출력값을 통해 BKP메모리의 특성을 살펴볼 수 있습니다.

![img](/assets/images/sw/opencm_ide/opencm9.04_bkp3.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04_bkp4.jpg)

![img](/assets/images/sw/opencm_ide/opencm9.04_bkp5.jpg)
