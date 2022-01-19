---
layout: archive
lang: kr
ref: rplus2_manager
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus2/manager/
sidebar:
  title: R+ Manager 2.0
  nav: "rplusmanager2"
---

# [개요](#개요)

## [R+ Manager 2.0](#r-manger-20)
R+ Manager 2.0은 로봇을 구성하는 제어기와 다이나믹셀 장치들을 통합 관리합니다.  
제품을 연결하면 해당 제품을 최신버전으로 업데이트할 수 있으며, 컨트롤 테이블을 테스트해볼 수 있습니다.  
기존의 로보플러스 매니저1.0과 위자드1.0에서 제공하던 기능이 R+ Manager 2.0에서 통합되었습니다.

![](/assets/images/sw/rplus2/manager/rplusmanager2_01_kr.jpg)

## [사용전 주의사항](#사용전-주의사항)
V2.0.0 기준으로 지원 제품이 한정됩니다. 지원 제품 목록에 포함되지 않는 제품의 경우 로보플러스 매니저1.0과 위자드1.0을 사용하시기 바랍니다.

### 지원 제품 목록
- STEAMCUP DREAM
- 로보티즈 스마트(스마트2)
- 로보티즈 IoT
- 로보티즈 미니
- 다이나믹셀 2.0 시리즈 (MX-28, MX-64, MX-106, XL-320, XM시리즈, XH시리즈, PRO시리즈)

**참고**: [다이나믹셀 위자드 2.0]은 모든 다이나믹셀을 지원합니다. 다이나믹셀 설정 또는 펌웨어 복구 및 업데이트시, 다이나믹셀 위자드 2.0을 사용하세요.
{: .notice}

![](/assets/images/sw/rplus2/manager/rplusmanager2_02_kr.jpg)

## [펌웨어 정의](#펌웨어-정의)

펌웨어는 하드웨어 장치를 구동하기 위하여 장치에 설치하는 기본적인 소프트웨어입니다. 펌웨어에는 PC나 스마트폰, 다른 장치와의 통신 약속이 포함되기 때문에 가급적 펌웨어를 최신상태로 유지할 것을 권장합니다.
모든 장치(제어기, 다이나믹셀 등)는 처음 구매시 펌웨어가 설치되어있으나, 기능 추가 / 버그 수정이 있을 경우 새로운 버전을 배포하기도 합니다.

### 제어기 펌웨어의 역할

- 로보플러스 태스크를 통해 작성한 제어프로그램을 구동합니다.
- 로보플러스 모션을 통해 작성한 모션 데이터를 해석합니다.
- PC나 스마트폰, 다이나믹셀과의 패킷 통신 기능을 합니다.

### 다이나믹셀 펌웨어의 역할

- 제어기에서 제어프로그램이나 모션 구동시 제어기와의 패킷 통신 기능을 합니다.
- PC나 스마트폰, 다이나믹셀과의 패킷 통신 기능을 합니다.

### 펌웨어 업데이트의 중요성

- 새로운 기능이 추가되거나 기존의 기능이 수정될 경우, 새로운 펌웨어가 배포될 수 있습니다.
- 새로운 S/W를 지원해야 하는 경우, 호환성 향상을 위해 새로운 펌웨어가 배포될 수 있습니다.
- 버그 수정이 있을 경우, 새로운 버전의 펌웨어가 배포될 수 있습니다.
- 제품이 정상적으로 동작하지 않거나, 통신이 원활하지 않을 경우, 최신 펌웨어 업데이트를 통해 문제가 해결될 수 있습니다.

# [메뉴 설명](#메뉴-설명)

## [단계별 편집 탭](#단계별-편집-탭)

작업 영역이 홈 탭, 관리 탭, 터미널 탭으로 분리됩니다.
(V2.0.0 기준으로 관리 탭의 자가진단 / 캘리브래이션 기능과 터미널 탭 기능이 미지원 됩니다.)

![](/assets/images/sw/rplus2/manager/rplusmanager2_03_kr.jpg)

## [홈 탭](#홈-탭)

프로그램 시작시 첫 화면으로 제품 선택 메뉴와 펌웨어 업데이트 내역 기능 등을 제공합니다.

![](/assets/images/sw/rplus2/manager/rplusmanager2_04_kr.jpg)

## [관리 탭](#관리-탭)

앞서 선택한 제품의 펌웨어 업데이트 / 테스트 / 복구 기능을 제공합니다. 선택된 제품에 따라 사용할 수 있는 기능이 필터링되어 나타납니다.

![](/assets/images/sw/rplus2/manager/rplusmanager2_05_kr.jpg)

아래 그림은 컨트롤 테이블을 테스트하는 화면입니다. 검색된 제품을 통신속도, 모델에 따라 분류하여 나타내며, 컨트롤 테이블 값을 수정하며 테스트해볼 수 있습니다.

![](/assets/images/sw/rplus2/manager/rplusmanager2_06_kr.jpg)

## [터미널 탭](#터미널-탭)

해당 기능은 현재 준비 중이며 추후 업데이트를 통해 지원할 예정입니다.
{: .notice--warning}

# [기본 기능](#기본-기능)

## [펌웨어 업데이트](#펌웨어-업데이트)

1. 홈 탭에서 업데이트 및 테스트를 진행할 제품을 선택합니다. (예시에서는 ROBOTIS MINI를 선택함)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_07_kr.jpg)

2. “업데이트 및 테스트” 메뉴를 선택합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_08_kr.jpg)
 
3. 안내에 따라 제품과 PC를 연결한 후 제품을 켭니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_09_kr.jpg)

4. 연결할 포트를 선택한 후 “다음”버튼을 클릭합니다. (예시에서는 블루투스 시리얼 포트를 사용함)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_10_kr.jpg)
 
5. 검색할 통신속도를 선택한 후 “다음”버튼을 클릭합니다.(블루투스 시리얼 포트 사용시 57600bps만 가능함)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_11_kr.jpg)

6. 관리할 대상이 정상적으로 검색되었는지 확인한 후 다음 버튼을 클릭합니다. (만약, 제품 검색이 정상적으로 이뤄지지 않을 경우 다시 시도 버튼을 클릭하세요.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_12_kr.jpg)

7. 업데이트할 내용이 감지되면 아래의 “지금 업데이트” 버튼이 활성화됩니다. 업데이트 내용을 확인한 후 “지금 업데이트”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_13_kr.jpg)
 
8. 업데이트가 정상적으로 완료될 때까지 기다린 후, “다음” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_14_kr.jpg)

9. 업데이트가 완료되면 “컨트롤 테이블 테스트” 기능이 실행됩니다. (일부 제어기는 업데이트 완료 후 전원이 꺼지며, 대화창이 종료됩니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_15_kr.jpg)

## [펌웨어 복구](#펌웨어-복구)

1. 홈 탭에서 펌웨어 복구를 진행할 제품을 선택합니다. (예시에서는 ROBOTIS MINI를 선택함)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_21_kr.jpg)

2. “펌웨어 복구” 메뉴를 선택합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_22_kr.jpg)

3. 안내 메시지를 확인한 후 “다음” 버튼을 클릭하세요.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_23_kr.jpg)

4. 복구를 진행할 제품을 선택한 후 “다음” 버튼을 클릭합니다. (예시에서는 OpenCM9.04를 선택함.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_24_kr.jpg)
 
5. 안내를 순서대로 따라서 진행합니다. 노란색 경고 문구를 반드시 숙지하세요!
6. 모든 준비를 마치면 “다음” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_25_kr.jpg)

7. 연결할 포트를 선택한 후 “다음”버튼을 클릭합니다. (예시에서는 블루투스 시리얼 포트를 사용함)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_26_kr.jpg)

8. 장치가 연결되면 펌웨어 설치를 위해 부트로더를 감지합니다. “다음” 버튼이 활성화되면 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_27_kr.jpg)

9. 설치할 펌웨어 정보를 확인한 후 “다음” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_28_kr.jpg)
 
10. 복구가 정상적으로 완료되면 “마침” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_29_kr.jpg)

## [다이나믹셀 컨트롤 테이블](#다이나믹셀-컨트롤-테이블)

1. 컨트롤 테이블 창이 열려있다는 가정으로 진행합니다.(연결하는 과정은 “업데이트 하기”를 참고하세요.)
2. 컨트롤 테이블 창은 장치를 통신속도, 장치, 순으로 분류합니다. 테스트할 통신속도 그룹과 장치를 선택합니다. (예시에서는 XL-320을 선택함.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_16_kr.jpg)

3. 좌측 메뉴에서 “팩토리 리셋” 버튼을 클릭하면 제품을 공장 초기화 상태로 되돌릴 수 있습니다. (이때, ID와 Baudrate 값은 변경하지 않습니다.) 좌측 메뉴에서 “리부팅” 버튼을 클릭하면 해당 다이나믹셀을 재부팅할 수 있습니다. 좌측 메뉴에서 “토크 켜기” 버튼을 클릭하면 해당 다이나믹셀의 토크를 켜거나 끌 수 있습니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_17_kr.jpg)

4. 좌측 메뉴의 “토크 켜기” 버튼을 클릭하여 다이나믹셀의 토크를 켭니다.
5. 컨트롤 테이블 항목에서 “Goal Position”항목을 찾아 선택합니다.
6. 우측 하단의 위치 값 컨트롤을 사용하여 모터를 움직여봅니다.(값을 조정하는 과정에서 모터가 갑작스럽게 움직일 수 있으니 주의하세요.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_18_kr.jpg)

7. 좌측 하단의 “통신 상태” LED를 통해 현재 PC와 제품의 통신이 원활히 이루어지고 있는지 확인할 수 있습니다. (초록색 : 정상, 노란색 : 타임아웃, 빨간색 : 데이터 소실)
8. 좌측 하단의 “응답 에러” 메시지를 통해 다이나믹셀의 응답상태를 확인할 수 있습니다.
9. 좌측 하단의 “하드웨어 알람” 메시지를 통해 하드웨어의 에러상태를 확인할 수 있습니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_19_kr.jpg)
 
10. 일부 다이나믹셀의 경우 프로파일 타입 상태 보기 기능을 제공합니다. 특정 Operating Mode에서 Profile Acceleration 값과 Profile Velocity 값에 따라 프로파일 타입이 결정됩니다. 자세한 사항은 해당 다이나믹셀의 E-Manual을 참고하세요. (지원 가능한 제품 : XM시리즈와 XH시리즈)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_20_kr.jpg)

11. 컨트롤 테이블에 대한 더 많은 정보를 얻으려면 각 제품의 E-Manual을 참고하세요.

## [제어기 컨트롤 테이블](#제어기-컨트롤-테이블)

해당 내용은 작성중 입니다. 
{: .notice}

# [참고자료](#참고자료)

## [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)

1. 마우스 왼쪽 버튼 드래그로 변경하기 (값을 크게 변경할 때 사용합니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_35_kr.jpg)

2. 마우스 휠로 변경하기 (값을 조금 키우거나 줄일 때 사용합니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_36_kr.jpg)

3. 키보드 방향키로 변경하기 (값을 미세하게 키우거나 줄일 때 사용합니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_37_kr.jpg)

4. 값 직접 입력하기 (간단한 연산 식(덧셈, 뺄셈)의 입력이 가능합니다.)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_38_kr.jpg)

## [펌웨어 정보 확인](#펌웨어-정보-확인)

제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인하는 기능입니다.

1. 홈 탭으로 이동한 후, 펌웨어 정보를 확인할 제품을 선택합니다.
2. 우측 상단의 “펌웨어 정보” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_39_kr.jpg)

3. 선택된 제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인할 수 있습니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_40_kr.jpg)

## [블루투스로 펌웨어 관리하기](#블루투스로-펌웨어-관리하기)

BT-210, BT-110을 이용하면 무선으로 펌웨어 관리를 진행하실 수 있습니다. (BT-410의 경우 무선 펌웨어 관리 기능을 제공하지 않습니다.)

다음 설명에 따라 블루투스 시리얼 포트를 추가하세요. (Windows10 기준)

1. 제어기에 BT-210(또는 BT-110)을 연결하고 제어기의 전원을 켭니다.
2. 윈도우 시작 버튼을 클릭한 후, 설정 메뉴를 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_41_kr.jpg)

3. 장치 메뉴를 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_42_kr.jpg)
 
4. 좌측의 Bluetooth를 선택한 후, Bluetooth 장치를 켭니다.
5. 검색된 블루투스 모듈을 찾아 선택한 후, 연결 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_43_kr.jpg)

6. 장치 암호입력란에 0000을 입력한 후, 다음 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_44_kr.jpg)
 
7. 페어링이 완료되면 페어링된 장치를 선택한 후, 하단의 “추가 Bluetooth 옵션”을 클릭합니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_45_kr.jpg)

8. COM 포트 탭을 클릭한 후, 송신 포트의 포트 번호를 확인합니다. (아래 그림에서는 COM7)

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_46_kr.jpg)
 
9. R+ Manager 2.0에서 설치된 블루투스 포트를 선택하면 무선으로 관리 기능을 사용할 수 있습니다.

    ![](/assets/images/sw/rplus2/manager/rplusmanager2_47_kr.jpg)

## [FAQ](#faq)

### 지원하는 제품은 무엇인가요?

제품에 사용되는 제어기의 [소프트웨어 호환표](/docs/kr/parts/controller/controller_compatibility/#로보플러스-20)를 참고하세요.

### 통신 포트가 나타나지 않습니다. 어떻게 해야 하나요?

[USB 드라이버 설치]{: .popup} 또는 [LN-101 드라이버 설치] 매뉴얼을 참고하세요.

### 제어기가 잘 검색되지 않습니다. 어떻게 해야 하나요?

- 홈 탭에서 올바른 제품을 선택하였는지 확인하세요.
- USB 케이블을 사용하는 경우, 제어기의 전원을 끄고 PC와 연결한 후 다시 켜보세요.
- 제어기의 베터리가 충분한지 확인하세요.
- 위 사항이 모두 만족한다면 펌웨어 복구를 시도해보세요.
- 더 자세한 사항은 고객지원 또는 Q&A게시판으로 문의바랍니다.

### 다이나믹셀이 잘 검색되지 않습니다. 어떻게 해야 하나요?

- USB2DYNAMIXEL의 통신 모드 스위치가 제대로 설정되어 있는지 확인하세요.
- 다이나믹셀의 연결을 하나씩만 제거하며 시도해보세요.
- 다이나믹셀의 ID가 겹칠 경우 동작이 원활하지 않을 수 있습니다.
- 더 자세한 사항은 고객지원 또는 Q&A게시판으로 문의바랍니다.

[XL-320, XM 시리즈, XH 시리즈]: /docs/kr/dxl/x/
[PRO 시리즈]: /docs/kr/dxl/pro/
[P 시리즈]: /docs/kr/dxl/p/
[ROBOTIS DREAM]: /docs/kr/edu/
[ROBOTIS SMART]: /docs/kr/edu/
[ROBOTIS SMART2]: /docs/kr/edu/
[ROBOTIS IoT]: /docs/kr/edu/
[ROBOTIS MINI]: /docs/kr/edu/
[CM-150, CM-200, OpenCM9.04, OpenCM7.0]: /docs/kr/parts/controller/controller_compatibility/
[USB 드라이버 설치]: /docs/kr/popup/usb_driver_install/
[LN-101 드라이버 설치]: /docs/kr/parts/interface/ln-101/#드라이버-설치-확인
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
