---
layout: archive
lang: kr
ref: rplus2_scratch
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus2/scratch/
sidebar:
  title: 로보플러스 스크래치
  nav: "rplusscratch"
---

# [개요](#개요)

## [로보플러스 스크래치 설명](#로보플러스-스크래치-설명)

![](/assets/images/sw/rplus2/scratch/r+scratch_1.jpg)

1. 홈  
  프로그램 시작 시 첫 화면으로 제어기 선택화면/“추가 블록” 이 포함된 새로운 스크래치를 만들기/예제 파일 열기/ 언어 선택 등 설정 메뉴를 포함합니다.

2. 설정  
  언어를 변경할 수 있습니다.

3. 정보  
  버전 정보, 업데이트 된 내용을 확인 할 수 있습니다.

4. 업데이트 체크  
  R+ Scratch 의 최신 버전 업데이트를 확인합니다.

5. 종료  
  R+ Scratch 를 종료합니다.

6. 제어기 선택  
  Scratch 에서 사용 가능한 제어기 목록이 표시됩니다.

7. 연결 포트 선택  
  Micro USB 또는 무선통신 모듈을 이용해서 선택된 포트를 통해 제어기를 PC에 연결할 수 있습니다.

8. 연결 / 연결 끊기  
  연결 버튼을 클릭하면 R+ Scratch 와 제어기와 연결되고 Scratch2Offline 에서 사용하는 “추가 블록” 에 대한 처리를 할 수 있는 준비 상태가 됩니다.  
  또한 Scratch2Offline 과 R+ Scratch 가 서로 잘 통신하고 있다면 아래 그림처럼 “추가 블록” 에 등록된 블록 설명 옆의 O 표시가 빨간색에서 초록색으로 변합니다.

9. 스크래치 새로 만들기  
  Scratch2Offline 이 설치되어 있으면 선택한 제어기에 필요한 블록들이 추가된 상태의 새로운 스크래치 프로젝트 파일이 열립니다. (Scratch2Offline 이 설치되어 있지 않다면 “기타 > Scratch2Offline 설치” 설명의 다운로드 페이지를 표시합니다.)

10. 스크래치 열기  
  Scratch2Offline 이 설치되어 있으면 선택한 제어기에서 제공되는 예제 프로젝트들이 아래 그림과 같이 표시 됩니다.

    ![](/assets/images/sw/rplus2/scratch/r+scratch_5.jpg)

    예제를 선택하면 해당 예제의 스크래치 프로젝트가 열립니다.(Scratch2Offline 이 설치되어 있지 않다면 “기타 > Scratch2Offline 설치” 설명의 다운로드 페이지를 표시합니다.)

11. 도움말 보기  
  도움말 보기를 클릭하면 아래 그림과 같은 도움말 파일이 있는 폴더가 표시 됩니다.

    ![](/assets/images/sw/rplus2/scratch/r+scratch_4.jpg)

    각 제어기 이름의 파일은 제어기에서 사용되는 블록들에 대한 설명이 포함되어 있으며 “제어기명.VXX.json” 파일은 “추가 블록”의 직접 추가가 필요한 경우 사용하시면 됩니다.

## [제어기를 PC에 연결하기](#제어기를-pc에-연결하기)

### Micro USB 케이블을 이용한 제어기 연결

1. 다음 그림과 같이 micro USB 케이블을 이용해 제어기를 연결합니다.  

  ![](/assets/images/sw/rplus2/scratch/r+scratch_2.jpg)

2. Micro USB 케이블을 연결하고 전원을 키면 “연결 포트 선택”을 클릭했을 때 아래와 같이 “ROBOTIS Virtual COM Port” 가 표시됩니다.

  ![](/assets/images/sw/rplus2/scratch/r+scratch_3.jpg)

3. “ROBOTIS Virtual COM Port” 가 표시되지 않는다면 기타의 “ROBOTIS Virtual COM Port 드라이버 설치” 를 확인해주세요.

### 무선 통신 모듈을 이용한 제어기 연결

1. 다음 그림과 같이 무선 통신 모듈을 연결합니다.

  ![](/assets/images/sw/rplus2/scratch/untitled-1.jpg)

2. Micro USB 케이블을 이용하는 경우 포트 목록에 자동으로 표시되지만 블루투스의 경우 아래 링크를 참고하여 장치를 추가해야 합니다.  
  [블루투스 연결](/docs/kr/edu/mini/#로보티즈-미니-연결하기)

3. 추가한 블루투스는 다음과 같이 목록에 “Bluetooth Serial Port” 로 표시됩니다.

  ![](/assets/images/sw/rplus2/scratch/r+scratch_6.jpg)

# [참고자료](#참고자료)

## [Scratch2Offline 설치](#Scratch2Offline-설치)

 Scratch2Offline 다운로드 페이지 ([https://scratch.mit.edu/scratch2download/](https://scratch.mit.edu/scratch2download/)) 에서 OS 맞게 (windows) Adobe AIR 과 스크래치 오프라인 에디터를 다운받아 설치 합니다.

 Scratch2Offline 이 설치 되지 않은 상태에서 홈 화면의 “스크래치 새로 만들기” 또는 “스크래치 열기” 버튼을 클릭하면 다운로드 페이지로 이동합니다.


## [ROBOTIS Virtual COM Port 설치](#robotis-virtual-com-port-설치)

드라이버가 정상적으로 설치되었다면 PC와 제어기를 연결하고 제어기의 전원을 켰을 때 아래와 같이 장치관리자에 “ROBOTIS Virtual Com port(COM X)” 가 표시됩니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_7.jpg)

만약 아래와 같이 “USB 직렬 장치” 로 표시된다면 드라이버를 업데이트 해야 합니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_8.jpg)

USB 직렬 장치를 마우스로 우클릭하여 드라이버 소프트웨어 업데이트를 선택합니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_9.jpg)

컴퓨터에서 드라이버 소프트웨어 찾아보기 를 선택합니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_10.jpg)

컴퓨터의 장치 드라이버 목록에서 직접 선택 을 선택합니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_11.jpg)

ROBOTIS Virtual COM Port 를 선택한 후 다음을 클릭하여 설치를 완료 합니다.

![](/assets/images/sw/rplus2/scratch/r+scratch_13.jpg)

수동으로 USB 드라이버를 설치하기 위한 방법은 [USB 드라이버 설치]{: .popup} 에서 확인 할 수 있습니다.

[USB 드라이버 설치]: /docs/kr/faq/usb_driver_install/

## [추가 블록 직접 추가](#추가-블록-직접-추가)

제어기를 선택하고 “스크래치 새로 만들기” 또는 “스크래치 열기” 버튼을 클릭하여 실행되는 스크래치 프로젝트에서는 선택한 제어기 관련 블록들이 자동으로 추가됩니다.

스크래치를 직접 실행하거나 스크래치 메뉴의 새로 만들기를 클릭한 경우 아래와 같이 직접 블록을 추가해야 합니다.

스크래치 사이트에서 다운로드 받은 예제 ([https://scratch.mit.edu/starter_projects/](https://scratch.mit.edu/starter_projects/)) 또는 기존 작성했던 스크래치를 제어기와 연결하도록 사용하고자 할 때, 직접 추가할 수 있습니다.

1. 키보드의 “Shift” 키를 누른고 “파일” 메뉴를 클릭하면 그림과 같이 메뉴 제일 밑에 “import experimental HTTP extension” 메뉴가 표시됩니다. HTTP extension 메뉴를 클릭합니다.

    ![](/assets/images/sw/rplus2/scratch/r+scratch_14.jpg)

2. 도움말 보기를 클릭하여 나오는 폴더 경로를 복사하고

    ![](/assets/images/sw/rplus2/scratch/r+scratch_15.jpg)

3. HTTP extension 메뉴 클릭하여 나온 선택창에 복사한 후, 표시되는 파일 중 추가하고자 하는 제어기 명의 *.json 파일을 선택합니다.

    ![](/assets/images/sw/rplus2/scratch/r+scratch_16.jpg)

4. 아래 그림과 같이 선택한 블록들이 “추가 블록” 에 표시됩니다.

    ![](/assets/images/sw/rplus2/scratch/r+scratch_17.jpg)
