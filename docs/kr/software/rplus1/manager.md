---
layout: archive
lang: kr
ref: rplus1_manager
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus1/manager/
sidebar:
  title: 로보플러스 매니저 1.0
  nav: "rplusmanager1"
---

# [개요](#개요)

로보플러스 매니저는 로봇을 구성하는 각 장치들을 관리해줍니다. 이 프로그램의 주요 역할은 다음과 같습니다.

- 제어기 펌웨어를 관리합니다. [(업데이트 및 복구 기능)]
- 제어기 및 주변 장치들의 상태를 점검합니다. [(테스트 기능)]
- 사용에 필요한 모드 등을 설정할 수 있습니다. (설정 기능)

**참고**: 통신이 불안정하다면 전압레벨 차이 일수 있습니다. 연결된 장비 및 PC가 그라운드와 연결되어 있는지 확인해주세요.
{: .notice}

![img](/assets/images/sw/rplus1/manager/roboplus_manager.png)

## [설치하기](#설치하기)

- `다운로드` [로보티즈 홈페이지 자료실](http://www.robotis.com/service/downloadcenter.php)

로보플러스는 모든 로보티즈 제품을 프로그래밍할 수 있는 통합 소프트웨어입니다.

### RoboPlus 시스템 요구 사항
- OS : Windows XP Service Pack 2 이상/ Vista/ 7 (32/64bit)/8 (32/64bit)
- 800MHz이상의 32비트(x86) 또는 64비트 (x64) 프로세서
- 3D 가속 기능을 지원하는 그래픽 카드  
- 512MB이상 시스템 메모리
- 여유공간이 500MB 이상인 하드디스크

![img_install](/assets/images/sw/roboplus_install.png)

**참고**: 로보플러스를 실행하기 위해선 .NET FrameWork 3.5이상의 버전이 필요 합니다. 로보플러스 설치시 .NET FrameWork 자동설치가 실패할 경우엔 .NET FreameWork를 별도로 설치하세요.
{: .notice}

### RoboPlus 설치 실패시

대부분의 RoboPlus 설치 실패의 원인은 사용자 PC환경에 따른 .NET FrameWork 자동 설치 실패 입니다.  
따라서 사용자가 직접 .NET FrameWork 3.5를 수동으로 설치 하셔야 합니다.  
.NET FrameWork 3.5를 수동으로 설치 하기 전에 Windows installer 3.1이상이 설치 되어 있어야 합니다.  

Windows installer와 .NET Framework는 마이크로 소프트 다운로드 센터에서 다운로드가 가능합니다.  

- `다운로드` [Windows installer 3.1](http://www.microsoft.com/downloads/details.aspx?FamilyID=889482fc-5f56-4a38-b838-de776fd4138c&DisplayLang=ko)
- `다운로드` [.NET Framework 3.5](http://www.microsoft.com/downloads/details.aspx?FamilyID=d0e5dea7-ac26-4ad7-b68c-fe5076bba986&DisplayLang=ko)

# [시작하기](#시작하기)

## [제어기 연결](#제어기-연결)

1. 제어기를 PC와 연결합니다. (연결 방법은 각 [제어기 정보]를 참고하세요.)
2. 사용할 통신 포트를 선택합니다.
   자동 찾기 기능을 이용하면 쉽게 통신 포트를 설정할 수 있습니다.
   ![img](/assets/images/sw/rplus1/manager/connection.png)

   만약, 해당 통신 포트가 사용중으로 나타나면 사용중인 프로그램을 찾아 사용을 해제해야 합니다.
   ![img]/(assets/images/sw/rplus1/manager/connection_in_use.png)

   RoboPlus Manager가 제어기를 찾지 못하면 아래와 같은 에러 메시지가 나타납니다.
   ![img](/assets/images/sw/rplus1/manager/connection_not_find.png)

   - PC 와 제어기가 연결되어 있는지 확인합니다. (연결 방법은 각 제어기 정보를 참고하세요.)
   - 제어기의 전원이 켜져 있는지 확인합니다.
   - 제어기가 연결된 통신 포트가 바르게 선택되어 있는지 확인합니다.
3. 관리를 시작합니다. (각 [제어기별 관리방법]을 참고하세요.)

## [제어기 연결 안될시 확인사항](#제어기-연결-안될시-확인사항)

1. 제품을 컴퓨터에 연결시 장치 관리자에게 연결장치(LN101, USB2DXL, 제어기 등)의 포트가 생기는지 확인해주세요.

    ![img](/assets/images/sw/rplus1/manager/manege_controller.jpg)

2. 포트가 잡힐 시  
  펌웨어 복구를 시도해보시길 바랍니다. 펌웨어 복구 방법은 E-manual을 참조해 주시길 바랍니다.
    - [펌웨어복구] 바로가기
    - [OpenCM9.04 펌웨어복구] 바로가기

3. 포트가 잡혀도 펌웨어 복구가 안될시

    - 다른 제품이나 위 사항을 확인 후에도 안될시 고객지원으로 연락을 주시거나 A/S 신청을 해주시기 바랍니다.

4. 포트가 안뜰시
    - [CM150, CM200 해결방법]{: .popup}
    - [OpenCM9.04 해결방법]


다른 제품이나 위 사항을 확인 후에도 안될시 고객지원으로 연락을 주시거나 A/S 신청을 해주시기 바랍니다.

# [펌웨어 관리](#펌웨어-관리)

## [펌웨어 업데이트](#펌웨어-업데이트)

펌웨어는 제어기에 설치되어 있는 프로그램을 말하며, tsk 프로그램을 실행하거나 제어기 관리 등의 역할을 담당하고 있습니다.

RoboPlus Manager는 인터넷을 통해 새 버전의 펌웨어를 자동으로 감지하여 항상 최신으로 유지시킵니다.

![img](/assets/images/sw/rplus1/manager/update_2.png)

1. 제어기와 연결되면 자동으로 제어기의 펌웨어를 검색하며 버전이 낮다면 업데이트 여부를 묻습니다.

   ![img](/assets/images/sw/rplus1/manager/update_5.png)

2.  '예(Y)'를 누르면 다음과 같이 제어기 펌웨어 업데이트 마법사를 시작합니다.

   ![img](/assets/images/sw/rplus1/manager/update_6.png)

3. 현재 연결된 제어기의 모델명과 펌웨어 버전을 확인할 수 있습니다.

   ![img](/assets/images/sw/rplus1/manager/update_7.png)

4. 다음을 누르면 펌웨어 업데이트를 시작합니다. 완료될 때 까지 전원이 꺼지거나 케이블이 빠지지 않도록 유의합니다.

   ![img](/assets/images/sw/rplus1/manager/update_8.png)

5. 제어기 펌웨어 설치 결과를 확인합니다.

   ![img](/assets/images/sw/rplus1/manager/update_9.png)

## [펌웨어 복구](#펌웨어-복구)

로보플러스 매니저는 제어기의 펌웨어에 문제가 있는 경우 이를 복구 할 수 있습니다. CM-150, CM-200 제어기의 경우 최신 로보플러스 매니저(1.0.31.0 이상 버전)에서만 복구가 지원 됩니다.

1. LN-101을 이용해서 제어기와 PC를 연결합니다.

    ![img](/assets/images/parts/controller/cm-200/cm_200_pc.jpg)

2. 제어기 펌웨어 복구 마법사 실행
  도구 모음의 제어기 복구 버튼을 눌러 제어기 펌웨어 마법사를 실행합니다. (CM150, CM-200의 경우 별도의 복구모드 진입과정이 있습니다. 아래 메세지를 참고하세요)

    ![img](/assets/images/sw/rplus1/manager/recovery_1.png)

    ![img](/assets/images/sw/rplus1/manager/cap_2013-12-13_13-12-36-391.png)

3. 제어기 연결 포트 선택  
  펌웨어를 인식하지 못하므로 제어기를 자동 검색할 수 없습니다. 따라서 사용자가 제어기가 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 제어기를 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오.

    제어기가 연결된 포트를 선택하고 찾기 버튼을 누르십시오.

    ![img](/assets/images/sw/rplus1/manager/recovery_3.png)

4. 제어기 전원 껐다 켜기 (CM-150, CM-200은 이과정이 생략됩니다.)

    제어기를 찾기 위해 복구할 제어기의 전원을 껐다가 켜십시오.

    ![img](/assets/images/sw/rplus1/manager/recovery_4.png)

5. 제어기 정보 확인  
  제어기를 찾으면 현재 제어기의 정보와 다운로드 할 펌웨어 정보가 나옵니다. 모델명이 사용자가 연결한 제어기가 맞는지 확인하십시오. (제어기 정보의 버전은 펌웨어 버전이 아니고 부트로더(Boot Loader)의 버전입니다.)

    ![img](/assets/images/sw/rplus1/manager/recovery_5.png)

6. 펌웨어 복구  
  다음 버튼을 클릭하면 펌웨어 복구를 시작합니다. 완료될 때까지 전원이 꺼지거나 케이블이 빠지지 않도록 주의하십시오.

    ![img](/assets/images/sw/rplus1/manager/recovery_7.png)

7. 제어기 펌웨어 복구 결과를 확인합니다.

    ![img](/assets/images/sw/rplus1/manager/recovery_8.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/ITpIY1lF2As" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

### [블루투스 통신을 이용한 제어기 펌웨어 복구](#블루투스-통신을-이용한-제어기-펌웨어-복구)

1. 블루투스 동글을 PC USB 포트에 연결 합니다.(CM-150, CM-200)  
  (블루투스 기능이 있는 노트북 사용자는 바로 3번 항목으로 진행하세요.)

2. 드라이버가 설치되는 동안 대기합니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_1.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_2.png)

3. 제어기에 BT-110A (또는 BT-210)을 연결하고 전원 버튼을 5초 동안 눌러 "뚜뚜뚜"(3회) 소리가 나면 손을 뗍니다.
4. BT-110A(또는 BT-210)의 파란 불이 켜져있는지 확인 합니다.
5. PC에서 주변의 블루투스 장치를 검색합니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_3.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_4.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_5.png)

6. 검색된 장치들의 ID로 제어기에 연결된 BT-110A(또는 BT-210)이 맞는지 확인 합니다.  
  (BT-110A(또는 BT-210)의ID는 모듈 윗면에 적혀 있습니다.)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_6.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_7.png)

7. 장치가 확인 되면 장치에 연결합니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_8.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_9.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_10.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_11.png)

8. COM 포트 번호를 기억합니다.(펌웨어 복구 시 필요합니다.)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_12.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_13.png)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_14.png)

9. 로보플러스 프로그램을 실행하고 매니저를 실행합니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_15.png)

10. 제어기 펌웨어 복구 마법사 실행

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_16.png)

11. 제어기 연결 포트 선택  
  STEP8에서 찾은 포트 번호를 선택하고 찾기 버튼을 누르십시오.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_17.png)

12. 제어기 정보 확인  
  제어기를 찾으면 현재 제어기의 정보가 나옵니다. 모델명이 사용자가 연결한 제어기가 맞는지 확인하십시오. (제어기 정보의 버전은 펌웨어 버전이 아니고 부트로더(Boot Loader)의 버전입니다.)

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_18.png)

13. 복구할 펌웨어 정보확인  
  제어기의 정보와 다운로드 할 펌웨어 정보가 나옵니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_19.png)

14. 펌웨어 복구  
  다음 버튼을 클릭하면 펌웨어 복구를 시작합니다. 완료될 때까지 전원이 꺼지거나 케이블이 빠지지 않도록 주의하십시오.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_20.png)

15. 제어기 펌웨어 복구 결과를 확인합니다.

    ![img](/assets/images/sw/rplus1/manager/fw_bluetooth_21.png)


# [테스트 및 설정](#테스트-및-설정)

## [제어기](#제어기)

### [CM-5](#cm-5)

로보플러스 매니저와 CM-5 제어기가 연결되면 다음과 같은 화면을 볼 수 있습니다.

![img](/assets/images/sw/rplus1/manager/cm5_roboplusmanager.png)

왼쪽 창에서는 제어기와 제어기에 연결된 주변장치 목록을 확인할 수 있으며, 오른쪽 창에서는 제어기 관리창을 확인할 수 있습니다.  
제어기의 펌웨어가 로보플러스 매니저가 가지고있는 펌웨어 버전보다 낮다면, 제어기의 펌웨어를 업데이트 할 수 있습니다. ([제어기 펌웨어 업데이트] 참조)

#### 일반/상세 검색

{% include kr/software/rplus1/general_detail_search.md %}

#### Aux LED

{% include kr/software/rplus1/aux_led.md %}

#### 버튼

{% include kr/software/rplus1/button.md %}

#### 타이머

{% include kr/software/rplus1/timer.md %}

#### 상대 로봇 무선 ID

{% include kr/software/rplus1/remocon_id.md %}

#### 내 로봇 무선 ID

{% include kr/software/rplus1/my_id.md %}

### [CM-510](#cm-510)

로보플러스 매니저와 CM-510 제어기가 연결되면 다음과 같은 화면을 볼 수 있습니다.

![img](/assets/images/sw/rplus1/manager/cm510_roboplusmanager.png)

왼쪽 창에서는 제어기와 제어기에 연결된 주변장치 목록을 확인할 수 있으며, 오른쪽 창에서는 제어기 관리창을 확인할 수 있습니다.  
제어기의 펌웨어가 로보플러스 매니저가 가지고있는 펌웨어 버전보다 낮다면, 제어기의 펌웨어를 업데이트 할 수 있습니다. [(제어기 펌웨어 업데이트] 참조)

#### 일반/상세 검색

{% include kr/software/rplus1/general_detail_search.md %}

#### Aux LED

{% include kr/software/rplus1/aux_led.md %}

#### 버튼

{% include kr/software/rplus1/button.md %}

#### 타이머

{% include kr/software/rplus1/timer.md %}

#### 상대 로봇 무선 ID

{% include kr/software/rplus1/remocon_id.md %}

#### 내 로봇 무선 ID

{% include kr/software/rplus1/my_id.md %}

#### 제어기 버저 종류

{% include kr/software/rplus1/buzzer_index.md %}

#### 제어기 버저 울림 시간

{% include kr/software/rplus1/buzzer_time.md %}

#### 제어기 소리 감지 횟수

{% include kr/software/rplus1/sound_count.md %}

#### 제어기 현재 소리 감지 횟수

{% include kr/software/rplus1/current_sound.md %}

#### 제어기 외부 I/O

{% include kr/software/rplus1/ext_io_device.md %}

### [CM-530](#cm-530)

로보플러스 매니저와 CM-530 제어기가 연결되면 다음과 같은 화면을 볼 수 있습니다.

![img](/assets/images/sw/rplus1/manager/cm530_roboplusmanager.jpg)

왼쪽 창에서는 제어기와 제어기에 연결된 주변장치 목록을 확인할 수 있으며, 오른쪽 창에서는 제어기 관리창을 확인할 수 있습니다.  
제어기의 펌웨어가 로보플러스 매니저가 가지고있는 펌웨어 버전보다 낮다면, 제어기의 펌웨어를 업데이트 할 수 있습니다. [제어기 펌웨어 업데이트] 참조)

#### 일반/상세 검색

{% include kr/software/rplus1/general_detail_search.md %}

#### Aux LED

{% include kr/software/rplus1/aux_led.md %}

#### 버튼

{% include kr/software/rplus1/button.md %}

#### 타이머

{% include kr/software/rplus1/timer.md %}

#### 정밀타이머

{% include kr/software/rplus1/high_resolution_timer.md %}

#### 상대 로봇 무선 ID

{% include kr/software/rplus1/remocon_id.md %}

#### 내 로봇 무선 ID

{% include kr/software/rplus1/my_id.md %}

#### 제어기 버저 종류

{% include kr/software/rplus1/buzzer_index.md %}

#### 제어기 버저 울림 시간

{% include kr/software/rplus1/buzzer_time.md %}

#### 제어기 소리 감지 횟수

{% include kr/software/rplus1/sound_count.md %}

#### 제어기 현재 소리 감지 횟수

{% include kr/software/rplus1/current_sound.md %}

#### 제어기 외부 I/O

{% include kr/software/rplus1/ext_io_device.md %}

### [CM-700](cm-700)

#### 일반/상세 검색

{% include kr/software/rplus1/general_detail_search.md %}

#### Aux LED

{% include kr/software/rplus1/aux_led.md %}

#### 타이머

{% include kr/software/rplus1/timer.md %}

#### 상대 로봇 무선 ID

{% include kr/software/rplus1/remocon_id.md %}

#### 내 로봇 무선 ID

{% include kr/software/rplus1/my_id.md %}

#### 제어기 외부 I/O

{% include kr/software/rplus1/ext_io_device.md %}


## [다이나믹셀](#다이나믹셀)

**참고**: `액츄에이터`는 다이나믹셀 중 모터를 말합니다. 액츄에이터의 종류는 AX, DX, RX, EX, MX, X, PRO 시리즈 등이 있으며, 제어기의 종류에 따라 연결할 수 있는 액츄에이터가 다를 수 있습니다.
{: .notice}

`AX-S1`은 여러가지 센서가 내장되어 있으며, 로보플러스 매니저를 통해 값을 확인하거나 기능을 설정할 수 있습니다.
{: .notice}

`적외선 센서 어레이`는 버저와 7개의 적외선센서가 내장되어 있으며, 로보플러스 매니저를 통해 값을 확인하거나 기능을 설정할 수 있습니다.
{: .notice}

액츄에이터의 테스트 및 설정을 위한 화면은 다음과 같습니다.

![img](/assets/images/sw/rplus1/manager/fig01.png)

- 제어기 관리 화면에서 Scan이나 Search기능으로 검색된 다이나믹셀 목록입니다. 액츄에이터 뿐만 아니라 AX-S1 등의 센서류 등 제어기에 연결된 장치를 확인할 수 있습니다.
- 왼쪽 목록에 나열된 하나의 액츄에이터를 클릭하면, 해당 액츄에이터를 관리할 수 있습니다.
- 각 장치에서 테스트 및 설정이 가능한 테이블을 볼 수 있습니다. 각 행을 클릭하여 사용자가 손쉽게 테스트 및 설정을 할 수 있는 보조 창을 호출할 수 있습니다. 보조창은 의미를 파악하기 어려운 수치값을, 사용자가 알아보기 쉽게 표현 해 주거나 설정을 쉽게 할 수 있도록 도와줍니다.
- 위 화면은 '이동 속도'행을 클릭했을 경우 나타나는 화면입니다. 이동 속도 뿐만 아니라 각 행을 클릭했을 때 왼쪽 아래에 적절한 보조 창이 호출됩니다. 다만, 단순히 수치만을 표현하는 경우 보조 창이 뜨지 않을 수 있습니다.

**참고**: ① 위치의 ID를 가진 액츄에이터를 더블 클릭하면, 해당 ID를 가진 액츄에이터가 선택됨과 동시에 해당 액츄에이터의 LED가 잠시 깜박거립니다. 현재 관리하고 있는 액츄에이터 위치를 확인할 때 간단히 사용할 수 있습니다.
{: .notice}

**참고**: 액츄에이터는 그룹 관리를 할 수 있습니다.
{: .notice}

### [ID 설정](#id-설정)

다이나믹셀은 고유 ID를 가지고 있으며, 제어기는 ID를 기준으로 각각의 다이나믹셀을 제어합니다. 이 명령을 통해 다이나믹셀의 ID를 관리할 수 있습니다.  
([ID 바꾸기] 설명을 참고하세요.)

[ID 바꾸기]: /docs/kr/edu/bioloid/beginner/#다이나믹셀-관리하기

#### 파라미터 속성

- 값을 설정하면, 전원을 차단해도 설정값이 저장됩니다.
- ID목록을 클릭하면 현재 바꿀 수 있는 ID 리스트를 확인할 수 있습니다.
- ID리스트에 나타나지 않는 값은 다른 다이나믹셀에서 사용하고 있는 ID입니다.
- ID는 제어기의 고유 ID인 200을 제외한 0~253까지 설정할 수 있습니다.

### [위치 제한과 모드](#위치-제한과-모드)

액츄에이터의 위치 제한을 하거나, 동작 모드를 설정할 수 있습니다.  
([동작모드 바꾸기] 설명을 참고하세요.)

[동작모드 바꾸기]: /docs/kr/edu/bioloid/beginner/#다이나믹셀-관리하기

#### 파라미터 속성

- 값을 설정하면, 전원을 차단해도 설정값이 저장됩니다.
- 순방향과 역방향의 위치 제한값을 설정할 수 있으며, 목표 위치값이 이 설정값에 따라 영향을 받습니다.
- 설정값에 따른 실제 각도를 확인할 수 있습니다.

### [동작 모드](#동작-모드)

[동작모드 바꾸기] 설명을 참고하세요.

[동작모드 바꾸기]: /docs/kr/edu/bioloid/beginner/#다이나믹셀-관리하기

- 바퀴 모드
  - CW 위치 제한 값과 CCW 위치 제한 값을 모두 0 으로 설정하면 바퀴 모드(무한 회전 모드)로 동작합니다.
  - 바퀴 모드 버튼을 누르면 자동으로 위치 제한 값에 0 이 입력됩니다.
- 관절 모드
  - 바퀴 모드 이외의 경우 관절 모드로 동작합니다.

### [온도 설정](#온도-설정)

다이나믹셀의 동작 한계 온도 기준값을 설정할 수 있습니다.

#### 파라미터 속성

- 값을 설정하면, 전원을 차단해도 설정값이 저장됩니다.
- 설정값에 따른 실제 온도를 확인할 수 있습니다.
- 액츄에이터의 경우 온도가 한계 온도값을 넘어서면 LED 알람 설정 및 셧다운 설정 상태에 따라, LED를 깜박이거나 자동으로 동작을 멈출 수 있습니다.
- 특별한 이유가 없다면, 동작 한계 온도는 기본값을 사용하는 것이 좋습니다.

### [현재 온도](#현재-온도)

다이나믹셀의 현재 온도값을 읽어올 수 있습니다.

#### 파라미터 속성

- 다이나믹셀의 현재 온도를 실시간으로 반영합니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [온도]

[온도]: /docs/kr/software/rplus1/task/programming_02/#온도

### [전압 설정](#전압-설정)

다이나믹셀의 동작 한계 전압 범위를 설정할 수 있습니다.

#### 파라미터 속성

- 값을 설정하면, 전원을 차단해도 설정값이 저장됩니다.
- 설정값에 따른 실제 전압을 확인할 수 있습니다.
- 설정할 수 있는 전압 값은 최대 한계 전압과 최소 한계 전압 2가지 입니다.
- 액츄에이터의 경우 전압이 설정 범위를 넘어서면 LED 알람 설정 및 셧다운 설정 상태에 따라, LED를 깜박이거나 자동으로 동작을 멈출 수 있습니다.
- 특별한 이유가 없다면, 동작 한계 전압은 기본값을 사용하는 것이 좋습니다.

### [현재 전압](#현재-전압)
다이나믹셀의 현재 전압값을 읽어올 수 있습니다.

#### 파라미터 속성
- 다이나믹셀의 현재 전압을 실시간으로 반영합니다.

#### RoboPlus Task 참고 명령어
- 파라미터 : [전압]

[전압]: /docs/kr/software/rplus1/task/programming_02/#전압

### [알람 & 셧다운 설정](#알람--셧다운-설정)
특정 상황에서 LED 알람 및 셧다운 동작 여부를 설정할 수 있습니다.

#### 파라미터 속성

- 값을 설정하면, 전원을 차단해도 설정값이 저장됩니다.
- 액츄에이터의 경우 셧다운 설정을 통해 사용자 설정에 따라 동작을 자동으로 멈추게 할 수 있습니다.
- 셧다운 설정을 통해 과전류, 과열, 동작범위 이탈 등 여러 상황에서 동작을 멈추게 함으로써 다이나믹셀을 보호합니다.
- 다음과 같은 상황에서 사용자에게 LED를 이용한 알람 신호를 발생하거나 셧다운 동작을 실행 합니다.
  - Instruction Error : 잘못된 명령을 받았을 경우
  - OverLoad Error : 액츄에이터가 받는 힘이 힘 조절값을 초과했을 경우
  - Checksum Error : 받은 명령에 체크섬 오류가 있을 경우
  - Range Error : 액츄에이터 위치 사용 범위를 초과한 명령을 받은 경우
  - Overheating Error : 현재 액츄에이터 상태가 한계 설정 온도를 초과했을 경우
  - Angle Limit Error : 위치 제한값을 벗어난 경우
  - Input Voltage Error : 입력 전압이 한계 전압값 범위를 벗어난 경우

### [모터 켜기](#모터-켜기)

액츄에이터를 켜거나 끌 수 있습니다.

#### 파라미터 속성

- 값이 0이면 액츄에이터 토크가 꺼져있는 상태이며, 1이면 토크가 켜져있는 상태입니다.
- 켜짐/꺼짐 명령을 통해 간단히 토크를 켜거나 끌 수 있습니다.
- 액츄에이터 토크가 켜져있지 않은 상태에서 목표 위치를 설정하면, 액츄에이터 토크가 켜짐과 동시에 값이 1로 설정됩니다.

####  RoboPlus Task 참고 명령어

- 파라미터 : [모터 켜기]
- 상수 : 참/거짓

[모터 켜기]: /docs/kr/software/rplus1/task/programming_02/#모터-켜기

### [LED](#led)

다이나믹셀의 LED를 켜거나 끌 수 있습니다.

#### 파라미터 속성

- 값이 0이면 LED가 꺼져있는 상태이며, 1이면 켜져있는 상태입니다.
- 켜짐/꺼짐 명령을 통해 간단히 LED를 켜거나 끌 수 있습니다.
- LED 알람이 발생했을 때는 제어되지 않습니다.

####  RoboPlus Task 참고 명령어

- 파라미터 : [LED]
- 상수 : 참/거짓

[LED]: /docs/kr/software/rplus1/task/programming_02/#led

### [Compliance Margin 설정](#compliance-margin-설정)
액츄에이터의 Compliance Margin값을 설정할 수 있습니다.

#### 파라미터 속성

- 값을 설정하면, 목표위치를 중심으로 토크가 걸리지 않는 구간이 생기게 됩니다.
- Compliance Slope과 힘 조절, Compliance Margin을 적절한 값으로 설정하면 좀 더 부드러운 동작이 가능합니다.

#### RoboPlus Task 참고 명령어
- 파라미터 : [CW/CCW Margin]

[CW/CCW Margin]: /docs/kr/software/rplus1/task/programming_02/#cwccw-margin

### [Compliance Slope 설정](#compliance-slope-설정)
액츄에이터의 Compliance Slope값을 설정할 수 있습니다.

#### 파라미터 속성
- CW/CCW 방향 별로 존재하며 목표 위치 근처에서 출력의 정도를 설정합니다.
- 낮은 값을 설정하면 목표위치까지 거의 힘을 줄이지 않고 다가가며, 높은 값을 설정하면 목표위치에 도달할 수록 힘을 줄이면서 다가갑니다.
- 낮은 값을 설정하면 목표위치에서 벗어나지 않으려고 최대의 힘으로 저항을 합니다.
- 높은 값을 설정해도 목표위치에서 너무 많이 벗어나면 점점 최대 힘으로 저항을 합니다.
- Compliance Slope 는 입력되는 Data 값의 범위에 따라 총 7 단계의 Data 대표 값으로 바뀌어 적용됩니다. 즉, Data 값으로 25 를 넣더라도 실제로는 Data 대표값인 16 이 사용됩니다.

| 단계 | Data 값             | Data 대표 값 |
| ----| ------------------- | ---------- |
| 1   | 0 (0x00) ~ 3(0x03)  | 2 (0x02)   |
| 2   | 4(0x04) ~ 7(0x07)   | 4 (0x04)   |
| 3   | 8(0x08)~15(0x0F)    | 8 (0x08)   |
| 4   | 16(0x10)~31(0x1F)   | 16 (0x10)  |
| 5   | 32(0x20)~63(0x3F)   | 32 (0x20)  |
| 6   | 64(0x40)~127(0x7F)  | 64 (0x40)  |
| 7   | 128(0x80)~254(0xFE) | 128 (0x80) |

- Compliance Slope과 힘 조절, Compliance Margin을 적절한 값으로 설정하면 좀 더 부드러운 동작이 가능합니다.

#### RoboPlus Task 참고 명령어
- 파라미터 : [CW/CCW Slope]

[CW/CCW Slope]: /docs/kr/software/rplus1/task/programming_02/#cwccw-slope

### [목표 위치](#목표-위치)

액츄에이터의 목표 위치값을 설정할 수 있습니다.

#### 파라미터 속성

- 조그 다이얼을 이용하여 목표 위치값을 설정할 수 있습니다.
- 설정 즉시 목표 위치로 이동을 시작합니다.
- 이동 속도, 위치 제한, Compliance Slope, Compliance Margin값에 영향을 받습니다.
- 토크가 꺼져있어도 값을 설정하는 즉시 토크가 켜집니다.
- Center Position 버튼을 누르면 중앙값으로 설정됩니다.

####  RoboPlus Task 참고 명령어

- 파라미터 : [목표 위치]
- 상수 : 위치 값

[목표 위치]: /docs/kr/software/rplus1/task/programming_02/#목표-위치

### [이동 속도](#이동-속도)

액츄에이터의 이동 속도값을 설정할 수 있습니다.

#### 파라미터 속성

- 액츄에이터의 동작 모드가 관절 모드일 때, 이동 속도는 구간에 따라 Compliance Slope, Compliance Margin값에 영향을 받습니다.
- 액츄에이터의 동작 모드가 관절 모드일 때, 이동 속도를 0으로 설정하면 최대 속도로 움직입니다.
- 액츄에이터의 동작 모드가 무한 회전 모드일 때, 이동 속도 설정값에 따라 회전 방향과 속도가 바뀌게 됩니다.
- 동작 모드는 위치 제한값을 설정하여 바꿀 수 있습니다.
- 동작 모드에 따라 이동 속도를 설정할 수 있는 컨트롤이 다르게 나타납니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [이동 속도]
- 상수 : 모터 제어 값

[이동 속도]: /docs/kr/software/rplus1/task/programming_02/#이동-속도

### [힘 조절](#힘-조절)
액츄에이터의 최대 부하량을 설정할 수 있습니다.

#### 파라미터 속성

- 힘 조절 설정값 및 LED 알람 설정, 셧다운 설정값에 따라 LED 알람이 발생하거나, 동작이 자동으로 정지할 수 있습니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [힘 조절]

[힘 조절]: /docs/kr/software/rplus1/task/programming_02/#힘-조절

### [현재 위치](#현재-위치)

액츄에이터의 현재 위치값을 읽어올 수 있습니다.

#### 파라미터 속성

- 액츄에이터의 움직임에 따라 실시간으로 값이 반영됩니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [현재 위치]

[현재 위치]: /docs/kr/software/rplus1/task/programming_02/#현재-위치

### [현재 속도](#현재-속도)

액츄에이터의 현재 속도값을 읽어올 수 있습니다.

#### 파라미터 속성

- 액츄에이터의 움직임에 따라 실시간으로 값이 반영됩니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [현재 속도]

[현재 속도]: /docs/kr/software/rplus1/task/programming_02/#현재-속도

### [현재 하중](#현재-하중)

액츄에이터의 현재 하중값을 읽어올 수 있습니다.

#### 파라미터 속성

- 액츄에이터의 움직임에 따라 실시간으로 값이 반영됩니다.
- 모터가 꺼져있는 경우의 값은 의미가 없습니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [현재 하중]

[현재 하중]: /docs/kr/software/rplus1/task/programming_02/#현재-하중

### [움직임 유무](#움직임-유무)

액츄에이터의 움직임 유무를 읽어올 수 있습니다.

#### 파라미터 속성

- 값이 0이면 움직이지 않는 상태이고, 1이면 움직이는 상태입니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [움직임 유무]

[움직임 유무]: /docs/kr/software/rplus1/task/programming_02/#움직임-유무

### [소모 전류량](#소모-전류량)

EX 액츄에이터의 현재 소모 전류량을 알 수 있습니다.

#### 파라미터 속성

- 값이 512일 경우에 소모하는 전류는 0암페어이며, 전류가 흐르지 않고 있다는 것을 의미합니다.
- 데이터가 512보다 클 경우에는 모터를 시계방향으로 돌리는 전류가 흐르고 있다는 것이며 전류의 크기는 데이터의 크기와 비례합니다. (값 단위  1 = 약 10mA)
- 예를 들어 데이터가 612 일 경우 (612-512=100 => 100x10mA = 1,000mA) 1A 전류가 모터를 시계방향으로 돌리고 있다는 것을 의미합니다.
- 데이터가 512보다 작을 경우에는 모터를 반 시계방향으로 돌리는 전류가 흐르고 있다는 전류의 크기는 데이터의 크기와 반비례합니다. (값 단위 1 = 약 10mA)
- 예를 들어 데이터가 312일 경우 (512-312= -200 => 200x10mA=1,000mA) 2A 의 전류가 모터를 반시계방향으로 돌리고 있다는 것을 의미합니다.

### [PID gain](#pid-gain)

다이나믹셀의 PID 값을 읽고 쓸 수 있습니다.

#### 파라미터 속성

- P Gain은 Propotional Gain값 입니다.
- I Gain은 Integral Gain값 입니다.
- D Gain은, Derivative Gain값 입니다.
- 값의 범위는 0 ~ 254 입니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [PID gain]

[PID Gain]: /docs/kr/software/rplus1/task/programming_02/#pid-제어

### [적외선 거리 감지](#적외선-거리-감지)

`AX-S1`의 적외선 거리 센서값을 읽어올 수 있습니다.

#### 파라미터 속성

- AX-S1의 현재 적외선 거리 센서값을 읽어올 수 있습니다.
- 실제로는 적외선의 반사도를 측정하는 것이며, 같은 거리라 하더라도 반사되는 물체, 조명, 외부 상황 등에 따라 값이 바뀔 수 있습니다.
- 값의 범위는 0~255입니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [왼쪽/중앙/오른쪽 거리센서값]

[왼쪽/중앙/오른쪽 거리센서값]: /docs/kr/software/rplus1/task/programming_02/#거리센서-값

### [조명 감지](#조명-감지)

`AX-S1`의 조명 밝기값을 읽어올 수 있습니다.

#### 파라미터 속성

- AX-S1의 현재 조명 밝기값을 읽어올 수 있습니다.
- 촛불이나 전구 등 근거리의 조명에서 나오는 적외선을 측정할 수 있습니다.
- 값의 범위는 0~255입니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [왼쪽/중앙/오른쪽 조명 밝기]

[왼쪽/중앙/오른쪽 조명 밝기]: /docs/kr/software/rplus1/task/programming_02/#조명-밝기

### [물체 감지](#물체-감지)

물체 감지 유무를 판단할 수 있습니다.

#### 파라미터 속성

- AX-S1의 적외선 센서값이 물체 감지 기준값을 넘어서는 경우, 값의 특정 비트를 1로 설정 해줍니다.
- 각각 0비트는 좌측, 1비트는 중앙, 2비트는 우측 센서에 물체가 감지되었음을 나타냅니다.
- 값은 각 비트의 조합으로 나타내어 집니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [물체 감지]
- 상수 : 2진수 숫자

[물체 감지]: /docs/kr/software/rplus1/task/programming_02/#물체감지

### [물체 감지 기준값](#물체-감지-기준값)

물체 감지 기준값을 설정할 수 있습니다.

#### 파라미터 속성

- 물체 감지 유무를 판단하는 기준값을 설정합니다.
- 값의 범위는 0 ~ 255입니다.
- 근거리 감지 모드와 원거리 감지 모드가 있습니다.
- 거리 감지 기준값을 0으로 설정하면 근거리 감지 모드로 동작하게 됩니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [물체 감지 기준값]

[물체 감지 기준값]: /docs/kr/software/rplus1/task/programming_02/#물체감지-기준값

### [조명 감지](#조명-감지)

조명 감지 유무를 판단할 수 있습니다.

#### 파라미터 속성

- AX-S1의 적외선 센서값이 조명 감지 기준값을 넘어서는 경우, 값의 특정 비트를 1로 설정 해줍니다.
- 각각 0비트는 좌측, 1비트는 중앙, 2비트는 우측 센서에 조명이 감지되었음을 나타냅니다.
- 값은 각 비트의 조합으로 나타내어 집니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [조명 감지]
- 상수 : 2진수 숫자

[조명 감지]: /docs/kr/software/rplus1/task/programming_02/#조명감지

### [조명 감지 기준값](#조명-감지-기준값)

조명 감지 기준값을 설정할 수 있습니다.

#### 파라미터 속성

- 조명 감지 유무를 판단하는 기준값을 설정합니다.
- 값의 범위는 0 ~ 255입니다.

#### RoboPlus Task 참고 명령어

파라미터 : [조명 감지 기준값]

[조명 감지 기준값]: /docs/kr/software/rplus1/task/programming_02/#조명감지-기준값

### [소리 크기](#소리-크기)

현재 감지되는 소리 크기를 확인할 수 있습니다.

#### 파라미터 속성

- AX-S1의 현재 감지되고 있는 소리 크기를 읽어옵니다.
- 소음이 없을 때는 기본적으로 127 근처의 값이 읽어지며, 소리가 커질 수록 소리 크기값의 변화폭이 커집니다.
- (큰소리가 날 수록 127값을 중심으로, 0과 255근처로 크게 진동하게 됩니다.)
- '소리 크기'값은 0 ~ 255 사이의 숫자를 사용합니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [소리 크기]

[소리 크기]: /docs/kr/software/rplus1/task/programming_02/#소리-크기

### [최대 소리 크기](#최대-소리-크기)

감지된 최대 소리 크기를 확인할 수 있습니다.

#### 파라미터 속성

- AX-S1에서 감지된 최대 소리 크기를 읽어옵니다.
- 소리 크기가 최대 소리 크기 값을 넘어서는 경우, 소리 크기값을 최대 소리 크기값으로 복사를 하게 됩니다.
- '최대 소리 크기'값은 0 ~ 255 사이의 숫자를 사용합니다.
- 최대 소리 크기는 자동으로 초기화 되지 않기 때문에 사용자가 직접 0 으로 초기화 해 주어야 합니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [최대 소리 크기]

[최대 소리 크기]: /docs/kr/software/rplus1/task/programming_02/#최대-소리-크기

### [소리 감지 횟수](#소리-감지-횟수)

AX-S1은 일정 수준 이상의 큰 소리가 날 경우 1회씩 카운트 해 주는 기능이 있습니다. 대표적인 예로 박수 소리의 횟수를 카운트 하는 것이 가능합니다. 이 때 감지된 소리의 횟수 값을 읽어오거나 초기화할 수 있습니다.

#### 파라미터 속성

- '소리감지 횟수'는 0 ~ 255 사이의 숫자를 사용합니다.
- 연속적인 소리의 입력이 멈추어야 '소리감지 횟수' 파라미터에 현재까지 감지된 소리의 횟수 값이 입력됩니다.
- 소리감지 횟수는 자동으로 초기화 되지 않기 때문에 소리감지를 시작하기 전에 사용자가 직접 0 으로 초기화 해 주어야 합니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [소리 감지 횟수]

[소리 감지 횟수]: /docs/kr/software/rplus1/task/programming_02/#소리감지-횟수

### [버저 음계](#버저-음계)

`AX-S1`에는 버저가 장착되어 있습니다. 버저 음계를 설정할 수 있습니다.

#### 파라미터 속성

- 버저 울림 시간을 설정하고, 버저 음계를 설정하면 음계에 따른 비프음을 낼 수 있습니다.
- 음계값은 0에서 51까지의 값을 사용합니다.
- 특수 멜로디 값은 0에서 26까지의 값을 사용합니다.
- 음계, 혹은 특수멜로디는 버저 울림 시간 설정값에 따라 선택됩니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [버저 음계]

[버저 음계]: /docs/kr/software/rplus1/task/programming_02/#부저-음계

### [버저 울림 시간](#버저-울림-시간)

AX-S1에는 버저가 장착되어 있습니다. 버저 울림 시간을 설정할 수 있습니다.

#### 파라미터 속성

- 버저 울림 시간을 설정하고, 버저 음계를 설정하면 음계에 따른 비프음을 낼 수 있습니다.
- 0에서 50까지의 값을 사용하며, 1의 값은 0.1초와 같습니다.
- 254의 값으로 설정하면, 소리가 멈추지 않고 계속 울리게 됩니다.
- 255의 값으로 설정하면 특수 멜로디 연주 상태로 설정이 됩니다.
- 멜로디 연주가 끝나면 버저 울림 시간은 0으로 초기화 됩니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [버저 울림 시간]

[버저 울림 시간]: /docs/kr/software/rplus1/task/programming_02/#부저-울림시간

### [1~7번 적외선 센서 값](#17번-적외선-센서-값)

`적외선 센서 어레이`의 적외선 센서값을 읽어올 수 있습니다.

#### 파라미터 속성

- 적외선 센서 어레이의 현재 적외선 센서값을 읽어올 수 있습니다.
- 적외선 센서 어레이에 있는 적외선 수광부 센서에서 반사되는 적외선의 양을 측정한 것으로, 벽이나 물체가 가까이 있을수록, 물체 표면의 색이 밝을 수록 높은 값으로 측정됩니다.
- 값의 범위는 0~1023입니다.

#### RoboPlus Task 참고 명령어

- 파라미터 : [적외선 센서값]

[적외선 센서값]: /docs/kr/software/rplus1/task/programming_02/#적외선-센서-값

### [감지 기준값 자동설정](#감지-기준값-자동설정)

`적외선 센서 어레이`의 검은 색 감지 기준값 자동 찾기의 시작/마침 을 설정할 수 있습니다.

#### 파라미터 속성

- 켜짐을 누르면 LED가 깜박이며 감지기준값 설정으로 들어갑니다.
- 흰색과 검은색을 교차시키며 적외선센서를 감지시키면 자동으로 기준값이 설정 됩니다.
- 꺼짐을 누르면 종료합니다.

  ![img](/assets/images/sw/rplus1/manager/ir_array_auto_setting.png)

#### RoboPlus Task 참고 명령어

파라미터 : [감지 기준값 자동 설정]

[감지 기준값 자동 설정]: /docs/kr/software/rplus1/task/programming_02/#감지-기준값-자동설정

### [적외선 물체 감지 유무](#적외선-물체-감지-유무)

`적외선 센서 어레이`의 물체 감지 기준 값에서 지정된 거리 값 이내로 물체가 감지되었는지 유/무를 판단하기 위해 사용하는 파라미터입니다.

#### 파라미터 속성

- 적외선 센서 어레이의 각 적외선 센서의 감지 값이 검은 색 감지 기준값보다 작으면 검은 색을 감지하였다고 판단하여 아래와 같이 검은 색 감지 유무값의 특정 Bit을 1로 셋팅해 줍니다. 동시에 해당 LED가 켜집니다.

- 10진수 값 으로 각 감지값이 더해진 형태로 출력됩니다.

| 2 진수 값  | 10 진수 값 | 검은색 감지 유무          |
| ------- | ------- | ------------------ |
| 0000001 | 1       | 1번 적외선 센서에 검은 색 감지 |
| 0000010 | 2       | 2번 적외선 센서에 검은 색 감지 |
| 0000100 | 4       | 3번 적외선 센서에 검은 색 감지 |
| 0001000 | 8       | 4번 적외선 센서에 검은 색 감지 |
| 0010000 | 16      | 5번 적외선 센서에 검은 색 감지 |
| 0100000 | 32      | 6번 적외선 센서에 검은 색 감지 |
| 1000000 | 64      | 7번 적외선 센서에 검은 색 감지 |

#### RoboPlus Task 참고 명령어

- 파라미터 : [적외선 물체 감지 유무]

[적외선 물체 감지 유무]: /docs/kr/software/rplus1/task/programming_02/#적외선-물체감지

### [적외선 감지 기준값](#적외선-감지-기준값)

`적외선 센서 어레이`가 흰 색/검은 색을 판단하는 기준값입니다.

#### 파라미터 속성

- 적외선 물체 감지 유무를 판단하는 기준값을 개별 설정할 수 있습니다.
- 감지 기준값 자동 설정 파라미터를 이용 하면 전체적으 로 기준을 설정할 수 있습니다.
- 값의 범위는 0 ~ 1023입니다.

  ![img](/assets/images/sw/rplus1/manager/ir_array_threshold.png)

## [ZIG2Serial](#zig2serial)

로보 플러스 매니저에서 Zig2Serial을 이용하여 Zig-100모듈을 관리할 수 있습니다. 관리 방법은 다음과 같습니다.

1. 먼저 Zig2Serial에 Zig-100을 장착한 후, PC의 시리얼 포트를 Zig2Serial과 연결합니다. ([Zig2Serial - Zig100 연결하기])  
  다음 그림과 같이 시리얼 포트가 없는 경우 USB2DYNAMIXEL을 이용할 수 있습니다.

    ![img](/assets/images/sw/rplus1/manager/zig2serial_u2d.png)

2. Zig2Serial이 연결된 포트를 선택하고 Zig2Serial 관리 아이콘을 클릭합니다.   (제어기와 달리 자동 찾기가 되지 않습니다.)

     ![img](/assets/images/sw/rplus1/manager/zig2serial_inite.png)

3. Zig2Serial 관리 아이콘을 클릭하면 다음과 같은 화면을 볼 수 있습니다. "Zigbee 설정" 버튼을 클릭합니다.

     ![img](/assets/images/sw/rplus1/manager/zig2serial_manage.png)

4. OK버튼을 누른 후 3초 이내에 리셋 버튼을 누르십시오.

     ![img](/assets/images/sw/rplus1/manager/zig2serial_connection.png)

5. Zigbee모듈이 정상적으로 인식되면 다음과 같은 화면을 볼 수 있으며, 기능을 설정할 수 있습니다.
    - 현재 내 ID와 상대 ID를 확인할 수 있습니다.
    - 상대 ID를 바꿀 수 있습니다.
    - Broadcast 모드를 설정할 수 있습니다.
    - Wait 모드를 설정할 수 있습니다.

    ![img](/assets/images/sw/rplus1/manager/zig2serial_setting.png)

6. 만약 Zig100모듈을 찾지 못한 경우, 모듈이 정상적으로 연결되었는지 확인 해 보십시오.

    ![img](/assets/images/sw/rplus1/manager/zig2serial_connection_fail.png)

    - 다른 무선 통신 모듈과 데이터를 주고 받을 수 있으며, RC-100 리모컨 신호를 생성 및 전송할 수 있습니다.


 <iframe width="640" height="360" src="https://www.youtube.com/embed/YgebCObXJZg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

[업데이트 및 복구 기능]: #펌웨어-복구
[테스트 기능]: #다이나믹셀
[제어기 정보]: /docs/kr/parts/controller/controller_compatibility/
[제어기별 관리방법]: #제어기
[펌웨어복구]: #펌웨어-복구
[OpenCM9.04 펌웨어복구]: /docs/kr/software/opencm_ide/getting_started/#복구-모드
[CM150, CM200 해결방법]: /docs/kr/popup/usb_driver_install/
[OpenCM9.04 해결방법]: /docs/kr/software/opencm_ide/getting_started/#소프트웨어-설치
[제어기 펌웨어 업데이트]: #펌웨어-업데이트
[Zig2Serial - Zig100 연결하기]: /docs/kr/parts/communication/zig2serial/#사용-방법
