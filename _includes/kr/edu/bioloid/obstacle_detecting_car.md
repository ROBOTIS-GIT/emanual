장애물을 피하며 주행하는 지능형 자동차를 만들어 보겠습니다. 조립서의 2-2-9. 장애물 감지 차를 참조하여 하드웨어를 완성하십시오.

![](/assets/images/edu/bioloid/detectcar_kr.png)

각 방향의 물체 감지 유무에 따른 장애물 감지차의 행동 패턴은 아래와 같습니다.

| 왼쪽 | 정면|오른쪽|행돈 패턴 |
|:----:|:---------------------:|
|  -   |       -|-|전진        |
|  O   |      -|-|우회전       |
|  -   |       O|-|후진        |
|  O   |      O|-|우회전       |
|  -   |      -|O|좌회전       |
|  O   |       -|O|전진        |
|  -   |      O|O|좌회전       |
|  O   |       O|O|정지        |

### 다이나믹셀 모드 설정
AX-12+ 를 장애물 감지차의 바퀴로 사용하기 위해 바퀴 모드(무한 회전 모드)로 변경합니다. 변경 방법은 [로보플러스 매니저] 를 사용하여 AX-12+ 의 CW 위치 제한 값과 CCW 위치 제한 값을 모두 0 으로 설정하면 됩니다.

 ![](/assets/images/edu/bioloid/detectcar-01_KR.png)

### 태스크 코드 작성

 ![](/assets/images/edu/bioloid/detectcar-02_KR.png)

 1. 모터 이동 속도 기본 값 변수로 저장
 2. 물체 감지 판단을 위해 [물체 감지 기준 값과 물체 감지 유무]를 사용합니다. 이를 위해 물체 감지 기준 값을 설정합니다.
 3. 물체 감지 유무 값(장애물 감지 방향)에 따라 적절한 동작 함수를 호출합니다.

    ![](/assets/images/edu/bioloid/detectcar-03_KR.png)

 4. 정지 / 전진 / 후진 / 우회전 / 좌회전 동작을 만듭니다. 각 모터의 이동 속도는 처음에 설정한 속도 값인 이동속도 변수에 방향을 나타내는 CW:0 과 CCW:0 을 합해서 설정합니다.

### 다운로드

- 완성된 태스크 코드 : [Download][BIO_CMP_ObstacleDetectionCarExam_KR.tsk]
- 다운로드 방법 : [태스크 코드 다운로드]

### 동작 확인
다운로드한 태스크 코드를 PLAY 시킵니다. 장애물을 피하며 주행하는지 확인하십시오.

![](/assets/images/edu/bioloid/detectcar-result_KR.png)

[BIO_CMP_ObstacleDetectionCarExam_KR.tsk]: http://www.robotis.com/service/download.php?no=1214
