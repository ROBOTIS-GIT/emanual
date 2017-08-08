---
layout: archive
lang: kr
ref: rplus1_task_getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus1/task/getting_started/
sidebar:
  title: R+ Task 1.0
  nav: "rplustask1"
---

# [개요](#개요)

## [로보플러스 태스크](#로보플러스-태스크)

어떤 일을 처리하기 위한 행동들의 집합을 태스크(Task)라고 합니다. 로봇이 해야할 태스크를 프로그래밍 한 소스를 로보플러스(RoboPlus)에서는 태스크 코드(Task Code)라고 합니다. 로봇은 사용자가 작성한 태스크 코드에 따라 동작하게 되며, 이러한 태스크 코드를 쉽게 작성할 수 있도록 도와주는 것이 로보플러스 태스크(RoboPlus Task) 프로그램입니다.

태스크 코드 파일은 PC 에서 .tsk 라는 확장자를 가지며 좌측과 같은 아이콘으로 표시됩니다.

`참고` 상위버젼의 Task 파일은 하위버젼에서 호환되지 않습니다.
{: .notice}

![](/emanual/assets/images/sw/rplus1/roboplus_task_01.png)

### [설치하기](#설치하기)

`다운로드` [로보티즈 홈페이지 자료실](#http://www.robotis.com/BlueAD/board.php?bbs_id=service_03)
{: .notice}

로보플러스는 모든 로보티즈 제품을 프로그래밍할 수 있는 통합 소프트웨어입니다.

#### RoboPlus 시스템 요구 사항
+ OS : Windows XP Service Pack 2 이상/ Vista/ 7 (32/64bit)/8 (32/64bit)
+ 800MHz이상의 32비트(x86) 또는 64비트 (x64) 프로세서
+ 3D 가속 기능을 지원하는 그래픽 카드
+ 512MB이상 시스템 메모리
+ 여유공간이 500MB 이상인 하드디스크


`참고` 로보플러스를 실행하기 위해선 .NET FrameWork 3.5이상의 버전이 필요 합니다. 로보플러스 설치시 .NET FrameWork 자동설치가 실패할 경우엔 .NET FreameWork를 별도로 설치하세요.
{: .notice}

#### RoboPlus 설치 실패시

대부분의 RoboPlus 설치 실패의 원인은 사용자 PC환경에 따른 .NET FrameWork 자동 설치 실패 입니다. 따라서 사용자가 직접 .NET FrameWork 3.5를 수동으로 설치 하셔야 합니다.
.NET FrameWork 3.5를 수동으로 설치 하기 전에 Windows installer 3.1이상이 설치 되어 있어야 합니다.

Windows installer와 .NET Framework는 [마이크로소프트 다운로드 센터]에서 다운로드가 가능합니다.

[Windows installer 3.1 다운로드]

[.NET Framework 3.5 다운로드]


[마이크로소프트 다운로드 센터]: http://www.microsoft.com/downloads/Search.aspx?displaylang=ko

[Windows installer 3.1 다운로드]: http://www.microsoft.com/downloads/details.aspx?FamilyID=889482fc-5f56-4a38-b838-de776fd4138c&DisplayLang=ko

[.NET Framework 3.5 다운로드]: http://www.microsoft.com/downloads/details.aspx?FamilyID=d0e5dea7-ac26-4ad7-b68c-fe5076bba986&DisplayLang=ko
