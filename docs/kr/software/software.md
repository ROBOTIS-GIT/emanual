---
layout: archive
lang: kr
ref: all-software
permalink: /docs/kr/software/
sidebar:
  title: 소프트웨어
  nav: "all-software"
---

# [Featured](#featured)

|                                                     다이나믹셀 위자드 2.0                                                      |                                                                다이나믹셀 SDK                                                                 |                                                               다이나믹셀 워크벤치                                                               |
|:---------------------------------------------------------------------------------------------------------------------------:| :------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/software.png)](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_wizard2/) | [![](/assets/images/sw/all_software/icon_dynamixel_sdk.png)](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_sdk/overview/) | [![](/assets/images/sw/all_software/DYNAMIXEL_Workbench_LOGO.png)](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_workbench/) |

## [다이나믹셀 위자드 2.0](다이나믹셀l-wizard-20)

다이나믹셀 위자드 2.0은 다양한 운영체제에서 다이나믹셀 제품들을 통합 관리할 수 있는 편리한 툴입니다.

- 모든 다이나믹셀의 펌웨어를 업데이트 및 복구할 수 있습니다.
- 다양한 프로토콜을 기반으로 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 및 파라미터 등을 설정하고, 목표 지령을 생성할 수 있습니다.
- 시간에 따라 변화하는 값들을 실시간 그래프로 확인할 수 있습니다.
- 사용자가 직접 프로토콜 패킷을 생성하여 전송하고, 모니터링 할 수 있습니다

## [다이나믹셀 SDK](#다이나믹셀-sdk)

다이나믹셀 SDK는 패킷 통신을 사용하여 다이나믹셀의 제어기능을 제공하는 소프트웨어 개발 도구 입니다.

- 더많은 개발도구를 찾는다면, [개발 (SDK & ROS)](#개발-sdk--ros)를 참고하세요.

## [다이나믹셀 워크벤치](다이나믹셀l-workbench)

다이나믹셀 SDK를 기반으로 제작된 다이나믹셀 워크벤치는 간단하고 쉬운 방법으로 다이나믹셀을 제어할수있는 라이브러리를 제공합니다.

# [아두이노 IDE](#아두이노-ide)

아두이노를 지원하는 제어기 또는 쉴드와 특정 라이브러리를 사용하여, 다이나믹셀을 제어할수 있습니다.  

|                                                      아두이노 IDE                                                      |
| :-------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/icon_arduino_ide.png)](https://emanual.robotis.com/docs/kr/software/arduino_ide/) |

# [개발 (SDK & ROS)](#개발-sdk--ros)

|                                                                다이나믹셀 SDK                                                                 |                                                               다이나믹셀 워크벤치                                                               |                                                          Embedded C(CM-530)                                                          |                                                        Embedded C(CM-510/700)                                                        |                                                              ZIGBEE SDK                                                              |                                                             OpenCM IDE                                                              |
| :------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/icon_dynamixel_sdk.png)](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_sdk/overview/) | [![](/assets/images/sw/all_software/DYNAMIXEL_Workbench_LOGO.png)](https://emanual.robotis.com/docs/kr/software/dynamixel/dynamixel_workbench/) | [![](/assets/images/sw/all_software/icon_embedded.png)](https://emanual.robotis.com/docs/kr/software/embedded_sdk/embedded_c_cm530/) | [![](/assets/images/sw/all_software/icon_embedded.png)](https://emanual.robotis.com/docs/kr/software/embedded_sdk/embedded_c_cm530/) | [![](/assets/images/sw/all_software/icon_embedded.png)](https://emanual.robotis.com/docs/kr/software/embedded_sdk/embedded_c_cm530/) | [![](/assets/images/sw/all_software/icon_opencm_ide.png)](https://emanual.robotis.com/docs/kr/software/opencm_ide/getting_started/) |

## [다이나믹셀 SDK](#다이나믹셀-sdk)

다이나믹셀 SDK는 패킷 통신을 사용하여 다이나믹셀의 제어기능을 제공하는 소프트웨어 개발 도구 입니다.

- API는 다이나믹셀과 플랫폼 로봇에 기반하여 만들어졌습니다.
- C/C++ 등의 프로그래밍 언어의 이해가 필요합니다.

## [다이나믹셀 워크벤치](다이나믹셀l-workbench)

다이나믹셀 SDK를 기반으로 제작된 다이나믹셀 워크벤치는 간단하고 쉬운 방법으로 다이나믹셀을 제어할수있는 라이브러리를 제공합니다.

- 손쉬운 제어를 위해 다양한 예제가 준비되어있습니다. Linux, ROS, max OS 및 아두이노 등 다양한 환경에서 다이나믹셀을 쉽게 사용해보세요.

## [임베디드 SDK](#임베디드-sdk)

사용자가 직접 제어기 (CM-510/530/700) 펌웨어를 개발할 수 있는 솔루션입니다. 

1. 임베디드 C는 다음과 같은 특징이 있습니다.
- 모든 소스가 C언어로 작성되어 있습니다.
- 제어기 각 부분을 직접 제어하는 예제를 제공합니다.

2. Zigbee SDK는 RoboPlus Task 코드와 통신하는 S/W 개발을 위한 표준 프로그래밍 라이브러리입니다. Zigbee SDK의 특징은 다음과 같습니다.
- C언어로 작성되어 플랫폼별 이식성이 뛰어납니다.
- 플랫폼 독립적인 소스와 의존적인 소스로 작성되어 플랫폼 포팅이 쉽습니다.
- 인터페이스를 표준화시켜서 제어기가 달라져도 개발된 S/W를 재사용할 수 있습니다.
- 통신 모듈과 독립적으로 사용 가능한 SDK입니다.
- ZigBee 모듈뿐만 아니라 Bluetooth 모듈에서도 사용할 수 있습니다.

## [로보티즈 프레임워크 패키지](#로보티즈-프레임워크-패키지)

다이나믹셀 SDK를 기반으로 만들어진 로보티즈 프레임워크 패키지는 똘망3, OP2, OP3같은 휴머노이드 로봇에서 사용되는 패키지 입니다. 

- [로보티즈 프레임워크 패키지](https://emanual.robotis.com/docs/kr/software/robotis_framework_packages/)

## [로보티즈 매니퓰레이터 라이브러리](#로보티즈-매니퓰레이터-라이브러리)

매니퓰레이터를 제어하기위해 만들어진 라이브러리 입니다.  

- [로보티즈 매니퓰레이터 라이브러리](https://emanual.robotis.com/docs/en/software/robotis_manipulator_libs/)

## [OpenCM IDE](#opencm-ide)

ROBOTIS OpenCM은 OpenCM9.04 임베디드 보드를 쉽게 프로그래밍하고 다운로드 할 수 있는 통합개발환경 소프트웨어 입니다.  

# [로보플러스](#로보플러스)

로보플러스는 로보티즈 키트를 쉽고 빠르게 프로그래밍하기위해 만들어진 소프트웨어입니다.

## [로보플러스 태스크 3.0](#로보플러스-태스크-30)

로보플러스 태스크 3.0은 로보플러스 태스크 2.0과 모션 2.0이 통합된 소프트웨어입니다.

|                                                     로보플러스 태스크 3.0                                                |
| :------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/R+Task3_APP_ICON.png)](https://emanual.robotis.com/docs/kr/software/rplustask3/) |

## [로보플러스 2.0](#로보플러스-20)

|                                                     로보플러스 매니저 2.0                                                     |                                                    로보플러스 태스크 2.0                                                     |                                                     로보플러스 모션 2.0                                                      |                                                    로보플러스 디자인 2.0                                                     |                                                       로보플러스 스크래치                                                       |
| :--------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: | :--------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/icon_r_manager.png)](https://emanual.robotis.com/docs/kr/software/rplus2/manager/) | [![](/assets/images/sw/all_software/icon_r_task_2.jpg)](https://emanual.robotis.com/docs/kr/software/rplus2/task/) | [![](/assets/images/sw/all_software/icon_r_motion_2.jpg)](https://emanual.robotis.com/docs/kr/software/rplus2/motion/) | [![](/assets/images/sw/all_software/icon_r_design.jpg)](https://emanual.robotis.com/docs/kr/software/rplus2/design/) | [![](/assets/images/sw/all_software/icon_r_scratch.jpg)](https://emanual.robotis.com/docs/kr/software/rplus2/scratch/) |

### [로보플러스 매니저 2.0](#로보플러스-매니저-20)

로봇을 구성하는 제어기와 다이나믹셀 장치들을 통합 관리합니다.  
제품을 연결하면 해당 제품을 최신버전으로 업데이트할 수 있으며, 컨트롤 테이블을 테스트해볼 수 있습니다.  
기존의 로보플러스 매니저1.0과 위자드1.0에서 제공하던 기능이 로보플러스 매니저 2.0에서 통합되었습니다.

### [로보플러스 태스크 2.0](#로보플러스-태스크-20)

어떤 일을 처리하기 위한 행동들의 집합을 태스크(Task)라고 합니다. 로봇이 해야할 태스크를 프로그래밍 한 소스를 로보플러스(RoboPlus)에서는 태스크 코드(Task Code)라고 합니다. 로봇은 사용자가 작성한 태스크 코드에 따라 동작하게 되며, 이러한 태스크 코드를 쉽게 작성할 수 있도록 도와주는 것이 로보플러스 태스크(RoboPlus Task) 프로그램입니다.

### [로보플러스 모션 2.0](#로보플러스-모션-20)

로보플러스 모션은, 로봇의 행동을 생성하는 에디터입니다. 모션이란, 로봇이 의미있는 행동을 하기 위해 필요한 관절 별 모터의 위치와 속도 데이터 집합을 의미합니다.  

### [로보플러스 디자인 2.0](#로보플러스-디자인-20)

단계별로 로봇조립을 3D 이미지로 보여주는 조립 가이드입니다. 

### [로보플러스 모바일](#로보플러스-모바일)

로보플러스를 모바일에서 사용할수있는 앱입니다. 

|                                                        R+ m.Task 2.0                                                        |                                                        R+ m.Motion 2.0                                                        |                                                          R+ m.Design                                                          |                                                          R+ Block                                                          |
| :-------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/rplus_m_task2.png)](https://emanual.robotis.com/docs/kr/software/rplus_mobile/mtask20/) | [![](/assets/images/sw/all_software/rplus_m_motion2.png)](https://emanual.robotis.com/docs/kr/software/rplus_mobile/mmotion/) | [![](/assets/images/sw/all_software/rplus_m_design2.png)](https://emanual.robotis.com/docs/kr/software/rplus_mobile/mdesign/) | [![](/assets/images/sw/all_software/rplus_m_block.png)](https://emanual.robotis.com/docs/kr/software/rplus2/rplus2_block/) |

#### [로보플러스 블록](#로보플러스-블록)

로보플러스 블록은 구글 블로클리(Blockly) 방식의 블록형 코딩이 가능하도록 개발된 코딩 교육용 플랫폼입니다.

## [로보플러스 1.0](#로보플러스-10)

로보플러스는 1.0은 로보플러스 태스크 1.0, 로보플러스 모션 1.0, 다이나믹셀 위자드 1.0, 로보플러스 매니저 등의 프로그램을 하나의 프로그램에서 관리하는 프로그램입니다. 

로보플러스 매니저 1.0 로보플러스 매니저 2.0에서 지원하지않는 다이나믹셀 AX 및 MX 그리고 특정 제어기 (CM-510/530/700)등을 지원합니다.


|                                                              로보플러스 태스크                                                               |                                                      로보플러스 매니저                                                       |                                                      로보플러스 모션                                                       |                                                        다이나믹셀 위자드                                                        |
| :--------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/task10_icon.png)](https://emanual.robotis.com/docs/kr/software/rplus1/task/getting_started/) | [![](/assets/images/sw/all_software/manager10_icon.png)](https://emanual.robotis.com/docs/kr/software/rplus1/manager/) | [![](/assets/images/sw/all_software/motion10_icon.png)](https://emanual.robotis.com/docs/kr/software/rplus1/motion/) | [![](/assets/images/sw/all_software/wizard10_icon.png)](https://emanual.robotis.com/docs/kr/software/rplus1/dynamixel_wizard/) |



## [로보티즈 미니](#로보티즈-미니)

로보티즈 미니를 작동하는데 사용되는 앱입니다.

|                                                         로보티즈 미니                                                         |
| :--------------------------------------------------------------------------------------------------------------------------: |
| [![](/assets/images/sw/all_software/mobile_mini_app.png)](https://emanual.robotis.com/docs/kr/software/mobile_app/mini_app/) |
