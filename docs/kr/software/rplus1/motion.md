---
layout: archive
lang: kr
ref: rplus1_motion
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus1/motion/
sidebar:
  title: 로보플러스 모션 1.0
  nav: "rplusmotion1"
---

# [개요](#개요)

## 모션이란?

모션이란, 로봇이 의미있는 행동을 하기 위해 필요한 관절 별 모터의 위치와 속도 데이터 집합을 의미합니다.  
로봇이 움직이기 위해서는 모션 파일이 필요하며, 조립된 로봇에 맞는 모션 파일을 다운로드 해야 합니다.  
모션 파일은 PC 상에서 아래와 같은 아이콘 그림과 확장자가 mtn으로 존재합니다.

![img](/assets/images/sw/rplus1/motion/roboplusmotion_icon.png)

## 모션과 태스크 코드는 어떤 관계인가요?

태스크 코드(Task Code)파일은 프로그램이고, 모션 파일은 데이터입니다. 이 관계는 MP3 플레이어와 MP3파일을 생각해보면 매우 쉽게 이해할 수 있습니다. MP3 플레이어가 없다면 MP3파일을 재생할 수 없어서 음악을 들을 수 없습니다. 반대로, MP3플레이어는 있지만 MP3파일이 없어도 마찬가지로 음악을 들을 수 없습니다. 만약, 내가 만든 로봇을 움직이게 하려면 반드시 태스크 코드가 있어야 합니다. 로봇에 다운로드한 태스크 코드가 모션 데이터를 사용한다면, 반드시 모션 파일도 다운로드해야 합니다. 만약, 태스크 코드에서 모션을 사용하지 않는다면 모션 파일은 필요 없습니다.

`Note` 태스크 코드에서 모션을 사용한다면, 반드시 모션 파일을 다운로드해야 합니다.
{: .notice}

![img](/assets/images/sw/rplus1/motion/roboplus_motion.png)

## [설치하기](#설치하기)

- `다운로드` [로보티즈 홈페이지 자료실](http://www.robotis.com/service/downloadpage.php?cate=software)

로보플러스는 모든 로보티즈 제품을 프로그래밍할 수 있는 통합 소프트웨어입니다.

### RoboPlus 시스템 요구 사항
- OS : Windows XP Service Pack 2 이상/ Vista/ 7 (32/64bit)/8 (32/64bit)
- 800MHz이상의 32비트(x86) 또는 64비트 (x64) 프로세서
- 3D 가속 기능을 지원하는 그래픽 카드  
- 512MB이상 시스템 메모리
- 여유공간이 500MB 이상인 하드디스크

![img_install](/assets/images/sw/roboplus_install.png)

`Note` 로보플러스를 실행하기 위해선 .NET FrameWork 3.5이상의 버전이 필요 합니다. 로보플러스 설치시 .NET FrameWork 자동설치가 실패할 경우엔 .NET FreameWork를 별도로 설치하세요.
{: .notice}

### RoboPlus 설치 실패시

대부분의 RoboPlus 설치 실패의 원인은 사용자 PC환경에 따른 .NET FrameWork 자동 설치 실패 입니다.  
따라서 사용자가 직접 .NET FrameWork 3.5를 수동으로 설치 하셔야 합니다.  
.NET FrameWork 3.5를 수동으로 설치 하기 전에 Windows installer 3.1이상이 설치 되어 있어야 합니다.  
 
Windows installer와 .NET Framework는 마이크로 소프트 다운로드 센터에서 다운로드가 가능합니다.  
 
- `다운로드` [Windows installer 3.1](http://www.microsoft.com/downloads/details.aspx?FamilyID=889482fc-5f56-4a38-b838-de776fd4138c&DisplayLang=ko)
- `다운로드` [.NET Framework 3.5](http://www.microsoft.com/downloads/details.aspx?FamilyID=d0e5dea7-ac26-4ad7-b68c-fe5076bba986&DisplayLang=ko)

# [시작하기](#시작하기)

## [로봇 모션](#로봇-모션)

로봇 모션은 제어기 안에 존재하는 모션 데이터를 의미합니다.  
로봇 모션 창은 이 데이터를 보여주고, 편집할 수 있도록 합니다.  
로봇 모션 창은 로봇을 연결해야만 나타납니다. ([로봇 연결하기](#로봇-연결하기) 참고)

![img](/assets/images/sw/rplus1/motion/rmfm_robotmotion.png)

## [파일 모션](#파일-모션)

파일 모션은 PC에 파일로 존재하는 모션 데이터를 의미합니다.  
파일 모션 창은 이 데이터를 보여주고 편집할 수 있도록 합니다.  
파일 모션 창은 여러 개를 띄울 수 있습니다.

![img](/assets/images/sw/rplus1/motion/rmfm_filemotion.png)

## [로봇 연결하기](#로봇-연결하기)

1. 로봇을 PC와 연결합니다. (연결 방법은 [각 제어기 정보]를 참고하세요.)
2. 통신 포트를 선택합니다.  
    로봇이 연결된 통신 포트를 선택합니다. 만약 통신 포트를 모른다면 자동 찾기를 선택합니다.

    ![img](/assets/images/sw/rplus1/motion/conn_portselection.png)

3. 로봇에 연결합니다. 연결 메뉴를 선택합니다.

    ![img](/assets/images/sw/rplus1/motion/conn_connecticon.png)

    ![img](/assets/images/sw/rplus1/motion/conn_connectmenu.png)

    로봇에 연결하지 못하면 다음과 같은 문제를 확인하기 바랍니다.
    - 제어기를 PC에 연결했습니까?
    - 제어기 전원을 켰습니까?
    - 제어기가 연결된 올바른 포트를 선택했습니까?
    - RoboPlus Motion을 사용할 수 있는 제어기입니까?
      - CM-100의 경우는 사용할 수 없습니다.
      - CM-5의 경우는 펌웨어 업그레이드를 해야 사용할 수 있습니다.

4. 로봇의 연결을 끊습니다.  
    로봇의 연결을 끊으려면 해제 메뉴를 선택하거나 로봇 모션 창을 닫습니다.

    ![img](/assets/images/sw/rplus1/motion/conn_disconnecticon.png)

## [모션 다운로드](#모션-다운로드)

특정 파일 모션을 로봇 모션으로 바꿀 수 있습니다.

- 다운로드 할 파일 모션을 엽니다.
- 로봇을 연결합니다.
- 다운로드 버튼을 누르고 완료되기를 기다립니다.

  ![img](/assets/images/sw/rplus1/motion/down_menu.png)

- 파일 모션의 내용이 로봇 모션에 옮겨진 것을 확인합니다.

  ![img](/assets/images/sw/rplus1/motion/down_result.png)

- 로보플러스 프로그램 다운로드(CM-510/530)

<iframe width="560" height="315" src="https://www.youtube.com/embed/dHCqPs1_2yY" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [모션 실행](#모션-실행)

만든 모션을 실행해볼 수 있습니다. 원하는 페이지를 선택한 후, 실행 메뉴를 선택합니다.

![img](/assets/images/sw/rplus1/motion/playstop_motion_play.png)

- 모션 실행 시도시 다음과 같은 문제가 발생할 수 있습니다.
  - 이 경우는 로봇 모션 창에서 작업할 경우 나타납니다. 이 문제는 Next나 Exit로 연결된 페이지가 수정되었고, 제어기 메모리가 작아서 임시로 저장할 수 없기  때문입니다.

    ![img](/assets/images/sw/rplus1/motion/playstop_motion_robot_play_error.png)

    > 실행하기 전에 저장을 하면 이 문제는 해결이됩니다. 만약, 저장하지 않고 확인을 눌러 진행한다면 현재 페이지만 실행됩니다.

  - 이 경우는 파일 모션 창에서 작업할 경우 나타납니다. 제어기가 아닌 PC에 데이터가 있는 경우 제어기 메모리가 작아서 Next나 Exit로 연결된 페이지를 임시로 저장할 수 없기 때문입니다.

    ![img](/assets/images/sw/rplus1/motion/playstop_motion_file_play_error.png)

    > 오직, 선택한 페이지만 실행 가능합니다. 만약, 연결된 페이지도 실행하려면 다운로드 해야 합니다.

## [모션 정지](#모션-정지)

실행중인 모션을 정지시킵니다.

![img](/assets/images/sw/rplus1/motion/playstop_motion_stop.png)

모션 정지는 바로 멈추는 것이 아니라 Exit 페이지를 실행한 후 정지합니다.

## [모션 비상 정지](#모션-비상-정지)

실행중인 모션을 정지시킵니다.

![img](/assets/images/sw/rplus1/motion/playstop_e_stop.png)

모션 정지와 달리 비상 정지는 그 즉시 멈춥니다.


# [모션 편집](#모션-편집)

여기서는 모션 편집에 앞서서 미리 알아두어야 할 사항에 대해 소개하고 있습니다.

## 다이나믹셀 ID 설정

제어기에 내장된 모션 플레이어는 ID 0부터 25까지 총 26개의 다이나믹셀만 관리할 수 있습니다. 따라서, RoboPlus Motion에서 모션을 만들기 위해서는 반드시 해당 관절의 다이나믹셀의 ID가 0~25사이에 할당되어야 합니다.

## 제어 우선 순위

다이나믹셀 제어는 RoboPlus Motion과 RoboPlus Task가 모두 할 수 있습니다. 일반적인 제어 우선 순위는 다음과 같습니다.

1. RoboPlus Motion (단, 해당 다이나믹셀의 ID가 0~25사이에 존재)
2. RoboPlus Task

즉, 모션이 실행되면 RoboPlus Task는 더이상 해당 다이나믹셀을 제어할 수 없고, 오직 RoboPlus Motion만 제어가 가능해집니다.  
하지만, 사용자는 이 제어 우선 순위를 바꿀 수 있습니다. 제어 우선 순위를 바꾸는 방법은 다음과 같습니다.

- 모션 데이터에 설정하는 방법 : 이 방법은 [ID 사용 유무 설정](#id-사용-유무-설정)을 이용하면 됩니다.
- 태스크 코드(Task Code)에서 설정하는 방법 : 이 방법은 [관절 오프셋 파라미터]를 이용하면 됩니다. 로봇이 상황에 따라 제어 우선 순위를 바꿀 수 있는 것이 장점입니다.

## 다이나믹셀 자동 꺼짐 기능

다이나믹셀은 자동 꺼짐 기능이 있습니다. 이 기능은 과도한 사용 환경으로부터 다이나믹셀이 망가지는 것을 막기위한 것입니다. 자동 꺼짐 기능은 다음과 같은 경우 작동합니다.
- 내부 온도 상승으로 모터가 과열된 경우
- 과도한 힘이 일정 시간 동안 모터에 작용한 경우

자동 꺼짐 기능이 작동하면 다음과 같은 증상이 나타납니다.
- 다이나믹셀 LED가 깜박거립니다.
- 모터가 작동하지 않아서 힘이 생기지 않습니다.

이 문제를 해결하기 위해서는 다음과 같은 조치를 취해야 합니다.
- 자동 꺼짐 기능 작동 원인을 제거합니다.
- 과열로 인한 경우는 일정한 휴식을 통해 열을 식혀줍니다.
- 과부하로 인한 경우는 모터에 무리한 힘을 가하지 않습니다.
- 다이나믹셀에 전원을 차단했다가 다시 켭니다.

로봇의 모션을 만들다보면 갑자기 관절에 힘이 들어가지 않는 경우가 생깁니다. 이러한 증상은 다이나믹셀 자동 꺼짐 기능이 작동한 것이고, 위와 같은 원인때문입니다.

## [포즈 편집]

포즈(Pose)란, 로봇의 정지된 자세를 뜻하며 해당 자세를 취하기 위해 필요한 모터들의 위치 값의 집합으로 표현됩니다.

![img](/assets/images/sw/rplus1/motion/poseedit_concept.png)

- `스텝의 포즈` : 데이터로 저장된 상태의 포즈를 스텝의 포즈라고 부릅니다.

- `로봇의 포즈`: 연결된 로봇의 관절별 위치 값들을 로봇의 포즈라고 부릅니다. 로봇의 포즈는 수정하면 로봇이 움직입니다.

### <a name="기본-포즈-편집기"></a>[기본 포즈 편집기](#기본-포즈-편집기)

기본 포즈 편집기는 어떤 형태의 로봇도 사용할 수 있는 기본적인 편집기입니다. 만약, 스텝의 포즈에서 사용하는 ID 개수를 변경하거나  바꾸고 싶다면 [ID편집 기능](#전체-페이지-편집)을 사용할 수 있습니다.

![img](/assets/images/sw/rplus1/motion/basic_motion_edit.png)

#### [관절 선택하기](#관절-선택하기)

마우스로 해당 줄을 클릭하면 1개의 관절을 선택할 수 있습니다. 여러 개의 관절을 선택하는 방법은 다음과 같습니다.
- 연속적으로 여러 관절을 선택

  ![img](/assets/images/sw/rplus1/motion/basic_joint_selection_3.png)

  - 마우스로 드래그(Drag)합니다.
  - Shift키를 누른 상태에서 다른 관절을 선택합니다.

- 개별적으로 여러 관절을 선택

  ![img](/assets/images/sw/rplus1/motion/basic_joint_selection_4.png)

  - Ctrl키를 누른 상태에서 해당 관절을 선택합니다.

- 전체 관절 선택
  - 버튼을 눌러서 선택

    ![img](/assets/images/sw/rplus1/motion/basic_joint_selection_1.png)

  - 메뉴를 선택

    ![img](/assets/images/sw/rplus1/motion/basic_joint_selection_2.png)

#### [토크 On/Off](#토크-onoff)

토크 On/Off 기능은 로봇 관절의 힘을 켜거나 끄거나해서 손으로 포즈를 잡을 수 있도록 합니다.  
토크 On/Off기능은 로봇의 포즈에서만 사용할 수 있습니다.  
토크 On인 상태에서는 위치 값이 출력되고, Off인 상태에서는 '꺼짐'표시로 출력됩니다.

![img](/assets/images/sw/rplus1/motion/basic_torque_1.png)

토크를 On/Off시키는 방법은 다음과 같습니다.
- "켜기"버튼을 누르면 선택된 관절의 토크가 On됩니다.

  ![img](/assets/images/sw/rplus1/motion/basic_torque_2.png)

- "끄기"버튼을 누르면 선택된 관절의 토크가 Off됩니다.

  ![img](/assets/images/sw/rplus1/motion/basic_torque_3.png)

- 토크 토글(Toggle) 기능은 선택된 관절의 토크 On/Off상태를 전환시킵니다.

  ![img](/assets/images/sw/rplus1/motion/basic_torque_4.png)

#### [관절 값 바꾸기](#관절-값-바꾸기)

포즈에서 관절을 선택하면 해당 모터의 위치 값을 바꿀 수 있습니다.

![img](/assets/images/sw/rplus1/motion/basic_joint_value_1.png)


#### <a name="포즈-실행"></a>[포즈 실행](#포즈-실행)

포즈 실행은 스텝의 포즈를 로봇의 포즈로 옮겨서 로봇이 해당 포즈를 취하게 합니다.

![img](/assets/images/sw/rplus1/motion/stepwritebutton.png)

![img](/assets/images/sw/rplus1/motion/basic_pose_1.png)

#### <a name="포즈-캡쳐"></a>[포즈 캡쳐](#포즈-캡쳐)

포즈 캡쳐(Capture)란, 로봇의 포즈를 스텝의 포즈로 옮겨서 데이터에 저장합니다.

![img](/assets/images/sw/rplus1/motion/stepgobutton.png)

![img](/assets/images/sw/rplus1/motion/basic_pose_2.png)

#### [포즈 복사/붙여넣기](#포즈-복사붙여넣기)

포즈 복사/붙여넣기 기능은 매우 쉽게 관절 값을 교환할 수 있도록 합니다.  
포즈끼리의 교환은 물론 엑셀(Excel)이나 다른 문서에서 사용되는 텍스트도 교환이 가능합니다.  
(일반 텍스트의 경우 숫자 구분자는 공백 문자(Space)와 엔터(Enter), 탭(Tab)만 가능합니다.)

![img](/assets/images/sw/rplus1/motion/pose_copy_from_pose.png)

![img](/assets/images/sw/rplus1/motion/pose_copy_from_memo.png)

- 포즈 복사: 메뉴를 선택하거나 Ctrl+C를 눌러서 실행합니다.

  ![img](/assets/images/sw/rplus1/motion/pose_copy.png)

- 포즈 붙여넣기: 메뉴를 선택하거나 Ctrl+V를 눌러서 실행합니다.

  ![img](/assets/images/sw/rplus1/motion/pose_paste.png)

#### [포즈 마스크](#포즈-마스크)

포즈 마스크(Mask)는 포즈 실행/캡쳐시 값의 사용 유무를 설정함으로써 2개의 포즈를 합쳐서 새로운 포즈를 만들어냅니다.  
예를 들어 A라는 포즈의 상체 포즈와 B라는 포즈의 하체 포즈를 합쳐서 C라는 포즈를 만드는 등의 작업을 할 수 있습니다.

![img](/assets/images/sw/rplus1/motion/pose_mask.png)

![img](/assets/images/sw/rplus1/motion/pose_mask_pic.png)


### [포즈 유틸리티](#포즈-유틸리티)

포즈 유틸리티는 미리 입력된 로봇 정보를 이용해서 로봇의 포즈를 보다 쉽게 생성하기 위한 툴입니다.

- **3D 로봇 제어** : 3D 로봇의 관절을 마우스로 움직여서 포즈를 만들 수 있습니다.
- **미러** : 좌우 대칭 혹은 교환의 방법으로 포즈를 만들 수 있습니다.
- **역기구학** : 수학적으로 계산하는 방법으로 포즈를 만들 수 있습니다.

{% capture motion_01 %}
`Note` 
- 포즈 유틸리티는 반드시 로봇 정보가 필요합니다. 즉, 리스트에 없는 로봇은 사용할 수 없습니다. 
- 로봇에 따라 3D 로봇이나 미러/역기구학 기능을 지원하지 않을 수 있습니다. 
- 포즈 유틸리티는 3D 그래픽 기술을 사용하므로 그래픽 사양이 좋지 않은 시스템에서는 프로그램 속도가 느려질 수 있습니다.
{% endcapture %}

<div class="notice">{{ motion_01 | markdownify }}</div>

![img](/assets/images/sw/rplus1/motion/poseutility.png)

#### [로봇 선택](#로봇-선택)

포즈 유틸리티를 사용하기 위해서는 먼저 포즈 유틸리티를 적용할 로봇을 선택하여야 합니다. 로봇 이름의 리스트를 선택하면 적용할 로봇을 선택할 수 있습니다.

`Note` 리스트에 없는 로봇은 포즈 유틸리티를 사용할 수 없습니다.사용자 로봇의 경우는 [기본 포즈 편집기](#기본-포즈-편집기)로만 모션을 만들어야 합니다. 
{: .notice}

![img](/assets/images/sw/rplus1/motion/poseutility_robotselect.png)

- 포즈를 만들고자 하는 로봇의 이름을 선택합니다.

| 로봇 이름                   |                         |
| ----------------------- | ----------------------- |
| Bioloid Battle Droid    | 바이올로이드 중급 응용 로봇 배틀 드로이드 |
| Bioloid Dinosaur        | 바이올로이드 고급 응용 로봇 공룡      |
| Bioloid Fawn            | 바이올로이드 중급 응용 로봇 아기 사슴   |
| Bioloid Gerwalk         | 바이올로이드 중급 응용 로봇 거웍      |
| Bioloid Humanoid        | 바이올로이드 고급 응용 로봇 휴머노이드   |
| Bioloid King Spider     | 바이올로이드 고급 응용 로봇 킹 스파이더  |
| Bioloid Puppy           | 바이올로이드 고급 응용 로봇 강아지     |
| Bioloid Spider          | 바이올로이드 중급 응용 로봇 거미      |
| Bioloid Turtle          | 바이올로이드 중급 응용 로봇 거북이     |
| Bioloid Walking Droid   | 바이올로이드 초급 응용 로봇 보행 드로이드 |
| Premium Humanoid A-type | 바이올로이드 프리미엄 휴머노이드 A 타입  |
| Premium Humanoid B-type | 바이올로이드 프리미엄 휴머노이드 B 타입  |
| Premium Humanoid C-type | 바이올로이드 프리미엄 휴머노이드 C 타입  |

- `초기 자세` 버튼을 누르면 로봇이 각 로봇의 타입에 맞는 초기 자세를 취합니다.

#### [3D 로봇 제어](#3d-로봇-제어)

##### 뷰(View) 제어

3D 화면의 뷰 제어 기능을 이용해서 3D 로봇을 다양한 각도에서 볼 수 있습니다.

![img](/assets/images/sw/rplus1/motion/poseutility_3dview.png)

- **줌 맞춤(Zoom Fit)** : 뷰 각도를 초기 상태로 돌려놓습니다.
- **물체 선택하기** : 마우스 커서로 관절을 선택할 수 있는 상태로 만듭니다.
- **뷰(View) 회전시키기** : 마우스로 뷰를 회전시킬 수 있는 상태로 만듭니다. 마우스 가운데 버튼(휠 버튼)을 누른고 마우스를 움직여도 동일한 효과가 나타납니다.
- **뷰(View) 이동시키기** : 마우스로 뷰를 평행 이동시킬 수 있는 상태로 만듭니다. 키보드의 `Ctrl`키를 누른 상태에서 마우스 가운데 버튼(휠 버튼)을 누르고 마우스를 움직여도 동일한 효과가 나타납니다.
- **뷰(View) 확대/축소시키기** : 마우스로 뷰를 확대/축소할 수 있는 상태로 만듭니다. 마우스 휠을 돌려도 동일한 효과가 나타납니다.

##### [관절 제어](#관절-제어)

로봇 위에 나타나는 숫자는 다이나믹셀의 ID를 의미합니다. ID위에 마우스를 올려 놓으면 선택할 수 있는 다이나믹셀의 색깔이 바뀝니다.

![img](/assets/images/sw/rplus1/motion/poseutility_3djoint1.png)

해당 관절을 마우스로 클릭하면 관절 값이 나타납니다. 관절 값은 모터 값이 아닌 각도로 표시됩니다.

![img](/assets/images/sw/rplus1/motion/poseutility_3djoint2.png)

마우스 왼쪽 버튼을 누른 상태에서 좌/우로 움직이면 값이 증가하거나 감소합니다. 값의 단위는 1024기반 제어인 경우 약0.29(300 / 1024)이고, 4096의 경우 약 0.06(250.92 / 4096)이 됩니다.

#### [미러(Mirror)](#미러mirror)

포즈 유틸리티의 미러 기능은 아래 두 가지 기능을 제공합니다. 기능 선택 후 "적용" 버튼을 누르면 로봇에 적용됩니다.

1. 교환하기
    교환하기는 로봇의 좌측과 우측 포즈를 서로 교환하여 거울을 보듯이 정 반대의 포즈를 만들기 위해 사용합니다.
    
    ![img](/assets/images/sw/rplus1/motion/poseutility_mirror_exchange.jpg)
    
    ![img](/assets/images/sw/rplus1/motion/poseutility_mirror1.png)

2. 대칭
    대칭은 좌/우 한 쪽의 포즈를 기준으로 좌/우 대칭이 되도록 반대쪽의 포즈를 만들어 주기 위해 사용합니다.

    ![img](/assets/images/sw/rplus1/motion/poseutility_mirror_symmetry.png)

    ![img](/assets/images/sw/rplus1/motion/poseutility_mirror2.png)

#### [역기구학](#역기구학)

##### 위치(Position)와 좌표계(Coordinate System)

로봇의 움직임에 대한 기구학적 이해의 출발점은 로봇을 구성하는 각 부분의 위치를 파악하는 것에서부터 비롯됩니다. 이를 위해서는 먼저 원점(Origin)이 되는 좌표를 결정하고, 거기에서부터 어느 정도의 위치에 있는지를 변위로 표시해야 합니다.  

뷰(View)상에서의 좌표축과 원점은 아래와 같이 나타나며 격자의 단위는 20mm입니다.  
Origin은 X, Y, Z의 좌표가 (0, 0, 0)임을 의미합니다.

![img](/assets/images/sw/rplus1/motion/poseutility_vieworigin.png)

##### 순기구학(Kinematics)과 역기구학(Inverse Kinematics)

로봇 관절의 각도나 동작으로부터 끝점의 위치나 동작을 구하는 것을 순기구학이라 합니다. 즉, 순기구학은 각 관절의 값이 정해지면 끝점의 위치를 어떻게 구할 것인가 하는 것입니다.

간단한 예로 아래와 같이 평면에서 2개의 관절을 갖는 매니퓰레이터를 생각해 봤을 때, 각 관절의 값이 정해져 있는 경우 그 끝점의 좌표 (x, y)를 구하는 것을 순기구학이라 하며, 순기구학의 해는 오직 하나만 존재합니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_kinematics.png)

반대로 끝점의 위치나 동작으로부터 각 관절의 위치나 각도를 구하는 것을 역기구학이라 합니다.  
역시 위에서와 같이 평면 2링크 매니퓰레이터를 생각해 봤을 때, 끝점의 좌표 (x, y) 가 정해져 있는 경우 각 관절의 값은 아래 그림과 같이 2 가지 해가 존재합니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_inversekinematics.png)

역기구학에서는 경우에 따라 좌표 (x, y) 가 끝점이 다다를 수 없는 거리에 있거나, 관절 각도 제한에 의해 해가 존재하지 않을 수도 있으며, 더 많은 관절을 사용할 경우 무수히 많은 해가 존재할 수도 있습니다.

##### 끝점(End Point) 제어

포즈 유틸리티의 역기구학 기능은 초기 자세에서 정해진 끝점을 어느 방향으로 얼마나 옮길 것인가를 선택하면 역기구학을 이용하여 각 관절의 값을 계산하여 자동으로 설정된 값 만큼 끝점을 이동시켜 주는 기능입니다.

이 기능은 역기구학 연산을 수행하는 모듈이 있어야 합니다. 현재 역기구학 연산을 지원하는 로봇은 다음과 같습니다.

- 바이올로이드 휴머노이드
- 바이올로이드 프리미엄 휴머노이드 A타입
- 바이올로이드 프리미엄 휴머노이드 B타입
- 바이올로이드 프리미엄 휴머노이드 C타입

본 주제에 대한 설명은 바이올로이드 프리미엄 휴머노이드 A타입을 기준으로 진행됩니다.

###### 끝점 선택

- Walking Step : 두 발을 모두 움직이는 끝점이며 두 발 가운데에 위치합니다.
- Right Foot : 오른쪽 발만 움직이는 끝점이며 발바닥 가운데에 위치합니다.
- Left Foot : 왼쪽 발만 움직이는 끝점이며 발바닥 가운데에 위치합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_selectendpoint.png)

###### 끝점 초기화

끝점의 위치를 초기화시킵니다.

###### 끝점 움직이기

3D 공간에서 끝점은 6개의 파라미터로 제어가 가능합니다. 로봇의 구조에 따라 6개의 파라미터가 모두 나오지 않는 경우도 있습니다.
값을 바꾸기 위해서는 해당 파라미터를 선택한 후, 다음과 같은 방법을 사용합니다.

- 키보드의 `[` 키를 누르면 1씩 감소하고, `]`키를 누르면 1씩 증가합니다.
- 키보드의 `Shift`키를 누른 상태에서 `[`키를 누르면 10씩 감소하고, `]`키를 누르면 10씩 증가합니다.
- 마우스로 더블 클릭을 하거나 `Enter`키를 누르면 값을 변경할 수 있는 컨트롤이 나타납니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_descrip.png)

- X(mm): X축 방향으로 mm단위로 이동합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_xmove.png)

- Y(mm): Y축 방향으로 mm단위로 이동합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_ymove.png)

- Z(mm): Z축 방향으로 mm단위로 이동합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_zmove.png)

- &phi;(&deg;): X축을 기준으로 각도 단위로 회전합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_xamove.png)

- &theta;(&deg;): Y축을 기준으로 각도 단위로 회전합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_yamove.png)

- &psi;(&deg;): Z축을 기준으로 각도 단위로 회전합니다.

  ![img](/assets/images/sw/rplus1/motion/poseutility_ik_zamove.png)

{% capture rplusmotion_notice_01 %}
`Note` 각 파라미터는 최소 값과 최대 값이 있어서 그 범위에서만 변경이 가능합니다.  
역기구학 연산은 때때로 수학적으로 결과를 알 수 없는 경우가 발생하며, 이를 해(Solution)가 없거나 무수히 많다라고 표현합니다.  
이로인해 파라미터 값이 범위 안에 있는데도 불구하고 변경되지 않는 경우가 발생하는데, 이런 경우에는 다른 파라미터 값을 바꾸면 해결이 됩니다.  
(예를 들어, 다리를 끝까지 펴고 있는 경우(Z가 0)에는 X 혹은 Y파라미터가 변경되지 않습니다.)
{% endcapture %}

<div class="notice">{{ rplusmotion_notice_01 | markdownify }}</div>


###### 결과 적용

스텝의 포즈가 선택된 상태에서는 데이터 상의 포즈값이 바뀌고, 로봇의 포즈가 선택된 상태에서는 로봇의 포즈값이 바뀝니다.

#### [포즈 실행/캡쳐](#포즈-실행캡쳐)

![img](/assets/images/sw/rplus1/motion/poseutility_gowritestep.png)

##### 스텝의 포즈와 로봇의 포즈

스텝의 포즈는 현재 선택된 모션 파일 상의 스텝을 의미합니다. 즉, 스텝의 포즈가 선택된 상태에서는 포즈 유틸리티에서 바꾼 포즈가 바로 모션 파일에 반영됩니다.  
로봇의 포즈는 현재 연결된 로봇을 의미합니다. 즉, 로봇의 포즈가 선택된 상태에서는 포즈 유틸리티에서 바꾼 포즈가 바로 로봇에 반영됩니다.

`Note` 스텝의 포즈는 현재 선택한 페이지에 스텝이 있어야 활성화 됩니다. 로봇의 포즈는 로봇이 연결되어야 활성화 됩니다.
{: .notice}

##### 포즈 실행/캡쳐

기본 포즈 편집기의 [포즈 실행](#포즈-실행), [포즈 캡쳐](#포즈-캡쳐)와 같은 기능입니다.

- 포즈 실행: 스텝의 포즈를 로봇의 포즈에 반영합니다.
- 포즈 캡쳐: 로봇의 포즈를 현재 선택한 스텝의 포즈에 반영합니다.

## [스텝 편집](#스텝-편집)

모션 스텝(Step)이란, 연속된 모션을 재생하기 위해 필요한 키 프레임을 의미합니다.

![img](/assets/images/sw/rplus1/motion/step_concept_1.png)

모션 스텝에는 모션의 실행 속도를 결정하는 재생 시간이 추가되어 있습니다. 스텝 편집기는 스텝을 보다 편리하게 편집할 수 있는 기능을 제공합니다.

![img](/assets/images/sw/rplus1/motion/step_editor.png)

스텝은 `페이지`당 최대 7개까지 만들 수 있습니다. 만약, 만들고자 하는 모션의 스텝 개수가 7개를 넘어간다면 [페이지 연결](#페이지-연결)기능을 활용하면 됩니다.

### [스텝 추가/삽입/삭제/이동](#스텝-추가삽입삭제이동)

#### 스텝 추가

스텝 리스트의 제일 마지막에 새로운 스텝을 추가합니다.

![img](/assets/images/sw/rplus1/motion/step_add.png)

#### 스텝 삽입

선택한 스텝 앞에 새로운 스텝을 삽입합니다.

![img](/assets/images/sw/rplus1/motion/step_insert.png)

#### 스텝 삭제

선택한 스텝을 리스트에서 삭제합니다.

![img](/assets/images/sw/rplus1/motion/step_delete.png)

#### 스텝 이동

선택한 스텝의 순서를 바꿉니다.

![img](/assets/images/sw/rplus1/motion/step_move.png)

### [스텝 멈춤 시간](#스텝-멈춤-시간)

- 스텝 멈춤 시간은 현재 스텝을 실행한 후 다음 스텝으로 가기 전에 멈추는 시간입니다.
- 단위는 초(sec)이며, 0.008초 단위로 증감합니다.
- 값의 범위는 0 ~ 2.04초입니다.
- 아래쪽의 스크롤바로 시간을 바꿀 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/step_stop_time.png)

### [스텝 실행 시간](#스텝-실행-시간)

- 스텝 실행 시간은 이전 스텝에서 현재 스텝까지 걸리는 시간입니다.
- 단위는 초(sec)이며, 0.008초 단위로 증감합니다.
- 값의 범위는 0.072 ~ 2.04초입니다.
- 아래쪽의 스크롤바로 시간을 바꿀 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/step_play_time.png)

### [스텝 복사/잘라내기/붙여넣기](#스텝-복사잘라내기붙여넣기)

#### 스텝 복사

- 선택한 스텝을 복사할 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/step_copy.png)

#### 스텝 잘라내기

- 선택한 스텝을 잘라냅니다.

  ![img](/assets/images/sw/rplus1/motion/step_cut.png)

#### 스텝 붙여넣기

- 복사 혹은 잘라내기한 스텝을 붙여넣습니다. 붙여넣기할 때 선택한 스텝의 내용은 대체됩니다.

  ![img](/assets/images/sw/rplus1/motion/step_paste.png)

## <a name="페이지-편집"></a>[페이지 편집](#페이지-편집)

모션 페이지란, 저장된 모션을 구분하기 위한 영역 단위입니다.  
외부에서 저장된 모션을 사용할때는 페이지 단위로 접근합니다.  
모션 데이터 안에는 255개의 페이지가 존재합니다. (일부 제어기는 127개만 지원합니다.)

![img](/assets/images/sw/rplus1/motion/pageeditor.png)

### <a name-"페이지-선택"></a>[페이지 선택](#페이지-선택)

마우스로 해당 페이지를 클릭하면 1개의 페이지를 선택할 수 있습니다. 여러 개의 페이지를 선택하는 방법은 다음과 같습니다.

- 연속적으로 여러 페이지를 선택

  ![img](/assets/images/sw/rplus1/motion/page_selection_2.png)

  - 마우스로 드래그(Drag)합
  - Shift키를 누른 상태에서 다른 페이지를 선택

- 개별적으로 여러 페이지를 선택

  ![img](/assets/images/sw/rplus1/motion/page_selection_1.png)

  - Ctrl키를 누른 상태에서 해당 페이지를 선택

- 전체 페이지 선택
  - 버튼을 눌러서 선택

    ![img](/assets/images/sw/rplus1/motion/page_selection_3.png)

### <a name="페이지-연결"></a>[페이지 연결](#페이지-연결)

모션 페이지를 서로 연결시켜서 유기적인 관계를 갖게 만들 수 있습니다.

#### 이어지는(Next) 페이지

한 페이지에는 최대 7개의 스텝만 들어갈 수 있습니다. 이로인해 어떤 모션은 한 페이지에 들어가지 못합니다. 한 모션을 여러 개의 페이지에 걸쳐서 넣을 때 이어지는 페이지 기능을 사용합니다.

![img](/assets/images/sw/rplus1/motion/page_next_concept.png)

이어지는 페이지는 연결될 페이지 번호를 사용합니다.

![img](/assets/images/sw/rplus1/motion/page_next.png)

#### 마무리(Exit) 페이지

모션 정지를 명령했을 때, 대부분 현재 실행 중인 모션으로 인해 로봇은 매우 불안한 상태에 놓입니다. 보다 안정적인 상태로 로봇을 만들고 모션을 정지하고 싶을 때 마무리 페이지 기능을 사용합니다.

![img](/assets/images/sw/rplus1/motion/page_exit_concept.png)

마무리 페이지는 연결될 페이지 번호를 사용합니다.

![img](/assets/images/sw/rplus1/motion/page_exit.png)

### [페이지 복사/잘라내기/붙여넣기](#페이지-복사잘라내기붙여넣기)

#### 페이지 복사

- 선택한 페이지를 복사합니다.

  ![img](/assets/images/sw/rplus1/motion/page_copy.png)

#### 페이지 잘라내기

- 선택한 페이지를 잘라냅니다.

  ![img](/assets/images/sw/rplus1/motion/page_cut.png)

#### 페이지 붙여넣기

- 복사하거나 잘라낸 페이지를 붙여넣습니다. 붙여넣기할 때 선택된 페이지의 내용은 대체됩니다.

  ![img](/assets/images/sw/rplus1/motion/page_paste.png)

### [페이지 반복/속도 설정](#페이지-반복속도-설정)

#### 반복 횟수

- 모션 실행시 현재 페이지를 반복할 횟수입니다.

  ![img](/assets/images/sw/rplus1/motion/page_repeat.png)

#### 재생 배속

- 모션 실행시 현재 페이지의 재생 배속입니다. "스텝 실행 시간"과 달리 페이지 전체에 영향을 줍니다..
  - 1.0배속은 스텝 실행 시간을 그대로 사용하는 것입니다.
  - 1.0배속보다 작으면 전체적으로 느려집니다.
  - 1.0배속보다 크면 전체적으로 빨라집니다.

    ![img](/assets/images/sw/rplus1/motion/page_play_speed.png)

### [관성력 조절](#관성력-조절)

스텝과 스텝이 연결되는 부분은 힘이 발생하는데, 이 힘은 관성의 법칙때문에 나타나며 관성력이라 부릅니다.  
일반적으로 관성력은 속도의 변화량인 가속도로 인해 발생합니다. 즉, 가속도가 크면 관성력이 커지고, 가속도가 작으면 관성력은 작아집니다.  
가속도를 줄이려면 속도를 서서히 증감시키고, 가속도를 크게하려면 속도를 급격하게 증감시키면 됩니다.  
관성력 조절은 이 가속도를 조절하는 것이며 값이 클수록 속도가 서서히 증감하여 가속도를 줄여줍니다.

- 관성력은 0 ~ 127까지 값을 설정해서 조절할 수 있습니다.(기본 값은 32입니다.)

  ![img](/assets/images/sw/rplus1/motion/page_compliance.png)

- 0에 가까울수록 관성력은 커집니다.
- 127에 가까울수록 관성력은 작아집니다.

### [관절 유연성](#관절-유연성)

관절 유연성은 다이나믹셀의 컴플라이언스(Compliance)를 설정하는 것입니다. 관절의 유연성에 따른 모션의 장단점은 다음과 같습니다.

- 관절의 유연성이 큰 경우
  - 장점: 춤추는 팔 동작과 같이 현란한 움직임이 필요한 경우 부드럽게 움직일 수 있습니다.
  - 단점: 지탱력이 많이 필요한 다리의 경우 안 좋을 수 있습니다.
- 관절의 유연성이 작은 경우
  - 장점: 보행과 같이 몸을 지탱하는 힘이 필요한 경우 안정하게 만들 수 있습니다.
  - 단점: 현란한 모션의 경우 뻣뻣하게 보일 수 있습니다.

관절 유연성은 총 7단계로 설정할 수 있습니다.

- 1단계: 거의 없음 (권장하지 않음)
- 2단계: 매우 낮음
- 3단계: 낮음
- 4단계: 약간 낮음
- 5단계: 보통 (기본 값)
- 6단계: 높음
- 7단계: 매우 높음

  ![img](/assets/images/sw/rplus1/motion/page_compliance_2.png)

# [기타 정보](#기타-정보)

## [로봇 모션 업로드](#로봇-모션-업로드)

제어기에 있는 모션 데이터를 PC로 옮기는 작업을 업로드(Upload)라 합니다.

1. 로봇을 연결하여 로봇 모션 창을 띄웁니다.

  ![img](/assets/images/sw/rplus1/motion/conn_connectmenu.png)
  
  ![img](/assets/images/sw/rplus1/motion/rmfm_robotmotion.png)

2. 로봇 모션 창을 선택한 후, 다른 이름으로 저장하기 메뉴를 선택합니다.

  ![img](/assets/images/sw/rplus1/motion/saveas.png)

## [모션 오프셋](#모션-오프셋)

오프셋(Offset)이란, 기준 값에 대한 차이를 의미합니다. 모션 오프셋은 기준 모션에 대한 차이를 뜻하고, 기준 모션을 수행하는 로봇을 마스터(Master) 로봇이라 부릅니다.  
같은 로봇을 여러 대 만들었을 때, 같은 모션을 실행해도 로봇의 자세는 조금씩 차이가 있습니다. 그 이유는 모터의 위치 편차와 조립 상의 오차때문입니다. 이 차이로 인해 어떤 로봇은 넘어지기도 합니다.  
모션 오프셋 개념을 사용하면 모션을 수정하지 않고 로봇마다의 차이를 적용하여 같은 모션을 쓸 수 있습니다.

`Note` 일반적으로 모션 오프셋은 무시할 정도로 작습니다. 하지만, 휴머노이드와 같이 중심을 잡기 어려운 로봇에서는 이 문제가 매우 크게 나타날 수 있습니다. 
{: .notice}

### 모션 오프셋 편집

로봇의 관절 편차는 모션 오프셋 편집 기능을 이용해서 맞출 수 있습니다.

`Note` 모션 오프셋 메뉴를 선택하면 모든 관절의 토크를 On시켜서 현재 자세를 유지시킵니다. 따라서, 차이를 쉽게 알 수 있는 기준 자세를 미리 취해 놓은 후에 이 기능을 실행하는 것이 좋습니다. {: .notice}

![img](/assets/images/sw/rplus1/motion/offset_menu.png)

해당 관절을 선택한 후, 편집기로 값을 편집할 수 있습니다.

- +값은 모터를 기준으로 CCW방향으로 더 움직인다는 뜻입니다.
- -값은 모터를 기준으로 CW방향으로 더 움직인다는 뜻입니다.

  ![img](/assets/images/sw/rplus1/motion/offset_edit3.png)

### 모션 오프셋 초기화

- 모션 오프셋 값을 모두 0으로 초기화시킵니다.

  ![img](/assets/images/sw/rplus1/motion/offset_reset.png)

### 모션 오프셋 저장

- 현재 수정한 오프셋을 저장시킵니다. 이 기능은 오프셋 정보를 제어기 내부에 저장시킵니다.

  ![img](/assets/images/sw/rplus1/motion/offset_save.png)

### 모션 오프셋 파일로 저장

- 현재 로봇의 오프셋 정보를 파일로 저장하여 PC에 보관할 수 있습니다. PC상에 모션 오프셋 파일은 확장자가 ofs인 형태로 존재합니다.

  ![img](/assets/images/sw/rplus1/motion/offset_file_save.png)

### 모션 오프셋 다운로드

- PC에 보관중인 모션 오프셋 파일(ofs)을 로봇에 다운로드할 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/offset_download.png)

## <a name="전체-페이지-편집"></a>[전체 페이지 편집](#전체-페이지-편집)

전체 페이지 편집은 모든 페이지에 수정 사항을 반영시킬 때 사용합니다. 전체 페이지 편집이 필요한 경우는 다음과 같습니다.

- 모든 모터의 값을 한꺼번에 바꿉니다.
- ID의 사용 유무를 바꿉니다.

### [해상도 설정](#해상도-설정)

- 모터의 해상도(Resolution)를 설정을 할 수 있습니다.
- 해상도 설정은 실제 로봇이 연결되지 않은 상태에서 모션을 만들때 설정하는 값입니다.
- 다이나믹셀이 연결된 상태에서는 각 다이나믹셀에 맞는 해상도가 자동으로 셋팅되며 변경할 수 없습니다.
- 새롭게 추가된 EX/MX시리즈 모델의 경우에는 4096으로 변환하셔야 하며, 그외의 다이나믹셀은 1024 값으로 사용하시기 바랍니다.
- EX시리즈는 250도까지 위치제어가 가능합니다.
- MX시리즈는 360도까 지 위치제어가 가능합니다.

  ![img](/assets/images/sw/rplus1/motion/dx_resolution.png)

- 해상도를 4096으로 변환 했을때 기본 포즈 편집기에서 기본값을 (512->2048) 로 자동 변환이 됩니다.

  ![img](/assets/images/sw/rplus1/motion/motion_edit.png)

### <a name="id-사용-유무-설정"></a>[ID 사용 유무 설정](#id-사용-유무-설정)

- RoboPlus Motion은 최대 26개의 모터로 만들어진 로봇의 모션을 지원합니다. (다이나믹셀 ID로 0 ~ 25번까지).
- ID 사용 유무를 설정하여 필요한 ID만 모션 편집시 사용할 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/page_edit.png)

### [ID 교환하기](#id-교환하기)

- ID 교환은 로봇에 사용된 관절의 위치가 바뀐 경우 관절의 위치 값을 손쉽게 바꿀 수 있습니다. 교환할 2개의 ID를 선택한 후 실행합니다.

  ![img](/assets/images/sw/rplus1/motion/id_change.png)

### [값 모두 바꾸기](#값-모두-바꾸기)

- 해당 ID의 관절 값을 특정 값으로 모두 바꾸고 싶을 때 사용합니다.

  ![img](/assets/images/sw/rplus1/motion/value_change.png)

### 값 모두 오프셋 적용

- 오프셋(Offset)이란, 기준에 대해 상대적인 차이를 의미합니다. 해당 ID의 관절 값에 대해 전체적으로 값을 빼거나 더할 때 사용합니다.

  ![img](/assets/images/sw/rplus1/motion/offset_change.png)

## [키보드 단축키 활용 팁](#키보드-단축키-활용-팁)

로봇의 모션을 실제로 만들다보면 한손은 로봇을 잡고 있기때문에, 마우스와 키보드를 동시에 사용하는 것이 쉽지 않습니다.  
여기서는 키보드만으로 모션을 만들 수 있는 유용한 팁을 알려드립니다.

### 편집창 방향키로 이동하기

- 페이지 편집창, 스텝 편집창, 포즈 편집창을 방향키로 포커스를 이동시킬 수 있습니다.

  ![img](/assets/images/sw/rplus1/motion/arrow_move.png)

### 관절값 키보드로 바꾸기

- `[` , `]`키를 이용하면 해당 관절 값이 1씩 증가하거나 감소합니다.
- `[`, `]`키를 `Shift`키와 함께 이용하면 해당 관절 값이 10씩 증가하거나 감소합니다.
- `Enter`키를 누르면 설정창으로 포커스가 이동되고, 수정한 뒤 다시 `Enter`를 누르면 돌아갑니다.

  ![img](/assets/images/sw/rplus1/motion/joint_move.png)

이 기능이 가능한 편집창은 다음과 같습니다.

- 스텝의 포즈 편집창

  ![img](/assets/images/sw/rplus1/motion/step_move.png)

- 로봇의 포즈 편집창

  ![img](/assets/images/sw/rplus1/motion/robot_move.png)

- 모션 오프셋 편집창

  ![img](/assets/images/sw/rplus1/motion/offset_move.png)

- 로봇의 3D 화면

  ![img](/assets/images/sw/rplus1/motion/poseutility_3djoint2.png)

### 토크 On/Off 키보드로 바꾸기

- 관절을 선택하고 Space키를 누르면 토크 상태가 바뀝니다.

### 스텝별로 로봇 움직이기

- 원하는 스텝을 선택하고 Enter키를 누르면 로봇이 해당 스텝의 포즈를 취합니다. (로봇 모션 창의 경우만 가능)

  ![img](/assets/images/sw/rplus1/motion/step_editor.png)

## [사용자 로봇 만들기](#사용자-로봇-만들기)

사용자가 만든 로봇을 RoboPlus Motion 프로그램에 추가하여 사용 할 수 있습니다.

{% capture roboplus_motion_warning_01 %}
`주의` 이 내용은 다음과 같은 전문 지식을 필요로 합니다.
  - XML
  - 3D Graphics
  - C# Programming
{% endcapture %}

<div class="notice--warning">{{ roboplus_motion_warning_01 | markdownify }}</div>

### [폴더 구조](#폴더-구조)

RoboPlus Motion이 설치된 폴더 안을 보면 로봇 정보 파일이 아래와 같이 존재합니다.  
(예, C:/Program Files/ROBOTIS/RoboPlus/Motion)
- `/Robots`: 로봇 정보가 기술된 파일들이 있습니다.
- `/Models`: 3D 그래픽을 위한 각 파트들의 모델 데이터가 있습니다.
- `/PlugIn`: IK(역기구학)연산 모듈들이 있습니다.

사용자가 자신의 로봇을 만들어 넣기 위해서는 각 폴더에 관련 파일들을 만들어 넣어야 합니다.

### [로봇 정보 파일](#로봇-정보-파일)

로봇 정보 파일에는 RoboPlus Motion이 필요로 하는 모든 정보가 기술되어 있습니다. 이 파일은 rbt라는 확장자로 존재합니다. 포즈 유틸리티의 로봇 리스트는 rbt파일 리스트를 보여주는 것입니다.

![img](/assets/images/sw/rplus1/motion/poseutility_robotselect.png)

로봇 정보 파일은 XML형식으로 관련 정보를 기술합니다. 일반 Text편집기로 파일의 내용을 보면 이를 확인할 수 있습니다.

![img](/assets/images/sw/rplus1/motion/robotinfo_xml.png)

#### &lt;General&gt;

이 부분에는 로봇의 일반적인 정보가 기술되며 필수로 입력해야 합니다.

#### &lt;Name&gt;

리스트에 보여질 이름을 입력합니다.  
culture속성을 줘서 언어별로 보여지게 할 수 있는데, RoboPlus Motion에서 지원하는 언어만 가능합니다.

| 값    | 언어            |
| ---- | ------------- |
| kor  | 한국어           |
| jpn  | 일본어           |
| 없음   | 영어 혹은 그 외의 언어 |

```xml
<Name>Premium Humanoid A-type</Name> 
<Name culture=”kor”> Bioloid Premium Type A</Name> 
```

> 바이올로이드 프리미엄 A타입의 예

#### &lt;Motor&gt;

로봇에 사용되는 다이나믹셀 정보를 입력합니다.
- id: 다이나믹셀의 ID
- model: 모델명
- init: “초기 자세” 버튼을 눌 러서 취할 포즈의 위치 값

![img](/assets/images/sw/rplus1/motion/poseutility_robotselect.png)

```xml
<Motor id="1" model="AX-12+" init="205"></Motor>
<Motor id="2" model="AX-12+" init="818"></Motor>
<Motor id="3" model="AX-12+" init="251"></Motor>
<Motor id="4" model="AX-12+" init="772"></Motor>
<Motor id="5" model="AX-12+" init="512"></Motor>
<Motor id="6" model="AX-12+" init="512"></Motor>
<Motor id="7" model="AX-12+" init="358"></Motor>
<Motor id="8" model="AX-12+" init="666"></Motor>
<Motor id="9" model="AX-12+" init="512"></Motor>
<Motor id="10" model="AX-12+" init="512"></Motor>
<Motor id="11" model="AX-12+" init="475"></Motor>
<Motor id="12" model="AX-12+" init="549"></Motor>
<Motor id="13" model="AX-12+" init="437"></Motor>
<Motor id="14" model="AX-12+" init="587"></Motor>
<Motor id="15" model="AX-12+" init="549"></Motor>
<Motor id="16" model="AX-12+" init="475"></Motor>
<Motor id="17" model="AX-12+" init="512"></Motor>
<Motor id="18" model="AX-12+" init="512"></Motor>
```

> 바이올로이드 프리미엄 A타입의 예

#### &lt;Mirror&gt;

미러(Mirror) 기능을 수행하기 위한 정보입니다. 사용하지 않는다면 입력하지 않아도 됩니다.

![img](/assets/images/sw/rplus1/motion/poseutility_mirror_exchange.jpg)

서로 대칭이 되는 다이나믹셀만 입력합니다. 대칭되는 대상이 없는 경우는 입력하지 않습니다.

- Right: 오른쪽에 해당하는 다이나믹셀 ID
- Left: 왼쪽에 해당하는 다이나믹셀 ID

```xml
<Mirror>
  <Right>1,3,5,9,11,13,15,17</Right>
  <Left>2,4,6,10,12,14,16,18</Left>
</Mirror>
```

> 바이올로이드 프리미엄 A타입의 예

![img](/assets/images/sw/rplus1/motion/poseutility_3dview.png)

#### &lt;InverseKinematics&gt;

역기구학 연산을 수행할 모듈을 연결시킵니다. 연산 모듈은 DLL형태로 존재하며 이것은 뒤에서 설명할 [Plug-In SDK 프로그래밍](#plug-in-sdk-프로그래밍)을 통해 만들 수 있습니다. 사용하지 않는다면 없어도 됩니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_selectendpoint.png)

```xml
<InverseKinematics>
  <Module>
    <Name>PremiumHumanoidA.dll</Name>
  </Module>
</InverseKinematics>
```

> 바이올로이드 프리미엄 A타입의 예

#### &lt;Object3D&gt;

3D 디스플레이를 위한 로봇 조립 정보가 포함됩니다. 로봇의 조립 정보가 트리(Tree)구조로 형성됩니다. 사용하지 않는다면 없어도 됩니다.

#### &lt;Part&gt;

로봇을 구성하는 각 파트 정보가 기술됩니다. 각 파트끼리의 구속관계는 트리(Tree) 구조로 표현됩니다.

- **name**: 3D 모델 파일명입니다. 파일 확장자는 제외하고 입력합니다. (예, f3.igs라면 f3만 입력)
- **T**: 3D 변환에 사용되는 회전과 이동 정보가 포함된 3x4 행렬입니다. 각 요소는 공백 문자(Space)로 구분됩니다.

  ![img](/assets/images/sw/rplus1/motion/robotinfo_xml_matrix.png)

- **id**: 다이나믹셀의 경우 id를 입력합니다.
- **type**: 움직이는 방법에 대해 정의합니다.
  - 모터 몸체가 움직이는 경우는 type을 “body”로 지정합니다.

    ![img](/assets/images/sw/rplus1/motion/robotinfo_xml_part.png)

  - 몸체는 고정되고 연결된 혼(Horn)이 움직이는 경우는 고정할 대상에 “body”을 지정하고 움직일 대상에 “horn”을 지정합니다.

    ![img](/assets/images/sw/rplus1/motion/robotinfo_xml_part2.png)

```xml
<Object3D>
    <Part name="f51" T="0 0 1 0 1 0 0 0 0 1 0 302.5">
      <Part name ="f3" T="1 0 0 0 0 0 1 -70.5 0 -1 0 19"></Part>
      <Part name ="f3" T="1 0 0 0 0 0 -1 -70.5 0 1 0 -19"></Part>
      <Part name="f52" T="1 0 0 0 0 1 0 0 0 0 1 0">
```

> 바이올로이드 프리미엄 A타입의 예

### [3D 모델 데이터](#3d-모델-데이터)

3D 화면에 보여지는 그래픽은 3D 모델 데이터의 역할입니다. 3D 모델 데이터는 여러 3D 모델링 소프트웨어들을 이용해서 만들 수 있습니다. 기본적으로 제공되는 모델 데이터 외에 사용자가 설계한 데이터도 넣을 수 있습니다.

RoboPlus Motion은 IGES(igs)포맷만 지원하며, 데이터 크기가 너무 크면 3D 화면이 느려지게 되므로 되도록이면 데이터 크기를 작게 만드는 것을 권장합니다.

현재 기본으로 제공되는 모델 데이터는 다음과 같습니다. (Models폴더 안에 존재하며  RoboPlus 업데이트 시 추가될 수 있습니다.)

| 이름          | 모양                                       | 파일              |
| ----------- | ---------------------------------------- | --------------- |
| F1          | ![img](/assets/images/sw/rplus1/motion/f1.png) | f1.igs          |
| F2          | ![img](/assets/images/sw/rplus1/motion/f2.png) | f2.igs          |
| F3          | ![img](/assets/images/sw/rplus1/motion/f3.png) | f3.igs          |
| F4          | ![img](/assets/images/sw/rplus1/motion/f4.png) | f4.igs          |
| F5          | ![img](/assets/images/sw/rplus1/motion/f5.png) | f5.igs          |
| F6          | ![img](/assets/images/sw/rplus1/motion/f6.png) | f6.igs          |
| F7          | ![img](/assets/images/sw/rplus1/motion/f7.png) | f7.igs          |
| F8          | ![img](/assets/images/sw/rplus1/motion/f8.png) | f8.igs          |
| F9          | ![img](/assets/images/sw/rplus1/motion/f9.png) | f9.igs          |
| F10         | ![img](/assets/images/sw/rplus1/motion/f10.png) | f10.igs         |
| F11         | ![img](/assets/images/sw/rplus1/motion/f11.png) | f11.igs         |
| F12         | ![img](/assets/images/sw/rplus1/motion/f12.png) | f12.igs         |
| F15 + F16   | ![img](/assets/images/sw/rplus1/motion/f15+16.png) | f15.igs         |
| F51         | ![img](/assets/images/sw/rplus1/motion/f51.png) | f51.igs         |
| F52         | ![img](/assets/images/sw/rplus1/motion/f52.png) | f52.igs         |
| F53         | ![img](/assets/images/sw/rplus1/motion/f53.png) | f53.igs         |
| F56         | ![img](/assets/images/sw/rplus1/motion/f56.png) | f56.igs         |
| F57         | ![img](/assets/images/sw/rplus1/motion/f57.png) | f57.igs         |
| F58         | ![img](/assets/images/sw/rplus1/motion/f58.png) | f58.igs         |
| F60         | ![img](/assets/images/sw/rplus1/motion/f60.png) | f60.igs         |
| WA          | ![img](/assets/images/sw/rplus1/motion/wa.png) | wa,igs          |
| BU          | ![img](/assets/images/sw/rplus1/motion/bu.png) | bu.igs          |
| CM-5        | ![img](/assets/images/sw/rplus1/motion/cm5.png) | cm-5.igs        |
| ADAPTOR-CM5 | ![img](/assets/images/sw/rplus1/motion/adaptor_cm5.png) | adaptor_cm5.igs |
| BATTERY     | ![img](/assets/images/sw/rplus1/motion/battery.png) | battery.igs     |
| AX-12       | ![img](/assets/images/sw/rplus1/motion/ax12.png) | ax-12.igs       |
| AX-12 Horn  | ![img](/assets/images/sw/rplus1/motion/ax12_horn.png) | ax-12_horn.igs  |
| AX-S1       | ![img](/assets/images/sw/rplus1/motion/axs1.png) | ax-s1.igs       |

### <a name="plug-in-sdk-프로그래밍"></a>[Plug-In SDK 프로그래밍](#plug-in-sdk-프로그래밍)

사용자는 Plug-In SDK를 이용해서 포즈 유틸리티의 역기구학 연산 모듈을 추가할 수 있습니다.  
설명은 Visual Studio 2005에서 C#으로 개발하는 것을 예로 들었습니다. (Sample 예제 첨부)

- `Download ZIP` [PlugInSDK_Example.zip](http://support.robotis.com/ko/baggage_files/roboplus/roboplus_motion/pluginsdk_example.zip)  

#### 프로젝트 생성

Visual Studio 메뉴에서 `파일` > `새로 만들기` > `프로젝트`를 선택한 후, `Visual C#` > `Windows` > `클래스 라이브러리` 타입의 프로젝트를 만듭니다.

#### 참조 추가

Visual Studio 메뉴에서 `프로젝트` > `참조 추가`를 선택한 후, 참조 추가 대화 상자에서 “찾아보기” 버튼을 눌러서 RoboPlus가 설치된 폴더에 있는 `Motion` > `PlugInSDK.dll`을 선택합니다. (예, C:\Program Files\ROBOTIS\RoboPlus\Motion\PlugInSDK.dll”)

#### 인터페이스 구현

구현할 Class 파일에 다음과 같이 기술합니다. (예, Class1.cs)

```csharp
using ROBOTIS.MotionEditor.SDK  // namespace 추가
namespace MyPlugIn
{
  public class MyPlugIn : IInverseKinematics // 인터페이스 상속
  {
  }
}
```

커서를 IInverseKinematics 글자에 두고 오른쪽 마우스 버튼을 눌러서 “인터페이스 구현->인터페이스 구현”을 선택하면 구현할 소스가 자동으로 생성됩니다.

##### CurrentPose

RoboPlus Motion과 주고 받을 Pose 데이터입니다. 사용자는 다음의 규칙을 지켜야 합니다.

- 배열의 생성은 사용자가 직접하며 개수는 26입니다.
- 배열의 인덱스가 다이나믹셀의 ID입니다.
- 해당 ID의 모터에 값을 전달하려면 0~1023 혹은 4096의 값을 넣고, 그렇지 않으려면 -1을 넣습니다.

RoboPlus Motion이 get을 호출할 때는 역기구학(Inverse Kinematics) 연산 결과를 전달해야 하며, set을 호출할 때는 넘겨준 Pose 데이터를 바탕으로 순기구학(Forward Kinematics)을 연산하여 끝점을 알아내야 합니다.

##### EndPoints

끝점 리스트에 출력될 이름입니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_selectendpoint.png)

끝점 리스트 중 선택하거나 선택된 결과를 알아내기 위해서는 아래 인터페이스를 구현합니다.
- SelectedIndex: 끝점의 인덱스
- SelectedEndPoint: 끝점의 이름

##### X,Y,Z, Roll, Pitch, Yaw

끝점의 3D 로봇의 중심으로부터의 위치 데이터입니다.  
사용자 DLL에서 최소값과 최대값을 설정할 수 있습니다.  
Roll은 X축 방향의 회전이고, Pitch는 Y축 방향의 회전, Yaw는 Z축 방향의 회전을 의미합니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_descrip.png)

- MinX, MinY, MinZ, MinRoll, MinPitch, MinYaw: 끝점 위치의 최소값입니다.
- MaxX, MaxY, MaxZ, MaxRoll, MaxPitch, MaxYaw: 끝점 위치의 최대값입니다.
- 만약, 최소값과 최대값을 같게 만든다면 해당 끝점은 사용하지 않는 것으로 간주되어 리스트에 나타나지 않습니다.
- X, Y, Z, Roll, Pitch, Yaw: 끝점의 위치 값입니다.

##### Reset

RoboPlus Motion에서 초기화 버튼을 눌렀을 때 호출됩니다. 끝점의 위치 값을 초기화시킵니다.

![img](/assets/images/sw/rplus1/motion/poseutility_ik_selectendpoint.png)

#### Plug-In 추가

프로젝트를 빌드를 성공했다면, DLL파일을 RoboPlus Motion폴더내의 “PlugIn” 폴더에 복사합니다. (예, C:\Program Files\ROBOTIS\RoboPlus\Motion\PlugIn)  
로봇 정보 파일(rbt)에 역기구학 연산을 할 DLL정보를 기술합니다.  
RoboPlus Motion을 실행시켜서 추가시킨 로봇이 잘 동작하는지 확인합니다.

```xml
<InverseKinematics>
   <Module>
      <Name>PremiumHumanoidA.dll</Name>
   </Module>
</InverseKinematics>
```

> 바이올로이드 프리미엄 A타입의 예


[각 제어기 정보]: /docs/kr/parts/controller/controller_compatibility/
[ID 사용 유무 기능]: #id-사용-유무-설정
[관절 오프셋 파라메터]: /docs/kr/software/rplus1/task/programming_02/#관절-오프셋
