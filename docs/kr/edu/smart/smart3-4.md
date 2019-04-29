---
layout: archive
lang: kr
ref: smart3-4
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/smart/smart3-4/
sidebar:
  title: 스마트III 교육키트 4단계
  nav: "smart3-4"
---

# [개요](#개요)

## [로보티즈 스마트III 교육키트(로봇수업용) 4단계](#로보티즈-스마트iii-교육키트로봇수업용-4단계)

로보티즈 스마트III는 일반 리모컨을 이용한 로봇 구동의 단순 조정한계를 스마트 기기와 로봇을 블루투스로 연결하여 양방향 입출력이 가능하도록 구현된 교육용 로봇 솔루션입니다.

- 교재와 예제 로봇이 결합되어 로봇 및 과학 원리의 이해, 로봇의 제작, 문제 풀이 등의 과정을 제공합니다.

- 추가적인 서보모터를 통해 최대 8관절의 로봇구조를 배울수 있습니다. 이번 단계에서 모션 프로그램을 통해 다관절 생체모방형 로봇이나 복잡한 기계의 형태를 구현하는 동작을 가진 로봇을 학습 할 수 있습니다.

- 프로그램 학습 및 다운로드를 하기 위해서는 [R+ SMARTIII] 와 [R+m.Task2.0], 그리고 [R+m.Motion]이 필요합니다.

- 스마트기기가 없을때는, 블루투스모듈(BT-410 SET)가 결합된 리모컨(RC-100B)으로 로봇을 조종할 수 있도록 별도의 예제 프로그램이 제공됩니다.


[스마트 앱 파라미터 사용법 바로가기]  
{: .notice}

# [부품 목록](#부품-목록)

![](/assets/images/edu/smart/smart3-4_e-manual.jpg)

- [서보 모터]

# [작동하기](#작동하기)

- 스마트 기기에 [R+ SMARTIII] 와 [R+m.Task2.0],[R+m.Motion]을 설치해야 합니다.

- 앱 설치가 완료되면 스마트III 1단계 키트에 포함된 제어기([CM-200])에 블루투스([BT-410])를 연결하고 R+SMARTIII에서 R+m.task2.0을 실행하여 예제를 다운로드 받습니다.

**[R+ SMARTIII 설치 및 예제 다운로드 방법 바로가기](/docs/kr/software/mobile_app/rplussmart/#r-smart-다운로드설치)**  
{% capture warning_1 %}
**주의**  
- 제어기에 프로그램을 다운로드 받으면, 그전에 다운받은 프로그램은 지워집니다.  
- 예제 동작시 음원이나 음성이 재생되는 것을 함께 확인하기 위해서는 스마트 기기의 미디어 볼륨을 반드시 키우고 실행하길 권장합니다.
{% endcapture %}
<div class ="notice--warning">{{ warning_1 | markdownify}}</div>

{% capture warning_2 %}
**주의**  
- 구글의 변경된 정책으로 SMS 기능은 더이상 지원되지 않습니다.  
SMS 기능이 필요한 경우 이전 버전의 앱 설치파일(APK)을 다운로드 받아 수동으로 설치하시기 바랍니다.  
이전 버전 사용시 최신 업데이트가 반영되지 않는 점 유의하시기 바랍니다.  
[R+ SMART (v0.9.3.6) 다운로드](http://www.robotis.com/service/download.php?no=1674)  
[R+ SMART2 (v0.9.3.6) 다운로드](http://www.robotis.com/service/download.php?no=1675)  
[R+ SMART3 (v0.9.6.1) 다운로드](http://www.robotis.com/service/download.php?no=1673)   
**참고** : [인터넷에서 받은 앱 설치하기](/docs/kr/popup/apk_install){: .popup}  
{% endcapture %}
<div class ="notice--warning">{{ warning_2 | markdownify}}</div>

## 작동방법

- 제어기의 버튼을 눌러 전원을 켭니다. R+ SMARTIII에서 해당 예제를 클릭하여 제어기와 스마트기기 연결이 완료되면 프로그램이 실행됩니다.

  ![](/assets/images/edu/smart/cm_200_7.jpg)

  **참고**: 예제 파일은 [4단계 교안예제] 페이지 또는 R+ SMARTIII앱 에서 얻을 수 있습니다.  
  {: .notice}

# [교안예제](#교안예제)

각 예제의 조립 방법이나 실행 시 동작에 관한 내용은 교육키트 2단계 교안을 참고하세요.  
또한, 예제 태스크 코드의 다운로드 방법은 [태스크 코드 다운로드]를 참고하세요.  
다운로드시 필요한 [BT-410]은 1단계 구성품에 포함되어 있습니다. 분실시 쇼핑몰에서 별도구매 해주세요.
{: .notice}


|                                        로봇                                         |                                                                                          태스크 코드                                                                                          |
|:-----------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|     1. 컬러공장<br />![](/assets/images/edu/smart/200_smartiii_l4_1factory.png)     |                                          [로봇 예제 프로그램][01_smart3_L4_Factory_kr.tskx]<br />[조종기 프로그램][03_smart3_L4_Factory_RC_kr.tskx]                                           |
| 2. 스마트 탐사차<br />![](/assets/images/edu/smart/200_smartiii_l4_2tongs_car.png)  |                                   [로봇 예제 프로그램][01_smart3_L4_Smart_Explorer_kr.tskx]<br />[조종기 프로그램][03_smart3_L4_Smart_Explorer_RC_kr.tskx]                                    |
|     3. 4족 로봇<br />![](/assets/images/edu/smart/200_smartiii_l4_3fwrobot.png)     |        [로봇 예제 프로그램][01_smart3_L4_Quadruped_Robot_kr.tskx]<br />[모션 파일][smart3_L4_Quadruped_Robot_kr.mtnx]<br />[조종기 프로그램][03_smart3_L4_Quadruped_Robot_RC_kr.tskx]         |
| 4. 춤추는 고릴라<br />![](/assets/images/edu/smart/200_smartiii_l4_4dj_gorilla.png) |                [로봇 예제 프로그램][01_smart3_L4_DJ_Gorilla_kr.tskx]<br />[모션 파일][smart3_L4_DJ_Gorilla_kr.mtnx]<br />[조종기 프로그램][03_smart3_L4_DJ_Gorilla_RC_kr.tskx]                |
|   5. 스마트 강아지<br />![](/assets/images/edu/smart/200_smartiii_l4_5puppy.png)    |              [로봇 예제 프로그램][01_smart3_L4_Smart_Puppy_kr.tskx]<br />[모션 파일][smart3_L4_Smart_Puppy_kr.mtnx]<br />[조종기 프로그램][03_smart3_L4_Smart_Puppy_RC_kr.tskx]               |
|   6. 변신로봇<br />![](/assets/images/edu/smart/200_smartiii_l4_6transformer.png)   | [로봇 예제 프로그램][01_smart3_L4_Transformation_Robot_kr.tskx]<br />[모션 파일][smart3_L4_Transformation_Robot_kr.mtnx]<br />[조종기 프로그램][03_smart3_L4_Transformation_Robot_RC_kr.tskx] |
|    7. 레전드 히어로<br />![](/assets/images/edu/smart/200_smartiii_l4_7hero.png)    |                          [로봇 예제 프로그램][01_smart3_L4_Hero.tskx]<br />[모션 파일][smart3_L4_Hero_kr.mtnx]<br />[조종기 프로그램][03_smart3_L4_Hero_RC_kr.tskx]                           |
|      8. 드래곤<br />![](/assets/images/edu/smart/200_smartiii_l4_8dragon.png)       |                       [로봇 예제 프로그램][01_smart3_L4_Dragon_kr.tskx]<br />[모션 파일][smart3_L4_Dragon.mtnx]<br />[조종기 프로그램][03_smart3_L4_Dragon_RC_kr.tskx]                        |
|     9. 슈퍼카<br />![](/assets/images/edu/smart/200_smartiii_l4_9super_car.png)     |                                        [로봇 예제 프로그램][01_smart3_L4_Super_Car_kr.tskx]<br />[조종기 프로그램][03_smart3_L4_Super_Car_RC_kr.tskx]                                         |


[스마트 앱 파라미터 사용법 바로가기]: /docs/kr/software/rplus1/task/task_misc/#스마트앱-파라미터
[서보 모터]: /docs/kr/parts/motor/servo_motor/
[R+ SMARTIII 설치 및 예제 다운로드 방법 바로가기]: /docs/kr/software/mobile_app/rplussmart/#r-smart-다운로드설치
[4단계 교안예제]: #교안예제
[태스크 코드 다운로드]: /docs/kr/faq/download_task_code/
[CM-200]: /docs/kr/parts/controller/cm-200/
[BT-410]: /docs/kr/parts/communication/bt-410/
[R+m.Motion]: /docs/kr/software/rplus_mobile/mmotion/
[R+ SMARTIII]: /docs/kr/software/mobile_app/rplussmart/
[R+m.Task2.0]: /docs/kr/software/rplus_mobile/mtask20/
[01_smart3_L4_Factory_kr.tskx]: http://www.robotis.com/service/download.php?no=1110
[03_smart3_L4_Factory_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1119
[01_smart3_L4_Smart_Explorer_kr.tskx]: http://www.robotis.com/service/download.php?no=1113
[03_smart3_L4_Smart_Explorer_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1122
[01_smart3_L4_Quadruped_Robot_kr.tskx]: http://www.robotis.com/service/download.php?no=1112
[smart3_L4_Quadruped_Robot_kr.mtnx]: http://www.robotis.com/service/download.php?no=1129
[03_smart3_L4_Quadruped_Robot_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1121
[01_smart3_L4_DJ_Gorilla_kr.tskx]: http://www.robotis.com/service/download.php?no=1108
[smart3_L4_DJ_Gorilla_kr.mtnx]: http://www.robotis.com/service/download.php?no=1126
[03_smart3_L4_DJ_Gorilla_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1117
[01_smart3_L4_Smart_Puppy_kr.tskx]: http://www.robotis.com/service/download.php?no=1114
[smart3_L4_Smart_Puppy_kr.mtnx]: http://www.robotis.com/service/download.php?no=1130
[03_smart3_L4_Smart_Puppy_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1123
[01_smart3_L4_Transformation_Robot_kr.tskx]: http://www.robotis.com/service/download.php?no=1116
[smart3_L4_Transformation_Robot_kr.mtnx]: http://www.robotis.com/service/download.php?no=1131
[03_smart3_L4_Transformation_Robot_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1125
[01_smart3_L4_Hero.tskx]: http://www.robotis.com/service/download.php?no=1111
[smart3_L4_Hero_kr.mtnx]: http://www.robotis.com/service/download.php?no=1128
[03_smart3_L4_Hero_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1120
[01_smart3_L4_Dragon_kr.tskx]: http://www.robotis.com/service/download.php?no=1109
[smart3_L4_Dragon.mtnx]: http://www.robotis.com/service/download.php?no=1127
[03_smart3_L4_Dragon_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1118
[01_smart3_L4_Super_Car_kr.tskx]: http://www.robotis.com/service/download.php?no=1115
[03_smart3_L4_Super_Car_RC_kr.tskx]: http://www.robotis.com/service/download.php?no=1124
