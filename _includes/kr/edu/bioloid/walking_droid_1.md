평상시에는 앞으로 걷고, 장애물을 감지하면 회피하여 움직이는 보행 드로이드를 만들어 보도록 하겠습니다.  
보행 드로이드는 걷기, 장애물 회피하기 등의 동작을 할 때, 여러가지 포즈를 사용하기 때문에, 이를 모션으로 저장하여 사용하는 것이 편리합니다.

### 모션 정하기
보행 드로이드의 주변 상황이나 동작 상태에 따른 행동 양식입니다.

|                    상황                     |         행동         |
|:-------------------------------------------:|:--------------------:|
|               처음 실행할 때                |   기본자세로 정지    |
|             장애물이 없는 경우              |     앞으로 걷기      |
|            장애물을 발견한 경우             |  정지 후 뒤로 걷기   |
|               뒤로 걸어간 후                | 왼쪽으로 방향 바꾸기 |
| 왼쪽으로 방향을 바꾸어도 장애물이 감지될 때 | 왼쪽으로 방향 바꾸기 |

중복되는 동작을 제외하고 다음과 같이 4가지 모션을 만들어야 하며, 이를 이용하여 장애물을 회피하면서 걷는 동작을 할 수 있습니다.
- 정지
- 앞으로 걷기
- 뒤로 걷기
- 왼쪽으로 방향 바꾸기

### 모션 만들기

1. RoboPlus Motion을 실행하고 제어기와 연결합니다.([로봇 연결하기 참조])

    ![](/assets/images/edu/bioloid/walking_01_kr.png)

    ![](/assets/images/edu/bioloid/walking_02_kr.png)

2. 정지 상태 모션을 만들기 위해 1번 페이지에 이름을 입력하고, 스탭을 추가합니다.

    ![](/assets/images/edu/bioloid/walking_03_kr.png)

3. ID 1, 2, 3, 4의 관절값을 512로 설정하고, 오른쪽 방향의 화살표를 누르면 값이 로봇에 적용되며, 설정된 포즈를 직접 확인할 수 있습니다. (사용자가 관절값을 직접 입력하는 방법입니다.)

    ![](/assets/images/edu/bioloid/walking_04_kr.png)

4. 실행 시간을 조절합니다. 가장 빠른 시간인 0.072초로 설정하였습니다.

    ![](/assets/images/edu/bioloid/walking_05_kr.png)

5. 앞으로 걷기 모션을 만들기 위해 12번 페이지에 이름을 입력하고 스탭을 추가합니다.

    ![](/assets/images/edu/bioloid/walking_07_kr.png)

6. 토크 오프 버튼을 눌러 로봇의 모든 관절의 토크를 끕니다. 다음과 같이 관절값이 모두 꺼짐으로 설정되는 것을 확인할 수 있습니다.

    ![](/assets/images/edu/bioloid/walking_08_kr.png)

    ![](/assets/images/edu/bioloid/walking_09_kr.png)

7. 사용자가 로봇의 포즈를 설정 해 줍니다. 다음 그림은 보행 드로이드의 걷기 시작하는 포즈입니다.

    ![](/assets/images/edu/bioloid/walking_10_kr.png)

8. 위와 같이 로봇의 포즈를 설정하고 토크 온 버튼을 누르면 현재 로봇의 관절값이 로봇의 포즈에 자동으로 입력됩니다. 왼쪽 화살표 버튼을 누르면 현재 입력된 로봇의 관절을 스텝의 포즈로 읽어올 수 있습니다. (사용자가 관절값을 로봇으로부터 읽어오는 방법입니다.)

    ![](/assets/images/edu/bioloid/walking_11_kr.png)

9. 5번부터 반복하여 각각의 스텝에 앞으로 걷는 포즈를 추가합니다. 포즈 추가가 완료되면 멈춤시간과 실행시간을 적절하게 조절합니다.

    ![](/assets/images/edu/bioloid/walking_12_kr.png)

10. 모션 실행 버튼을 누르면 현재 페이지의 스텝을 연속적으로 실행합니다. 로봇이 잘 움직이는지 확인합니다.

    ![](/assets/images/edu/bioloid/walking_06_kr.png)

11. 지금까지와 같은 방법으로 페이지 13에 뒤로 걷기, 페이지 15에 왼쪽으로 돌기 모션을 추가합니다.

    ![](/assets/images/edu/bioloid/walking_13_kr.png)

12. 로봇에 현재까지 작업한 내용을 저장합니다.

    ![](/assets/images/edu/bioloid/walking_14_kr.png)

### 다운로드

- 예제 모션 파일 : [download][BIO_CMP_WalkingDroidExam1_KR.mtn]
- 다운로드 방법 : [모션 파일 다운로드]

[BIO_CMP_WalkingDroidExam1_KR.mtn]: http://www.robotis.com/service/download.php?no=1241
