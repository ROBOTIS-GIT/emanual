---
layout: archive
lang: kr
ref: rplus2_block
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus2/rplus2_block/
sidebar:
  title: 로보플러스 블록
  nav: "rplus2_block"
---

# [개요](#개요)

로보플러스 블록은 구글 블로클리(Blockly) 방식의 블록형 코딩이 가능하도록 개발된 코딩 교육용 플랫폼입니다.

## [지원 제품 목록](#지원-제품-목록)
- ROBOTIS OLLO K
- ROBOTIS PLAY 700

## [지원 부품 목록](#지원-부품-목록)

### [제어기](#제어기)
- CM-50

### [부품](#부품)
- [BT-110]
- [BT-210]
- [BT-410]

# [시작하기](#시작하기)

## [로보플러스 블록 설치](#로보플러스-블록-설치)

### [시스템 최저 요구사항](#시스템-최저-요구사항)
- OS 버전 : Android 5.0(롤리팝) 이상
- H/W : 블루투스 내장 기기 (블루투스 2.0 / 4.0 지원)

### [다운로드/설치](#다운로드설치)

스마트 기기에서 Play 스토어를 실행합니다. (Play 스토어는 안드로이드 마켓 앱입니다.)  
Play 스토어에서 `R+Block` 을 검색한 후 설치합니다.

![](/assets/images/sw/rplus2/block/block_search_kr.png)
> Play 스토어에서 `로보티즈` 검색 및 선택

![](/assets/images/sw/rplus2/block/block_install_kr.png)
> 설치

## [메뉴 설명](#메뉴-설명)

R+Block 의 화면 구성은 아래와 같습니다.

![](/assets/images/sw/rplus2/block/menu_kr.png)

1. [제품명 표시 영역](#제품-변경)
2. [작품명 표시 영역](#제품-변경)
3. [실행 버튼](#실행)
4. [중지 버튼](#중지)
5. [저장 버튼](#저장)
6. [추가메뉴 버튼](#추가-메뉴)
7. [블록 레벨 선택 영역](#블록-레벨-변경)
8. [블록 그룹 영역](#블록-선택)
9. [실행 블록 영역](#블록-선택)
10. [작업 영역](#블록-선택)
11. [Undo 버튼](#undoredo-기능)
12. [Redo 버튼](#undoredo-기능)
13. [블록 삭제 영역 / 버튼 (휴지통)](#블록-삭제)

# [따라해보기](#따라해보기)

## [제품 변경](#제품-변경)
제품명 표시 영역을 클릭하면 R+Block 에서 사용 가능한 로보티즈 제품이 표시됩니다.

![](/assets/images/sw/rplus2/block/change_product_kr.png)

## [블록 레벨 변경](#블록-레벨-변경)
블록 레벨 선택 영역을 클릭하면 선택된 제품에서 사용가능한 블록 레벨이 표시됩니다.  
선택한 블록 레벨에 따라 블록 그룹, 그룹 내의 블록들이 다르게 표시될 수 있습니다.

![](/assets/images/sw/rplus2/block/change_blocklevel_kr.png)

## [블록 선택](#블록-선택)
블록 그룹을 클릭하면 해당 그룹에 포함된 블록들이 표시됩니다.  
블록을 작업영역으로 드래그하여 사용할 수 있으며, 한 화면에 표시되지 않는 블록은 위아래로 스크롤하여 표시할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_select_kr.png)

## [시작 블록](#시작-블록)
시작 블록은 하나만 사용할 수 있으며 시작 블록과 연결된 블록들만 실행 됩니다.

![](/assets/images/sw/rplus2/block/block_start_01_kr.png)

블록이 연결 가능하면 아래와 같이 연결 부위가 강조됩니다.

![](/assets/images/sw/rplus2/block/block_start_02_kr.png)

아래 화면은 시작 블록에 `이동 앞으로` 블록이 연결된 화면 입니다. 제품과 연결 되면 시작 블록에 연결된 `이동 앞으로` 블록이 실행되어 제품이 전진합니다.

![](/assets/images/sw/rplus2/block/block_start_03_kr.png)

아래와 같이 떨어져 있다면 `이동 앞으로` 블록은 실행되지 않습니다.

![](/assets/images/sw/rplus2/block/block_start_04_kr.png)

## [블록 삭제](#블록-삭제)
블록 그룹 영역이나 휴지통에 블록을 드래그 하여 삭제할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_trash_kr.png)

휴지통을 클릭하면 삭제한 블록이 표시되어 다시 사용할 수 있습니다.  
한 화면에 표시되지 않는 블록은 좌우로 스크롤하여 표시할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_trash_01_kr.png)

## [블록 확대/축소](#블록-확대축소)
작업 영역의 빈 공간을 두 손가락으로 터치 후 손가락을 벌리거나 모으면 블록을 확대 또는 축소 할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_zoom_kr.png)

## [블록 추가 기능](#블록-추가-기능)
블록을 누르고 있으면 `같은 블록 만들기`, `블록 지우기` 와 같은 추가 기능을 사용할 수 있습니다.  
아래 화면에서는 `1 초` 블록의 추가 기능을 표시하는 예 입니다.

![](/assets/images/sw/rplus2/block/block_add_01_kr.png)

`1 초` 블록을 누르고 있으면 연결되어 같이 실행되는 블록의 색상이 바뀌어 표시됩니다.  
아래 화면에서는 `1 초` 블록 과 연결된 `이동 멈추기` 블록의 색상이 바뀌어 표시되었습니다.

![](/assets/images/sw/rplus2/block/block_add_02_kr.png)

블록을 누른채로 있으면 아래 화면과 같이 추가 기능이 표시 됩니다.

![](/assets/images/sw/rplus2/block/block_add_03_kr.png)

### [같은 블록 만들기](#같은-블록-만들기)
`1 초` 블록의 추가 기능을 표시하고 `같은 블록 만들기` 를 선택합니다.

![](/assets/images/sw/rplus2/block/block_copy_01_kr.png)

아래 화면과 같이 `1 초` 와 `이동 멈추기` 블록이 만들어져 표시됩니다.

![](/assets/images/sw/rplus2/block/block_copy_02_kr.png)

### [블록 숨기기](#블록-숨기기)
`아니면 만약 박수를 (2) 번 치면` 블록을 선택하여 `블록 숨기기` 를 선택합니다.

![](/assets/images/sw/rplus2/block/block_hide_01_kr.png)

`아니면 만약 박수를 (2) 번 치면` 과 연결된 블록들이 회색으로 표시됩니다. 숨겨진 블록은 `시작` 블록에 연결되어 있어도 실행되지 않습니다.

![](/assets/images/sw/rplus2/block/block_hide_02_kr.png)

### [블록 나타내기](#블록-나타내기)
숨겨진 블록을 선택하고 `블록 나타내기` 를 선택하면 다시 블록이 실행되도록 할 수 있습니다.

### [블록 지우기](#블록-지우기)
블록은 `블록 그룹 영역` 이나 `블록 삭제 영역 / 버튼` 으로 지울 수 있지만 `블록 지우기` 를 통해서도 지울 수 있습니다.  
아래와 같이 `아니면 만약 박수를 (2) 번 치면` 을 선택한 후 `블록 지우기`를 선택하면 블록을 지울수 있습니다.

![](/assets/images/sw/rplus2/block/block_delete_01_kr.png)  
![](/assets/images/sw/rplus2/block/block_delete_02_kr.png)

## [Undo/Redo 기능](#undoredo-기능)
블록을 이동 또는 삭제 하였을 때 취소하거나 다시 실행할 수 있습니다.  
undo / redo 기능의 사용이 가능한 상태가 되면 아래와 같이 버튼이 비활성화 된 상태에서 활성화 된 상태가 됩니다.

![](/assets/images/sw/rplus2/block/block_undoredo_kr.png)

## [실행](#실행)
`실행 버튼`을 클릭합니다.  
제품과 연결되어 있지 않으면 연결 화면이 표시됩니다.  

블루투스가 선택되어 있다면 `재시도` 버튼을 클릭하여 다시 연결을 시도할 수 있습니다.  
처음 실행하는 경우 `장치선택` 버튼을 클릭하여 연결할 장치를 선택할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_run_01_kr.png)

제품에 연결된 블루투스의 마지막 두자리를 입력하고 검색 버튼을 클릭합니다.  
블루투스가 검색되면 검색된 블루투스를 클릭하고 다시 `실행 버튼`을 클릭합니다.

![](/assets/images/sw/rplus2/block/block_run_02_kr.png)

제품에 연결된 블루투스와 연결되면 `대기 중...` 메시지가 표시됩니다.

![](/assets/images/sw/rplus2/block/block_run_03_kr.png)

블록이 실행되면 `실행 중...` 메시지가 표시되며 블록이 실행됩니다. 현재 실행 중인 블록은 붉은색으로 표시됩니다.

![](/assets/images/sw/rplus2/block/block_run_04_kr.png)

만약 계속 연결이 되지 않는다면 제품에 연결된 블루투스가 깜박이는지 확인 후 `장치선택` 버튼을 클릭하여 다시 검색 후 실행 버튼을 클릭합니다.

연결된 블루투스와 연결을 해제하려면 연결된 제품의 전원을 끄거나 `추가 메뉴` -> `설정` -> `블루투스` 를 선택하면 연결이 해제 됩니다.

## [중지](#중지)
`실행 중...` 인 상태에서 `정지 버튼` 을 누르거나 우측 상단의 `x` 버튼을 누르면 실행을 중지할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_stop_kr.png)

## [저장](#저장)
현재의 작품을 저장합니다. `추가 메뉴` -> `작품` -> `저장하기` 를 클릭하여 저장할 수도 있습니다.

![](/assets/images/sw/rplus2/block/block_save_kr.png)

## [끝내기](#끝내기)
스마트 기기의 뒤로가기 버튼을 누르면 R+Block 앱이 종료됩니다.

![](/assets/images/sw/rplus2/block/block_quit_kr.png)

### [취소](#취소)
종료를 취소하고 계속 작업합니다.

### [종료](#종료)
작업한 내용을 저장하지 않고 바로 종료 합니다.

### [저장 후 종료](#저장-후-종료)
작업한 내용을 저장하고 종료합니다.

# [추가 메뉴](#추가-메뉴)
`추가 메뉴 버튼`을 클릭하면 `설정`, `작품`, `Task` 등의 메뉴를 사용할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_menu_kr.png)

## [설정](#설정)
`블루투스`, `e-매뉴얼`, `버전정보` 등을 확인할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_setting_kr.png)

### [블루투스](#블루투스)
제품에 연결된 블루투스를 설정, 변경 하거나 연결된 블루투스를 연결 해제 할 수 있습니다.  
블루투스 검색시에는 블루투스 모듈이나 제품에 표시된 주소 중 마지막 두 자리를 입력 후 검색 버튼을 클릭해야 합니다.

![](/assets/images/sw/rplus2/block/block_option_bluetooth_kr.png)

### [e-매뉴얼](#e-매뉴얼)
온라인 매뉴얼을 확인할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_emanual_kr.png)

### [버전 정보](#버전-정보)
현재의 앱 버전을 확인할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_version_kr.png)

## [작품](#작품)
작업 중인 내용을 저장하거나 불러오기 등의 기능을 사용할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_project_kr.png)

### [저장하기](#저장하기)
현재 작업 중인 내용을 저장할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_save_01_kr.png)

![](/assets/images/sw/rplus2/block/block_option_save_02_kr.png)
> 작품 이름을 입력하고 OK 버튼을 클릭합니다.

![](/assets/images/sw/rplus2/block/block_option_save_03_kr.png)
> 작품 이름이 표시됩니다.

이미 작품 이름이 저장되어 있다면 `저장하기` 를 클릭했을 때 작품 이름이 표시됩니다. 작품 이름을 변경하면 변경한 이름으로 새로 저장됩니다.

### [불러오기](#불러오기)
저장된 작품을 불러올 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_load_kr.png)

### [지우기](#지우기)
작업 중인 블록들을 삭제할 수 있습니다. 시작 블록을 제외한 모든 블록들이 지워지고 작품 이름은 그대로 사용합니다.

![](/assets/images/sw/rplus2/block/block_option_erase_kr.png)

### [새로만들기](#새로만들기)
새로운 작품을 만듭니다.

![](/assets/images/sw/rplus2/block/block_option_create_01_kr.png)

> 새로 만들 작품 이름을 입력하고 OK 버튼을 누릅니다.

![](/assets/images/sw/rplus2/block/block_option_create_02_kr.png)

### [삭제하기](#삭제하기)
저장된 작품의 목록이 표시됩니다. 지울 작품 이름을 누르고 있으면 삭제됩니다.

![](/assets/images/sw/rplus2/block/block_option_delete_kr.png)

### [태스크](#태스크)
블록으로 작성된 코드를 Task 코드로 변환하거나 다운로드 할 수 있습니다.

![](/assets/images/sw/rplus2/block/block_option_task_kr.png)

R+Task 가 설치되어 있지 않으면 구글 플레이로 이동합니다. R+Task 앱을 설치해주세요.

![](/assets/images/sw/rplus2/block/block_option_task_search_kr.png)
> Play 스토어에서 `로보티즈` 검색 후 R+mTask2 선택

![](/assets/images/sw/rplus2/block/block_option_task_install_kr.png)
> 설치

#### [변환](#변환)
블록으로 작성된 코드가 Task 코드로 변환되어 표시 됩니다.  
R+Task 앱을 통해 블록으로 작성할 수 없는 코드를 추가하거나 에러를 확인할 수 있습니다.  
R+Task 앱을 통해 제품으로 다운로드 하는 방법은 R+Task 앱 설명을 확인해주세요.

![](/assets/images/sw/rplus2/block/block_option_convert_kr.png)

변환된 태스크 코드는 안드로이드 기기의 경우 아래의 위치에 저장됩니다.

#### [다운로드](#다운로드)
변환된 코드를 R+Task 앱에 표시하지 않고 바로 제품으로 다운로드 합니다.  
제품에 다운로드 되어 실행되기 때문에 R+Block 의 연결이 필요없으며 실행 속도가 빠릅니다.  
다운로드된 코드는 제품의 전원을 켰을 때 바로 실행됩니다.

![](/assets/images/sw/rplus2/block/block_option_download_kr.png)

# [유용한 정보](#유용한-정보)


[BT-110]: /docs/kr/parts/communication/bt-110/
[BT-210]: /docs/kr/parts/communication/bt-210/
[BT-410]: /docs/kr/parts/communication/bt-410/
