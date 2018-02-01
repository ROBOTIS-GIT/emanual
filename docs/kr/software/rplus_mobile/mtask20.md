---
layout: archive
lang: kr
ref: mtask20
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus_mobile/mtask20/
sidebar:
  title: 로보플러스 모바일 태스크 2.0
  nav: "mtask20"
---

# [개요](#개요)

안드로이드 기기 및 iOS 기기에서 로보플러스 태스크 2.0 (R+ Task 2.0)과 동일한 기능을 제공합니다.  
예제 다운로드, 편집, 디버깅, 리모컨 기능을 제공합니다.

## [구동사양 및 주의사항](#구동사양-및-주의사항)

항상 제어기의 펌웨어를 최신 버전으로 유지 시켜주세요.  
반드시 구동 기기에서 블루투스를 지원해야 다운로드 기능을 이용할 수 있습니다.

## [지원제품](#지원제품)

- [ROBOTIS DREAM]
- [ROBOTIS SMART]
- [ROBOTIS STEM]
- [ROBOTIS PREMIUM]
- [ROBOTIS GP]
- [ROBOTIS MINI]
- [ROBOTIS IoT]

그 외 [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM9.04], [OpenCM7.0]을 사용하여 만든 사용자 로봇

# [메뉴설명](#메뉴설명)

## [단계별 편집 탭](#단계별-편집-탭)

작업 영역이 홈 탭, 프로그래밍 탭, 디버깅 탭으로 분리됩니다.

![](/assets/images/sw/rplus_mobile/r+m_task2_1_kr.gif)

## [시작화면](#시작화면)

시작 화면에서는 편집기와 리모컨을 선택할 수 있습니다.

![](/assets/images/sw/rplus_mobile/r+m_task2_2_kr.gif)

## [홈 탭](#홈-탭)

프로그램 시작 시 첫 화면으로 기본 예제, 파일 관련 메뉴, 업데이트, 설정 메뉴, 리모컨을 포함합니다.

![](/assets/images/sw/rplus_mobile/r+m_task2_3_kr.gif)

![](/assets/images/sw/rplus_mobile/r+m_task2_4_kr.gif)

## [프로그래밍 탭](#프로그래밍-탭)

태스크 소스 코드를 편집하는 영역으로 프로그래밍 툴바, 소스뷰, 아웃라인 메뉴, 다운로드 기능을 제공합니다.

![](/assets/images/sw/rplus_mobile/r+m_task2_5_kr.gif)

![](/assets/images/sw/rplus_mobile/r+m_task2_6_kr.gif)

## [디버깅 탭](#디버깅-탭)

태스크 코드를 디버깅하기 위한 영역으로 출력 모니터, 가상리모컨 기능을 제공합니다.

(사용자 편의를 위해 자동 연결기능이 추가되었습니다.)

![](/assets/images/sw/rplus_mobile/r+m_task2_7_kr.gif)

![](/assets/images/sw/rplus_mobile/r+m_task2_8_kr.gif)


# [따라해보기](#따라해보기)

## [예제파일 열기](#예제파일-열기)
1. 홈 탭으로 이동합니다. (프로그램 시작 시 홈 탭에서 시작됩니다)  
2. “예제” 버튼을 클릭합니다.  
3. 원하는 제품과 단계, 예제 명을 선택합니다.   
4. “확인” 버튼을 클릭합니다.

  ![](/assets/images/sw/rplus_mobile/r+m_task2_61_kr.gif)

## [새 파일 만들기](#새-파일-만들기)

1. 홈 탭으로 이동합니다. (프로그램 시작시 홈 탭에서 시작됩니다)  
2. “새로 만들기”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_9_kr.gif)

3. 제어기와 제어기의 펌웨어 버전을 선택합니다. (구1.0, 신규2.0)  
4. “확인”버튼을 클릭하면 새로운 Task 파일이 생성됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_10_kr.gif)

## [명령어 편집하기](#명령어-편집하기)
1. 프로그래밍 탭으로 이동합니다. (새 파일을 생성한 직후라면 프로그래밍 탭에서 시작됩니다)
2. 명령어 버튼을 클릭합니다.
3. “반복문” 카테고리를 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_11_kr.gif)

4. “무조건 반복” 명령어를 드래그(drag)하여,

5. 원하는 라인에 드롭(drop)하여 명령어가 추가합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_12_kr.gif)

## [파라미터 편집하기](#파라미터-편집하기)
1. “명령어” 버튼을 클릭합니다.
2. “실행문” 카테고리를 클릭합니다.
3. “로드” 명령어를 드래그(drag)하여,
4. 원하는 라인에 드롭(drop)하여 명령어를 추가합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_13_kr.gif)

5. 추가된 명령어의 “좌변 블록”을 두 번 터치합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_14_kr.gif)

6. 카테고리1의 “제어기 장치”를 선택합니다.
7. 카테고리2의 “주변 장치”를 선택합니다.
8. 포트를 1번으로 선택한 후 “감속모터”를 선택합니다.
9. “확인” 버튼을 클릭하여 명령어 편집을 완료합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_15_kr.gif)

10. 추가된 명령어의 “우변 블록”을 두 번 터치합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_16_kr.gif)

11. 카테고리1의 “제어기 상수”를 선택합니다.
12. 카테고리2의 “모터 제어 값”을 선택합니다.
13. 방향을 “CCW”로 선택한 후 출력 값에 500을 입력합니다.
14. “확인” 버튼을 클릭하여 명령어 편집을 완료합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_17_kr.gif)

15. 편집이 적용된 명령어 블록을 확인합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_18_kr.gif)

## [다운로드 하기](#다운로드-하기)

1. “장치” 버튼을 클릭합니다.
2. 로봇의 연결 장치를 선택합니다 (처음 연결할 경우 블루투스 필터 2자리를 입력해야 합니다.)
3. “확인” 버튼을 클릭합니다.
4. 창이 닫히면 “다운로드”버튼을 클릭합니다.(BT-210을 사용할 경우 PIN번호[0000]를 입력해야 합니다.)
  
    ![](/assets/images/sw/rplus_mobile/r+m_task2_19_kr.gif)

5. 다운로드가 완료되면 제어기가 Task를 실행합니다.(일부 제어기의 경우 제어기가 Task를 실행하는 대신 종료합니다.)

    ![](/assets/images/sw/rplus_mobile/r+m_task2_20_kr.gif)

## [프로그램 출력보기](#프로그램-출력보기)

1. 디버깅 탭으로 이동합니다.
2. “장치” 버튼을 클릭합니다.
3. 로봇의 연결 장치를 선택합니다.(처음 연결할 경우 블루투스 필터 2자리를 입력해야 합니다.)
4. “확인” 버튼을 클릭합니다.
5. 창이 닫히면 “시작” 버튼을 클릭합니다. (BT-210을 사용할 경우 PIN번호[0000]를 입력해야 합니다.)

    ![](/assets/images/sw/rplus_mobile/r+m_task2_21_kr.gif)

6. 로봇이 연결되면 “출력 모니터”와 “가상 리모컨”이 활성화 됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_22_kr.gif)

7. 소스 코드상에서 “화면출력 후 줄 바꿈(혹은 화면출력)”을 사용한 경우,

    ![](/assets/images/sw/rplus_mobile/r+m_task2_23_kr.gif)

8. 다음과 같이 “출력용 모니터”에 값이 출력됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_24_kr.gif)

## [리모컨 사용하기](#리모컨-사용하기)

1. 홈 탭으로 이동합니다. (프로그램 시작시 홈 탭에서 시작됩니다.)
2. “장치” 버튼을 클릭합니다.
3. 로봇의 연결 장치를 선택한 후, (처음 연결할 경우 블루투스 필터 2자리를 입력해야 합니다.)
4. “확인” 버튼을 클릭합니다.
5. 창이 닫히면 “리모컨” 버튼을 클릭합니다.(BT-210을 사용할 경우 PIN번호[0000]를 입력해야 합니다.)

    ![](/assets/images/sw/rplus_mobile/r+m_task2_25_kr.gif)

6. 초기에 리모컨이 실행되면 “버튼”모드로 로봇을 조종할 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_26_kr.gif)

7. “조이스틱”모드를 선택하면 방향키가 조이스틱 형태로 변경됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_27_kr.gif)

8. “센서”모드를 선택하면 방향키가 기울기 센서 형태로 변경됩니

    ![](/assets/images/sw/rplus_mobile/r+m_task2_28_kr.gif)


# [프로그래밍(편집)](#프로그래밍편집)

## [명령어 삽입/변경](#명령어-삽입변경)

1. 우측의 “명령어” 탭을 클릭합니다.(혹은 명령어를 삽입할 위치를 두 번 터치합니다.)

2. 명령어를 드래그(drag)하여 원하는 위치에 드롭(drop)합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_29_kr.gif)

3. 명령어 블록을 두 번 터치하면 다른 명령어로 변경할 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_30_kr.gif)

## [여러 줄 선택](#여러-줄-선택)

1. 줄 번호를 드래그(drag)하여 여러 줄을 선택합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_31_kr.gif)

2. 이미 선택된 라인의 번호를 드래그(drag)하면 부분적으로 취소할 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_32_kr.gif)

3. 소스코드를 직접 클릭하면 라인선택이 취소됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_33_kr.gif)

## [줄 삽입/지우기](#줄-삽입지우기)

1. 줄 삽입(혹은 줄 지우기)를 진행할 위치를 터치하여 선택합니다.
2. “줄 삽입(+)”을 클릭하면 선택된 줄의 위쪽에 새로운 줄이 삽입됩니다.
3. “줄 지우기(-)”를 클릭하면 선택된 줄이 삭제됩니다.

  ![](/assets/images/sw/rplus_mobile/r+m_task2_34_kr.gif)

## [줄 활성/비활성](#줄-활성비활성)

1. 활성/비활성을 진행할 위치를 터치하여 선택합니다.
2. “줄 활성/비활성”버튼을 클릭하면 선택된 줄의 활성/비활성 상태가 전환됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_35_kr.gif)

3. 비활성화된 코드는 회색으로 표시되며 컴파일시 제외됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_36_kr.gif)

## [복사/잘라내기/붙여넣기](#복사잘라내기붙여넣기)

1. 복사(혹은 잘라내기)를 진행할 줄 번호를 드래그하여 선택합니다.
2. “추가 메뉴”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_38_kr.gif)

3. “복사(혹은 잘라내기)”를 클릭하면 선택된 줄이 클립보드에 복사됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_37_kr.gif)

4. 붙여넣기를 진행할 줄을 터치하여 선택합니다.
5. “추가 메뉴”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_39_kr.gif)

6. “붙여넣기”를 클릭하면 클립보드에 복사된 내용이 붙여집니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_40_kr.gif)

7. 그림과 같이 복사한 코드가 삽입됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_41_kr.gif)

## [실행취소/다시실행](#실행취소다시실행)

1. 코드를 편집하던 중에 “실행취소”버튼을 클릭하면 코드를 되돌릴 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_42_kr.gif)

2. 상단 툴바의 “다시실행”버튼을 클릭하면 되돌린 코드를 다시 실행할 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_43_kr.gif)

# [프로그래밍(명령어)](#프로그래밍명령어)

R+ m.Task 2.0에서 사용하는 명령어는 R+ Task 2.0과 동일합니다.  
R+ Task 2.0 매뉴얼의 [프로그래밍(명령어)]를 참고하세요.

[프로그래밍(명령어)]: /docs/kr/software/rplus2/task/#프로그래밍명령어

# [프로그래밍(파라미터)](#프로그래밍파라미터)

R+ m.Task 2.0에서 사용하는 파라미터는 R+ Task 2.0과 동일합니다.  
R+ Task 2.0 매뉴얼의 [프로그래밍(파라미터)]를 참고하세요.

[프로그래밍(명령어)]: /docs/kr/software/rplus2/task/#프로그래밍파라미터

# [소프트웨어 다운로드](#소프트웨어-다운로드)

## [Android](#android)
- 시스템 최저 요구 사양
  - OS : Android 2.3이상
  - 하드웨어 : 1.2 dual-core CPU, 1GB RAM 이상, 블루투스 및 센서 내장 기기
 
- 통신 
  - BT-410 지원 (Android 4.4이상)
  - BT-210, BT-110 지원

- [다운로드](https://play.google.com/store/apps/details?id=com.robotis.task2)

## [Apple](#apple)
- 시스템 최저 요구 사양
  - OS : iOS 8.0 이상
  - 하드웨어 : iPhone4S, iPod 5G, iPad mini, iPad 2 이상
 
- 통신 관련
  - BT-410 지원
  - BT-210, BT-110 지원 불가

- [다운로드](https://itunes.apple.com/kr/app/r%2b-m.task2-robotis/id1031166481?mt=8)

# [유용한 정보](#유용한-정보)

## [변수, 함수 참조 찾기](#변수-함수-참조-찾기)

변수 & 함수가 사용된 지점을 찾아가는 기능입니다. 각 변수 & 함수의 이름변경 기능을 제공합니다.
1. 우측의 “변수(또는 함수)”버튼을 클릭합니다. (변수 또는 함수가 반드시 하나 이상 존재해야 합니다.)
2. “변수 목록(또는 함수 목록)”에서 참조 찾기를 진행할 대상을 선택합니다.
3. 변수 목록 하단의 “참조 찾기(돋보기)” 버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_44_kr.gif)

4. “참조 결과”에서 항목을 선택하면 위치를 찾아갈 수 있습니다.
5. 다시 “참조 찾기”버튼을 클릭하여 창을 닫습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_45_kr.gif)

6. 변수 목록 하단에 “이름 변경”버튼을 클릭하면 해당 변수(함수)의 이름을 일괄적으로 변경할 수 있습니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_46_kr.gif)

## [키워드 찾기](#키워드-찾기)

프로그램 코드에서 사용한 요소를 검색하는 기능입니다.
1. 우측 하단의 찾기 버튼을 클릭하세요.
2. 상단에 검색어를 입력하세요.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_47_kr.gif)

3. 태스크 코드에서 “찾기 결과”가 하단에 목록으로 표시됩니다.
4. 목록의 아이템을 클릭하면 해당 줄로 이동합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_48_kr.gif)

## [문법 검사, 컴파일 결과 확인하기](#문법검사-컴파일-결과-확인하기)
태스크 코드를 제어기에 다운로드하기 위해서는 문법 검사 및 컴파일 과정을 거쳐야 합니다. 제어기에 다운로드를 시도하거나 “오류”버튼을 클릭하면 문법 검사 및 컴파일이 자동으로 수행됩니다.  

문법 검사 : 태스크 코드에서 사용한 명령어가 제어기에서 호환된 명령어인지, 문법에 오류가 있는지를 검사하는 과정입니다. 반드시 모든 오류를 수정해야 다음과정이 진행됩니다.

컴파일 : 문법 검사가 올바르게 이루어진 코드를 제어기가 해석 가능한 기계어로 변환하는 과정입니다. 컴파일 과정에서 변수 개수, 콜백 사용량, 메모리 사용량을 검사하게 됩니다.

![](/assets/images/sw/rplus_mobile/r+m_task2_49_kr.gif)

## [안드로이드 기기에 태스크파일 복사하기](#안드로이드-기기에-태스크파일-복사하기)
PC에서 작성한 태스크 파일을 안드로이드 기기에 복사하여 사용할 수 있습니다.

1. USB 케이블을 이용하여 안드로이드 기기를 PC에 연결합니다. (PC에 안드로이드 기기 제조사에서 제공하는 USB 드라이버가 설치되어 있어야 합니다.)  
2. 탐색기에서 “스마트 기기의 장치” → “내부 저장소” → “RoboPlus”로 이동합니다. (만약 “RoboPlus” 폴더가 존재하지 않으면 RoboPlus 폴더를 직접 생성합니다.)

    ![](/assets/images/sw/rplus_mobile/r+m_task2_50_kr.gif)

3. “RoboPlus”폴더 내에 원하는 태스크 파일(*.tsk)을 복사합니다.*

    ![](/assets/images/sw/rplus_mobile/r+m_task2_51_kr.gif)

4. 파일 복사가 완료되면 안드로이드 기기에서 R+ m.Task 2.0를 실행하여 상단의 “열기”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_52_kr.gif)

5. 열기 창에 복사한 파일을 선택하여 “확인”버튼을 클릭하면 복사한 파일이 실행됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_53_kr.gif)

##  [Apple 기기에 태스크파일 복사하기](#apple-기기에-태스크파일-복사하기)

PC에서 작성한 태스크 파일을 iOS 기기에 복사하여 사용할 수 있습니다.

1. USB 케이블을 이용하여 iOS 기기를 PC에 연결합니다. (PC에 iOS 기기 제조사에서 제공하는 USB 드라이버가 설치되어 있어야 합니다.)
2. PC에서 iTunes를 실행합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_54_kr.gif)

3. iTunes가 실행되면 상단에 연결된 장치를 선택합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_55_kr.gif)

4. 좌측에 “App” 카테고리를 선택합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_56_kr.gif)

5. App 목록이 로딩될 때까지 잠시 기다린 후, 화면을 아래로 스크롤합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_57_kr.gif)

6. App 목록에서 R+ Task2를 선택한 후, 좌측 도큐멘트 폴더 내에 원하는 태스크 파일(*.tsk)을 복사합니다.*

    ![](/assets/images/sw/rplus_mobile/r+m_task2_58_kr.gif)

7. 파일 복사가 완료되면 iOS 기기에서 R+ m.Task 2.0를 실행하여 상단의 “열기”버튼을 클릭합니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_59_kr.gif)

8. 열기 창에 복사한 파일을 선택하여 “확인”버튼을 클릭하면 복사한 파일이 실행됩니다.

    ![](/assets/images/sw/rplus_mobile/r+m_task2_60_kr.gif)

# [자주 묻는 질문](#자주-묻는-질문)

## 지원 가능한 제품 군은?

- [ROBOTIS DREAM]
- [ROBOTIS SMART]
- [ROBOTIS STEM]
- [ROBOTIS PREMIUM]
- [ROBOTIS GP]
- [ROBOTIS MINI]
- [ROBOTIS IoT]
- 그 외 [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM9.04], OpenCM7.0을 사용하여 만든 사용자 로봇

## 기존 태스크 1.0에서 사용하던 TSK파일을 태스크 2.0에서 사용할 수 있나요?

- 사용할 수 있습니다. 단, 기존 TSK파일을 태스크2.0으로 불러와 다시 저장할 경우 태스크 1.0에서 더 이상 사용할 수 없습니다.

## 태스크 다운로드 후 제어기가 종료되지 않습니다. 어떻게 해야 하나요?

- R+ Task 2.0에서는 태스크를 다운로드 후 태스크가 실행됩니다. (해당 제어기 : CM-150, OpenCM9.04, OpenCM7.0…)

## R+ Task 2.0에서 블루투스 모듈을 사용할 수 있나요?

- 제어기마다 지원하는 블루투스 모듈이 다르므로 각 블루투스 모듈의 사양서를 참고하세요.
  - BT-110, BT-210, BT-410

## 제어기가 잘 연결되지 않습니다. 어떻게 해야 하나요?

- 제어기를 껐다 켠 후 다시 시도해보세요. 문제가 지속된다면 제어기의 펌웨어를 최신 버전으로 업데이트하세요. 제어기 펌웨어 업데이트

## 도움말 애니메이션을 더 이상 보고 싶지 않습니다. 어떻게 해야 하나요?

- 홈 탭 > 설정 메뉴로 이동하여 “도움말 애니메이션”을 비활성화하면 더 이상 도움말 애니메이션이 나타나지 않습니다.

[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCM9.04]: /docs/kr/parts/controller/opencm904/
[ROBOTIS DREAM]: /docs/kr/edu/dream/dream1-1/
[ROBOTIS SMART]: /docs/kr/edu/smart/smart1-1/
[ROBOTIS STEM]: /docs/kr/edu/bioloid/stem/
[ROBOTIS PREMIUM]: /docs/kr/edu/bioloid/premium/
[ROBOTIS GP]: /docs/kr/edu/bioloid/gp/
[ROBOTIS MINI]: /docs/kr/edu/mini/
[ROBOTIS IoT]: /docs/kr/edu/iot/iot-1/
