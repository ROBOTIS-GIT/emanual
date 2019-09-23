---
layout: archive
lang: kr
ref: motion_programming
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplustask3/motion_programming/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 5
---

<div style="counter-reset: h1 5"></div>

# [모션 프로그래밍](#모션-프로그래밍)

모션 파일에는 로봇을 움직이고 다운로드하기 위한 여러 정보가 포함되며 데이터 구조는 아래 그림과 같습니다.

![](/assets/images/sw/rplus2/motion/motion_5.gif)

1. 키-프레임  
기존의 모션 스텝(Motion Step)과 유사한 개념으로 로봇의 연속적인 움직임을 표현하기 위해 특징적인 자세를 재생하고 싶은 시점에 저장한 단위를 말합니다.  
예를 들어 13초 시점에서 “팔 흔들기”자세를 키-프레임으로 저장해놓으면, 해당 시점이 다가올수록 로봇이 “팔 흔들기”자세를 취하게 됩니다.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_01.png)

2. 모션 유닛  
기존의 모션 페이지(Motion Page)와 유사한 개념으로 로봇의 연속적인 움직임을 표현하기 위해 시간 순으로 배치한 키-프레임의 묶음 단위를 말합니다.  
아래 그림을 예로 들면 “경례하기”라는 모션 유닛은 11.2초에 “경례 하기” 키-프레임을 저장하고, 13.2초에 “경례 ” 키-프레임을 저장한 형태로 이루어질 수 있습니다.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_02.png)

3. 모션  
기존의 페이지 연결(Page Link)과 유사한 개념으로 로봇의 댄스와 같이 복잡하고 긴 동작을 표현하기 위해 여러 개의 모션 유닛을 연결한 묶음 단위를 말합니다.  
아래 그림을 예로 들면 “무술” 이라는 모션은 “무술 준비”, “무술동작”, "기본자세" 라는 모션 유닛을 순서대로 연결한 형태로 이루어질 수 있습니다.

    ![](/assets/images/sw/rplus_task3/motion_keyframe_03.png)

4. 모션 그룹  
모션 2.0에서는 파일내의 용량 제한이 없어지게 되어, 로봇에 다운로드시 일부의 모션을 선택하여 모션 목록을 작성하여야 합니다.  
이렇게 작성된 모션 목록을 “모션 그룹”이라 부르며 제어기의 메모리 용량에 따라 저장할 용량이 백분율로 표시됩니다.  
아래 그림을 예로 들면 “main”이라는 모션 그룹은 9개의 모션을 담고 있으며 제어기 용량의 15.7%를 사용합니다.  

    ![](/assets/images/sw/rplus_task3/motion_keyframe_04.png)

5. 3D 로봇  
모션 데이터를 해석할 때 기준이 되는 로봇으로 로봇이 연결되지 않은 상황에서도 모션 데이터를 재생할 수 있도록 도와줍니다.  
모션 파일을 생성할 때 반드시 선택해야 하며, 편집기 내에서 “3D 로봇 변경”메뉴를 제공합니다.  
아래 그림은 동일한 모션 데이터를 서로 다른 3D 로봇에 적용한 예시 입니다.  

    ![](/assets/images/sw/rplus_task3/motion_keyframe_05.png)

## [모션 예제 열기](#모션-예제-열기)

1. 홈 탭의 `프로젝트 열기` 버튼을 클릭합니다.  
  ![](/assets/images/sw/rplus_task3/motion_open_01.png)
2. 예제 프로젝트 파일을 선택합니다.  
3. `열기` 버튼을 클릭합니다.  
  ![](/assets/images/sw/rplus_task3/motion_open_02.png)


## [로봇 연결하기](#로봇-연결하기)

1. 화면 하단의 `연결` 버튼을 클릭합니다.  
  ![](/assets/images/sw/rplus_task3/motion_port_01.png)
2. 로봇이 연결된 포트를 선택한 후 `연결하기` 아이콘을 클릭합니다.  
  ![](/assets/images/sw/rplus_task3/motion_port_02.png)  
3. 포트가 검색되지 않는다면 `재검색` 아이콘을 클릭해주세요.   
  ![](/assets/images/sw/rplus_task3/motion_port_02_1.png)
4. 로봇이 연결되면 아래 그림과 같이 포트 번호와 전송속도가 표시됩니다.  
  ![](/assets/images/sw/rplus_task3/motion_port_03.png)

## [새 모션 유닛 만들기](#새-모션-유닛-만들기)

로봇의 어떠한 동작을 표현하기 위해 동작의 특징된 자세를 시간 순으로 나열하여 저장한 데이터를 모션 유닛이라 합니다. 저장된 자세들은 시간 간격에 따라 보간되어 이어진 움직임으로 재생됩니다.

1. 상단 툴바의 홈 탭에서, 로보티즈 모션예제를 클릭합니다.  
![](/assets/images/sw/rplus_task3/motion_ex_01.png)
2. 모션을 만들 제품을 선택합니다.  
![](/assets/images/sw/rplus_task3/motion_ex_02.png)
3. 상단 툴바의 모션유닛 목록을 클릭합니다.  
![](/assets/images/sw/rplus_task3/motion_ex_03.png)
4. 새로운 모션유닛 이름을 입력후, 확인버튼을 클릭합니다.  
![](/assets/images/sw/rplus_task3/motion_ex_04.png)
5. 생성된 모션유닛을 선택후 확인 버튼을 클릭합니다.  
![](/assets/images/sw/rplus_task3/motion_ex_05.png)

## [모션 유닛 편집하기](#모션-유닛-편집하기)

### [3D 로봇 활용](#3d-로봇-활용)

지금부터 실제 로봇이 없는 상황에서 3D 로봇만으로 모션 유닛을 편집합니다. 3D 로봇의 포즈를 편집하고 타임라인 상에 저장하여 연결된 동작을 만듭니다.

1. 아래 그림과 같이 화면 상단에 검게 표시된 타임라인(timeline)에서 임의의 위치를 클릭합니다.
2. 3번 관절을 선택합니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_06.png)

3. 우측 하단의 “각도 조정”메뉴를 활용하면 관절을 움직일 수 있습니다. 로봇의 양팔에 해당하는 관절을 움직여 로봇의 포즈를 만들어 봅니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_07.png)

4. 화면 우측 상단에 “키 프레임 삽입”버튼을 클릭하여 앞서 만든 3D 로봇의 포즈를 삽입합니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_08.png)

5. 다시, 타임라인 상에서 임의로 다음 위치를 지정한 후 “키 프레임 삽입”버튼을 클릭하여 동일한 포즈를 삽입합니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_09.png)

6. 3D 로봇의 포즈를 변경한 후 “키 프레임 저장”버튼을 클릭하여 변경된 포즈를 덮어씌웁니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_10.png)

7. 이와 같은방법으로 8번 관절을 움직여, 팔을 흔드는 모션을 만들어 봅시다.

    ![](/assets/images/sw/rplus_task3/motion_ex_10_1.png)  
    ![](/assets/images/sw/rplus_task3/motion_ex_10_2.png)  
    ![](/assets/images/sw/rplus_task3/motion_ex_10_3.png)  

7. 처음의 타임라인 위치로 이동하여, 상단 툴바의 “재생”버튼을 클릭하여 지금까지 만든 모션 유닛을 재생해봅니다. 앞서 타임라인 상에 삽입한 로봇의 포즈가 시간 순으로 재생됩니다.

    ![](/assets/images/sw/rplus_task3/motion_ex_10_4.png)  


### [실제 로봇 활용](#실제-로봇-활용)

지금부터 실제 로봇을 연결하여 모션 유닛을 편집합니다. 실제 로봇의 자세를 손으로 조작하면서 타임라인 상에 저장할 동작을 만듭니다.

1. 좌측 하단의 “연결하기”버튼을 클릭하여 로봇을 연결합니다. ([로봇 연결하기](#로봇-연결하기) 참조)  
2. 새로운 모션 유닛을 생성합니다. ([새 모션 유닛 만들기](#새-모션-유닛-만들기) 참조)  
3. 전체 관절을 선택한 후 ”토크 끄기”버튼을 클릭하여 실제 로봇의 토크를 풀어줍니다. (임의로 관절을 클릭한 후 `Ctrl` + `A` 를 누르면 전체 관절이 선택됩니다.)  
    ![](/assets/images/sw/rplus_task3/motion_sync_01.png)
4. 실제 로봇을 손으로 움직여 원하는 포즈를 만든 후 “토크 켜기”버튼을 클릭, 이어서 “로봇 포즈 읽기“버튼을 클릭합니다. (3D 로봇이 실제 로봇의 포즈를 따라 합니다.)  
    ![](/assets/images/sw/rplus_task3/motion_sync_03.png)  
    ![](/assets/images/sw/rplus_task3/motion_sync_04.png)
5. 화면 상단에 검게 표시된 타임라인에서 임의의 위치를 클릭한 후 “키 프레임 삽입”버튼을 클릭하여 로봇으로부터 읽어온 포즈를 해당 위치에 삽입합니다.  
    ![](/assets/images/sw/rplus_task3/motion_sync_05.png)  
6. 다시, 타임라인 상에서 임의로 다음 위치를 지정한 후 “키 프레임 삽입”버튼을 클릭하여 동일한 포즈를 삽입합니다.  
    ![](/assets/images/sw/rplus_task3/motion_sync_06.png)  

7. 좌측 하단의 “동기화 모드”버튼을 클릭하여 활성화합니다. (동기화 모드가 활성화되면 3D로봇의 포즈가 자동으로 실제 로봇에 입력됩니다.)
    ![](/assets/images/sw/rplus_task3/motion_sync_08.png)  
8. 3D로봇을 조작하여 포즈를 잡아줍니다. 이때 3D 로봇을 따라 움직이는 실제 로봇이 무게중심을 잃지 않도록 확인하며 진행합니다.
    ![](/assets/images/sw/rplus_task3/motion_sync_09.png)  
    ![](/assets/images/sw/rplus_task3/motion_sync_10.png)  
9. 상단 툴바의 “재생”버튼을 클릭하여 지금까지 만든 모션 유닛을 재생해봅니다. 앞서 타임라인 상에 삽입한 로봇의 포즈가 시간 순으로 재생됩니다.

## [새 모션 만들기](#새-모션-만들기)

모션이란 여러 개의 모션 유닛을 이어 붙이거나 반복횟수, 재생속도 등을 지정하여 댄스와 같이 긴 동작을 효율적으로 표현하기 위한 데이터 단위 입니다.  
태스크 코드에서 모션을 사용하기 위해서는 반드시 모션 유닛을 조합하여 모션을 만들어야 합니다.

1. 모션 탭으로 이동한 후, 상단 툴바의 모션 목록을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_new_01.png)

2. 모션 목록에서 “새 모션 만들기”버튼을 클릭합니다.
3. 새로운 모션의 이름을 입력한 후 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_new_02.png)

4. 새로 생성된 모션을 선택한 후 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_new_03.png)

## [모션 편집하기](#모션-편집하기)

지금부터 빈 모션 내에 모션 유닛을 삽입한 후 재생 파라미터를 편집하는 방법을 설명합니다.

1. 우측 상단에 “모션 유닛 삽입”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_01.png)  

2. 삽입할 모션 유닛을 선택한 후 “재생 파라미터”탭을 선택합니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_02.png)

3. 재생 파라미터 탭에서 삽입할 모션 유닛의 재생속도, 반복횟수, 호출번호 삽입 유무를 편집할 수 있습니다. 우선 값을 변경하지 않고 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_03.png)

4. 삽입된 모션 유닛을 확인한 후 “재생”버튼을 클릭하여 모션을 확인 합니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_04.png)

5. 삽입된 모션 유닛을 다른 모션 유닛으로 변경하거나 재생 파라미터를 수정하려면 삽입된 모션 유닛을 더블 클릭합니다.
6. “초록색 화살표”를 더블 클릭하면 모션 유닛이 실행된 후 이어서 실행할 모션 유닛을  추가로 삽입할 수 있습니다.
7. “붉은색 화살표”를 더블 클릭하면 모션 유닛이 종료될 때 이어서 실행할 모션 유닛을 추가로 삽입할 수 있습니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_05.png)

8. “초록색 화살표”를 더블클릭하여 다음 위치에 “초기 자세” 모션 유닛을 추가합니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_06.png)

9. 완성된 모션을 재생해봅니다.

    ![](/assets/images/sw/rplus_task3/motion_edit_07.png)

## [모션 그룹 만들기](#모션-그룹-만들기)

로봇에 모션을 다운로드하기 위해서는 모션 그룹을 만들어야 합니다. 모션 그룹은 전체 모션 중 다운로드 하려는 모션을 선택하여 묶어놓은 데이터 단위 입니다.

1. 모션 다운로드 탭으로 이동한 후, 중앙 좌측의 “새 모션 그룹 만들기”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_group_01.png)

2. 새 모션 그룹의 이름을 입력한 후 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_group_02.png)

3. 후보 모션 목록에서 그룹에 포함시킬 모션을 선택한 후 “모션 추가”버튼을 클릭합니다. 우측에 막대 그래프를 통해 실제 로봇의 저장공간을 얼마나 사용했는지 알 수 있습니다. “확인”버튼을 클릭하여 모션 그룹을 생성합니다.

    ![](/assets/images/sw/rplus_task3/motion_group_03.png)

## [모션 다운로드 하기](#모션-다운로드-하기)

1. 모션 그룹 목록에서 로봇에 다운로드 하려는 모션 그룹을 선택합니다. 우측의 저장 용량 그래프가 초과하지 않았는지 확인합니다.

    ![](/assets/images/sw/rplus_task3/motion_download_01.png)

2. “모션 그룹 다운로드”버튼을 클릭하여 로봇에 다운로드합니다. 화면 중앙에 다운로드 과정이 표기됩니다.

    ![](/assets/images/sw/rplus_task3/motion_download_02.png)

### [모션 다운로드 주의사항](#모션-다운로드-주의사항)

기존에는 모션 파일의 크기가 로봇 제어기의 저장 용량을 초과할 수 없어 용량이 큰 모션의 경우 모션 파일을 별도로 나누어 저장해야 했던 반면, 모션 2.0에서는 모션 프로젝트 내에 용량 제한이 없어 한 가지 로봇의 모션을 하나의 파일에 모두 저장한 후 필요시 선택적으로 다운로드할 수 있습니다.  
모션 프로젝트 내에 저장된 로봇 모션 중 목적에 따라 원하는 모션을 모션 그룹으로 묶을 수 있으며, 작성한 모션 그룹 중 하나를 로봇에 다운로드할 수 있습니다.

![](/assets/images/sw/rplus_task3/motion_download_03.png)

모션 그룹을 편집하는 과정에서 모션을 담을 때마다 우측에 제어기 예상 메모리 용량이 세로 막대 그래프로 표시됩니다.
모션 그룹에 담긴 모션에는 순서대로 호출 번호가 부여되며 이를 활용해서 로보플러스 태스크에서 호출할 수 있습니다.

`다운로드시 주의사항` 기존과 달리 모션 유닛과 모션을 편집하는 과정에서 실제 로봇으로 모션을 재생한 경우 로봇 제어기내에 저장된 모션이 삭제되므로 모션 편집을 완료한 후에 반드시 로봇 제어기에 모션을 새로 다운로드해야 합니다
{: .notice--warning}

## [모션 저장하기](#모션-저장하기)

모션 작성 및 편집이 완료 되면 오른쪽 상단의 저장하기 또는 단축기 `Ctrl` + `S` 버튼을 클릭하여 저장 할수있습니다.

![](/assets/images/sw/rplus_task3/motion_save.png)  


[제어기 호환표]: /docs/kr/parts/controller/controller_compatibility/
[접촉 센서 부품 정보]: /docs/kr/parts/sensor/ts-10/
[적외선 센서 부품 정보]: /docs/kr/parts/sensor/irss-10/
[컬러 센서 부품 정보]: /docs/kr/parts/sensor/cs-10/
[자석 센서 부품 정보]: /docs/kr/parts/sensor/mgss-10/
[온도 센서 부품 정보]: /docs/kr/parts/sensor/tps-10/
[절대 거리 센서 부품 정보]: /docs/kr/parts/sensor/dms-80/
[조도 센서 부품 정보]: /docs/kr/parts/sensor/cds-10/
[온습도 센서 부품 정보]: /docs/kr/parts/sensor/tms-10/
[동작감지 센서 부품 정보]: /docs/kr/parts/sensor/pir-10/
[사용자 센서 제작]: /docs/kr/edu/bioloid/premium/#사용자-센서-제작
[CM-50]: /docs/kr/parts/controller/cm-100/
[CM-100A]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCM 7.0]: /docs/kr/parts/controller/opencm7/
[R+ Smart]: /docs/kr/software/mobile_app/rplussmart/
[R+ Smart 컨트롤 테이블]: /docs/kr/software/mobile_app/rplussmart/#r-smart-control-table
[ROBOTIS DREAM]: /docs/kr/edu/dream/dream1-1/
[ROBOTIS SMART]: /docs/kr/edu/smart/smart1-1/
[ROBOTIS STEM]: /docs/kr/edu/bioloid/stem/
[ROBOTIS PREMIUM]: /docs/kr/edu/bioloid/premium/
[ROBOTIS GP]: /docs/kr/edu/bioloid/gp/
[ROBOTIS MINI]: /docs/kr/edu/mini/
[OpenCM 9.04]: /docs/kr/parts/controller/opencm904/
[BT-110]: /docs/kr/parts/communication/bt-110/
[BT-210]: /docs/kr/parts/communication/bt-210/
[BT-410]: /docs/kr/parts/communication/bt-410/
[제어기펌웨어 업데이트]: /docs/kr/software/rplus2/manager/getting_started/#펌웨어-업데이트
