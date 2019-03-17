---
layout: archive
lang: kr
ref: info
read_time: true
share: false
author_profile: false
permalink: /docs/kr/edu/info/
sidebar:
  title: 실과로봇
  nav: "info"
---

# [개요](#개요)

로보티즈 실과로봇은 우수한 로봇기술과 교육 노하우를 바탕으로 만든 초등학교 실과 교육용 로봇 키트입니다.  

기존 소프트웨어 중심의 단순한 프로그래밍 수업의 한계를 벗어나 로봇과 스마트기기의 다양한 상호작용을 통해 로보플러스 태스크, 엔트리 코딩 프로그램으로 능동적인 자기주도 학습이 가능한 로봇/코딩교육 솔루션입니다.  
실과로봇에는 스마트 기기와 무선 통신이 가능한 블루투스 모듈이 포함되어 있습니다. 또한 적외선 센서, 컬러 센서, 서보 모터, 감속 모터 등이 포함되어 다양한 하드웨어 장치를 구현할 수 있습니다.  
12가지의 예제별 코딩 학습을 통해 로봇의 동력과 전기, 무게중심의 이해, 힘의 변환과 전달, 6족 보행 로봇의 기본 개념 등의 원리를 재미있게 학습할 수 있습니다.  

학습을 통하여 자동문의 작동원리, 스쿠터의 조향 장치, 로봇청소기 등을 구현하여 생활 속 장치의 필요성, DIY의 제작 등의 수업을 할 수 있고 스마트기기로 코딩이 가능한 로보플러스 태스크와 PC환경의 엔트리로 다양한 기기에서의 코딩을 통한 프로그램 학습, 응용하기 등의 과정을 제공합니다.

# [부품 목록](#부품-목록)

![](/assets/images/edu/info/info_partlist_01.jpg)

![](/assets/images/edu/info/info_partlist_02.jpg)

- [제어기(OpenCM7.0 B-Type)]
- [감속 모터]
- [서보 모터]
- [LED 모듈]
- [적외선 센서]
- [컬러 센서]

# [엔트리로 작동하기](#엔트리로-작동하기)

## [엔트리 설치하기](#엔트리-설치하기)

엔트리는 누구나 무료로 소프트웨어 교육을 받을 수 있는 플랫폼입니다.  
학생들이 소프트웨어를 쉽고 재미있게 학습하고, 선생님들은 효과적으로 학생들을 가르칠 수 있습니다.  
엔트리를 통하여 로보티즈 실과로봇의 다양한 센서와 구동장치를 학습하고 원하는대로 구현할 수 있습니다.

1. 엔트리 홈페이지([www.playentry.org]{: .blank})에 접속 후 메뉴에서 `다운로드`를 선택합니다

    ![](/assets/images/edu/info/entry_001.png)

2. 운영체제에 맞는 프로그램을 선택하여 다운로드합니다.

    **참고** : 윈도우의 경우 운영체제 확인은 `내 컴퓨터` 아이콘을 오른쪽 클릭 한 후 `속성` 또는 `제어판 > 시스템 및 보안 > 시스템`에서 확인할 수 있습니다.
    {: .notice}

    ![](/assets/images/edu/info/entry_002.png)

3. 다운로드한 파일을 실행하고 아래와 같이 엔트리를 PC에 설치합니다

    ![](/assets/images/edu/info/entry_003_1.png)  
    ![](/assets/images/edu/info/entry_003_2.png)  
    ![](/assets/images/edu/info/entry_003_3.png)  
    ![](/assets/images/edu/info/entry_003_4.png)  

## [PC에 예제 다운로드하기](#pc에-예제-다운로드하기)

[교육자료 다운로드](#교육자료-다운로드) 항목에서 작동시키고자 하는 로봇의 예제 프로그램을 찾아 다운로드합니다.

  - [엔트리 예제](#엔트리-예제)
  - [태스크 예제](#태스크-예제)

## [엔트리에서 예제 불러오기](#엔트리에서-예제-불러오기)

1. 엔트리 앱을 실행한 후 엔트리 만들기 환경에서 `교과형`을 선택 후 확인을 누릅니다.

    ![](/assets/images/edu/info/entry_007.png)

2. 엔트리 창이 열리면 `파일`에서 `오프라인 작품 선택하기`를 선택합니다.

    ![](/assets/images/edu/info/entry_008.png)

3. 다운로드한 예제 프로그램이 저장된 위치를 찾아 불러옵니다 (예시: 청소로봇)

    ![](/assets/images/edu/info/entry_009.png)

## [PC에 블루투스 연결하기](#pc에-블루투스-연결하기)

1. PC에 동글을 연결하면 파란 빛이 깜빡입니다.

    ![](/assets/images/edu/info/entry_010.png)

2. 제어기의 전원을 켜고 로봇을 동글에 가까이 가져가면 자동으로 통신 연결(페어링)을 시도합니다.

    ![](/assets/images/edu/info/entry_011.png)

3. 로봇의 블루투스 모듈과 동글에 모두 파란 불이 켜진 상태가 유지되면 통신 연결이 완료됩니다.

    **참고** : 블루투스 통신이 연결되면 로봇과 PC의 거리가 멀어져도 통신이 끊어지지 않습니다.
    {: .notice}

    ![](/assets/images/edu/info/entry_012.png)

## [엔트리에 로봇 연결하기](#엔트리에-로봇-연결하기)

1. 엔트리에서 `로봇`을 선택하고 `연결 프로그램 열기`를 선택합니다.

    ![](/assets/images/edu/info/entry_013.png)

2. 목록에서 `로보티즈 실과로봇`을 찾아 선택합니다.

    ![](/assets/images/edu/info/entry_014.png)

3. 검색된 포트를 선택하고 `연결`을 누릅니다.

    ![](/assets/images/edu/info/entry_015.png)

4. 연결에 성공하면 [최소화] 버튼을 눌러 창을 내립니다.

    ![](/assets/images/edu/info/entry_016.png)

# [태스크로 작동하기](#태스크로-작동하기)

## [R+ m.Task 2 설치하기](#r-mtask-2-설치하기)

{% include kr/software/mobile_app/task/install.md %}

## [R+ Smart 설치하기](#r-smart-설치하기)

{% include kr/software/mobile_app/smart/install.md %}

## [제어기와 스마트기기 연결](#제어기와-스마트기기-연결)

### 블루투스를 OpenCM7.0 제어기에 연결하기   
1. 블루투스를 OpenCM7.0의 `4핀 포트`에 연결합니다.  
2. OpenCM7.0의 시작버튼을 한 번 누르고 블루투스의 LED가 깜빡이면 제어기와 블루투스가 정상적으로 연결된 것입니다.

    ![](/assets/images/sw/mobile/image11_kr.png)

### 블루투스를 통해 제어기와 스마트기기 연결하기

![](/assets/images/sw/mobile/image13_kr.gif)
![](/assets/images/sw/mobile/image15_kr.gif)

1. R+ Smart 앱을 실행한 후 우측 상단에 환경설정을 선택합니다.  
2. 환경설정 창이 뜨면 “연결할 장치 선택”을 선택합니다.  
3. 연결할 장치를 선택하라는 창이 뜨면 하단의 목록 중에서 제어기에 연결된 블루투스의 윗면에 있는 번호와 동일한 번호를 선택합니다.  
4. 만약 동일한 번호가 없으면 검색을 통해 등록합니다.(이때, PIN정보가 필요합니다. PIN은 `0000`으로 기본 설정되어 있습니다.)

 **참고**: PIN 정보는 로보티즈 고객지원센터를 통해서만 변경이 가능합니다.
 {: .notice}

## [R+ Smart에서 예제 불러오기](#r-smart에서-예제-불러오기)

{% include kr/software/mobile_app/smart/task_download.md %}

# [교육자료 다운로드](#교육자료-다운로드)
각 예제를 실행할 때 동작에 대해서는 키트에 포함된 교안을 참고하거나 교육자료를 확인해보세요.

**참고** : 활동자료를 출력할 때는 실제크기(A4 원본크기)로 인쇄해야 합니다.
{: .notice}

## [엔트리 예제](#엔트리-예제)

|                                        예제 이름                                        |                    교안 / 조립서                     | 프로그램 자료                                                                                                                                                                                                 |
|:---------------------------------------------------------------------------------------:|:----------------------------------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|             선풍기 (Fan)<br>![](/assets/images/edu/info/info_entry_fan.png)             | [교안 다운로드][교안_선풍기]<br>[조립서 다운로드][조립서_선풍기] | **선풍기 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Fan_kr]<br>기초 코딩 예제 : [02_inforobot_Fan_Basic_kr]<br>활동자료 : [inforobot_Fan_sourcebook]                                           |
|        다람쥐 (Squirrel)<br>![](/assets/images/edu/info/info_entry_squirrel.png)        | [교안 다운로드][교안_다람쥐]<br>[조립서 다운로드][조립서_다람쥐] | **다람쥐 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Squirel_kr]<br>기초 코딩 예제 : [02_inforobot_Squirel_Basic_kr]                                                                             |
|       경찰 (Police Officer)<br>![](/assets/images/edu/info/info_entry_police.png)       | [교안 다운로드][교안_경찰]<br>[조립서 다운로드][조립서_경찰] | **경찰 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Police_Officer_kr]<br>기초 코딩 예제 : [02_inforobot_Police_Officer_Basic_kr]                                                                 |
|         스쿠터 (Scooter)<br>![](/assets/images/edu/info/info_entry_scooter.png)         | [교안 다운로드][교안_스쿠터]<br>[조립서 다운로드][조립서_스쿠터] | **스쿠터 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Scooter_kr]<br>기초 코딩 예제 : [02_inforobot_Scooter_Basic_kr]                                                                             |
| 분리수거로봇 (Recycling Robot)<br>![](/assets/images/edu/info/info_entry_recycling.png) | [교안 다운로드][교안_분리수거]<br>[조립서 다운로드][조립서_분리수거] | **분리수거로봇 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Recycling_Robot_kr]<br>기초 코딩 예제 : [02_inforobot_Recycling_Robot_Basic_kr]<br>활동자료 : [inforobot_Recycling_Robot_sourcebook] |
|    청소로봇 (Cleaning Robot)<br>![](/assets/images/edu/info/info_entry_cleaning.png)    | [교안 다운로드][교안_청소]<br>[조립서 다운로드][조립서_청소] | **청소로봇 예제프로그램 다운로드**<br>키트 데모 예제 : [01_infoRobot_Cleaning_Robot_kr]<br>기초 코딩 예제 : [02_infoRobot_Cleaning_Robot_Basic_kr]<br>활동자료 : [infoRobot_Cleaning_Robot_sourcebook]        |

## [태스크 예제](#테스크-예제)

|                                       예제 이름                                       |                    교안 / 조립서                     | 프로그램 자료                                                                                                                                                                                                                                                    |
|:-------------------------------------------------------------------------------------:|:----------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|         룰렛 (Roulette)<br>![](/assets/images/edu/info/info_task_lottery.png)         | [교안 다운로드][교안_룰렛]<br>[조립서 다운로드][조립서_룰렛] | **룰렛 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Roulette_kr]<br>기초 코딩 예제 : [02_inforobot_Roulette_Basic_kr]<br>응용코딩예제 : [03_inforobot_Roulette_Advance_kr]<br>활동자료 : [inforobot_Roulette_sourcebook]                             |
|      자동문 (Automatic Door)<br>![](/assets/images/edu/info/info_task_door.png)       | [교안 다운로드][교안_자동문]<br>[조립서 다운로드][조립서_자동문] | **자동문 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Automatic_Door_kr]<br>기초 코딩 예제 : [02_inforobot_Automatic_Door_Basic_kr]<br>응용코딩예제 : [03_inforobot_Automatic_Door_Advance_kr]                                                        |
|       투석기 (Catapult)<br>![](/assets/images/edu/info/info_task_catapult.png)        | [교안 다운로드][교안_투석기]<br>[조립서 다운로드][조립서_투석기] | **투석기 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Catapult_kr]<br>기초 코딩 예제 : [02_inforobot_Catapult_Basic_kr]<br>응용코딩예제 : [03_inforobot_Catapult_Advance_kr]<br>활동자료 : [inforobot_Catapult_sourcebook]                           |
|      곤충로봇 (Hexapod Robot)<br>![](/assets/images/edu/info/info_task_bug.png)       | [교안 다운로드][교안_곤충]<br>[조립서 다운로드][조립서_곤충] | **곤충로봇 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Hexapod_Robot_kr]<br>기초 코딩 예제 : [02_inforobot_Hexapod_Robot_Basic_kr]<br>응용코딩예제 : [03_inforobot_Hexapod_Robot_Advance_kr]                                                         |
|  집게로봇 (Gripper Robot)<br>![](/assets/images/edu/info/info_task_gripperrobot.png)  | [교안 다운로드][교안_집게]<br>[조립서 다운로드][조립서_집게] | **집게로봇 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Gripper_Robot_kr]<br>기초 코딩 예제 : [02_inforobot_Gripper_Robot_Basic_kr]<br>응용코딩예제 : [03_inforobot_Gripper_Robot_Advance_kr]                                                         |
| 안내로봇 (Guidance Robot)<br>![](/assets/images/edu/info/info_task_guidancerobot.png) | [교안 다운로드][교안_안내]<br>[조립서 다운로드][조립서_안내] | **안내로봇 예제프로그램 다운로드**<br>키트 데모 예제 : [01_inforobot_Guidance_Robot_kr]<br>기초 코딩 예제 : [02_inforobot_Guidance_Robot_Basic_kr]<br>응용코딩예제 : [03_inforobot_Guidance_Robot_Advance_kr]<br>활동자료 : [inforobot_Guidance_Robot_sourcebook] |




[www.playentry.org]: https://playentry.org

[제어기(OpenCM7.0 B-Type)]: /docs/kr/parts/controller/opencm7/
[감속 모터]: /docs/kr/parts/motor/gm-10a/
[서보 모터]: /docs/kr/parts/motor/servo_motor/
[LED 모듈]: /docs/kr/parts/display/lm-10/
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[컬러 센서]: /docs/kr/parts/sensor/cs-10/

[교안_선풍기]: #
[교안_다람쥐]: #
[교안_경찰]: #
[교안_스쿠터]: #
[교안_분리수거]: #
[교안_청소]: #
[교안_룰렛]: #
[교안_자동문]: #
[교안_투석기]: #
[교안_곤충]: #
[교안_집게]: #
[교안_안내]: #

[조립서_선풍기]: #
[조립서_다람쥐]: #
[조립서_경찰]: #
[조립서_스쿠터]: #
[조립서_분리수거]: #
[조립서_청소]: #
[조립서_룰렛]: #
[조립서_자동문]: #
[조립서_투석기]: #
[조립서_곤충]: #
[조립서_집게]: #
[조립서_안내]: #

[01_inforobot_Fan_kr]: http://www.robotis.com/service/download.php?no=1677
[02_inforobot_Fan_Basic_kr]: http://www.robotis.com/service/download.php?no=1678
[inforobot_Fan_sourcebook]: http://www.robotis.com/service/download.php?no=1692
[01_inforobot_Squirel_kr]: http://www.robotis.com/service/download.php?no=1679
[02_inforobot_Squirel_Basic_kr]: http://www.robotis.com/service/download.php?no=1680
[01_inforobot_Police_Officer_kr]: http://www.robotis.com/service/download.php?no=1681
[02_inforobot_Police_Officer_Basic_kr]: http://www.robotis.com/service/download.php?no=1682
[01_inforobot_Scooter_kr]: http://www.robotis.com/service/download.php?no=1683
[02_inforobot_Scooter_Basic_kr]: http://www.robotis.com/service/download.php?no=1684
[01_inforobot_Recycling_Robot_kr]: http://www.robotis.com/service/download.php?no=1685
[02_inforobot_Recycling_Robot_Basic_kr]: http://www.robotis.com/service/download.php?no=1686
[inforobot_Recycling_Robot_sourcebook]: http://www.robotis.com/service/download.php?no=1694
[01_infoRobot_Cleaning_Robot_kr]: http://www.robotis.com/service/download.php?no=1687
[02_infoRobot_Cleaning_Robot_Basic_kr]: http://www.robotis.com/service/download.php?no=1688
[infoRobot_Cleaning_Robot_sourcebook]: http://www.robotis.com/service/download.php?no=1695

[01_inforobot_Roulette_kr]: http://www.robotis.com/service/download.php?no=1699
[02_inforobot_Roulette_Basic_kr]: http://www.robotis.com/service/download.php?no=1700
[03_inforobot_Roulette_Advance_kr]: http://www.robotis.com/service/download.php?no=1701
[inforobot_Roulette_sourcebook]: http://www.robotis.com/service/download.php?no=1696
[01_inforobot_Automatic_Door_kr]: http://www.robotis.com/service/download.php?no=1702
[02_inforobot_Automatic_Door_Basic_kr]: http://www.robotis.com/service/download.php?no=1703
[03_inforobot_Automatic_Door_Advance_kr]: http://www.robotis.com/service/download.php?no=1704
[01_inforobot_Catapult_kr]: http://www.robotis.com/service/download.php?no=1705
[02_inforobot_Catapult_Basic_kr]: http://www.robotis.com/service/download.php?no=1706
[03_inforobot_Catapult_Advance_kr]: http://www.robotis.com/service/download.php?no=1707
[inforobot_Catapult_sourcebook]: http://www.robotis.com/service/download.php?no=1697
[01_inforobot_Hexapod_Robot_kr]: http://www.robotis.com/service/download.php?no=1708
[02_inforobot_Hexapod_Robot_Basic_kr]: http://www.robotis.com/service/download.php?no=1709
[03_inforobot_Hexapod_Robot_Advance_kr]: http://www.robotis.com/service/download.php?no=1710
[01_inforobot_Gripper_Robot_kr]: http://www.robotis.com/service/download.php?no=1711
[02_inforobot_Gripper_Robot_Basic_kr]: http://www.robotis.com/service/download.php?no=1712
[03_inforobot_Gripper_Robot_Advance_kr]: http://www.robotis.com/service/download.php?no=1713
[01_inforobot_Guidance_Robot_kr]: http://www.robotis.com/service/download.php?no=1714
[02_inforobot_Guidance_Robot_Basic_kr]: http://www.robotis.com/service/download.php?no=1715
[03_inforobot_Guidance_Robot_Advance_kr]: http://www.robotis.com/service/download.php?no=1716
[inforobot_Guidance_Robot_sourcebook]: http://www.robotis.com/service/download.php?no=1698
