# 시작하기

임베디드 C를 시작하기 위한 방법을 설명합니다.

`note` Windows 8.1,10을 사용중 설치에 error 발생경우 여기를 클릭해 다운로드로와 압축 해제가 끝나면 파일을 C:\WinARM\utils\bin 에 복사하십시요. (기존에 있든 파일을 대체하면 됩니다.) **(EX error :/usr/bin/sh: fork: Resource temporarily unavailable)** {:. notice}

## JRE 설치

JRE (Java Runtime Enviroment)는 Eclipse 구동을 위해서 필요한 프로그램입니다.

만약 이미 JRE가 설치되어 있는지 확인 하시려면, 실행 창에서 "java"를 입력하였을 때,

![img](/assets/images/sw/sdk/embedded_050.png)

위와 같은 정보가 나온다면 JRE 설치는 Skip하셔도 됩니다.
JRE는 다음 사이트에서 다운로드 받을 수 있습니다.

<http://www.oracle.com/technetwork/java/javase/downloads/index.html>

![img](/assets/images/sw/sdk/embedded_051.png)
![img](/assets/images/sw/sdk/embedded_052.png)

사용하시는 환경에 맞는 버전을 선택하여 설치해 주시기 바랍니다.

## WinARM 설치

WinARM은 아래 링크에서 다운로드 받을 수 있습니다.

`download` [WinARM 다운로드](http://support.robotis.com/en/software/embeded_c/WinARM_20080331_testing.zip)

다운로드된 파일은 압축 파일입니다. C:\WinARM 에 압축을 풀어 주시면 됩니다.
![img](/assets/images/sw/sdk/embedded_053_kor.png)

WinARM이 제대로 동작하려면, 환경변수를 등록해야 합니다.
제어판 - 시스템 - 고급 탭에서 ‘환경 변수’ 버튼을 누릅니다.
![img](/assets/images/sw/sdk/embedded_054_kor.png)

시스템 변수에 “PATH"라는 변수가 이미 존재한다면 ‘편집’ 버튼을,
"PATH“라는 변수가 존재하지 않는다면 ‘새로 만들기’ 버튼을 누릅니다.
![img](/assets/images/sw/sdk/embedded_055_kor.png)

시스템 변수 편집 창에서 변수 값에 아래 항목을 추가합니다.
새로 만들기가 아니라 편집하는 경우, 기존 문구 맨 마지막에 “;” 가 없으면 “;” 를 추가한 다음 아래 문구를 추가합니다.

> C:\WinARM\bin;C:\WinARM\utils\bin;

![img](/assets/images/sw/sdk/embedded_056_kor.png)

WinARM이 제대로 설치되었는지 확인하려면, 실행 창에서 'arm-eabi-gcc -v'를 입력하여 보시기 바랍니다.
잘 안 되는 경우 cmd창을 끄고 재실행하고 다시 시도해보시기 바랍니다.

![img](/assets/images/sw/sdk/embedded_057.png)

## Eclipse 설치

Eclipse는 다음 사이트에서 다운로드 받을 수 있습니다.

`link` http://www.eclipse.org/downloads/

![img](/assets/images/sw/sdk/embedded_058.png)
![img](/assets/images/sw/sdk/embedded_059.png)

Helios packages중 Eclipse IDE for C/C++ Developers 를 다운로드 하시되 사용하시는 환경에 맞는 버전을 선택하여 다운로드 받습니다.
Eclipse는 따로 설치 과정이 필요 없이 압축을 푸신 후 바로 eclipse.exe를 실행하시면 됩니다.

`link` http://www.eclipse.org/downloads/packages/eclipse-ide-cc-developers/neonr

## 설치 성공여부 확인

함께 제공되는 [예제 프로젝트]를 열어 보겠습니다.
압축을 풀어주십시오. Root는 관계없습니다.

![img](/assets/images/sw/sdk/embedded_060.png)

만약 Eclipse 실행 시 다음과 같은 창이 나오게 되면
![img](/assets/images/sw/sdk/eclipse_1.jpg)

바로가기를 만들 후 바로가기의 속성에서 대상에 ```-vm “C:\Program Files\Java\jre7\bin\javaw.exe”``` 를 뒤에 추가시키면 됩니다.
폴더명에 공백이 있으면 “ (쌍따옴표)으로 감싸줘야 합니다.
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

[예제 프로젝트]: http://support.robotis.com/ko/baggage_files/embeded_c/embeddec_c(cm530_v1_02).zip

`note` Windows 8.1,10을 사용중 설치에 error 발생경우 여기를 클릭해 다운로드로와 압축 해제가 끝나면 파일을 C:\WinARM\utils\bin 에 복사하십시요. (기존에 있든 파일을 대체하면 됩니다.) **(EX error :/usr/bin/sh: fork: Resource temporarily unavailable)** {:. notice}

## 로보플러스 복구하기

임베디드 C로 만들어진 결과물은 제어기 펌웨어(bin 파일) 입니다. 이것을 설치하면 기존의 제어기 펌웨어가 지워져서 로보플러스를 사용할 수 없게됩니다. 만약, 로보플러스를 다시 사용하려면 공장 출하시 제어기 펌웨어를 설치해야 합니다. 로보플러스 매니저를 이용하면 공장 출하시 제어기 펌웨어를 쉽게 설치할 수 있습니다.

자세한 사항은 로보플러스 매니저의 [펌웨어 복구하기]를 참조하십시오.

[펌웨어 복구하기]: ??
