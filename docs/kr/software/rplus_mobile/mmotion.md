---
layout: archive
lang: kr
ref: mmotion
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus_mobile/mmotion/
sidebar:
  title: 로보플러스 모바일 모션 2.0
  nav: "rplusmmotion"
---

# [개요](#개요)

모션 프로젝트 파일의 생성, 편집, 다운로드 기능을 제공합니다.  
일부 기능은 제공하지 않습니다. (조인트 그룹 기능과 오프셋 편집 기능)

## [지원제품](#지원제품)

- [CM-200]
- [CM-530]
- [OpenCM9.04]
- AX 시리즈
- MX 시리즈
- XL-320(블루투스 다운로드가 가능한 제어기)
- CM-200 & CM-530의 경우 다운로드 안정성을 위한 펌웨어 업데이트 필요(Manager에서 제공)

## [구동사양](#구동사양)

- 최소사양 : 안드로이드 OS 2.3, 1.2GHz 듀얼코어, RAM 1GB (갤럭시 S2급)(로봇이 큰 예제(BP 예제, 로보티즈 미니)의 경우 최소 사양에서 원활히 구동되지 않을 수 있음)

- 권장사양 : 안드로이드 OS 4.0, 쿼드코어 1.4GHZ, RAM 2GB (갤럭시 S3급)

# [메뉴 설명](#메뉴-설명)

![](/assets/images/sw/rplus_mobile/01_001_kr.jpg)  

1. 단계별 편집 탭
2. 로봇의 연결 및 상태 표시 메뉴
3. 메뉴바
4. 작업 영역

![](/assets/images/sw/rplus_mobile/01_002_kr.jpg)  

1. 3D 로봇 뷰어
2. 타임라인(모션 유닛)
3. 타임라인 메뉴바
4. 포즈 테이블
5. 포즈 메뉴바

![](/assets/images/sw/rplus_mobile/01_003_kr.jpg)

1. 3D 로봇 뷰어
2. 흐름차트(모션)
3. 흐름차트 메뉴바

# [따라해보기](#따라해보기)

## [로봇 연결하기](#로봇-연결하기)

1. 연결 버튼을 클릭하여 로봇 연결 창을 호출합니다.

  ![](/assets/images/sw/rplus_mobile/02_001_kr.jpg)

1. 내 로봇의 블루투스 주소를 선택합니다.
2. 연결버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/02_001_kr.jpg)

1. PIN 코드 0000을 입력합니다.
2. 확인버튼을 클릭합니다. (위 과정은 이미 페어링된 블루투스 장치일 경우, 생략됩니다.)

  ![](/assets/images/sw/rplus_mobile/02_003_kr.jpg)

1. 스마트폰과 로봇이 연결된 후 장치를 읽어오는 동안 잠시 대기합니다.

  ![](/assets/images/sw/rplus_mobile/02_004_kr.jpg)

1. 연결에 성공하면 좌측에 연결 아이콘이 활성화 됩니다.

  ![](/assets/images/sw/rplus_mobile/02_005_kr.jpg)

## [예제 프로젝트 열기](#예제-프로젝트-열기)

1. 홈 탭으로 이동합니다.
2. 툴바에서 프로젝트 열기 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/03_001_kr.jpg)

1. 스마트폰에 저장된 모션 파일을 선택합니다.
2. 확인 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/03_002_kr.jpg)

1. 프로젝트를 불러오는 동안 잠시 대기합니다.

  ![](/assets/images/sw/rplus_mobile/03_003_kr.jpg)

## [모션 유닛 재생하기](#모션-유닛-재생하기)

1. 모션 유닛 탭으로 이동합니다.
2. 모션 유닛 목록을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/04_001_kr.jpg)

1. 재생할 모션 유닛을 선택합니다.
2. 확인 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/04_002_kr.jpg)

1. 상단의 모션 유닛 재생 메뉴를 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/04_003_kr.jpg)

1. 앞서 선택한 모션 유닛이 잘 동작하는지 3D 로봇을 보며 확인합니다.

  ![](/assets/images/sw/rplus_mobile/04_004_kr.jpg)

1. 동기화 모드를 클릭합니다.
2. 모션 유닛을 재생하여 3D 로봇과 실제 로봇이 잘 동작하는지 확인합니다.

  ![](/assets/images/sw/rplus_mobile/04_005_kr.jpg)

## [모션 유닛 편집하기](#모션-유닛-편집하기)

1. 모션 유닛 목록을 클릭합니다.
2. “새 모션 유닛 만들기” 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/05_001_kr.jpg)

1. 새로 만들 모션 유닛의 이름을 입력합니다.
2. 확인버튼을 클릭하면 빈 모션 유닛이 생성됩니다.

  ![](/assets/images/sw/rplus_mobile/05_002_kr.jpg)

1. 앞서 생성한 모션 유닛을 선택합니다.
2. 확인버튼을 클릭하여 모션 유닛 목록을 닫습니다.

  ![](/assets/images/sw/rplus_mobile/05_003_kr.jpg)

1. 3D 로봇의 관절을 클릭하여 조작할 대상을 선택합니다.
2. 추가로 3D 로봇의 관절을 클릭하여 여러 관절을 선택할 수 있습니다.
3. 토크 끄기 버튼을 클릭하여 선택된 관절을 토크를 끕니다.

  ![](/assets/images/sw/rplus_mobile/05_004_kr.jpg)

1. 토크가 꺼진 관절을 손으로 움직여서 원하는 로봇 자세를 만듭니다.

  ![](/assets/images/sw/rplus_mobile/05_005_kr.jpg)

1. 토크 켜기 버튼을 클릭합니다.
2. 앞서 실제 로봇으로 만든 자세를 3D 로봇이 따라 하게 됩니다.

  ![](/assets/images/sw/rplus_mobile/05_006_kr.jpg)

1. 상단의 타임라인 영역을 드래그하여 25번 프레임에 커서를 위치시킵니다.
2. 키프레임 삽입 버튼을 클릭합니다.(위 과정을 통해 3D 로봇의 자세가 25번 위치에 저장됩니다.)

  ![](/assets/images/sw/rplus_mobile/05_007_kr.jpg)

1. 타임라인 영역에서 51번 위치로 커서를 이동시킵니다.
2. 토크 끄기 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/05_008_kr.jpg)

1. 토크가 꺼진 관절을 손으로 움직여서 새로운 자세를 만듭니다.

  ![](/assets/images/sw/rplus_mobile/05_009_kr.jpg)

1. 토크 켜기 버튼을 클릭합니다.
2. 앞서 실제 로봇으로 만든 자세를 3D 로봇이 따라하게 됩니다.
3. 키프레임 삽입 버튼을 클릭하여 해당 자세를 51번 프레임에 저장합니다.

  ![](/assets/images/sw/rplus_mobile/05_010_kr.jpg)

1. 마찬가지로 0.6초, 0.8초, 1초 위치에 추가로 키프레임 자세를 저장합니다.

  ![](/assets/images/sw/rplus_mobile/05_011_kr.jpg)

1. 동기화 모드를 클릭합니다.
2. 모션 유닛 재생 메뉴를 활용하여 실제 로봇이 잘 움직이는지 확인합니다.

  ![](/assets/images/sw/rplus_mobile/05_012_kr.jpg)

## [모션 재생하기](#모션-재생하기)

1. 모션 탭으로 이동합니다.
2. 모션 목록을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/06_001_kr.jpg)

1. 원하는 모션을 선택합니다.
2. 확인버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/06_002_kr.jpg)

1. 앞서 선택한 모션은 그림과 같이 구성되어 있습니다.
2. “F_WALK_READ”와 “F_WALK”는 모션 유닛입니다.
3. “F_WALK_READ”를 1.0배속으로 1회 재생한 후 “F_WALK”를 1배속으로 3회 반복 재생합니다.

  ![](/assets/images/sw/rplus_mobile/06_003_kr.jpg)

1. 동기화 모드를 클릭합니다.
2. 모션 재생 메뉴를 활용하여 선택된 모션이 잘 실행되는지 확인합니다.

  ![](/assets/images/sw/rplus_mobile/06_004_kr.jpg)

1. 상단의 링크 영역에 삽입되어있는 모션 유닛을 선택합니다.
2. “연결된 모션 유닛 편집” 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/06_005_kr.jpg)

1. 재생 파라미터 탭을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/06_006_kr.jpg)

1. 해당 링크의 재생 속도를 수정해봅니다.
2. 해당 링크의 반복 횟수를 수정해봅니다.
3. 확인 버튼을 클릭하여 설정을 완료합니다.

  ![](/assets/images/sw/rplus_mobile/06_007_kr.jpg)

1. 앞서 변경한 재생 파라미터가 적용되었음을 확인합니다.

  ![](/assets/images/sw/rplus_mobile/06_008_kr.jpg)

1. 동기화 모드를 클릭합니다.
2. 모션 재생 메뉴를 활용하여 선택된 모션이 잘 실행되는지 확인합니다.

  ![](/assets/images/sw/rplus_mobile/06_009_kr.jpg)

## [모션 편집하기](#모션-편집하기)

1. 모션 목록을 클릭합니다.
2. 새 모션 만들기 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_001_kr.jpg)

1. 새로 만들 모션의 이름을 입력합니다.
2. 확인 버튼을 클릭하면 빈 모션이 생성됩니다.

  ![](/assets/images/sw/rplus_mobile/07_002_kr.jpg)

1. 앞서 생성한 모션을 선택합니다.
2. 확인버튼을 클릭하여 모션 목록을 닫습니다.

  ![](/assets/images/sw/rplus_mobile/07_003_kr.jpg)

1. 모션유닛 삽입 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_004_kr.jpg)

1. 연결할 모션유닛을 선택합니다.
2. 확인버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_005_kr.jpg)

1. 앞서 선택한 모션유닛이 연결되었습니다.
2. 다시 모션유닛 삽입 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_006_kr.jpg)

1. 연결할 모션유닛을 선택합니다.
2. 확인버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_007_kr.jpg)

1. 앞서 선택한 모션유닛이 연이어 연결됩니다.
2. 동기화 모드를 클릭합니다.
3. 모션 재생 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/07_008_kr.jpg)

1. 첫 번째로 연결한 모션유닛이 선택되고
2. 해당 모션유닛이 재생됩니다.

  ![](/assets/images/sw/rplus_mobile/07_009_kr.jpg)

1. 연이어 두 번째로 연결한 모션유닛이 선택되고
2. 해당 모션유닛이 재생됩니다.

  ![](/assets/images/sw/rplus_mobile/07_010_kr.jpg)

## [모션 다운로드하기](#모션-다운로드하기)

1. 모션 다운로드 탭으로 이동합니다.
2. 새 모션그룹 만들기 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/08_001_kr.jpg)

1. 새로 만들 모션그룹의 이름을 입력합니다.
2. 확인버튼을 클릭합니다

  ![](/assets/images/sw/rplus_mobile/08_002_kr.jpg)

1. 앞서 모션 탭에서 만든 모션 중에서 모션그룹에 추가할 모션을 선택합니다.
2. 모션 추가 버튼을 클릭합니다.
3. `1`, `2` 과정을 통해 모션을 추가하면 로봇 메모리의 용량이 계산됩니다.
4. 모션그룹에 원하는 모션을 모두 담은 후 확인버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/08_003_kr.jpg)

1. 앞서 만든 모션그룹을 선택합니다.
2. 모션그룹 다운로드 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/08_004_kr.jpg)

1. 해당 모션그룹이 로봇 제어기에 다운로드 되는 동안 잠시 대기합니다.

  ![](/assets/images/sw/rplus_mobile/08_005_kr.jpg)

## [모션 프로젝트 저장하기](#모션-프로젝트-저장하기)

1. 홈 탭으로 이동합니다.
2. 다른 이름으로 저장 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/09_001_kr.jpg)

1. 저장할 모션 프로젝트 파일의 이름을 입력합니다.
2. 확인버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/09_002_kr.jpg)

1. 로그 메시지를 확인합니다.
2. 좌측 상단에 저장된 모션 프로젝트의 파일명이 표기됩니다.

  ![](/assets/images/sw/rplus_mobile/09_003_kr.jpg)

# [소프트웨어 다운로드](#소프트웨어-다운로드)

## [Android](#android)
- 시스템 최저 요구 사양
  - OS : Android 2.3이상
  - 하드웨어 : 1.2 dual-core CPU, 1GB RAM 이상, 블루투스 및 센서 내장 기기
 
- 통신 
  - BT-410 지원 (Android 4.4이상)
  - BT-210, BT-110 지원

- [다운로드](https://play.google.com/store/apps/details?id=com.robotis.motion)

## [Apple](#apple)
- 시스템 최저 요구 사양
  - OS : iOS 8.0 이상
  - 하드웨어 : iPhone4S, iPod 5G, iPad mini, iPad 2 이상
 
- 통신 관련
  - BT-410 지원
  - BT-210, BT-110 지원 불가

- [다운로드](https://itunes.apple.com/kr/app/r%2b-m.motion/id955358210?mt=8)

# [기타 정보](#기타-정보)

## [3D 카메라 조작](#3d-카메라-조작)

![](/assets/images/sw/rplus_mobile/10_001_kr.jpg)

> 3D 화면을 한 손가락으로 드래그하면 시점이 회전됩니다.

![](/assets/images/sw/rplus_mobile/10_002_kr.jpg)

> 3D 화면을 두 손가락으로 펼치며 드래그하면 시점이 확대됩니다.

![](/assets/images/sw/rplus_mobile/10_003_kr.jpg)

> 3D 화면을 두 손가락으로 모으며 드래그하면 시점이 축소됩니다.

![](/assets/images/sw/rplus_mobile/10_004_kr.jpg)

> 3D 화면을 두 손가락으로 위쪽 방향으로 드래그하면 시점이 내려갑니다.(시점이 내려감에 따라 로봇이 위로 올려져 보입니다.)

![](/assets/images/sw/rplus_mobile/10_005_kr.jpg)

> 3D 화면을 두 손가락으로 아래쪽 방향으로 드래그하면 시점이 올라갑니다.(시점이 올라감에 따라 로봇이 아래로 내려져 보입니다.)

# [자주 묻는 질문](#자주-묻는-질문)

## 지원 가능한 제품군은?

- 프리미엄, 스템, 스마트, 다윈미니(CM-200, CM-530, OpenCM9.04C, AX시리즈, MX시리즈, XL-320 로 구성된 제품군)

## 지원 가능한 3D 모델은?

- 지원 제품군 중에서 모션을 사용하는 예제 전체(링크형 구조 로봇 지원 불가)

## 예제 3D 모델 외의 로봇을 추가할 수 있나요?

- 현재는 모터가 나열된 형태로만 제공하며, 추후 PC버전에서 R+ Design으로 조립한 로봇을 활용할 수 있도록 지원할 예정

## MTN파일을 MTNX로 변환할 수 있나요?

- 현재는 모션 데이터는 변환되나 3D 로봇을 사용할 수 없으며, 추후 3D 로봇을 선택할 수 있도록 지원할 예정

## MTNX파일을 MTN으로 변환할 수 있나요?

- 현재는 지원하지 않으며, 앞으로도 지원계획 없음

## 모션 파일을 수정한 후 제대로 동작하지 않습니다. 어떻게 해야 하나요?

- 모션 파일을 수정한 후 반드시 모션그룹을 다시 다운로드 해야 합니다.

## 제어기가 잘 연결되지 않습니다. 어떻게 해야 하나요?

- 제어기를 껐다 켠 후 다시 시도해보세요. 만약 사용하는 제어기가 CM-200이라면 제어기를 끈 후, 전원버튼을 2~3초 눌러서 태스크를 멈춘 후 시도해 보세요.

[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-530]: /docs/kr/parts/controller/cm-530/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
