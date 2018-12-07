---
layout: archive
lang: kr
ref: bioloid-stem
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/bioloid/stem/
sidebar:
  title: 로보티즈 STEM 키트
  nav: "bioloid-stem"
---

# [개요](#개요)

# [시작하기](#시작하기)

## [Level 1 부품 목록](#level-1-부품-목록)

![](/assets/images/edu/bioloid/pr05_e01_standard_partlist_01_KR.png)

![](/assets/images/edu/bioloid/pr05_e01_standard_partlist_02_KR.png)

## [Level 2 부품 목록](#level-2-부품-목록)

![](/assets/images/edu/bioloid/pr05_e01_expansion_partlist_01_KR.png)

![](/assets/images/edu/bioloid/pr05_e01_expansion_partlist_02_KR.png)

- [CM-530]
- [AX-12W]
- [AX-12A]
- [적외선센서어레이]
- [적외선 센서]

## [작동하기](#작동하기)

### 프로그램 다운로드
- [STEM Level 1 예제], [STEM Level 2 예제] 페이지에서 동작시키고자 하는 예제 로봇에 맞는 태스크 코드와 모션 파일을 로봇에 다운로드 합니다.  
  [제어기에 태스크 코드 다운로드 하기]

{% include kr/parts/controller/cm510_530_turnon.md %}

### 조립 확인하기
- 조립 확인 모드에서는 로봇이 제대로 조립되었는지 확인할 수 있습니다. 모터를 하나씩 선택하여 로봇의 기본 자세와 비교하세요.  
  1. 조립 확인 모드를 실행하려면 '로봇켜기' 의 2번 상태에서 제어기 버튼 'D' 를 누르면서 START 버튼을 누릅니다.
    > 멜로디(멜로디1)가 울릴 때까지 버튼에서 손을 떼지 않고 있어야 합니다.
  2. U / D 버튼을 눌러 모터를 하나씩 선택합니다. 이 때, 선택된 모터는 LED 가 켜지며 기본 위치로 돌아갑니다.
    > ( U : ID 를 1 씩 증가시킴. D : ID 를 1 씩 감소시킴)
  3. LED 가 켜진 모터의 ID 와 조립서의 ID 를 비교하세요.
    > 해당 ID 의 모터가 로봇에 존재하지 않을 경우 경고음이 울립니다.
  4. 실제로 모터가 멈춰있는 위치와 기본 자세에 해당하는 관절의 모습을 서로 비교하세요.
    > LED 는 켜져 있지만 모터에 힘이 풀려 있다면, 모터의 조립 상태나 주변의 케이블 등을 다시 살펴보세요.
  5. 적외선 센서가 연결되어 있는 포트 번호를 비교하세요.
    > 정해진 포트에 연결된 적외선 센서는 물체를 감지하면 해당 포트 번호 만큼 깜박 입니다.

## [충전하기](#충전하기)

{% include kr/edu/bioloid/stem_charge.md %}

# [다운로드](#다운로드)

## [STEM Level 1 예제](#stem-level-1-예제)

각 단원의 단계마다 동작이 다르므로 대표적인 동작에 대한 알고리즘을 기준으로 설명하였습니다.
{: .notice}

|로봇 사진|설명|
|:----:|:----|
|1. 순차명령로봇<br />![](/assets/images/edu/bioloid/stem_beebot_KR.jpg)|[Download][BIO_STEM_SequenceRacer1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_SequenceRacer2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_SequenceRacer3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_SequenceRacer.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br />- `알고리즘`<br />제어기의 버튼으로 로봇의 이동 방향을 제어<br/>- `동작방법`<br/>직진(U), 좌회전(L), 우회전(R), 후진(D) 명령을 순차적으로 입력하고 실행(START) 버튼을 누르면 입력 순서에 따라 이동|
|2. 딱정벌레로봇<br />![](/assets/images/edu/bioloid/stem_bug_kr.jpg)|[Download][BIO_STEM_BugFighter1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_BugFighter2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_BugFighter3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_BugFighter.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br />- `알고리즘`<BR/>검은 선의 적외선 감지 값에 따라 로봇의 이동 방향을 제어<BR/>- `동작방법`<br/>검은 선으로 된 경기장에서 작동시키면 안에서만 이동하며 상대를 만나면 밀어내는 동작 수행|
|3. 무한궤도로봇<br />![](/assets/images/edu/bioloid/stem_caterpillar_kr.jpg)|[Download][BIO_STEM_Tumbler1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_Tumbler2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_BugFighter3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_Tumbler.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br />- `알고리즘`<br />적외선 센서의 감지 시간으로 장애물을 감지하고 로봇의 이동 방향을 제어<br />- `동작방법`<br />높이가 낮은 장애물은 넘어가고, 높은 장애물은 적외선 센서로 감지하여 방향을 바꿔 이동하며, 뒤집어 져도 정상적으로 주행|
|4. 줄달음차<br />![](/assets/images/edu/bioloid/stem_linetracer_kr.jpg)|[Download][BIO_STEM_LineFollower1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_LineFollower2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_LineFollower3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_LineFollower.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br />- `알고리즘`<br />교차된 검은 선을 만나면 정해진 방향대로 로봇의 이동 방향을 제어<br />- `동작방법`<br />적외선센서어레가 검은 선을 감지하는 부분에 따라 로봇을 직진, 좌회전, 우회전 하며 미션을 수행하며 지정한 경로대로 주행|
|5. 악기로봇<br />![](/assets/images/edu/bioloid/stem_music_kr.jpg)|[Download][BIO_STEM_DigitalPiano1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_DigitalPiano2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_DigitalPiano3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_DigitalPiano.wmv) Video<br />- `알고리즘`<br />적외선센서어레이에 감지된 위치에 따라 다른 음계를 출력<br />- `동작방법`<br />적외선센서어레이와 제어기 버튼을 사용하여 3 옥타브 음계를 출력할 수 있고 곡을 연주하거나 녹음, 반복 재생이 가능|
|6. 바이크로봇<br />![](/assets/images/edu/bioloid/stem_bike_kr.jpg)|[Download][BIO_STEM_MotorCycle1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_MotorCycle2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_MotorCycle3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_MotorCycle.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1] : 바퀴모드<br/>AX-12W ID[2] : 관절모드<br />- `알고리즘`<br />검은 선을 따라 이동하며 장애물을 감지하면 회피하는 동작 제어<br />- `동작방법`<br />양쪽 적외선 센서와 조향장치를 사용해 검은 선을 따라 이동하며 선 위의 장애물을 감지하면 회피하여 다시 주행|
|7. 어보이더<br />![](/assets/images/edu/bioloid/stem_avoider_kr.jpg)|[Download][BIO_STEM_Avoider1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_Avoider2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_Avoider3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIO_STEM_Avoider.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br />- `알고리즘`<br />오른쪽 적외선 센서를 사용해 일정거리를 유지하며 미로를 따라 이동하는 동작 제어<br />- `동작방법`<br />로봇의 왼쪽, 오른쪽, 가운데에 있는 적외선 센서로 좌측, 우측으로 이동하며 제시된 미로에서 다양한 미션을 수행하고 빠져 나오는 동작|

## [STEM Level 2 예제](#stem-level-2-예제)

각 단원의 단계마다 동작이 다르므로 대표적인 동작에 대한 알고리즘을 기준으로 설명하였습니다.
{: .notice}

|로봇 사진|설명|
|:----:|:----|
|8. 펜봇<br />![](/assets/images/edu/bioloid/scribbler_kr.jpg)|[Download][BIO_STEM_Scribbler1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_Scribbler2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_Scribbler3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_8.Scribbler.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12A ID[3], ID[4] : 바퀴모드<br />- `알고리즘`<br />버튼 명령에 따라 입력된 이동 방향대로 로봇 제어<br />- `동작방법`<br />그림을 그릴 수 있는 펜을 장착하고 종이 위에 올려 놓으면 제어기 버튼을 눌러 글자 '가', '어' 를 그리는 동작 수행|
|9. 집게탐사차<br />![](/assets/images/edu/bioloid/transporter_kr.jpg)|[Download][BIO_STEM_TransPorter1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_TransPorter2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_TransPorter3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_9.Transporter.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12A ID[3]~ ID[5] : 관절모드<br />- `알고리즘`<br />미리 입력된 명령으로 경로를 이동하고 미션을 해결하도록 로봇 제어<br />- `동작방법`<br />일정한 위치에 장애물 2 종류를 지정한 위치에 옮기는 로봇으로 START 를 출발하여 FINISH에 정해진 경로로 이동하는 동작 수행|
|10. 포터로봇<br />![](/assets/images/edu/bioloid/probecar_kr.jpg)|[Download][BIO_STEM_ProbeCar1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_ProbeCar2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_ProbeCar3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_10.ProbeCar.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br/>AX-12A ID[3], ID[4] : 관절모드<br />- `알고리즘`<br />이동 중 장애물을 감지하여 정해진 위치로 옮기도록 로봇 제어<br />- `동작방법`<br />박스 위에 있는 장애물을 감지하여 옮기는 로봇으로 적외선 센서를 사용하여 지정한 위치로 이동하여 장애물을 위치시키는 동작 수행|
|11. 쇠똥구리로봇<br />![](/assets/images/edu/bioloid/beetlegripper_kr.jpg)|[Download][BIO_STEM_BeetleGripper1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_BeetleGripper2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_BeetleGripper3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_11.BeetleGripper.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br/>AX-12A ID[3]~ ID[5] : 관절모드<br />- `알고리즘`<br />입력 받은 버튼 신호에 따라 집게와 로봇 제어<br />- `동작방법`<br />리모컨을 사용해 직진, 좌회전, 우회전, 후진, 제자리좌회전, 제자리우회전으로 로봇이 이동하고 집게 벌리기, 오므리기, 올리기, 내리기 동작 수행|
|12. 로봇팔<br />![](/assets/images/edu/bioloid/robotarm_kr.jpg)|[Download][BIO_STEM_RobotArm1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_RobotArm2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_RobotArm3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_12.RobotArm.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12A ID[3]~ ID[6] : 관절모드<br />- `알고리즘`<br />적외선 센서에 감지되는 컵의 크기에 따라 지정된 위치로 옮기는 로봇 제어<br />- `동작방법`<br />작은 컵 두개와 큰 컵 두 개를 지정된 위치로 옮겨 놓는 예제 로봇으로 감지 순서와 무관하게 지정된 위치로 옮겨 놓는 동작수행|
|13. 뚜벅이 로봇<br />![](/assets/images/edu/bioloid/walking_droid_kr.jpg)|[Download][BIO_STEM_Walking Droid1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_Walking Droid2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_Walking Droid3_KR.tsk] 실전단계<br/>[Download][BIO_STEM_Walking Droid_KR.mtn] 데모용 모션파일<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_14.Hexapod.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12A ID[3]~ ID[5] : 관절모드<br />- `알고리즘`<br />적외선 센서로 장애물의 위치를 감지하고 피하는 로봇 제어<br />- `동작방법`<br />장애물이 왼쪽에 감지된 경우 오른쪽으로, 오른쪽에 감지된 경우 왼쪽으로 이동하며 위에 손이 감지된 경우 빠른 속도로 이동하는 동작 수행|
|14. 헥사포드<br />![](/assets/images/edu/bioloid/hexapod_kr.jpg)|[Download][BIO_STEM_Hexapod1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_Hexapod2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_Hexapod3_KR.tsk] 실전단계<br/>[Download][BIO_STEM_Hexapod_KR.mtn] 데모용 모션파일<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_14.Hexapod.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12A ID[3]~ ID[5] : 관절모드<br />- `알고리즘`<br />적외선 센서로 장애물의 위치를 감지하고 피하는 로봇 제어<br />- `동작방법`<br />장애물이 왼쪽에 감지된 경우 오른쪽으로, 오른쪽에 감지된 경우 왼쪽으로 이동하며 위에 손이 감지된 경우 빠른 속도로 이동하는 동작 수행|
|15. 펭귄로봇<br />![](/assets/images/edu/bioloid/greetingpenguin_kr.jpg)|[Download][BIO_STEM_GreetingPenguin1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_GreetingPenguin2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_GreetingPenguin3_KR.tsk] 실전단계<br/>[Download][BIO_STEM_GreetingPenguin_KR.mtn] 데모용 모션파일<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_15.GreetingPenguin.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 관절모드<br/>AX-12A ID[3]~ ID[6] : 관절모드<br />- `알고리즘`<br />입력 받아 동작한 명령을 기억하여 순차적으로 다시 실행하는 로봇 제어<br />- `동작방법`<br />임의대로 입력받은 왼팔 들기, 오른팔 들기, 인사하기, 박수치기 행동을 순서대로 기억하였다가 다시 반복 동작 수행|
|16. 캐논로봇<br />![](/assets/images/edu/bioloid/cannonshooter_kr.jpg)|[Download][BIO_STEM_CannonShooter1_KR.tsk] 기본단계<br/>[Download][BIO_STEM_CannonShooter2_KR.tsk] 응용단계<br/>[Download][BIO_STEM_CannonShooter3_KR.tsk] 실전단계<br />[Download](http://www.robotis.com/video/BIOLOID_STEM_16.CannonShooter.wmv) Video<br />- `다이나믹셀 설정 값`<br />AX-12W ID[1], ID[2] : 바퀴모드<br/>AX-12A ID[3]~ ID[6] : 관절모드<br />- `알고리즘`<br />입력 받은 버튼 신호에 따라 집게와 발사장치, 로봇 제어<br />- `동작방법`<br />리모컨을 사용해 직진, 좌회전, 우회전, 후진, 제자리좌회전, 제자리우회전으로 로봇이 이동하고 집게 벌리기, 오므리기, 올리기, 내리기, 발사하기 동작 수행|


# [참고자료](#참고자료)

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm510_530.md %}

## [다이나믹셀 관리하기](#다이나믹셀-관리하기)

{% include kr/edu/bioloid/dynamixel_management.md %}

{% include kr/parts/communication/zigbee_control.md %}


[CM-530]: /docs/kr/parts/controller/cm-530/
[AX-12W]: /docs/kr/dxl/ax/ax-12w/
[AX-12A]: /docs/kr/dxl/ax/ax-12a/
[적외선센서어레이]: /docs/kr/parts/sensor/ir_array/
[적외선 센서]: /docs/kr/parts/sensor/irss-10/
[STEM Level 1 예제]: #stem-level-1-예제
[STEM Level 2 예제]: #stem-level-2-예제
[제어기에 태스크 코드 다운로드 하기]: /docs/kr/faq/download_task_code/#cm-530
[모션 파일 다운로드 방법]: #모션-파일-다운로드
[BIO_STEM_SequenceRacer1_KR.tsk]: http://www.robotis.com/service/download.php?no=1377
[BIO_STEM_SequenceRacer2_KR.tsk]: http://www.robotis.com/service/download.php?no=1378
[BIO_STEM_SequenceRacer3_KR.tsk]: http://www.robotis.com/service/download.php?no=1379
[BIO_STEM_BugFighter1_KR.tsk]: http://www.robotis.com/service/download.php?no=1345
[BIO_STEM_BugFighter2_KR.tsk]: http://www.robotis.com/service/download.php?no=1346
[BIO_STEM_BugFighter3_KR.tsk]: http://www.robotis.com/service/download.php?no=1347
[BIO_STEM_Tumbler1_KR.tsk]: http://www.robotis.com/service/download.php?no=1383
[BIO_STEM_Tumbler2_KR.tsk]: http://www.robotis.com/service/download.php?no=1384
[BIO_STEM_Tumbler3_KR.tsk]: http://www.robotis.com/service/download.php?no=1385
[BIO_STEM_LineFollower1_KR.tsk]: http://www.robotis.com/service/download.php?no=1362
[BIO_STEM_LineFollower2_KR.tsk]: http://www.robotis.com/service/download.php?no=1363
[BIO_STEM_LineFollower3_KR.tsk]: http://www.robotis.com/service/download.php?no=1364
[BIO_STEM_DigitalPiano1_KR.tsk]: http://www.robotis.com/service/download.php?no=1351
[BIO_STEM_DigitalPiano2_KR.tsk]: http://www.robotis.com/service/download.php?no=1352
[BIO_STEM_DigitalPiano3_KR.tsk]: http://www.robotis.com/service/download.php?no=1353
[BIO_STEM_MotorCycle1_KR.tsk]: http://www.robotis.com/service/download.php?no=1365
[BIO_STEM_MotorCycle2_KR.tsk]: http://www.robotis.com/service/download.php?no=1366
[BIO_STEM_MotorCycle3_KR.tsk]: http://www.robotis.com/service/download.php?no=1367
[BIO_STEM_Avoider1_KR.tsk]: http://www.robotis.com/service/download.php?no=1339
[BIO_STEM_Avoider2_KR.tsk]: http://www.robotis.com/service/download.php?no=1340
[BIO_STEM_Avoider3_KR.tsk]: http://www.robotis.com/service/download.php?no=1341
[BIO_STEM_Scribbler1_KR.tsk]: http://www.robotis.com/service/download.php?no=1374
[BIO_STEM_Scribbler2_KR.tsk]: http://www.robotis.com/service/download.php?no=1375
[BIO_STEM_Scribbler3_KR.tsk]: http://www.robotis.com/service/download.php?no=1376
[BIO_STEM_TransPorter1_KR.tsk]: http://www.robotis.com/service/download.php?no=1380
[BIO_STEM_TransPorter2_KR.tsk]: http://www.robotis.com/service/download.php?no=1381
[BIO_STEM_TransPorter3_KR.tsk]: http://www.robotis.com/service/download.php?no=1382
[BIO_STEM_ProbeCar1_KR.tsk]: http://www.robotis.com/service/download.php?no=1368
[BIO_STEM_ProbeCar2_KR.tsk]: http://www.robotis.com/service/download.php?no=1369
[BIO_STEM_ProbeCar3_KR.tsk]: http://www.robotis.com/service/download.php?no=1370
[BIO_STEM_BeetleGripper1_KR.tsk]: http://www.robotis.com/service/download.php?no=1342
[BIO_STEM_BeetleGripper2_KR.tsk]: http://www.robotis.com/service/download.php?no=1343
[BIO_STEM_BeetleGripper3_KR.tsk]: http://www.robotis.com/service/download.php?no=1344
[BIO_STEM_RobotArm1_KR.tsk]: http://www.robotis.com/service/download.php?no=1371
[BIO_STEM_RobotArm2_KR.tsk]: http://www.robotis.com/service/download.php?no=1372
[BIO_STEM_RobotArm3_KR.tsk]: http://www.robotis.com/service/download.php?no=1373
[BIO_STEM_Walking Droid1_KR.tsk]: http://www.robotis.com/service/download.php?no=1386
[BIO_STEM_Walking Droid2_KR.tsk]: http://www.robotis.com/service/download.php?no=1387
[BIO_STEM_Walking Droid3_KR.tsk]: http://www.robotis.com/service/download.php?no=1388
[BIO_STEM_Walking Droid_KR.mtn]: http://www.robotis.com/service/download.php?no=1389
[BIO_STEM_Hexapod1_KR.tsk]: http://www.robotis.com/service/download.php?no=1358
[BIO_STEM_Hexapod2_KR.tsk]: http://www.robotis.com/service/download.php?no=1359
[BIO_STEM_Hexapod3_KR.tsk]: http://www.robotis.com/service/download.php?no=1360
[BIO_STEM_Hexapod_KR.mtn]: http://www.robotis.com/service/download.php?no=1361
[BIO_STEM_GreetingPenguin1_KR.tsk]: http://www.robotis.com/service/download.php?no=1354
[BIO_STEM_GreetingPenguin2_KR.tsk]: http://www.robotis.com/service/download.php?no=1355
[BIO_STEM_GreetingPenguin3_KR.tsk]: http://www.robotis.com/service/download.php?no=1356
[BIO_STEM_GreetingPenguin_KR.mtn]: http://www.robotis.com/service/download.php?no=1357
[BIO_STEM_CannonShooter1_KR.tsk]: http://www.robotis.com/service/download.php?no=1348
[BIO_STEM_CannonShooter2_KR.tsk]: http://www.robotis.com/service/download.php?no=1349
[BIO_STEM_CannonShooter3_KR.tsk]: http://www.robotis.com/service/download.php?no=1350
