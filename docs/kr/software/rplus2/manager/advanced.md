---
layout: archive
lang: kr
ref: rplusmanager2_advanced
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus2/manager/advanced/
sidebar:
  title: R+Manager 2.0
  nav: "rplusmanager2"
---

<div style="counter-reset: h1 3">
</div>

# [고급 기능](#고급-기능)

## [XM/XH 시리즈 사용전 준비](#xm-xh-시리즈-사용전-준비)

XM/XH 시리즈를 R+Task2.0이나 R+Motion2.0에서 사용하기 위해서는 두 가지 사전준비를 거쳐야 합니다.

### H/W 준비하기

1. 아래 그림처럼 OpenCM9.04과 XM시리즈 외에 “OpenCM 485 EXP 보드” 가 필요합니다.

2. 아래 3가지를 케이블로 연결합니다.

  ![](/emanual/assets/images/sw/rplus2/rplusmanager2_30.jpg)

### Dynamixel Channel 설정하기

1. R+ Manager 2.0을 실행하여 Dynamixel2.0 제품을 선택한 후, 업데이트 & 테스트 메뉴를 실행합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_31.jpg)

2. OpenCM9.04에 LN-101 또는 BT-210(혹은 BT-110)을 사용하여 PC와 연결한 후, OpenCM 485 EXP의 전원을 켭니다.
3. 안내에 따라 제품을 검색하면 OpenCM9.04가 검색됩니다. (처음에는 OpenCM9.04의 Dynamixel Channel 값이 Default로 설정되어 있어 XM/XH시리즈가 검색되지 않습니다.)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_32.jpg)

4. 제품을 업데이트하는 과정을 거치면 컨트롤 테이블이 실행됩니다.
5. 컨트롤 테이블 항목에서 Dynamixel Channel 값을 EXP Board로 설정한 후 저장합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_33.jpg)

6. 설정이 완료되면 컨트롤 테이블 창을 닫고, OpenCM 485 EXP의 전원을 껐다가 켭니다.(이때, 재부팅되면서 OpenCM9.04의 미니 TTL버스가 비활성화되고 OpenCM 485 EXP의 다이나믹셀 버스가 활성화 됩니다.)
7. 업데이트 & 테스트 메뉴를 다시 실행하여 XM/XH시리즈가 정상적으로 검색되는지 확인합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_34.jpg)

8. 설정이 완료되면 R+ Task 2.0과 R+ Motion 2.0에서 XM/XH 시리즈를 사용할 수 있게 됩니다.(R+ Task 2.0 v2.1.0, R+ Motion 2.0 v2.4.0 이상 버전에서 지원)

## [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)

1. 마우스 왼쪽 버튼 드래그로 변경하기 (값을 크게 변경할 때 사용합니다.)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_35.jpg)

2. 마우스 휠로 변경하기 (값을 조금 키우거나 줄일 때 사용합니다.)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_36.jpg)

3. 키보드 방향키로 변경하기 (값을 미세하게 키우거나 줄일 때 사용합니다.)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_37.jpg)

4. 값 직접 입력하기 (간단한 연산 식(덧셈, 뺄셈)의 입력이 가능합니다.)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_38.jpg)


## [펌웨어 정보 확인](#펌웨어-정보-확인)

제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인하는 기능입니다.

1. 홈 탭으로 이동한 후, 펌웨어 정보를 확인할 제품을 선택합니다.
2. 우측 상단의 “펌웨어 정보” 버튼을 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_39.jpg)

3. 선택된 제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인할 수 있습니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_40.jpg)


## [블루투스로 펌웨어 관리하기](#블루투스로-펌웨어-관리하기)

BT-210, BT-110을 이용하면 무선으로 펌웨어 관리를 진행하실 수 있습니다. (BT-410의 경우 무선 펌웨어 관리 기능을 제공하지 않습니다.)

다음 설명에 따라 블루투스 시리얼 포트를 추가하세요. (Windows10 기준)

1. 제어기에 BT-210(또는 BT-110)을 연결하고 제어기의 전원을 켭니다.
2. 윈도우 시작 버튼을 클릭한 후, 설정 메뉴를 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_41.jpg)

3. 장치 메뉴를 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_42.jpg)
 
4. 좌측의 Bluetooth를 선택한 후, Bluetooth 장치를 켭니다.
5. 검색된 블루투스 모듈을 찾아 선택한 후, 연결 버튼을 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_43.jpg)

6. 장치 암호입력란에 0000을 입력한 후, 다음 버튼을 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_44.jpg)
 
7. 페어링이 완료되면 페어링된 장치를 선택한 후, 하단의 “추가 Bluetooth 옵션”을 클릭합니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_45.jpg)

8. COM 포트 탭을 클릭한 후, 송신 포트의 포트 번호를 확인합니다. (아래 그림에서는 COM7)

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_46.jpg)
 
9. R+ Manager 2.0에서 설치된 블루투스 포트를 선택하면 무선으로 관리 기능을 사용할 수 있습니다.

    ![](/emanual/assets/images/sw/rplus2/rplusmanager2_47.jpg)
