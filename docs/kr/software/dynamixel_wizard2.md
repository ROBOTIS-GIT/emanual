---
layout: archive
lang: kr
ref: dynamixel_wizard2
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/dynamixel_wizard2/
sidebar:
  title: 다이나믹셀 위자드 2.0
  nav: "dynamixel_wizard2"
---

# [개요](#개요)

![](/assets/images/sw/wizard2/wizard2_main_000.png)

## [다이나믹셀 위자드 2.0](#다이나믹셀-위자드-20)

다이나믹셀 위자드 2.0은 다이나믹셀들을 아주 편리하게 관리해줍니다.

이 프로그램의 주요 역할은 다음과 같습니다.

- 다이나믹셀의 펌웨어를 관리합니다.
- 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 등을 설정할 수 있습니다.
- 시간에 따라 변화하는 값들을 그래프로 확인할 수 있습니다.
- 사용자가 직접 프로토콜 패킷을 생성하여 전송할 수 있습니다.

![](/assets/images/sw/wizard2/wizard2_main_001.png)

## [지원 프로토콜](#지원-프로토콜)

- Protocol 1.0
- Protocol 2.0

## [지원 운영체제](#지원-운영체제)

- Windows
- Linux

## [지원 제품 목록](#지원-제품-목록)

| Dynamixel Series |               |                   |                   |                     |               |
| ---------------- | ------------- | ----------------- | ----------------- | ------------------- | ------------- |
| **DX**           | DX-113        | DX-116            | DX-1117           |
| **AX**           | AX-12W        | AX-12+/12A        | AX-18F/18A        |
| **RX**           | RX-10         | RX-24F            | RX-28             | RX-64               |
| **EX**           | EX-106+       |
| **MX**           | MX-12W        | MX-28, MX-28(2.0) | MX-64, MX-64(2.0) | MX-106, MX-106(2.0) |
| **XL**           | XL320         | XL430-W250        |
| **XM**           | XM430-210     | XM430-W350        | XM540-W210        | XM540-W270          |
| **XH**           | XH430-W210    | XH430-W350        | XH430-V210        | XH430-V350          |
| **PRO-L**        | L42-10-S300-R | L54-30-S500-R     | L54-30-S400-R     | L54-50-S500-R       | L54-50-S290-R |
| **PRO-M**        | M42-10-S260-R | M54-40-S250-R     | M54-60-S250-R     |
| **PRO-H**        | H42-20-S300-R | H54-100-S500-R    | H54-200-S500-R    |
| **PRO+**         | H42P-020-S300-R | H54P-100-S500-R | H54P-100-S500-R   |


# [메뉴 설명](#메뉴-설명)

## [메인 화면](#메인-화면)

프로그램의 메인화면은 검색된 제품을 포트, 통신속도, 모델에 따라 분류하여 나타내며, 컨트롤 테이블 값을 수정하여 테스트해볼 수 있습니다.

![](/assets/images/sw/wizard2/wizard2_main_002.png)

## [그래프창](#그래프창)

표시항목을 설정하면 실시간으로 변화되는 값을 확인할 수 있습니다.

![](/assets/images/sw/wizard2/wizard2_graph_001.png)

## [패킷창](#패킷창)

선택한 프로토콜 버전의 Instruction패킷을 직접 생성하여 전송해볼 수 있습니다. 또한 패킷통신목록에서 항목을 선택하면 상세정보를 확인해볼 수 있습니다.

![](/assets/images/sw/wizard2/wizard2_packet_001.png)

## [설정창](#설정창)

### [검색 설정](#검색-설정)

검색에 필요한 설정을 할 수 있습니다.  
항목을 적게 선택할수록 검색시간이 단축됩니다.  
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_options_001.png)

### [제어 설정](#제어-설정)

컨트롤 테이블의 표시형식과 제어항목, 표시항목을 설정할 수 있습니다.

![](/assets/images/sw/wizard2/wizard2_options_002.png)

### [그래프 설정](#그래프-설정)

그래프 표시항목과 갱신주기, 속도 최적화를 설정할 수 있습니다.  
갱신주기는 1~1000ms로 설정가능하지만 통신속도와 PC사양에 따라 달라집니다.  
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_options_003.png)

# [기본 기능](#기본-기능)

## [펌웨어 업데이트](#펌웨어-업데이트)

1. 메인 메뉴에서 `Tools` → `Firmware Update`를 선택합니다.  
선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
{: .notice}  

2. 간단한 도움말과 함께 펌웨어 업데이트를 시작합니다. 특히, 업데이트 도중 연결이 끊기거나 전원이 꺼지지 않도록 유의하십시오.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_001.png)

3. 다음을 누르면 펌웨어 업데이트를 시작합니다. 완료될때 까지 전원이 꺼지거나 케이블이 빠지지 않도록 유의합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_002.png)

4. 다이나믹셀 펌웨어 설치 결과를 학인합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_004.png)

## [펌웨어 전체 업데이트](#펌웨어-전체-업데이트)

1. 메인 메뉴에서 `Tools` → `Firmware Update All`을 선택합니다.

2. 관리할 대상이 정상적으로 검색되었는지 확인한후 다음 버튼을 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_all_001.png)

3. 검색된 장치들 중 업데이트가 필요한 장치들만 진행합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_all_002.png)

4. 업데이트가 정상적으로 완료될때까지 기다린후, 닫기 버튼을 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_update_all_003.png)

## [펌웨어 복구](#펌웨어-복구)

1. 메인 메뉴에서 `Tools` → `Firmware Recovery`를 선택합니다.

2. 간단한 도움말과 함께 다이나믹셀 펌웨어 복구 마법사를 시작합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_001.png)

3. 다이나믹셀 펌웨어 복구 모드에서는 모델명을 자동으로 인식할 수 없기 때문에, 사용자가 정확한 모델을 선택해 주어야 합니다. 잘못된 모델을 선택하면 정상적으로 동작하지 않습니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_002.png)

4. 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오.  
다이나믹셀 펌웨어 복구시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.  
{: .notice--warning}  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_003.png)

5. 다이나믹셀을 찾기 위해 복구할 다이나믹셀의 전원을 껐다가 켜십시오.  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_004.png)

6. 다이나믹셀 검색에 성공하면 펌웨어 복구를 시작합니다. 완료될 때까지 전원이 꺼지거나 케이블이 빠지지 않도록 주의하십시오.  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_005.png)

7. 다이나믹셀 펌웨어 복구 결과를 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_firmware_recovery_007.png)

## [다이나믹셀 연결](#다이나믹셀-연결)

1. `Scan` 메뉴를 통해 다이나믹셀을 검색합니다. 필요에 따라 `검색 설정`에서 검색 범위를 설정할 수 있습니다.  
만약, 해당 통신 포트에 연결을 실패하면 사용중인 프로그램을 찾아 사용을 해제해야합니다.  
{: .notice}  

2. 검색되는 다이나믹셀을 왼쪽의 장치목록에서 확인할 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_001.png)

## [다이나믹셀 컨트롤 테이블](#다이나믹셀-컨트롤-테이블)

1. 검색이 완료되면, 검색된 다이나믹셀은 왼쪽 장치목록에 출력됩니다.

2. 장치목록은 포트, 통신속도, 장치 순으로 분류합니다. 테스트할 그룹이나 장치를 선택합니다.  
![](/assets/images/sw/wizard2/wizard2_002.png)

3. 부가 메뉴에서 `Factory Reset` 버튼을 클릭하면 제품을 공장 초기화 상태로 되돌릴 수 있습니다. (이때, ID와 Baudrate 값은 변경하지 않습니다.) 부가 메뉴에서 `Reboot` 버튼을 클릭하면 해당 다이나믹셀을 재부팅할 수 있습니다. 부가 메뉴에서 `Torque` 버튼을 클릭하면 해당 다이나믹셀의 토크를 켜거나 끌 수 있습니다. 부가 메뉴에서 `LED` 버튼을 클릭하면 해당 다이나믹셀의 LED를 켜거나 끌 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_003.png)

4. 부가 메뉴의 `Torque` 버튼을 클릭하여 다이나믹셀의 토크를 켭니다.

5. 컨트롤 테이블 항목에서 `Goal Position`항목을 찾아 선택합니다.

6. 우측 하단의 위치 값 컨트롤을 사용하여 모터를 움직여봅니다.  
값을 조정하는 과정에서 모터가 갑작스럽게 움직일 수 있으니 주의하세요.  
{: .notice--warning}  
![](/assets/images/sw/wizard2/wizard2_004.png)

7. 좌측 하단의 `통신 상태`를 통해 현재 PC와 제품의 통신이 원활히 이루어지고 있는지 확인할 수 있습니다.

8. 좌측 하단의 `패킷 상태`를 통해 다이나믹셀의 응답상태를 확인할 수 있습니다.

9. 부가 메뉴 하단의 `하드웨어 알람`을 통해 하드웨어의 에러상태를 확인할 수 있습니다.

10. 컨트롤 테이블에 대한 더 많은 정보를 얻으려면 각 제품의 E-Manual을 참고하세요.

11. 다음의 메뉴를 통해 컨트롤 테이블 항목들을 그룹화하여 표시할 수 있습니다.
- Group : 컨트롤 테이블에서 선택된 항목들을 하나의 그룹으로 묶어서 접었다 펼 수 있습니다.
- Ungroup : 선택된 그룹을 해제합니다.

## [그래프](#그래프)

1. `그래프 설정`에서 추가 버튼을 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_002.png)

2. 추가상자에서 표시항목과 선 색깔, 스케일값, 별도 축 사용 여부를 설정할 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_graph_003.png)

3. 설정창을 닫고 그래프창을 엽니다. `Start` 버튼을 클릭하면 그래프가 동작합니다.  
선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_graph_004.png)

4. 다음의 메뉴를 통해 그래프를 제어할 수 있습니다.

- Start/Stop : 그래프 시작/정지
- Reset : 줌화면에서 원래화면으로 복귀
- Capture : 그래프를 이미지로 저장
- Save : 데이터를 CSV파일로 저장
- 항목 표시 설정 : 그래프 우측에 있는 항목을 클릭하여 표시 여부 설정
- 확대/축소 : 마우스 드래그로 줌영역을 선택
  - Shift : y축 고정, x축 확대
  - Ctrl : x축 고정, y축 확대
  - 마우스 휠로 이전 줌, 다음 줌으로 이동
- 그래프 동작시 Ctrl과 마우스휠로 시간축을 1~10초로 1초단위로 조절가능

## [패킷](#패킷)

1. 패킷창을 열어서 통신포트와 통신속도를 설정하고 `Open` 버튼을 클릭합니다.  
열기에 성공하면 해당 포트의 다이나믹셀 프로토콜 통신 모니터링을 시작합니다.  
만약, 해당 통신 포트에 연결을 실패하면 사용중인 프로그램을 찾아 사용을 해제해야합니다.  
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_packet_002.png)

2. 우측 메뉴에서 통신할 프로토콜 버전과 Instruction을 설정할 수 있습니다.  
프로토콜 버전을 `2.0`으로 Instruction을 `Write`로 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_packet_003.png)

3. Instuctioin에 대한 상세설정을 할 수 있습니다.  
다음과 같이 LED 켜기의 패킷을 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_packet_004.png)

- LED 항목의 컨트롤 테이블 주소 : 65
- LED 항목의 컨트롤 테이블 길이 : 1
- LED On에 대한 데이타 : 1

4. 설정된 값에 따라 변화되는 패킷정보를 하단에 있는 `패킷상세정보`에서 확인할 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_packet_005.png)

5. `Send` 버튼을 클릭하여 패킷을 전송합니다.  
![](/assets/images/sw/wizard2/wizard2_packet_006.png)

6. 패킷목록에서 응답패킷을 클릭하면 패킷상세정보를 확인할 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_packet_007.png)

# [고급 기능](#고급-기능)

## [컨트롤 아이템 값 변경](#컨트롤-아이템-값-변경)

1. 마우스 왼쪽 버튼 드래그로 변경하기 (값을 크게 변경할 때 사용합니다.)  
![](/assets/images/sw/wizard2/wizard2_005.png)

2. 마우스 휠로 변경하기 (값을 조금 키우거나 줄일 때 사용합니다.)  
![](/assets/images/sw/wizard2/wizard2_006.png)

3. 키보드 방향키로 변경하기 (값을 미세하게 키우거나 줄일 때 사용합니다.)  
![](/assets/images/sw/wizard2/wizard2_007.png)

4. 값 직접 입력하기  
엔터키를 입력해야 값이 변경됩니다.
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_008.png)

## [펌웨어 정보 확인](#펌웨어-정보-확인)

제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인하는 기능입니다.

1. 메인 메뉴의 `Help` → `About Dynamixel Firmware` 메뉴를 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_009.png)

2. 선택된 제품의 펌웨어 버전, 배포일, 업데이트 노트를 확인할 수 있습니다.  
![](/assets/images/sw/wizard2/wizard2_010.png)

## [캘리브레이션](#캘리브레이션)

기어교체등으로 인해 혼의 위치값이 틀여졌다면 캘리브레이션을 통해 위치를 다시 설정해 줄 수 있습니다.

1. 메인 메뉴의 `Tool` → `Calibration` 메뉴를 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_001.png)

2. 간단한 도움말과 함께 다이나믹셀 캘리브레이션을 시작합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_002.png)

3. 다이나믹셀 캘리브레이션 모드에서는 모델명을 자동으로 인식할 수 없기 때문에, 사용자가 정확한 모델을 선택해 주어야 합니다. 잘못된 모델을 선택하면 정상적으로 동작하지 않습니다.  
![](/assets/images/sw/wizard2/wizard2_cali_003.png)

4. 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오.  
다이나믹셀 펌웨어 복구시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.  
{: .notice--warning}  
![](/assets/images/sw/wizard2/wizard2_cali_004.png)

5. 다이나믹셀을 찾기 위해 다이나믹셀의 전원을 껐다가 켜십시오.  
![](/assets/images/sw/wizard2/wizard2_cali_005.png)

6. 다이나믹셀 검색에 성공하면 캘리브레이션 펌웨어를 설치합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_006.png)  
![](/assets/images/sw/wizard2/wizard2_cali_007.png)

7. 첫번째 위치를 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_008.png)

8. 두번째 위치를 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_009.png)

9. 세번째 위치를 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_010.png)

10. 네번째 위치를 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_cali_011.png)

11. 캘리브레이션이 완료되었습니다.  
![](/assets/images/sw/wizard2/wizard2_cali_012.png)

## [자가진단](#자가진단)

다이나믹셀의 불량여부를 판단하기위해 자가진단을 실행할 수 있습니다.

1. 메인 메뉴의 `Tool` → `Self-Diagnosis` 메뉴를 클릭합니다.  
선택된 장치가 없으면 해당 메뉴가 비활성화된 상태입니다. 검색 후 다이나믹셀이 연결된 상태에서 진행해 주세요.  
{: .notice}  
![](/assets/images/sw/wizard2/wizard2_self_001.png)

2. 간단한 도움말과 함께 자가진단을 시작합니다.  
다이나믹셀 자가진단시에는 공장 초기화 상태로 변경됩니다.  
{: .notice--warning}  
![](/assets/images/sw/wizard2/wizard2_self_002.png)

3. 자가진단을 진행할 다이나믹셀의 모델명과 펌웨어 버전을 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_003.png)

4. 다이나믹셀의 하드웨어 에러 상태를 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_004.png)

5. 다이나믹셀의 동작 온도가 정상범위인지 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_005.png)

6. 다이나믹셀의 입력 전압이 정상범위인지 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_006.png)

7. 다이나믹셀의 LED가 제대로 깜박이는지 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_007.png)

8. 다이나믹셀의 혼의 센터 위치로 이동했는지 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_008.png)

9. 성능테스트를 진행합니다.  
![](/assets/images/sw/wizard2/wizard2_self_009.png)

10. 자가진단 결과를 확인합니다.  
![](/assets/images/sw/wizard2/wizard2_self_010.png)


## [그래프 속도 최적화](#그래프-속도-최적화)

그래프 설정에서 갱신주기를 최소 1ms로 설정할 수 있지만 통신속도와 PC사양에 따라 달라집니다.
다음과 같이 설정하면 그래프 갱신 주기를 최대한 빠르게 동작시킬 수 있습니다.

### [포트 응답 속도 설정](#포트-응답-속도-설정)

#### 윈도우의 경우

1. 윈도우의 장치관리자를 실행합니다. 해당 포트를 선택하고 마우스 오른쪽 버튼을 클릭하여 나온 메뉴에서 `속성`을 선택합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_008.png)

2. 속성의 `포트 설정` 탭에서 `고급` 버튼을 클릭합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_009.png)

3. 고급 설정에서 `응답 시간`을 `1ms`로 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_010.png)

#### 리눅스의 경우

1. 다음의 명령어를 수행하여 `응답 시간`을 `1ms`로 설정합니다.
```c
# cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
16
# echo 1 > /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
# cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer
1
```


### [다이나믹셀 설정](#다이나믹셀-설정)

1. 그래프 설정에서 `Interval`을 `1ms`로 설정하고 `Read only selected item for Speed` 항목을 체크합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_005.png)

2. 다이나믹셀의 통신속도를 최대로 설정하고 `Return Delay Time`을 `0`으로 설정합니다.  
![](/assets/images/sw/wizard2/wizard2_graph_007.png)

3. 그래프를 동작시켜서 갱신 주기를 확인합니다.  
