---
layout: archive
lang: kr
ref: kit2_quickstart
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/engineer/kit2_quickstart/
sidebar:
  title: 엔지니어 키트 2
  nav: "kit2"
product_group: kit2
page_number: 2  
---

<div style="counter-reset: h1 1"></div>

# [작동하기](#작동하기)

## [앱 설치하기](#앱-설치하기)

- 로보티즈 엔지니어는 [로보플러스 태스크 3.0]를 지원합니다.
- [로보플러스 태스크 3.0]은 기존의 [로보플러스 태스크 2.0]과 [로보플러스 모션 2.0]이 통합된 프로그램입니다.
- 태스크 코드를 작성하여, 로봇을 원하는대로 명령으로 구동할 수 있습니다.
- 모션파일로 로봇의 행동을 직접 만들어 줄 수 있습니다.

{% capture software_install_01 %}  
![](/assets/images/edu/engineer/kit1/icon_task_48.png)  
**로보플러스 태스크 3.0**
- [윈도우에서 다운로드 하기](https://www.robotis.com/service/download.php?no=1774) 
- [맥 OS에서 다운로드 하기](https://www.robotis.com/service/download.php?no=1908)
- [구글 플레이에서 다운로드(모바일) 하기](https://play.google.com/store/apps/details?id=com.robotis.task3)
- \[파이썬 추가] 로보플러스 태스크 3.0 ios 버전은 앱스토어에 곧 출시됩니다. PC 버전을 이용해주세요.  
{% endcapture %}
<div class="notice--success">{{ software_install_01 | markdownify }}</div>

{% capture software_install_02 %}  
![](/assets/images/edu/engineer/kit1/icon_engineer_48.png)  
**로보플러스 엔지니어**
- [구글 플레이에서 다운로드](https://play.google.com/store/apps/details?id=com.robotis.robotisEngineer)
- [앱 스토어에서 다운로드](https://apps.apple.com/kr/app/r-engineer/id1475713920)
- **참고**: [로보플러스 엔지니어 다운로드 방법](/docs/kr/popup/engineer/engineer_app_installation){: .popup}
{% endcapture %}
<div class="notice--success">{{ software_install_02 | markdownify }}</div>

**참고**: R+Task 3.0 모바일 버전은 파이썬 예제 다운로드는 PC 버전을 이용해주세요. 
{: .notice}

## [예제 다운로드 하기](#예제-다운로드-하기)
아래 표에서 예제를 다운로드 받을수 있습니다. 예제를 다운로드 받은후, 스마트 기기 또는 PC를 이용하여 제어기에 저장해주세요.
- 키트2 사용자는 KIT2 타입에 맞는 프로그램(`MAX-E2`, `Commando`, `Scorpi`,`AutoBot`, `Strider`)을 키트1에 포함된 CM-550에 직접 다운로드 받아야 합니다. 
- 예제 다운로드 하기 전, 로보플러스 매니저를 사용하여, CM-550의 펌웨어를 업데이트 하세요. [펌웨어 업데이트](/docs/kr/software/rplus2/manager/#펌웨어-업데이트) 따라하기.
- 예제를 PC에서 다운로드 받고 제어기에 저장하는 방법은 [PC에서 예제 다운로드 받기](#pc에서-예제-다운로드-받기)를 따라 하세요.
- 예제를 스마트 디바이스에서 다운로드 받고 제어기에 저장하는 방법은 [스마트 기기에서 예제 다운로드 받기](#스마트-기기에서-예제-다운로드-받기)를 따라하세요.

| 예제                | 파이썬 (.py)                                                                   | 모션 (.mtn3)                                                                    |
|:--------------------|:-------------------------------------------------------------------------------|:--------------------------------------------------------------------------------|
| MAX-E2              | [01_ENG2_Max_E2_PY.py](https://www.robotis.com/service/download.php?no=1915)   | [01_ENG2_Max_E2_MO.mtn3](https://www.robotis.com/service/download.php?no=1916)  |
| Commando            | [02_ENG2_Commando_PY.py](https://www.robotis.com/service/download.php?no=1917) | 파이썬 예제만 사용                                                              |
| Scorpi              | [03_ENG2_Scorpi_PY.py](https://www.robotis.com/service/download.php?no=1919)   | [03_ENG2_Scorpi_MO.mtn3](https://www.robotis.com/service/download.php?no=1918)  |
| AutoBot (추가 예제) | [04_ENG2_Autobot_PY.py](https://www.robotis.com/service/download.php?no=1920)  | [04_ENG2_Autobot_MO.mtn3](https://www.robotis.com/service/download.php?no=1921) |
| Strider (추가 예제) | [05_ENG2_Strider_PY.py](https://www.robotis.com/service/download.php?no=1922)  | 파이썬 예제만 사용                                                              |

### [PC에서 예제 다운로드 받기](#pc에서-예제-다운로드-받기)
PC로 작성한 예제 또는 다운로드 받은 예제를 제어기에 다운로드 하는 방법입니다.
- CM-550의 Micro USB 포트를 이용하면 PC와 직접 연결하여 태스크(.tsk3) 및 모션(.mtn3) 파일을 업로드 할 수 있습니다.
- CM-550에 내장된 BLE 슬레이브 모듈과 BT-410 동글을 페어링하면 PC에서 원격으로 예제를 업로드 할 수 있습니다.

1. [제어기와 PC 연결하기]{: .popup}
4. [PC에서 파이썬 예제 다운로드 하기]{: .popup}
3. [PC에서 모션 예제 다운로드 하기]{: .popup}
2. [PC에서 태스크 예제 다운로드 하기]{: .popup}

### [스마트 기기에서 예제 다운로드 받기](#스마트-기기에서-예제-다운로드-받기)
로보플러스 태스크 3.0 앱을 이용하여 제어기에 파일을 업로드 하려면 스마트 기기와 CM-550이 블루투스로 연결되어야 합니다.  
스마트기기에서 작성한 예제 또는 다운로드 받은 예제를 제어기에 원격으로 다운로드 하는 방법입니다.

1. [제어기와 스마트기기 연결하기]{: .popup}
2. [스마트기기에서 태스크 예제 다운로드 하기]{: .popup}
3. [스마트기기에서 모션 예제 다운로드 하기]{: .popup}

## [예제 실행하기](#예제-실행하기)

`ROBOTIS ENGINEER` 앱을 실행하고 조립된 로봇 예제를 선택하면 해당 예제에 맞는 다양한 기능들을 사용할 수 있습니다.    

![](/assets/images/edu/engineer/kit2/engineer2_app_execution.png)

**주의** : 조립된 로봇과 다른 예제를 선택할 경우 로봇이 정상적으로 작동하지 않습니다.
{: .notice--warning}

앱 화면 우측 상단의 메뉴버튼을 눌러 환경 설정을 할 수 있습니다.

![](/assets/images/edu/engineer/kit1/engineer_app_configuration_kr.png)

`연결할 장치 선택` : 연결할 블루투스 장치를 선택합니다.  
`예제 초기화` : 선택한 예제를 초기화 하는 기능입니다.  
`제스처 오차 범위 설정` : 제스처의 허용 오차 범위를 설정합니다.  
`갤러리에 예제 이미지 표시` : 스마트기기의 갤러리에 예제 이미지를 표시합니다.  
`미디어 스캔` : 파일이 PC에서 보이지 않을 때 사용하는 기능입니다.  
`버전 정보` : 현재 앱의 버전을 확인하는 기능입니다.  

### [블루투스 연결하기](#블루투스-연결하기)
엔지니어 키트를 조종하기위해서, CM-550과 엔지니어 키트앱의 무선연결이 필요합니다. 엔지니어 키트1의 [블루투스 연결하기](/docs/kr/edu/engineer/kit1/#블루투스-연결하기)를 따라하세요.

![](/assets/images/edu/engineer/kit2/kit2_streaming_bluetooth.png)

### [MAX-E2](#max-e2)

`ROBOTIS ENGINEER` 앱을 실행하고, 화면에서 MAX-E2를 선택하세요.

#### [MAX-E2 조종 화면](#max-e2-조종-화면)

![](/assets/images/edu/engineer/kit2/max2_controller_kr.png)

`메뉴 버튼`: 조종 / 스트리밍 / 얼굴 감지 / 로봇 점검 모드 등을 선택해 변경할 수 있습니다  
`조종 버튼`: MAX-E2를 조종하기 위한 버튼과 동작의 속도를 변경하는 버튼이 배치되어 있습니다.  
`모드 선택`: NORMAL / FIGHT / SOCCER / SPECIAL 등의 조종 모드를 변경할 수 있습니다.  
`모션 버튼`: 선택한 조종 모드에 따라 적합한 다양한 모션 동작들이 각각 설정되어 있습니다.  
`기능 버튼`: 전체 토크 설정 / LED 보드 색상 변경 / 로봇 일어나기 등의 기능이 설정되어 있습니다.  

{% capture max_notice %}
**참고**: 
- TORQ ON/OFF 버튼을 길게 누르면 전체 다이나믹셀의 토크가 풀리면서 리부트 됩니다.
- 스트리밍 사용방법은 [앱에서 영상 스트리밍 기능 설정하기](/docs/kr/edu/engineer/kit2_reference/#앱에서-영상-스트리밍-기능-설정하기) 참조하세요.
{% endcapture %}
<div class="notice">{{ max_notice | markdownify }}</div>

#### [MAX-E2 모드 메뉴](#max-e2-모드-메뉴)

|                          아이콘                          | 모드 설명                                                                                                                                          |
|:--------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------|
|  ![](/assets/images/edu/engineer/kit2/icon_remote.png)   | **REMOTE : 조종 모드**<br>MAX-E2 로봇을 조종하는 모드이며 FIGHT, SOCCER 등의 모드 변경을 통해 MAX-E2를 다양한 모션으로 조종할 수 있습니다.         |
| ![](/assets/images/edu/engineer/kit2/icon_streaming.png) | **STREAMING : 스트리밍 모드**<br>Raspberry Pi 카메라를 활용해 전송되는 영상을 스마트 기기의 화면으로 보면서 버튼을 눌러 로봇을 조종할 수 있습니다. |
|   ![](/assets/images/edu/engineer/kit1/icon_face.png)    | **FACE : 얼굴 감지 모드**<br>라즈베리파이 카메라를 활용해 얼굴을 감지하는 모드로 얼굴을 감지하면 인사 등의 지정된 동작을 수행합니다.               |

#### [MAX-E2 옵션메뉴](#max-e2-옵션메뉴)

|                        아이콘                         | 옵션 설명                                                                              |
|:-----------------------------------------------------:|:---------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_motor.png)  | **MOTOR : 모터 점검**<br>로봇의 다이나믹셀 상태를 각각 테스트해 볼 수 있는 메뉴입니다. |
| ![](/assets/images/edu/engineer/kit1/icon_offset.png) | **OFFSET : 모션 오프셋**<br>모션 동작시 각 관절의 기본 위치를 설정하는 기능입니다.     |

![](/assets/images/edu/engineer/kit2/kit2_motor_inspection_layout.png)
> 모터 점검 실행 화면

![](/assets/images/edu/engineer/kit2/kit2_offset_layout.png)
> 모션 오프셋 실행 화면

**참고** : 옵션 메뉴는 모든 예제에 포함되어 있으며 세부 설정 방법은 [로봇 설정하기](/docs/kr/edu/engineer/kit2_reference/#로봇-설정하기)를 참고하세요.
{: .notice--info}

### [Commando](#commando)

`ROBOTIS ENGINEER` 앱을 실행하고, 화면에서 Commando를 선택하세요.

#### [Commando 데모 화면](#commando-데모-화면)

![](/assets/images/edu/engineer/kit2/commando_demo_kr.png)

`메뉴 버튼` : 데모 / 조종 / 스트리밍 / 로봇 점검 모드 등을 선택해 변경할 수 있습니다.  
`모드 버튼` : 전/후/좌/우 이동 및 속도 설정 버튼으로 로봇을 조종할 수 있습니다  
- `LINE MODE`를 선택하면 Raspberry Pi Camera를 사용해 설정된 색의 라인을 인식하고 이동합니다. `COLOR SELECTION`에서 인식할 라인 색을 선택합니다
- `MARKER MODE`를 선택하면 Raspberry Pi Camera를 사용해 마커를 순서대로 인식한 후 `START 마커`를 사용해 인식한 마커의 순서에 따라 명령대로 이동합니다. Marker Mode 에서 `DEBUGGING MODE`는 동작 사이에 지연 시간이 발생해 동작을 구분할 수 있습니다. `RUN MODE`는 지연시간 없이 동작과 동작을 연결해서 이동합니다. 

{% capture commando_notice %}
**참고**: 
- 스트리밍 사용방법은 [앱에서 영상 스트리밍 기능 설정하기](/docs/kr/edu/engineer/kit2_reference/#앱에서-영상-스트리밍-기능-설정하기) 참조하세요.
- 마커는 카메라에서 30 CM 이상 떨어진 거리에서 인식시켜야 인식이 잘됩니다.
{% endcapture %}
<div class="notice">{{ commando_notice | markdownify }}</div>

#### [Commando 옵션메뉴](#commando-옵션메뉴)

![](/assets/images/edu/engineer/kit1/icon_remote.png)

**REMOTE : 조종 모드** <br> Commando 로봇을 조종하는 모드이며 로봇의 이동 및 방향 전환, 카메라 등을 제어하는 명령을 사용할 수 있습니다. 조종모드에서 WHEEL SPEED(바퀴 속도)를 조정하면 로봇의 이동속도를 변경할 수 있습니다

![](/assets/images/edu/engineer/kit2/commando_control_kr.png)
> Commando 조종 모드 화면

### [Scorpi](#scorpi)

`ROBOTIS ENGINEER` 앱을 실행하고, 화면에서 Scorpi를 선택하세요.

#### [Scorpi 데모 화면 소개](#scorpi-데모-화면-소개)  

![](/assets/images/edu/engineer/kit2/scorpi_demo_kr.png)

`메뉴 버튼` : 조종 / 제스처 / 데모 / 로봇 점검 모드 등을 선택할 수 있습니다.  
`모드 버튼` :
  - `NORMAL MODE`를 선택하면 Scorpi 로봇이 일어나 동작하고, 절대거리센서 [DMS-80](/docs/kr/edu/engineer/kit2_introduction/#절대-거리-센서)에 물체가 감지되면 꼬리를 움직여 공격합니다.
  - `GUARD MODE`를 선택하면 Scorpi 로봇이 제자리에서 경계 자세를 취하며, 절대거리센서 [DMS-80](/docs/kr/edu/engineer/kit2_introduction/#절대-거리-센서)에 물체가 감지되면 꼬리를 움직여 공격합니다.

#### [Scorpi 메뉴 기능 소개](#scorpi-메뉴-기능-소개)

|                         아이콘                         | 메뉴 설명                                                                                                                                                             |
|:------------------------------------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![](/assets/images/edu/engineer/kit1/icon_remote.png)  | **REMOTE : 조종 모드** <br>Scorpi 로봇을 조종하는 모드이며 로봇의 이동 및 방향 전환, 속도 변경과 로봇의 꼬리 및 집게를 사용하는 다양한 모션들을 동작시킬 수 있습니다. |
| ![](/assets/images/edu/engineer/kit2/icon_gesture.png) | **GESTURE : 제스처 모드** <br>스마트기기의 기울기, 흔들림 센서 등을 사용해 기기를 기울이거나 특정 동작을 통해 Scorpi 로봇의 이동 및 공격 등의 명령을 수행합니다.      |

![](/assets/images/edu/engineer/kit2/scorpi_control_kr.png)  
  > 조종 모드 화면

![](/assets/images/edu/engineer/kit2/scorpi_gesture.png)  
  > 제스쳐 모드 화면  

<!-- 

## [로봇 설정하기](#로봇-설정하기)

### [모터 조립확인](#모터-조립확인)
로보티즈 엔지니어에 사용된 다이나믹셀 ID 확인 및 작동 상태를 체크하는 기능입니다.  
이 기능은 엔지니어 키트 1과 동일합니다, 키트 1의 [모터 조립확인](/docs/kr/edu/engineer/kit1/#모터-조립확인)을 참고하세요.

### [모터 오프셋 설정](#모터-오프셋-설정)
로보티즈 엔지니어에 사용된 다이나믹셀의 자세나 위치 값의 보정이 필요할 때 사용하는 기능입니다.  
오프셋 기능을 통해 보정된 값은 로봇의 전원을 끄더라도 저장됩니다.  
오프셋 기능을 숙지한 상태에서 미세하게 조정해야 하며 잘못된 값을 사용시 예제 동작이 잘 안되거나 로봇이 파손될 수 있습니다.  
이 기능은 엔지니어 키트 1과 동일합니다, 키트 1의 [모터 조립확인](/docs/kr/edu/engineer/kit1/#모터-오프셋-설정)을 참고하세요. 
-->

[로보플러스 태스크 3.0]: /docs/kr/software/rplustask3/
[로보플러스 태스크 2.0]: /docs/kr/software/rplus2/task/
[로보플러스 모션 2.0]: /docs/kr/software/rplus2/motion/
[동작 모드]: /docs/kr/parts/controller/cm-550/#동작-모드
[제어기와 PC 연결하기]: /docs/kr/popup/engineer/connect_controller_pc
[PC에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_pc
[PC에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_pc
[제어기와 스마트기기 연결하기]: /docs/kr/popup/engineer/connect_controller_mobile
[스마트기기에서 태스크 예제 다운로드 하기]: /docs/kr/popup/engineer/task_download_mobile
[스마트기기에서 모션 예제 다운로드 하기]: /docs/kr/popup/engineer/motion_download_mobile
[PC에서 파이썬 예제 다운로드 하기]: /docs/kr/popup/engineer/python_download_pc
