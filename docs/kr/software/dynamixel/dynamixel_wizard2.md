---
layout: archive
lang: kr
ref: dynamixel_wizard2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/dynamixel/dynamixel_wizard2/
sidebar:
  title: 다이나믹셀 위자드 2.0
  nav: "dynamixel_wizard2"
---


![](/assets/images/sw/dynamixel/wizard2/wizard2_main_003.png)

# [개요](#개요)

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_000.jpg)

**소프트웨어 다운로드 (v2.0.11)**  
[윈도우](http://www.robotis.com/service/download.php?no=1670)  
[리눅스](http://www.robotis.com/service/download.php?no=1671)  
[맥 OS](http://www.robotis.com/service/download.php?no=1760)  

## [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)

다이나믹셀 위자드 2.0은 다양한 운영체제에서 다이나믹셀 제품들을 통합 관리할 수 있는 편리한 툴입니다.

다이나믹셀 위자드 2.0의 주요 역할은 다음과 같습니다.

- 모든 다이나믹셀의 펌웨어를 업데이트 및 복구할 수 있습니다.
- 다양한 프로토콜을 기반으로 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 및 파라미터 등을 설정하고, 목표 지령을 생성할 수 있습니다.
- 시간에 따라 변화하는 값들을 실시간 그래프로 확인할 수 있습니다.
- 사용자가 직접 프로토콜 패킷을 생성하여 전송하고, 모니터링 할 수 있습니다.

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_001.png)

## [지원 프로토콜](#지원-프로토콜)

- [프로토콜 1.0]
- [프로토콜 2.0]

## [지원 운영체제](#지원-운영체제)

- 윈도우 7 / 8.1 / 10 (32 bit and 64 bit)
- 리눅스
  - 우분투 18.04 (64 bit)
  - 우분투 16.04 (64 bit)
- 맥 OS 10.12 / 10.13 / 10.14 (64bit)

{% capture supported_platform %}
**경고**:
- 다이나믹셀 위자드 2.0은 노트북 및 데스크탑 환경에서만 테스트 되었습니다.
- x86기반 플랫폼에서 다이나믹셀 위자드 2.0을 사용 해주세요.
{% endcapture %}
<div class="notice--warning">{{ supported_platform | markdownify }}</div>

## [펌웨어 정의](#펌웨어-정의)

펌웨어는 하드웨어 장치를 구동하기 위하여 장치에 설치하는 기본적인 소프트웨어입니다. 펌웨어에는 PC나 스마트폰, 다른 장치와의 통신 약속이 포함되기 때문에 가급적 펌웨어를 최신상태로 유지할 것을 권장합니다. 모든 장치(제어기, 다이나믹셀 등)는 처음 구매시 펌웨어가 설치되어있으나, 기능 추가 / 버그 수정이 있을 경우 새로운 버전을 배포하기도 합니다.

## [펌웨어 업데이트의 중요성](#펌웨어-업데이트의-중요성)

- 새로운 기능이 추가되거나 기존의 기능이 수정될 경우, 새로운 펌웨어가 배포될 수 있습니다.
- 새로운 S/W를 지원해야 하는 경우, 호환성 향상을 위해 새로운 펌웨어가 배포될 수 있습니다.
- 버그 수정이 있을 경우, 새로운 버전의 펌웨어가 배포될 수 있습니다.
- 제품이 정상적으로 동작하지 않거나, 통신이 원활하지 않을 경우, 최신 펌웨어 업데이트를 통해 문제가 해결될 수 있습니다.

## [지원 제품 목록](#지원-제품-목록)

| DYNAMIXEL Series |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **DX**           | [DX-113]                       | [DX-116]                       | [DX-117]                       |                                |                 |
| **RX**           | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **EX**           | [EX-106+]                      |                                |                                |                                |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL330-M288]<br>[XL330-M077]   | [XL430-W250]                   | [2XL430-W250]                  |                 |
| **XC**           | [XC330-T288]<br>[XC330-T181]<br>[XC330-M288]<br>[XC330-M181] | [XC430-W150]<br/> [XC430-W240] | [2XC430-W250]                  |                                |                 |
| **XM**           | [XM430-W210]<br/> [XM430-W350] | [XM540-W150]<br/> [XM540-W270] |                                |                                |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **XW**           | [XW430-T333]<br/> [XW430-T200] | [XW540-T140]<br/> [XW540-T260] |                                |                                |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO L**        | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PH**           | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-100-S500-R]              |                                |                 |
| **PM**           | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |
| **ETC**          | [RH-P12-RN]                    | [RH-P12-RN(A)]                 |                                |                                |                 |

# [다이나믹셀 위자드 2.0 설치](#다이나믹셀-위자드-20-설치)

## [윈도우에서 설치하기](#윈도우에서-설치하기)

1. 윈도우즈 전용 패키지를 다운로드 합니다.  
  - [윈도우즈 소프트웨어 다운로드 (v2.0.9)](http://www.robotis.com/service/download.php?no=1670)
2. 다운받은 설치파일을 실행합니다.  

3. 안내에 따라 `Next`버튼을 눌러 설치를 진행합니다.

![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_01.png)

## [리눅스에서 설치하기](#리눅스에서-설치하기)

1. 리눅스 설치패키지를 다운로드합니다.  
  - [리눅스 소프트웨어 다운로드 (v2.0.9)](http://www.robotis.com/service/download.php?no=1671)  
2. 다음의 명령어를 수행하여 설치파일의 실행권한을 변경합니다.

    ```bash
    $ sudo chmod 775 DynamixelWizard2Setup_x64
    ```

3. 설치파일을 실행합니다.  

    ```bash
    $ ./DynamixelWizard2Setup_x64
    ```

4. 안내에 따라 `Next`버튼을 눌러 설치를 진행합니다.

5. 설치가 끝난 후, USB 포트에 접근하기 위해 사용자 계정을 dialout 그룹에 추가하세요. (아래 커맨드의 **\<your_account_id>**에 해당 PC에서 사용하는 계정으로 교체 하세요.)

    ```bash
    $ sudo usermod -aG dialout <your_account_id>
    ```

6. Dialout 그룹에 계정 추가를 완료하기위해 시스템을 재부팅 하세요.

    ```bash
    $ reboot
    ```

## [맥에서 설치하기](#맥에서-설치하기)

1. 맥 OS 설치 패키지를 다운로드 합니다.  
  - [맥 소프트웨어 다운로드 (v2.0.9)](http://www.robotis.com/service/download.php?no=1760)
2. 다운로드가 완료된 dmg 파일을 오른쪽 클릭하고 `Open(열기)`를 선택합니다.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_01.png)
3. `DynamixelWizard2Setup_x64` 파일을 실행합니다.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_02.png)
4. 아래와 같은 경고창이 나타나면 `Open(열기)`를 선택하고 설치를 진행합니다.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_03.png)
5. `Next(다음)`버튼을 누르고 설치과정을 따라 진행합니다.  
  ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_mac_04.png)

# [다이나믹셀 위자드 2.0 제거](#다이나믹셀-위자드-20-제거)

## [윈도우에서 제거하기](#윈도우에서-제거하기)

1. 윈도우 설정의 앱 및 기능에서 `Dynamixel Wizard 2`를 선택하고 `제거`버튼을 클릭하면 설치마법사가 시작합니다.

2. `Remove all components`를 선택하고 `Next`버튼을 눌러 제거를 진행합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_win_04.png)

## [리눅스에서 제거하기](#리눅스에서-제거하기)

1. 설치된 폴더에서 `maintenancetool`을 실행합니다.

2. `Remove all components`를 선택하고 `Next`버튼을 눌러 제거를 진행합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_setup_linux_03.png)

## [맥에서 제거하기](#맥에서-제거하기)

1. 어플리케이션에서 `DYNAMIXEL2Wizard`를 선택합니다.
2. DYNAMIXEL2Wizard 폴더 내의 `maintenancetool`을 실행합니다.
3. `Remove all components`를 선택하고 `Next`버튼을 눌러 제거를 진행합니다.

# [메뉴 설명](#메뉴-설명)

## [메인 화면](#메인-화면)

프로그램의 메인화면은 검색된 제품을 통신포트, 통신속도, 모델명에 따라 분류하여 나타내며, 컨트롤 테이블 값을 변경하여 테스트할 수 있습니다.

![](/assets/images/sw/dynamixel/wizard2/wizard2_main_002_kr.png)

## [그래프 창](#그래프-창)

표시항목을 설정하면 실시간으로 변화되는 값을 확인할 수 있습니다. 그래프 표시 항목 설정 방법은 [기본 기능 > 그래프]를 참고하세요

![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_001_kr.png)

## [패킷 창](#패킷-창)

선택한 프로토콜 버전의 Instruction패킷을 직접 생성하여 전송해볼 수 있습니다. 또한 패킷통신목록에서 항목을 선택하면 상세정보를 확인할 수 있습니다.

![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_001_kr.png)

# [기본 기능](#기본-기능)

## [다이나믹셀 연결](#다이나믹셀-연결)

### [다이나믹셀 검색 설정](#검색-설정)

1. 메인 메뉴에서 `도구` > `설정` 를 선택하면 설정창이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_011_kr.png)

2. 설정창의 좌측 목록에서 `검색` 항목을 선택하면 검색 설정이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_options_001_kr.png)

3. 순서대로 검색할 프로토콜 버전, 통신포트, 통신속도, ID범위를 설정하고 `OK` 버튼을 클릭합니다. 항목을 적게 설정할수록 검색시간이 단축됩니다.

### [다이나믹셀 검색하기](#다이나믹셀-검색하기)

1. 메인 메뉴에서 `장치` > `검색` 을 선택하면 다이나믹셀 검색을 시작합니다.

    **참고** : 만약, 해당 통신 포트에 연결을 실패하면 사용중인 프로그램을 찾아 사용을 해제해야 합니다.  
    {: .notice}  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_012_kr.png)

2. 검색되는 다이나믹셀을 왼쪽의 장치목록에서 확인할 수 있습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_001_kr.png)

## [다이나믹셀 컨트롤 테이블](#다이나믹셀-컨트롤-테이블)

1. 검색이 완료되면, 검색된 다이나믹셀은 왼쪽 장치목록에 출력됩니다.

2. 장치목록은 포트, 통신속도, 장치 순으로 분류합니다. 테스트할 그룹이나 장치를 선택합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_002_kr.png)

3. 부가 메뉴에서 `팩토리 리셋` 버튼을 클릭하면 제품을 공장 초기화 상태로 되돌릴 수 있습니다(이때, ID와 Baudrate 값은 변경하지 않습니다).  
  부가 메뉴에서 `리부팅` 버튼을 클릭하면 해당 다이나믹셀을 재부팅할 수 있습니다.  
  부가 메뉴에서 `토크` 버튼을 클릭하면 해당 다이나믹셀의 토크를 켜거나 끌 수 있습니다.  
  부가 메뉴에서 `LED` 버튼을 클릭하면 해당 다이나믹셀의 LED를 켜거나 끌 수 있습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_003_kr.png)

4. 부가 메뉴의 `토크` 버튼을 클릭하여 다이나믹셀의 토크를 켭니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_torque_on_kr.png)  

5. 컨트롤 테이블에서 `Goal Position` 또는 `Goal Velocity` 항목을 찾아 선택합니다.

   **참고** : 다이나믹셀 모델 및 동작모드(Operation Mode)에 따라 항목은 달라질수 있습니다. **관련 다이나믹셀의 컨트롤 테이블을 반드시 확인하세요.**
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_004_kr.png)

6. 우측 하단의 위치 또는 속도 값 컨트롤을 사용하여 모터를 움직여봅니다.

    **경고** : 값을 조정하는 과정에서 모터가 갑작스럽게 움직일 수 있으니 주의하세요.  
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_004_position_mode_joypad_kr.png)  
    - `Position control` 선택시, 가상 다이얼 컨트롤러를 사용할수 있습니다.
    - 가상 다이얼 컨트롤러를 사용하여, 원하는 위치로 이동시켜 보세요.
    - 입력창에서 컨트롤 아이템 값을 직접 입력가능합니다.
    - 자세한 내용은 [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)에서 확인하세요.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_004_velocity_mode_joypad_kr.png)  
    - `Velocitiy control`/`Current control`/`PWM control` 선택시, 가상 조이패드 컨트롤러로 변경됩니다.
    - 가상 조이패드 컨트롤러를 사용하여, CW 및 CCW 방향으로 움직여보세요.      
    - 입력창에서 컨트롤 아이템 값을 직접 입력가능합니다.
    - 자세한 내용은 [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)에서 확인하세요.

7. 좌측 하단의 `통신 상태` 를 통해 현재 PC와 제품의 통신이 원활히 이루어지고 있는지 확인할 수 있습니다.

8. 좌측 하단의 `패킷 상태` 를 통해 다이나믹셀의 응답상태를 확인할 수 있습니다.

9. 부가 메뉴 하단의 `하드웨어 알람` 을 통해 하드웨어의 에러상태를 확인할 수 있습니다.

10. 컨트롤 테이블에 대한 더 많은 정보를 얻으려면 각 다이나믹셀 모델의 e-Manual을 참고하세요.

11. 다음의 메뉴를 통해 컨트롤 테이블 항목들을 그룹화하여 표시할 수 있습니다.
- Group : 컨트롤 테이블에서 선택된 항목들을 하나의 그룹으로 묶어서 접었다 펼 수 있습니다.
- Ungroup : 선택된 그룹을 해제합니다.

## [그래프](#그래프)

### [그래프 설정](#그래프-설정)

1. 메인 메뉴에서 `도구` > `설정` 를 선택하면 설정창이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_011_kr.png)

2. 설정창의 좌측 목록에서 `그래프` 항목을 선택하면 그래프 설정이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_002_kr.png)

3. 아래 그림에 표시된 `>>` 버튼을 눌러 항목을 추가 합니다. (`<<` 버튼으로 항목을 제거할 수 있습니다.)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_003_kr.png)

4. 추가된 항목의 색깔을 클릭하면 항목 추가 상자가 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_kr.png)

5. 항목 추가 상자에서 색깔, 비율, 보조 Y축을 설정할 수 있습니다.    

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_1_kr.png)

    - Y축: 선택된 항목의 Y축을 그래프에 표시합니다. 총 10개의 Y축을 그래프에 나타낼 수 있습니다.

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_y_axis_01_kr.png)

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_y_axis_02_kr.png)

    - 비율: 그래프에서 선택된 항목의 Y축 값에 비율을 곱해서 나타냅니다.

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_scale_01_kr.png)

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_scale_02_kr.png)

    - 오프셋: 선택된 항목에 오프셋 값을 더하여 표시합니다. `Present Position` 과 `Goal Position` 같이 유사한 값을 가진 그래프를 분리하고 싶을 때 사용하세요.

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_offset_01_kr.png)

        ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_004_offset_02_kr.png)

6. 통신주기(Interval)는 1~1000ms로 설정가능합니다. 통신주기가 작을수록 더 세밀한 그래프가 표현됩니다.

    **참고** : 실제 통신주기는 통신속도와 PC사양에 따라 달라질 수 있습니다.  
    {: .notice}  

7. 속도 최적화 사용여부를 설정합니다. 설정하면 선택한 항목만 읽어오므로 통신이 빨라집니다.

    **참고** : 속도 최적화를 사용하면 컨트롤 테이블의 일부 항목들이 자동으로 갱신되지않습니다.  
    {: .notice}  

8. 설정창의 `확인` 버튼을 클릭합니다.

### [그래프 시작](#그래프-시작)

1. 메인 메뉴에서 `보기` > `그래프` 를 선택하면 그래프창이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_013_kr.png)

2. 그래프창의 `시작` 버튼을 클릭하면 그래프가 동작을 시작합니다.

    **참고** : 선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_001_kr.png)

3. 컨트롤 테이블에서 `Goal Position` 항목의 값을 변경하면 실시간으로 변경되는 `Present Position` 을 확인할 수 있습니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_005_kr.png)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_006_kr.png)  

4. 그래프의 우측에서 항목을 클릭하여, 그래프를 비활성화 시킬수 있습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_004.png)

5. 다음의 메뉴를 통해 그래프를 제어할 수 있습니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_start_002_kr.png)  

    - 시작/정지 : 그래프 시작/정지
    - 리셋 : 줌화면에서 원래화면으로 복귀
    - 캡처 : 그래프를 이미지로 저장
    - 저장 : 데이터를 CSV파일로 저장
    - 열기 : 저장한 그래프 이미지 열기.
    - 항목 표시 설정 : 그래프 우측에 있는 항목을 클릭하여 표시 여부 설정
    - 확대/축소 : 마우스 드래그로 줌영역을 선택
      - `Shift` + 드래그 : y축 고정, x축 확대
      - `Ctrl` + 드래그 : x축 고정, y축 확대
      - 마우스 휠로 이전 줌, 다음 줌으로 이동
    - 그래프 동작시 Ctrl과 마우스휠로 시간축을 1~10초로 1초단위로 조절

## [패킷](#패킷)

1. 메인 메뉴에서 `보기` > `패킷` 를 선택하면 패킷창이 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_014_kr.png)

2. 통신포트와 통신속도를 설정하고 `열기` 버튼을 클릭합니다.  
  열기에 성공하면 해당 포트의 다이나믹셀 프로토콜 통신 모니터링을 시작합니다.

    **참고** : 만약, 해당 통신 포트에 연결을 실패하면 사용중인 프로그램을 찾아 사용을 해제해야합니다.  
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_002_kr.png)

3. 우측 메뉴에서 통신할 프로토콜 버전과 Instruction을 설정할 수 있습니다.  
  프로토콜 버전을 `2.0` 으로 Instruction을 `Write` 로 설정합니다.  

    **참고** : 각 다이나믹셀은 지원하는 프로토콜 버전이 다릅니다. **관련 다이나믹셀의 [프로토콜 버전](/docs/kr/popup/faq_protocol_compatibility_table){: .popup}을 반드시 확인하세요.**
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_003_kr.png)

4. Instuction에 대한 상세설정을 할 수 있습니다.  
  다음과 같이 LED 켜기의 패킷을 설정합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_004_kr.png)

    - LED 항목의 컨트롤 테이블 주소 : 65
    - LED 항목의 컨트롤 테이블 길이[Byte] : 1
    - LED On에 대한 데이타 : 1

5. 설정된 값에 따라 변화되는 패킷정보를 하단에 있는 `패킷상세정보` 에서 확인할 수 있습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_005_kr.png)

6. `전송` 버튼을 클릭하여 패킷을 전송합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_packet_006_kr.png)

## [펌웨어 업데이트](#펌웨어-업데이트)

다이나믹셀의 펌웨어 업데이트가 필요할 경우, 장치이름 앞에 특수문자(*)와 함께 연하게 표시됩니다.  
해당 다이나믹셀에 마우스를 올리면, **Firmware update is available** 문장이 표시됩니다.  

![](/assets/images/sw/dynamixel/wizard2/wizard2_update_notification_kr.png)

1. 메인 메뉴에서 `도구` > `펌웨어 업데이트`를 선택합니다.

    **참고** : 선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_015_kr.png)

2. 간단한 도움말과 함께 펌웨어 업데이트를 시작합니다. 특히, 업데이트 도중 연결이 끊기거나 전원이 꺼지지 않도록 유의하십시오.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_001_kr.png)

3. 다음을 누르면 펌웨어 업데이트를 시작합니다. 완료될때 까지 전원이 꺼지거나 케이블이 빠지지 않도록 유의합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_002_kr.png)

4. 다이나믹셀 펌웨어 설치 결과를 학인합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_004_kr.png)

## [펌웨어 전체 업데이트](#펌웨어-전체-업데이트)

1. `도구` > `펌웨어 전체 업데이트`을 선택합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_016.png)

2. 펌웨어 업데이트가 필요한 다이나믹셀을 선택후, `다음` 버튼을 클릭합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_001_kr.png)

3. 펌웨어 업데이트가 진행됩니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_002_kr.png)

4. 펌웨어 업데이트 완료후, `닫기` 버튼을 클릭합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_update_all_003_kr.png)

## [펌웨어 복구](#펌웨어-복구)

1. 메인 메뉴에서 `도구` > `펌웨어 복구`를 선택합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_017_kr.png)

2. 간단한 도움말과 함께 다이나믹셀 펌웨어 복구 마법사를 시작합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_001_kr.png)

3. 다이나믹셀 펌웨어 복구 모드에서는 모델명을 자동으로 인식할 수 없기 때문에, 사용자가 정확한 모델을 선택해 주어야 합니다. 잘못된 모델을 선택하면 정상적으로 동작하지 않습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_002_kr.png)

4. 복구할 펌웨어 버전을 선택하십시오.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_003_kr.png)

5. 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오.  

    **주의** : 다이나믹셀 펌웨어 복구시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.  
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_004_kr.png)

6. 다이나믹셀을 찾기 위해 복구할 다이나믹셀의 전원을 껐다가 켜십시오.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_005_kr.png)

7. 다이나믹셀 검색에 성공하면 펌웨어 복구를 시작합니다. 완료될 때까지 전원이 꺼지거나 케이블이 빠지지 않도록 주의하십시오.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_006_kr.png)

8. 다이나믹셀 펌웨어 복구 결과를 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_firmware_recovery_007_kr.png)

# [고급 기능](#고급-기능)

## [ID 진단](#id-진단)

<iframe width="560" height="315" src="https://www.youtube.com/embed/B0x1PEISavw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  

> DYNAMIXEL Tips \| Use ID Inspector to Change Overlapping IDs with Ease

{% capture supported_dynamixel %}
**지원 다이나믹셀**
- [DYNAMIXEL-X](/docs/kr/dxl/x/) (펌웨어 버전 **45 이상**, X330 시리즈: 펌웨어 버전 **46 이상**) 
- [DYNAMIXEL-P](/docs/kr/dxl/p/) (펌웨어 버전 **12 이상**)
{% endcapture %}

다이나믹셀은 고유 ID를 가지고, Main Controller와 패킷을 사용하여 통신합니다. 

만약 조립된 로봇에서 고유 ID가 2개 이상 존재 할 경우, 통신 실패 및 다이나믹셀 위자드 2.0에서 다이나믹셀 검색에 실패할 수 있습니다. 

`ID 진단`을 사용하면, 조립된 로봇의 케이블을 분리하지않고 각 다이나믹셀에 고유 ID를 쉽게 할당 할 수 있습니다.

<div class="notice">{{ supported_dynamixel | markdownify }}</div>

자세한 내용은, 상단의 영상 또는 아래의 가이드를 참고하세요.

1. 도구 > `ID 진단`을 클릭하세요.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step1_01_kr.png)  

2. 다이나믹셀과 연결된 USB 포트 및 다이나믹셀의 보드레이트를 선택후, `검색`을 클릭하세요.  

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step1_02_kr.png)  

3. 다이나믹셀 검색이 시작되면, 상태창에 해당 다이나믹셀의 ID가 나타납니다.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step2_01_kr.png)  

    **참고**: 다이나믹셀이 검색 되지않는다면, [펌웨어 복구](#펌웨어-복구) 또는 [펌웨어 업데이트](#펌웨어-업데이트)를 통해 최신펌웨어로 업데이트하세요.
    {: .notice}

4. 검색이 끝나면, `다음` 버튼을 클릭하여, **ID 설정** 단계로 이동하세요.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step2_02_kr.png)  

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step3_01_kr.png)  

5. ID 설정 단계에서, 중복된 ID를 가진 다이나믹셀은 빨간색으로 표시됩니다. ID를 새롭게 지정 후 `저장`을 클릭하세요.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step3_02_kr.png)  

    **참고** : 항목 클릭시, 해당하는 다이나믹셀의 상단 LED가 깜밖입니다. LED를 통해, 연결된 다이나믹셀의 위치를 확인하세요.
    {: .notice}

6. 중복된 ID가 아닌 항목은 초록색으로 표시됩니다. ID 할당이 끝나면, `적용`을 클릭하여, 저장된 ID를 다이나믹셀에 할당하세요.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step4_01_kr.png)  

7. `끝` 을 클릭하여, `ID 진단`을 종료합니다.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_step4_02_kr.png)  

7. 다이나믹셀 검색 시, `ID 진단`에서 할당한 ID가 성공적으로 적용된것을 확인할수 있습니다.

    ![](/assets/images/sw/dynamixel/wizard2/id_inspection/id_inspection_done_kr.png)  

## [백업 및 복구](#백업-및-복구)

<iframe width="560" height="315" src="https://www.youtube.com/embed/CFinASETHiQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> DYNAMIXEL Tips \| EEPROM and RAM Data Restoring Using Backup Funcion 

`백업` 기능을 통해, 컨트롤 테이블에 저장된 EEPROM 및 일부 RAM 영역의 데이터를 다이나믹셀 내부에 저장 할 수 있습니다. 펌웨어 복구 또는 데이터가 초기화 된경우에 유용하게 사용할수 있습니다. 

저장된 데이터는 `EEPROM 복구` 기능을 통해, 다시 불러올수 있습니다. 

백업 및 복구 가능영역은 다음과 같습니다. 

- EERPOM 영역 전체 
- Velocity P.I Gains
- Position P.I.D Gains
- Feedforward 1st & 2nd Gains
- Profile Acceleration
- Profile Velocity
- Indirect Addresse (다이나믹셀-P 시리즈 제외)

**참고**: 백업후, RAM 영역의 복구를 위해서는, 컨트롤 테이블에서 `Startup Configuration` 주소의 **Restore RAM** 항목을 활성화 시켜야합니다. [RAM 영역 복구하기](#ram-영역-복구하기)를 참고하세요.
{: .notice}

<div class="notice">{{ supported_dynamixel | markdownify }}</div>

아래는 `백업`을 활용한 예시 입니다. 

1. [다이나믹셀 검색하기](#다이나믹셀-검색하기)

2. EEPROM 및 RAM 영역의 컨트롤테이블 값을 설정하세요.

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_eeprom.png)  
    > EEPROM 설정

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_ram1.png)

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_ram2.png)  
    > RAM 영역 설정
    
3. 도구 > `컨트롤 테이블` > `백업` 을 클릭하세요.

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_click_backup_kr.png)
    
    **주의**: `백업` 사용 전, 아래 이미지 처럼 다이나믹셀을 **Torque Off** 상태로 변경 하세요. 그렇지않으면, `백업`에 실패합니다.  
    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_torque_off_kr.png)
    {: .notice--warning}
    
    **참고**: 백업 후, `Backup Ready`가 '1'로 활성화 됩니다.  
    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_backup_enabled.png)
    {: .notice}
    
4. 도구 > `컨트롤 테이블` > `EEPROM 복구`를 클릭하세요.

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_click_restore_kr.png)

5. `EEPROM 복구`이후 다이나믹셀은 백업된 데이터를 불러옵니다.

    ![](/assets/images/sw/dynamixel/wizard2/backup/backup_restore_eeprom.png)

### [RAM 영역 복구하기](#ram-영역-복구하기)

1. EEPROM에서 `StartUp Configuration` 주소의 `Restore RAM` 비트를 활성화 하세요.

   ![](/assets/images/sw/dynamixel/wizard2/backup/backup_enable_restore_ram.png)
       
2. 다이나믹셀 재부팅시, 저장된 RAM영역을 불러옵니다. 

   ![](/assets/images/sw/dynamixel/wizard2/backup/backup_restore_ram2.png)
       
   ![](/assets/images/sw/dynamixel/wizard2/backup/backup_restore_ram1.png)

## [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)  

1. 마우스 왼쪽 버튼 드래그로 변경하기 (값을 크게 변경할 때 사용합니다.)  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_005.png)

2. 마우스 휠로 변경하기 (값을 조금 키우거나 줄일 때 사용합니다.)  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_006.png)

3. 키보드 방향키로 변경하기 (값을 미세하게 키우거나 줄일 때 사용합니다.)  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_007.png)

4. 값 직접 입력하기  

    **참고** : 엔터키를 입력해야 값이 변경됩니다.
    {: .notice}  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_008.png)

## [펌웨어 정보 확인](#펌웨어-정보-확인)

제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인하는 기능입니다.

1. 메인 메뉴의 `도움말` > `다이나믹셀 펌웨어 정보` 메뉴를 클릭합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_009_kr.png)

2. 선택된 제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인할 수 있습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_010_kr.png)

## [캘리브레이션](#캘리브레이션)

기어교체등으로 인해 혼의 위치값이 틀여졌다면 캘리브레이션을 통해 위치를 다시 설정해 줄 수 있습니다.

1. 메인 메뉴의 `도구` > `캘리브레이션` 메뉴를 클릭합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_001_kr.png)

2. 간단한 도움말과 함께 다이나믹셀 캘리브레이션을 시작합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_002_kr.png)

3. 다이나믹셀 캘리브레이션 모드에서는 모델명을 자동으로 인식할 수 없기 때문에, 사용자가 정확한 모델을 선택해 주어야 합니다. 잘못된 모델을 선택하면 정상적으로 동작하지 않습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_003_kr.png)

4. 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오.  

    **주의** : 다이나믹셀 캘리브레이션시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.  
    {: .notice--warning}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_004_kr.png)

5. 다이나믹셀을 찾기 위해 다이나믹셀의 전원을 껐다가 켜십시오.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_005_kr.png)

6. 다이나믹셀 검색에 성공하면 캘리브레이션 펌웨어를 설치합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_006_kr.png)

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_007_kr.png)

7. 첫번째 위치를 설정합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_008_kr.png)

8. 두번째 위치를 설정합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_009_kr.png)

9. 세번째 위치를 설정합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_010_kr.png)

10. 네번째 위치를 설정합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_011_kr.png)

11. 캘리브레이션이 완료되었습니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_cali_012_kr.png)

## [자가진단](#자가진단)

다이나믹셀의 불량여부를 판단하기위해 자가진단을 실행할 수 있습니다.

1. 메인 메뉴의 `도구` > `자가진단` 메뉴를 클릭합니다.  

    **참고** : 선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
    {: .notice}

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_001_kr.png)

2. 간단한 도움말과 함께 자가진단을 시작합니다.  

    **주의** : 다이나믹셀 자가진단시에는 공장 초기화 상태로 변경됩니다.  
    {: .notice--warning}  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_002_kr.png)

3. 자가진단을 진행할 다이나믹셀의 모델명과 펌웨어 버전을 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_003_kr.png)

4. 다이나믹셀의 하드웨어 에러 상태를 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_004_kr.png)

5. 다이나믹셀의 동작 온도가 정상범위인지 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_005_kr.png)

6. 다이나믹셀의 입력 전압이 정상범위인지 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_006_kr.png)

7. 다이나믹셀의 LED가 제대로 깜박이는지 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_007_kr.png)

8. 다이나믹셀의 혼이 센터 위치로 이동했는지 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_008_kr.png)

9. 성능테스트를 진행합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_009_kr.png)

10. 자가진단 결과를 확인합니다.  

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_self_010_kr.png)

## [그래프 속도 최적화](#그래프-속도-최적화)

그래프 설정에서 통신주기(Interval)를 최소 1 [ms]로 설정할 수 있습니다.  
다음과 같이 설정하면 그래프를 최대한 빠르게 동작시킬 수 있습니다.

### [포트 응답 속도 설정](#포트-응답-속도-설정)

#### 윈도우

1. 윈도우의 `장치 관리자`를 실행합니다. 해당 포트를 선택하고 마우스 오른쪽 버튼을 클릭하여 나온 메뉴에서 `속성`을 선택합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_008.png)

2. 속성의 `포트 설정` 탭에서 `고급` 버튼을 클릭합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_009.png)

3. 고급 설정에서 `응답 시간`을 `1ms`로 설정합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_010.png)

#### 리눅스

1. 다음의 명령어를 수행하여 `응답 시간`을 `1ms`로 설정합니다.

    ```c
    # cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    16
    # echo 1 > /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    # cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
    1
    ```

### [다이나믹셀 설정](#다이나믹셀-설정)

1. 그래프 설정에서 `통신 주기` 을 `1ms` 로 설정하고 `선택항목만 읽어오기` 항목을 체크합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_005_kr.png)

2. 다이나믹셀의 통신속도(Baud Rate)를 최대로 설정하고 `Return Delay Time` 을 `0` 으로 설정합니다.

    ![](/assets/images/sw/dynamixel/wizard2/wizard2_graph_007_kr.png)

[기본 기능 > 그래프]: #그래프
[프로토콜 1.0]: /docs/kr/dxl/protocol1/
[프로토콜 2.0]: /docs/kr/dxl/protocol2/
[AX-12W]: /docs/kr/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/kr/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/kr/dxl/ax/ax-18a/
[EX-106+]: /docs/kr/dxl/ex/ex-106+/
[DX-113]: /docs/kr/dxl/dx/dx-113/
[DX-116]: /docs/kr/dxl/dx/dx-116/
[DX-117]: /docs/kr/dxl/dx/dx-117/
[RX-10]: /docs/kr/dxl/rx/rx-10/
[RX-24F]: /docs/kr/dxl/rx/rx-24f/
[RX-28]: /docs/kr/dxl/rx/rx-28/
[RX-64]: /docs/kr/dxl/rx/rx-64/
[MX-12W]: /docs/kr/dxl/mx/mx-12w/
[MX-28]: /docs/kr/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/kr/dxl/mx/mx-28-2/
[MX-64]: /docs/kr/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/kr/dxl/mx/mx-64-2/
[MX-106]: /docs/kr/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/kr/dxl/mx/mx-106-2/
[XL320]: /docs/kr/dxl/x/xl320/
[XL330-M288]: /docs/kr/dxl/x/xl330-m288/
[XL330-M077]: /docs/kr/dxl/x/xl330-m077/
[XL430-W250]: /docs/kr/dxl/x/xl430-w250/
[2XL430-W250]: /docs/kr/dxl/x/2xl430-w250/
[XC430-W150]: /docs/kr/dxl/x/xc430-w150/
[XC430-W240]: /docs/kr/dxl/x/xc430-w240/
[2XC430-W250]: /docs/kr/dxl/x/2xc430-w250/
[XC330-T288]: /docs/kr/dxl/x/xc330-t288
[XC330-T181]: /docs/kr/dxl/x/xc330-t181
[XC330-M288]: /docs/kr/dxl/x/xc330-m288
[XC330-M181]: /docs/kr/dxl/x/xc330-m181
[XM430-W210]: /docs/kr/dxl/x/xm430-w210/
[XM430-W350]: /docs/kr/dxl/x/xm430-w350/
[XH430-W210]: /docs/kr/dxl/x/xh430-w210/
[XM540-W150]: /docs/kr/dxl/x/xm540-w150/
[XM540-W270]: /docs/kr/dxl/x/xm540-w270/
[XH430-W350]: /docs/kr/dxl/x/xh430-w350/
[XH430-V210]: /docs/kr/dxl/x/xh430-v210/
[XH430-V350]: /docs/kr/dxl/x/xh430-v350/
[XH540-W150]: /docs/kr/dxl/x/xh540-w150/
[XH540-W270]: /docs/kr/dxl/x/xh540-w270/
[XH540-V150]: /docs/kr/dxl/x/xh540-v150/
[XH540-V270]: /docs/kr/dxl/x/xh540-v270/
[XW430-T200]: /docs/kr/dxl/x/xw430-t200/
[XW430-T333]: /docs/kr/dxl/x/xw430-t333/
[XW540-T140]: /docs/kr/dxl/x/xw540-t140/
[XW540-T260]: /docs/kr/dxl/x/xw540-t260/
[XC430-W150]: /docs/kr/dxl/x/xc430-w150/
[XC430-W240]: /docs/kr/dxl/x/xc430-w240/
[H54-200-S500-R]: /docs/kr/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/kr/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/kr/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/kr/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/kr/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/kr/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/kr/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/kr/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/kr/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/kr/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/kr/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/kr/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/kr/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/kr/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/kr/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/kr/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/kr/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/kr/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/kr/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/kr/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/kr/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/kr/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/kr/dxl/p/pm42-010-s260-r/
[RH-P12-RN]: /docs/kr/platform/rh_p12_rn/
[RH-P12-RN(A)]: /docs/kr/platform/rh_p12_rna/
