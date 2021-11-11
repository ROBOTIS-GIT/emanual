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

|                                       다이나믹셀 위자드 2.0                                        |                                                  다이나믹셀 SDK                                                   |                                                 다이나믹셀 워크벤치                                                  |
|:--------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/software.png)](/docs/kr/software/dynamixel/dynamixel_wizard2/) | [![](/assets/images/sw/all_software/icon_dynamixel_sdk.png)](/docs/kr/software/dynamixel/dynamixel_sdk/overview/) | [![](/assets/images/sw/all_software/DYNAMIXEL_Workbench_LOGO.png)](/docs/kr/software/dynamixel/dynamixel_workbench/) |

## [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)

[다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/)은 다양한 운영체제에서 다이나믹셀 제품들을 통합 관리할 수 있는 편리한 툴입니다.

- 모든 다이나믹셀의 펌웨어를 업데이트 및 복구할 수 있습니다.
- 다양한 프로토콜을 기반으로 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 및 파라미터 등을 설정하고, 목표 지령을 생성할 수 있습니다.
- 시간에 따라 변화하는 값들을 실시간 그래프로 확인할 수 있습니다.
- 사용자가 직접 프로토콜 패킷을 생성하여 전송하고, 모니터링 할 수 있습니다

## [다이나믹셀 SDK](#다이나믹셀-sdk)

[다이나믹셀 SDK](/docs/kr/software/dynamixel/dynamixel_sdk/overview/)는 패킷 통신을 사용하여 다이나믹셀의 제어기능을 제공하는 소프트웨어 개발 도구 입니다.

- 더많은 개발도구를 찾는다면, [개발 (SDK & ROS)](#개발-sdk--ros)를 참고하세요.

## [다이나믹셀 워크벤치](#다이나믹셀-워크벤치)

[다이나믹셀 워크벤치](/docs/kr/software/dynamixel/dynamixel_workbench/)는 간단하고 쉬운 방법으로 다이나믹셀을 제어할수있는 라이브러리를 제공합니다.

# [아두이노 IDE](#아두이노-ide)

[아두이노](/docs/kr/software/arduino_ide/)의 특정 라이브러리를 사용하여, 호환 인터페이스 및 제어기를 통해 다이나믹셀을 제어할수 있습니다. 

|                                        아두이노 IDE                                        |
|:------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/icon_arduino_ide.png)](/docs/kr/software/arduino_ide/) |

# [개발 (SDK & ROS)](#개발-sdk--ros)

|                                                  다이나믹셀 SDK                                                   |                                                 다이나믹셀 워크벤치                                                  |                                                Embedded C(CM-530)                                                 |                                              Embedded C(CM-510/700)                                               |                                                   ZIGBEE SDK                                                   |                                                OpenCM IDE                                                |
|:-----------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/icon_dynamixel_sdk.png)](/docs/kr/software/dynamixel/dynamixel_sdk/overview/) | [![](/assets/images/sw/all_software/DYNAMIXEL_Workbench_LOGO.png)](/docs/kr/software/dynamixel/dynamixel_workbench/) | [![](/assets/images/sw/all_software/icon_embedded_sdk_530.png)](/docs/kr/software/embedded_sdk/embedded_c_cm530/) | [![](/assets/images/sw/all_software/icon_embedded_sdk_510.png)](/docs/kr/software/embedded_sdk/embedded_c_cm510/) | [![](/assets/images/sw/all_software/icon_embedded_sdk_zigbee.png)](/docs/kr/software/embedded_sdk/zigbee_sdk/) | [![](/assets/images/sw/all_software/icon_opencm_ide.png)](/docs/kr/software/opencm_ide/getting_started/) |

## [다이나믹셀 SDK ](#다이나믹셀-sdk-)

[다이나믹셀 SDK](/docs/kr/software/dynamixel/dynamixel_sdk/overview/)는 패킷 통신을 사용하여 다이나믹셀의 제어기능을 제공하는 소프트웨어 개발 도구 입니다.

- API는 다이나믹셀과 플랫폼 로봇에 기반하여 만들어졌습니다.
- C/C++ 등의 프로그래밍 언어의 이해가 필요합니다.

## [다이나믹셀 워크벤치 ](#다이나믹셀l-workbench-)

[다이나믹셀 워크벤치](/docs/kr/software/dynamixel/dynamixel_workbench/)는 간단하고 쉬운 방법으로 다이나믹셀을 제어할수있는 라이브러리를 제공합니다.

- 손쉬운 제어를 위해 다양한 예제가 준비되어있습니다. Linux, ROS, max OS 및 아두이노 등 다양한 환경에서 다이나믹셀을 쉽게 사용해보세요.

## [임베디드 SDK](#임베디드-sdk)

사용자가 직접 제어기 (CM-510/530/700) 펌웨어를 개발할 수 있는 솔루션입니다.

1. [Embedded C(CM530)](/docs/en/software/embedded_sdk/embedded_c_cm530/) 및 [Embeeded C(CM510/700)](/docs/en/software/embedded_sdk/embedded_c_cm510/)는 다음과 같은 특징이 있습니다.
  - 모든 소스가 C언어로 작성되어 있습니다.
  - 제어기 각 부분을 직접 제어하는 예제를 제공합니다.

2. [Zigbee SDK](/docs/en/software/embedded_sdk/zigbee_sdk/)는 [로보플러스](#로보플러스)의 Task 코드와 통신하는 S/W 개발을 위한 표준 프로그래밍 라이브러리입니다. Zigbee SDK의 특징은 다음과 같습니다.
  - C언어로 작성되어 플랫폼별 이식성이 뛰어납니다.
  - 플랫폼 독립적인 소스와 의존적인 소스로 작성되어 플랫폼 포팅이 쉽습니다.
  - 인터페이스를 표준화시켜서 제어기가 달라져도 개발된 S/W를 재사용할 수 있습니다.
  - 통신 모듈과 독립적으로 사용 가능한 SDK입니다.
  - ZigBee 모듈뿐만 아니라 Bluetooth 모듈에서도 사용할 수 있습니다.

## [로보티즈 프레임워크 패키지](#로보티즈-프레임워크-패키지)

다이나믹셀 SDK를 기반으로 만들어진 [로보티즈 프레임워크 패키지](/docs/en/software/robotis_framework_packages/)는 똘망3, OP2, OP3같은 휴머노이드 로봇에서 사용되는 패키지 입니다.

## [로보티즈 매니퓰레이터 라이브러리](#로보티즈-매니퓰레이터-라이브러리)

[로보티즈 매니퓰레이터 라이브러리](/docs/kr/software/robotis_manipulator_libs/)는 매니퓰레이터를 제어하기위해 만들어진 라이브러리 입니다.

## [OpenCM IDE](#opencm-ide)

[OpenCM IDE](/docs/en/software/opencm_ide/getting_started/)은 OpenCM9.04 임베디드 보드를 쉽게 프로그래밍하고 다운로드 할 수 있는 통합개발환경 소프트웨어 입니다.

# [로보플러스](#로보플러스)

로보플러스 (이하 R+)는 로보티즈 키트를 쉽고 빠르게 프로그래밍하기위해 만들어진 소프트웨어입니다.

## [R+ Task 3.0](#r-task-30)

[R+ Task 3.0](/docs/kr/software/rplustask3/)은 R+ Task 2.0과 R+ Motion 2.0이 통합된 소프트웨어입니다.

|                                        R+ Task 3.0                                        |
|:-----------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/R+Task3_APP_ICON.png)](/docs/kr/software/rplustask3/) |

## [R+ Task 2.0](#r-task-20)

|                                       R+ Manager 2.0                                        |                                       R+ Task 2.0                                       |                                        R+ Motion 2.0                                        |                                       R+ Design 2.0                                       |                                         R+ Scratch                                          |
|:-------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/icon_r_manager.png)](/docs/kr/software/rplus2/manager/) | [![](/assets/images/sw/all_software/icon_r_task_2.jpg)](/docs/kr/software/rplus2/task/) | [![](/assets/images/sw/all_software/icon_r_motion_2.jpg)](/docs/kr/software/rplus2/motion/) | [![](/assets/images/sw/all_software/icon_r_design.jpg)](/docs/kr/software/rplus2/design/) | [![](/assets/images/sw/all_software/icon_r_scratch.jpg)](/docs/kr/software/rplus2/scratch/) |

### [R+ Manager 2.0](#r-manager-20)

[R+ Manager 2.0](/docs/kr/software/rplus2/manager/)은 로봇을 구성하는 제어기와 다이나믹셀 장치들을 통합 관리합니다.  
제품을 연결하면 해당 제품을 최신버전으로 업데이트할 수 있으며, 컨트롤 테이블을 테스트해볼 수 있습니다.  
기존의 R+ Manager 1.0과 다이나믹셀 위자드 1.0에서 제공하던 기능이 R+ Manager 2.0에서 통합되었습니다.

### [R+ Task 2.0](#r-task-20)

[R+ Task 2.0](/docs/kr/software/rplus2/task/)은 태스크 코드를 작성할 수 있는 소프트웨어 입니다. 

어떤 일을 처리하기 위한 행동들의 집합을 태스크(Task)라고 합니다. 로봇이 해야할 태스크를 프로그래밍 한 소스를 R+(RoboPlus)에서는 태스크 코드(Task Code)라고 합니다. 로봇은 사용자가 작성한 태스크 코드에 따라 동작하게 되며, 이러한 태스크 코드를 쉽게 작성할 수 있도록 도와주는 것이 R+ Task(RoboPlus Task) 프로그램입니다.

### [R+ Motion 2.0](#r-motion-20)

[R+ Motion 2.0](/docs/kr/software/rplus2/motion/)은 로봇의 모션을 생성하는 에디터입니다. 모션이란, 로봇이 의미있는 행동을 하기 위해 필요한 관절 별 모터의 위치와 속도 데이터 집합을 의미합니다.

### [R+ Design 2.0](#r-design-20)

[R+ Design 2.0](/docs/kr/software/rplus2/design/)은 단계별로 로봇조립을 3D 이미지로 보여주는 조립 가이드입니다.

### [로보플러스 모바일](#로보플러스-모바일)

로보플러스를 모바일 (이하 R+ m)에서 사용할수있는 앱입니다.

|                                          R+ m.Task 2.0                                           |                                          R+ m.Motion 2.0                                           |                                            R+ m.Design                                             |                                            R+ Block                                             |
|:------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/rplus_m_task2.png)](/docs/kr/software/rplus_mobile/mtask20/) | [![](/assets/images/sw/all_software/rplus_m_motion2.png)](/docs/kr/software/rplus_mobile/mmotion/) | [![](/assets/images/sw/all_software/rplus_m_design2.png)](/docs/kr/software/rplus_mobile/mdesign/) | [![](/assets/images/sw/all_software/rplus_m_block.png)](/docs/kr/software/rplus2/rplus2_block/) |

#### [R+ Block](#r-block)

[R+ Block](/docs/kr/software/rplus2/rplus2_block/)은 구글 블로클리(Blockly) 방식의 블록형 코딩이 가능하도록 개발된 코딩 교육용 플랫폼입니다.

## [로보플러스 1.0](#로보플러스-10)

로보플러스 1.0은 R+ Task, R+ Motion, R+ Manager 및 다이나믹셀 위자드 4개의 프로그램을 하나의 프로그램에서 관리하는 프로그램입니다.

R+ Manager 1.0은 R+ Manager 2.0에서 지원하지않는 다이나믹셀 AX 및 MX 그리고 특정 제어기 (CM-510/530/700)등을 지원합니다.

|                                                R+ Task                                                |                                         R+ Manager                                          |                                         R+ Motion                                         |                                          다이나믹셀 위자드                                          |
|:-----------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/icon_task10.png)](/docs/kr/software/rplus1/task/getting_started/) | [![](/assets/images/sw/all_software/icon_manager10.png)](/docs/kr/software/rplus1/manager/) | [![](/assets/images/sw/all_software/icon_motion10.png)](/docs/kr/software/rplus1/motion/) | [![](/assets/images/sw/all_software/wizard10_icon.png)](/docs/kr/software/rplus1/dynamixel_wizard/) |

## [로보티즈 미니](#로보티즈-미니)

[로보티즈 미니앱](/docs/kr/software/mobile_app/mini_app/)은 로보티즈 미니를 제어할수 있습니다.

|                                           로보티즈 미니                                           |
|:-------------------------------------------------------------------------------------------------:|
| [![](/assets/images/sw/all_software/mobile_mini_app.png)](/docs/kr/software/mobile_app/mini_app/) |
