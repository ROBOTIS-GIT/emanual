---
layout: archive
lang: en
ref: useful_tips
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/useful_tips/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 4
---

<div style="counter-reset: h1 6"></div>

<!--[dummy Header 1]>
  <h1 id="rplustask3"><a href="#rplustask3">rplustask3</a></h1>
<![end dummy Header 1]-->

# [유용한 정보](#유용한-정보)

## [변수, 함수 참조 찾기](#변수-함수-참조-찾기)

변수 & 함수가 사용된 지점을 찾아가는 기능입니다. 각 변수 & 함수의 이름변경 기능을 제공합니다.  

1. 우측의 “변수(또는 함수)”버튼을 클릭합니다. (변수 또는 함수가 반드시 하나 이상 존재해야 합니다.)  
2. “변수 목록(또는 함수 목록)”에서 참조 찾기를 진행할 대상을 선택합니다.  
3. 해당 변수(또는 함수)가 사용된 위치를 “참조 결과”에서 확인할 수 있습니다.  

    ![](/assets/images/sw/rplus_task3/motion_info_01.png)  

4. “참조 결과”에서 항목을 선택하면 위치를 찾아갈 수 있습니다.  
5. 상단에 “이름 변경”버튼을 클릭하면 해당 변수(함수)의 이름을 일괄적으로 변경할 수 있습니다.  

    ![](/assets/images/sw/rplus_task3/motion_info_02.png)  
    ![](/assets/images/sw/rplus_task3/motion_info_03.png)

## [키워드 찾기](#키워드-찾기)

프로그램 코드에서 사용한 요소를 검색하는 기능입니다.

1. 우측 하단의 찾기 버튼을 클릭하세요.  
2. 상단에 검색어를 입력하세요.  
    ![](/assets/images/sw/rplus_task3/motion_info_04.png)  
3. 태스크 코드에서 “찾기 결과”가 하단에 목록으로 표시됩니다.  
4. 목록의 아이템을 클릭하면 해당 줄로 이동합니다.  
    ![](/assets/images/sw/rplus_task3/motion_info_05.png)

## [문법검사/컴파일 결과 확인하기](#문법검사컴파일-결과-확인하기)

태스크 코드를 제어기에 다운로드하기 위해서는 문법 검사 및 컴파일 과정을 거쳐야 합니다. 제어기에 다운로드를 시도하거나 “오류”버튼을 클릭하면 문법 검사 및 컴파일이 자동으로 수행됩니다.

- 문법 검사 : 태스크 코드에서 사용한 명령어가 제어기에서 호환된 명령어인지, 문법에 오류가 있는지를 검사하는 과정입니다. 반드시 모든 오류를 수정해야 다음과정이 진행됩니다.

- 컴파일 : 문법 검사가 올바르게 이루어진 코드를 제어기가 해석 가능한 기계어로 변환하는 과정입니다. 컴파일 과정에서 변수 개수, 콜백 사용량, 메모리 사용량을 검사하게 됩니다.

![](/assets/images/sw/rplus_task3/motion_info_06.png)

## [키프레임](#키프레임)

단축키와 함께 키프레임을 더 쉽게 사용할 수 있습니다.  

`Ctrl` 키를 활용하면 각 프레임 사이의 공간을 사용하여 총 시간에는 변화가 없지만, `Insert` 또는 `Delete` 키만 활용시에, 각 프레임간의 시간에 변화가 생깁니다.  

### [삽입](#삽입)

아래 사진은 `Ctrl` 키 와 `Insert` 키의 활용의 차이점을 보여줍니다.  


![](/assets/images/sw/rplus_task3/motion_keyframe_insert_kr.png)

### [삭제](#삭제)

아래 사진은 `Delete` 키 와 `Ctrl` 키의 활용의 차이점을 보여줍니다.  

![](/assets/images/sw/rplus_task3/motion_keyframe_delete_kr.png)


### [프레임 선택 재생](#프레임-선택-재생)
지정한 프레임 선택하여 재생 할 수 있습니다. 아래 그림은 빨간색 네모박스 안의 선택된 프레임만 재생되며, 나머지 프레임은 재생되지않습니다.

![](/assets/images/sw/rplus_task3/motion_keyframe_selected_play.png)

## [음원 재생](#음원-재생)

로봇에 음원을 재생 시킬수 있습니다.

- 음표이미지 버튼 클릭후, 음원을 선택해주세요.  
![](/assets/images/sw/rplus_task3/motion_musicplay.png)

- 음원재생버튼을 클릭시 음원만 재생이됩니다.  
![](/assets/images/sw/rplus_task3/motion_musicplay_03.png)

- 음원 재생 시작-종료 구간에서 시간값을 입력하여 선택재생 가능합니다.  
![](/assets/images/sw/rplus_task3/motion_musicplay_02.png)

- 모션 실행시 음원도 같이 재생할수있어 댄스모션 제작에 편리합니다.  



## [자유 형태 로봇 생성](#자유-형태-로봇-생성)


1. 홈탭에서, “자유 형태 로봇”목록을 클릭, 사용할 제어기를 선택한 후 “관절 추가”버튼을 클릭합니다.  
    ![](/assets/images/sw/rplus_task3/motion_user_01.png)  

2. 사용할 ID와 모터 종류를 선택한 후 “확인”버튼을 클릭하면 관절목록에 추가됩니다.

    ![](/assets/images/sw/rplus_task3/motion_user_02.png)  
    ![](/assets/images/sw/rplus_task3/motion_user_03.png)  

3. 이와 같이 사용할 모터 목록을 작성한 후 프로젝트를 생성하면 아래 그림과 같이 자유 형태 로봇이 생성됩니다.  
  자유 형태 로봇은 3D 로봇만으로 실제 로봇의 움직임을 유추하기 어려우나 연결된 실제 로봇의 움직임을 확인하며 모션 편집이 가능해집니다.  
    ![](/assets/images/sw/rplus_task3/motion_user_04.png)  

## [3D 로봇 변경](#3d-로봇-변경)

모션 파일은 최초 선택한 3D 로봇을 기준으로 작성됩니다. 모션 파일내의 데이터를 유지한 채로 3D 로봇을 변경해야 하는 경우 3D 로봇 변경 기능을 사용합니다.  
아래 설명은 “MAX-E1”을 “Dr.R”으로 변경하는 예시로 진행됩니다.

1. 홈 탭으로 이동한 후, 좌측 메뉴 중 “3D 로봇”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_3d_01.png)

2. 중앙 하단의 “3D 로봇 변경하기”버튼을 클릭하여 변경을 원하는 로봇을 선택한 후 확인버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_3d_02.png)

3. 3D 로봇이 변경되면 아래와 같이 탭이 이동합니다.
4. 불필요한 관절이 있을 경우 해당 관절을 제거하는 것이 좋습니다. 다시 홈 탭의 “3D 로봇”메뉴로 이동합니다. (제거할 관절이 없다면 ⑤는 생략합니다.)  
5. 선택한 후 좌측의 “관절 제거”버튼을 사용하여 제거합니다. 제거가 완료되면 우측 하단의 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_3d_03.png)

6. 불필요한 관절이 모두 제거되었습니다.

    ![](/assets/images/sw/rplus_task3/motion_3d_04.png)

## [포즈 미러링](#포즈-미러링)

3D 로봇의 각 관절은 아래 그림과 같이 중앙선을 기준으로 좌우 관절이 대칭으로 이루어져 미러링 기능을 사용할 수 있습니다. 로보플러스 태스크 3 에서 제공하는 미러링 기능은 포즈 대칭과 포즈 교환이 있습니다.

  ![](/assets/images/sw/rplus_task3/motion_mirror_01.png)

**포즈 대칭(Pose Symmetry)**

1. 포즈 대칭을 실행하기 위해 기준 값이 대입되어있는 관절을 선택합니다.
2. “미러링”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_mirror_02.png)

3. 선택한 관절의 값이 대칭되는 관절에 대입되었음을 확인합니다.

    ![](/assets/images/sw/rplus_task3/motion_mirror_03.png)

**포즈 교환(Pose Exchange)**

1. 포즈 교환을 실행하기 위해 기준 값이 대입되어있는 관절과 대응되는 관절을 모두 선택합니다.
2. “미러링”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_mirror_04.png)

3. 선택한 관절의 값이 서로 교환되었음을 확인합니다.

    ![](/assets/images/sw/rplus_task3/motion_mirror_05.png)

## [모션 호출 번호 수정](#모션-호출-번호-수정)

모션 호출 번호는 태스크(Task)로 작성한 프로그램 코드에서 모션 데이터를 호출할 때 사용됩니다.
제어기에 다운로드한 모션 데이터의 호출번호와 태스크에서 사용한 호출번호가 일치하도록 입력해야 합니다.

1. “모션 다운로드”탭으로 이동한 후, 모션 호출 번호를 수정할 모션그룹을 선택하고 편집 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_call_01.png)

2. 모션 그룹 내에 담긴 모션 중 수정하고 싶은 호출 번호나 종료 번호를 클릭합니다. 변경할 번호를 입력한 후 “Enter”키를 누릅니다.

    ![](/assets/images/sw/rplus_task3/motion_call_02.png)

3. 만약 입력한 번호가 중복되면 다음과 같은 확인 창이 활성화됩니다. 종료 번호의 경우 값을 넣지 않으면 임의로 할당됩니다.

    ![](/assets/images/sw/rplus_task3/motion_call_03.png)

## [모션 파일간 데이터 복사](#모션-파일간-데이터-복사)

1. 복사할 데이터가 담긴 모션 파일을 실행합니다.  
    ![](/assets/images/sw/rplus_task3/motion_copy_01.png)

5. 모션 유닛 목록을 열어 복사할 대상을 선택한 후, 단축키 `Ctrl` + `C` 를 실행합니다.  
    ![](/assets/images/sw/rplus_task3/motion_copy_02.png)
6. "1"번 과정과 동일하게 빈 파일을 다시 열어, 모션편집기에서 단축키 `Ctrl` + `V` 를 실행합니다.  
    ![](/assets/images/sw/rplus_task3/motion_copy_04.png)

**참고** : 로보플러스 태스크 3.0을 중복 실행해서, 모션파일 복사도 가능합니다.
{: .notice--info}

{% capture motion_01 %}
**경고 : 모션 파일간 데이터 복사 시 주의사항**  
- 복사가 가능한 데이터는 관절 값, 키-프레임, 모션 유닛, 모션입니다.
- 빈 프로젝트에 이미 같은 이름의 데이터가 존재한다면 복사되지 않습니다.
- 복사는 모션 유닛 -> 모션 순으로 진행해야 하며, 모션 유닛을 복사하지 않고 모션을 복사한다면 빈 모션으로 복사됩니다.
{% endcapture %}
<div class="notice--warning">{{ motion_01 | markdownify }}</div>

## [오프셋 편집](#오프셋-편집)

1. 홈 탭을 클릭한 후 오프셋 편집을 클릭합니다.  
    ![](/assets/images/sw/rplus_task3/motion_offset_01.png)  
2. 로봇을 연결합니다. ([로봇 연결하기](/docs/kr/software/rplustask3/motion_programming/#로봇-연결하기) 참조)  
3. 동기화 모드를 활성화 합니다.  
    ![](/assets/images/sw/rplus_task3/motion_offset_02.png)  
4. 초기 포즈를 잡아준 후 로봇을 확인하며 오프셋 포즈를 편집합니다.  
    ![](/assets/images/sw/rplus_task3/motion_offset_03.png)  
5. 실제 로봇이 초기 포즈와 같은 포즈를 잡을 때가 가장 이상적인 오프셋입니다.  
6. 실제 로봇이 초기 포즈를 취한 3D 로봇과 같은 자세를 잡도록 오프셋을 천천히 조정합니다.  
7. “오프셋 다운로드“버튼을 클릭하여 오프셋을 로봇 제어기에 저장합니다.  
    ![](/assets/images/sw/rplus_task3/motion_offset_04.png)  
8. 초기 포즈와 오프셋 포즈간의 차이가 오프셋으로 적용됩니다. (오프셋 포즈 - 초기 포즈 = 오프셋)


### [모션에서 오프셋 편집하기](#모션에서-오프셋-편집하기)

1. 오프셋 설정을 위한 프레임을 선택합니다.  
2. 수정이 필요한 관절을 선택후 조정합니다.  
![](/assets/images/sw/rplus_task3/motion_offset_edit_01.png)
3. 오프셋 다운로드를 해주세요. 그후 수정된 오프셋 자세로 동작합니다  
4. 저장전 위치 초기화를 클릭면 수정된 자세가 취소됩니다.  
![](/assets/images/sw/rplus_task3/motion_offset_edit_02.png)  

## [구 버전 파일(*.mtn) 변환하기](#구-버전-파일mtn-변환하기)

  ![](/assets/images/sw/rplus2/motion/motion_40.gif)

새로운 **로보플러스 태스크 3.0** 에서는 기존의 **로보플러스 모션 1.0** 에서 사용하던 구 모션 파일(\*.mtn)을 그대로 사용할 수 없습니다.   
구 모션 파일(\*.mtn)을 새로운 모션 편집기에서 사용하려면 \*.mtn3로 변환하는 과정을 거쳐야 합니다.

`주의사항` mtn파일을 mtn3로 변환한 후에는 저장 용량 및 모션 호출번호가 변경될 수 있습니다. 변환이 완료된 후 모션 호출번호를 확인하여 다시 지정해주시기 바랍니다.
{: .notice--warning}

1. 로보플러스 모션을 실행합니다.

    ![](/assets/images/sw/rplus2/motion/motion_41.gif)

2. 로봇을 연결한 후 로봇 모션을 mtn파일로 저장하기 위해 “다른 이름으로 저장” 메뉴를 실행합니다.

    ![](/assets/images/sw/rplus2/motion/motion_42.gif)

3. 저장할 파일명을 입력한 후 “저장”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus2/motion/motion_43.gif)

4. R+ Motion 3.0을 실행후, “프로젝트 열기” 버튼을 클릭합니다.  

    ![](/assets/images/sw/rplus_task3/motion_trans_01.png)

5. 변환을 진행할 대상 mtn 파일을 선택한 후 “열기"버튼을 클릭합니다.

   ![](/assets/images/sw/rplus_task3/motion_trans_02.png)

6. 아래 그림과 같이 파일 변환 창이 활성화되면 “확인”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_trans_03.png)

7. 모션 데이터를 사용할 3D 로봇을 선택한 후 확인 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_task3/motion_trans_04.png)

8. 컨버팅이 완료되면 좌측 상단의 “모션 유닛 목록”을 클릭하여 제대로 변환되었는지 확인합니다.

9. 변환이 완료된 mtn3 파일을 저장합니다

    ![](/assets/images/sw/rplus_task3/motion_trans_05.png)

## [3D 카메라 조작](#3d-카메라-조작)

1. 마우스 오른쪽 버튼을 클릭한 채 드래그하면 시점이 회전됩니다.

    ![](/assets/images/sw/rplus_task3/motion_angle_01.png)

2. `Home` 키를 누르거나 마우스 휠 버튼을 위로 올리면 시점이 확대됩니다.

    ![](/assets/images/sw/rplus_task3/motion_angle_02.png)

3. `End` 키를 누르거나 마우스 휠 버튼을 아래로 내리면 시점이 축소됩니다.

    ![](/assets/images/sw/rplus_task3/motion_angle_03.png)

4. `Page Down` 키를 누르면 시점이 내려갑니다. (시점이 내려감에 따라 로봇이 위로 올려져 보입니다.)

    ![](/assets/images/sw/rplus_task3/motion_angle_04.png)

5. `Page Up` 키를 누르면 시점이 올라갑니다. (시점이 올라감에 따라 로봇이 아래로 내려져 보입니다.)

    ![](/assets/images/sw/rplus_task3/motion_angle_05.png)


## [화면에 각도 출력하기](#화면에-각도-출력하기)

"각도 값" 표시버튼을 클릭하여 3D로봇과 실제로봇 모터의 각도값을 출력할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/motion_anglemark_01.png)  
  ![](/assets/images/sw/rplus_task3/motion_anglemark_02.png)

## [배경이미지 지정](#배경이미지-지정)

"자유형태 로봇"을 제작할때 2D 이미지를 배경으로 임의의 모터를 배치하여, 제작에 편의성을 제공할 수 있습니다.  

1. 배경삽입 버튼을 클릭후, 원하는 배경을 삽입하세요.  
  ![](/assets/images/sw/rplus_task3/motion_background_01.png)  

2. 아래 사진과 같이 배경 위로 모터를 배치할 수 있습니다.    
  ![](/assets/images/sw/rplus_task3/motion_background_02.png)  

3. 제작시, 자유 배치 잠금 버튼을 클릭하여, 모터가 움직이지 않도록 고정시켜 주세요.  
  ![](/assets/images/sw/rplus_task3/motion_background_03.png)  

## [초기위치 이동](#초기위치-이동)

모터전체의 위치를 0점으로 이동시킵니다.  
![](/assets/images/sw/rplus_task3/motion_position_init.png)


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
