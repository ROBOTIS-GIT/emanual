---
layout: archive
lang: kr
ref: overview
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplustask3/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 1
---

# [개요](#개요)

![](/assets/images/sw/rplus_task3/task3_001.png)

- **태스크**
  어떤 일을 처리하기 위한 행동들의 집합을 태스크(Task)라고 합니다. 로봇이 해야 할 태스크를 프로그래밍 한 소스를 로보플러스(RoboPlus)에서는 태스크 코드(Task Code)라고 합니다. 로봇은 사용자가 작성한 태스크 코드에 따라 동작하게 되며, 이러한 태스크 코드를 쉽게 작성할 수 있도록 도와주는 것이 로보플러스 태스크(RoboPlus Task) 프로그램입니다. 태스크 코드 파일은 PC(혹은 스마트폰)에서 .tsk3라는 확장자를 가집니다 

- **모션**

  태스크가 로봇이 어떻게 움직일지 논리적인 판단을 정의한 프로그램 코드라면, 모션은 태스크에서 내린 판단에 따라 움직일 행동이 정의된 데이터입니다. 만약, 내가 만든 로봇이 단순한 동작만을 사용하는 로봇이라면 태스크 파일을 작성할 때 모션을 사용하지 않아도 되지만 정밀한 움직임이나 댄스와 같이 복잡하고 다양한 움직임이 필요하다면 모션 파일을 사용하는 것이 효율적입니다 (태스크 코드에서 모션을 사용한다면, 반드시 모션 파일을 다운로드해야 합니다). 모션 파일은 PC(혹은 스마트폰)에서 .mtn3라는 확장자를 가집니다.


## [호환 제어기](#호환-제어기)

- [CM-5]
- [CM-50]
- [CM-100]
- [CM-150]
- [CM-200]
- [CM-510]
- [CM-530]
- [CM-550]
- [CM-700]
- [OpenCM7.0]
- [OpenCM9.04]

**[제어기 호환표]**
{: .notice}

# [시작하기](#시작하기)

## [소프트웨어 다운로드](#소프트웨어-다운로드)

- [로보플러스 태스크 3.0 윈도우 설치파일 다운로드](http://www.robotis.com/service/download.php?no=1774)
- [로보플러스 태스크 3.0 안드로이드 앱 다운로드](https://play.google.com/store/apps/details?id=com.robotis.task3)

## [메뉴 설명](#메뉴-설명)

1. 홈 탭  
  프로그램 시작 시 첫 화면으로 기본 예제, 파일 관련 메뉴, 업데이트, 설정 메뉴를 포함합니다.

    ![](/assets/images/sw/rplus_task3/task3_002.png)

2. 프로그래밍 탭  
  태스크 소스 코드를 편집하는 영역으로 프로그래밍 툴바, 소스뷰, 아웃라인 메뉴, 다운로드 기능을 제공합니다.

    ![](/assets/images/sw/rplus_task3/task3_003.png)

3. 디버깅 탭  
  태스크 코드를 디버깅하기 위한 영역으로 출력 모니터, 가상리모컨 기능을 제공합니다. (사용자 편의를 위해 자동 연결기능이 추가되었습니다.)

    ![](/assets/images/sw/rplus_task3/task3_004.png)

4. 모션유닛 탭  
  모션 예제를 선택하거나 자유 형태 로봇 모션을 만들 수 있는 화면입니다.

    ![](/assets/images/sw/rplus_task3/task3_002.png)  

    ![](/assets/images/sw/rplus_task3/task3_005.png)

5. 모션 탭  
  모션 유닛을 선택해서 재생해 볼 수 있는 화면입니다.

    ![](/assets/images/sw/rplus_task3/task3_006.png)

6. 모션 다운로드 탭  
  저장된 모션을 선택적으로 다운로드 할 수 있는 화면입니다.

    ![](/assets/images/sw/rplus_task3/task3_007.png)


[제어기 호환표]: /docs/kr/parts/controller/controller_compatibility/
[CM-50]: /docs/kr/parts/controller/cm-100/
[CM-100]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
