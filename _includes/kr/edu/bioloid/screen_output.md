- `학습 목표`: 화면에 1과 2를 출력합니다.
  
  ![](/assets/images/edu/bioloid/tutorial_printscr_result_kr.png)

### 태스크 코드 작성
1. [로보플러스 태스크] 프로그램 실행  
  아래 그림에서와 같이 윈도우에서 "시작 > 모든 프로그램 > ROBOTIS > RoboPlus > Software > RoboPlus Task" 를 선택하면 로보플러스 태스크 가 실행됩니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_01_kr.png)

    - 로보플러스 태스크 초기 화면

      ![](/assets/images/edu/bioloid/tutorial_printscr_1_02_kr.png)

2. 제어기 선택  
  빈 줄을 선택한 후 더블클릭 하거나 Enter 키를 누르면 <제어기 선택> 대화창이 나타납니다. 자신의 제어기를 선택한 후 <확인> 버튼을 누릅니다.
    
    ![](/assets/images/edu/bioloid/tutorial_printscr_1_03_kr.png)

3. [프로그램 시작] 만들기  
  **제어기 선택** 창에 이어서 뜨는 **명령어 종류 선택** 창에서 '프로그램 시작'을 선택하면 RoboPlus Task 에 **프로그램 시작** 이 만들어 집니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_04_kr.png)

4. [무조건 반복] 명령어 입력  
  숫자를 반복하여 화면에 출력하기 위하여 **무조건 반복** 명령어를 사용합니다. ([명령줄 만들기])  
  프로그램 시작의 { 와 } 사이 구간의 빈 줄을 더블클릭 하거나 선택 후 Enter 키를 누르면 <명령어 종류 선택> 창이 뜹니다. 명령어 종류 중 "반복문 >> 무조건 반복 (while(1))" 을 선택합니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_05_kr.png)
5.[로드] 명령어 입력  
  화면에 출력할 값을 <화면 출력> 으로 입력하기 위해 <로드> 명령어를 사용합니다. 무조건 반복의 { 와 } 사이 구간의 빈 줄에 "실행문 >> 로드 (값 입력하기)" 를 선택하여 입력합니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_06_kr.png)

6. 숫자 **1** 을 [화면 출력] 으로 로드  
  로드 명령어의 파라미터 중 좌측 파라미터( ? )를 선택합니다. ([파라미터에 대한 설명])  
  좌측 파라미터는 우측 파라미터 값을 입력할 곳입니다. 좌측 파라미터 **?**를 더블클릭 하거나 클릭 후 Enter 키를 누르면 아래와 같은 **파라미터 선택 창**이 뜹니다.  
  제어기 > 화면 출력 을 선택하고 확인 버튼을 누릅니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_07_kr.png)  

    같은 방법으로 우측 파라미터 **?** 에는 상수 > 숫자 > 1 을 입력합니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_08_kr.png)  

    로드 명령어의 파라미터를 모두 입력한 화면은 아래와 같습니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_09_kr.png)

7. 숫자 **2** 를 [화면 출력 후 줄 바꿈] 으로 로드  
  화면 출력 아래의 } (무조건 반복의 구간 끝)를 선택하고 스페이스(Space) 키를 눌러 빈 줄을 추가한 후 위 5. ~ 6. 에서와 동일한 방법으로 로드 명령어를 추가하고, 이번에는 "제어기 >> 화면 출력 후 줄 바꿈" 에 상수 숫자 2 를 로드합니다. 최종 완성된 태스크 코드는 아래와 같습니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_10_kr.png)

8. 태스크 코드 저장 하기  
  Ctrl + S 를 누르거나 도구 모음의 저장 버튼()을 눌러 저장합니다.

    ![](/assets/images/edu/bioloid/tutorial_printscr_1_11_kr.png)

### 태스크 코드 다운로드
- [태스크 코드 작성] 에서 작성한 태스크 코드를 제어기에 다운로드 합니다. ([태스크 코드 다운로드 방법])

### 실행 및 결과 확인
1. **프로그램 출력용 모니터** 창 띄우기  
  프로그램 실행 시 화면 출력을 보기 위해서는 반드시 프로그램 실행 전에 **프로그램 출력용 모니터** 창을 띄워야 합니다. 프로그램 출력용 모니터 창을 띄우는 방법은 아래와 같이 여러 가지가 있습니다.
    - 프로그램 다운로드 창에서 프로그램 출력 보기 버튼을 클릭
    
      ![](/assets/images/edu/bioloid/tutorial_printscr_3_01_kr.png)
      
    - 도구 모음에서 프로그램 출력 보기 버튼을 클릭
    - 프로그램(P) 메뉴의 프로그램 출력 보기(V) 메뉴 선택 혹은 단축키 F5

2. 프로그램 실행하기  
  제어기 전원 스위치를 켜면 모드 LED 가 깜빡이고 있는 대기 상태가 됩니다. 이 때 모드(MODE) 버튼을 눌러 모드 LED 가 PLAY 에 위치하도록 한 후 시작(START) 버튼을 누르면 다운로드 한 태스크 코드가 실행됩니다. 프로그램 출력용 모니터에 숫자 1 과 2 가 출력되는 것을 확인합니다.

  ![](/assets/images/edu/bioloid/tutorial_printscr_result_kr.png)
