---
layout: archive
lang: kr
ref: kit2_reference
read_time: true
share: true
author_profile: false
permalink: /docs/kr/edu/engineer/kit2_reference/
sidebar:
  title: 엔지니어 키트 2
  nav: "kit2"
product_group: kit2
page_number: 4
---

<div style="counter-reset: h1 3"></div>

# [참고자료](#참고자료)

## [앱에서 영상 스트리밍 기능 설정하기](#앱에서-영상-스트리밍-기능-설정하기)

스트리밍(Streaming)이란 음성이나 영상, 애니메이션 등을 실시간으로 재생하는 기술을 말합니다.
ROBOTIS ENGINEER KIT2에서는 Raspberry Pi Camera와 앱을 동일한 와이파이 환경에 연결
한 후 촬영한 영상을 스트리밍 기능을 통해 바로 확인할 수 있습니다.

1. 제어기의 전원을 켜고 Raspberry Pi가 부팅될 때까지 기다립니다.
  
    **참고**: 약 70초 정도가 지나 부팅이 되면 사용자 LED가 노란색으로 켜지고 소리가 납니다.
    {: .notice}

    ![](/assets/images/edu/engineer/kit2/pi_booting.png)

2. 앱이 설치된 기기에서 와이파이 설정을 선택합니다.
  
3. 네크워크 목록에서 Robotis_Rpi_XXXX를 찾아 선택합니다.

    ![](/assets/images/edu/engineer/kit2/kit2_wifi_01_kr.png)
        
    **참고**: XXXX는 제어기 MAC 주소 4자리 입니다.
    {: .notice}

4. 비밀번호 입력창이 나타나면 `robotis0` 을 입력한 후 연결합니다. 
   
   ![](/assets/images/edu/engineer/kit2/kit2_wifi_02_kr.png)

5. ENGINEER 앱을 실행한 후 우측 상단의 블루투스 아이콘을 눌러 제어기와 연결합니다. 제어기가 연결되면, 아이콘이 초록색으로 바뀝니다.

    ![](/assets/images/edu/engineer/kit2/kit2_streaming_bluetooth.png)

6. 스트리밍 기능이 지원되는 MAX-E2 또는 Commando를 선택하여 스트리밍 기능을 실행하면 아래 화면과 같이 스트리밍 기능을 활용해 로봇을 조종할 수 있습니다.

    ![](/assets/images/edu/engineer/kit2/kit2_streaming_select_example.png)
    > 예제 선택
        
    ![](/assets/images/edu/engineer/kit2/kit2_streaming_select_example_02.png)
    > 스트리밍 화면

## [Raspberry Pi 업데이트 및 복구](#raspberry-pi-업데이트-및-복구)

만약 라즈베리파이가 부팅시 문제가 있다면 키트전용 라즈비안을 다시 설치하여 해결할수 있습니다.

1. 압축된 키트전용 [Release.zip](https://www.robotis.com/service/download.php?no=1923) (라즈비안 이미지 압축 파일) 을 다운로드 받으세요. 

2. 파일압축을 해제하세요. 압축해제시 **rpi_eng_image_ver_1.img**이 선택한 폴더에 생성됩니다.

3. 압축해제한 이미지 파일을 [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)와 같은 Imager 프로그램을 사용하여 저장매체에 넣어줘야 합니다. 본 매뉴얼에서는 Win32 Disk Imager를 사용합니다. 

4. 설치한 Imager를 실행하세요.

    ![](/assets/images/edu/engineer/kit2/run_win32diskimager.png)

5. 2번 에서 압축해제한 **rpi_eng_image_ver_1.img**를 선택하세요.

    ![](/assets/images/edu/engineer/kit2/select_rpi_image_extracted_01.png)

    ![](/assets/images/edu/engineer/kit2/select_rpi_image_extracted_02.png)

6. 선택한 이미지를 저장할 저장매체를 선택하세요.
    
    ![](/assets/images/edu/engineer/kit2/select_sdcard_drive.png)

7. **Write**를 클릭하고, 키트 전용 라즈비안이 저장매체에 Writing이 완료될때까지 기다립니다.

8. Write가 완료되면 win32diskimager를 종료하고, SD카드를 컴퓨터에서 분리 합니다.

9. 분리한 SD 카드를 CM-550에 결합된 라즈베리파이 슬롯에 삽입합니다.

10. CM-550의 전원을 켜고 부팅이 완료될때까지 기다립니다. 처음 SD 카드 삽입시 자동으로 부팅이 여러번 이루어지며, 완료시 마다 사용자 버튼이 노란색으로 켜지면서 "삐" 소리가 납니다.
  
    **참고**: 부팅시 약 3분정도 소요됩니다. 
    {: .notice}

11. 부팅 후, 스마트기기로 네트워크 목록 검색시, CM-550의 맥 주소와 동일한 이름이 검색 되면 업데이트가 성공적으로 완료된 것입니다.

    **참고**: 맥 주소는 CM-550의 전원 버튼 옆에 표시되어 있습니다.
    {: .notice} 

    ![](/assets/images/edu/engineer/kit2/rpi_wifi_scan_01.png)  
      > 부팅 완료 전 와이파이 검색 결과 
    
    ![](/assets/images/edu/engineer/kit2/rpi_wifi_scan_02.png)  
      > 부팅 완료 후 와이파이 검색 결과

12. 검색된 네트워크를 클릭하고, 비밀번호 입력창이 나타나면 `robotis0`를 입력 후 기기와 연결 해주세요. 
      
## [제어기 BLE 신호 세기 설정](#제어기-ble-신호-세기-설정)

CM-550에 내장된 BLE 슬레이브 모듈의 신호의 세기가 약하거나 간섭이 발생할 경우 통신이 불안정할 수 있습니다.  
이러한 경우 로보플러스 매니저 2.0을 사용하여 BLE 신호세기를 알맞게 설정할 수 있습니다.

아래 표는 여러개의 CM-550를 한 공간에서 사용할 때 BLE 신호 세기를 설정하는 방법입니다.

{% capture ble_setting %}  

| 나의 CM-550 | 주변의 CM-550 | BLE 신호 세기 |
|:-----------:|:-------------:|:-------------:|
| 통신 불안정 |   통신 안정   |     올림      |
| 통신 불안정 |  통신 불안정  |     올림      |
|  통신 안정  |  통신 불안정  |     내림      |
|  통신 안정  |   통신 안정   |  설정 불필요  |

- 한 개의 제어기만을 사용하는 환경에서 통신이 불안정하다면, 신호의 세기가 약할 수 있습니다. **BLE 신호 세기를 높여주세요**.
- 같은 공간에서 여러 개의 제어기를 사용할 때 통신이 불안정하다면, 제어기의 BLE 신호가 서로 간섭을 줄 수 있습니다. **통신이 불안정한 제어기의 BLE 신호세기를 높이거나 주변 제어기의 BLE 신호 세기를 낮춰주세요**.
- 모든 제어기의 통신이 잘 유지된다면 신호의 세기가 충분하고, 다른 제어기에 의해서 간섭이 발생하지 않는 경우입니다. **BLE 신호 세기를 유지시켜 주세요**.
{% endcapture %}
<div class="notice">{{ ble_setting | markdownify }}</div>

**참고** : 주변 환경과 사용하는 기기의 수에 따라서, BLE 신호 세기 및 간섭의 정도가 달라질 수 있습니다.
{: .notice}

1. CM-550의 BLE와 연결되어 있는 BT-410 마스터 모듈 또는 BT-410 동글의 전원이 꺼져있는지 확인합니다.  
  (만일 전원이 켜져있는 경우 CM-550을 켜는 순간 서로 페어링되기 때문에 BLE 신호 확인 및 설정을 할 수 없습니다)

2. CM-550의 전원을 켜고 USB 케이블로 PC에 연결합니다 (외부 전원 없이 USB 케이블로 제어기에 충분한 전원공급이 가능합니다).

3. CM-550의 `MODE` 버튼이 깜박이는 것을 확인합니다.

4. 로보플러스 매니저 2.0 을 실행합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_01_kr.png)

5. `업데이트 검사` 를 클릭한 다음, 로보플러스 매니저 2.0이 최신 버전인지 확인합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_02_kr.png)  
    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_03_kr.png)

6. `모든제품` 탭을 선택합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_04_kr.png)

7. 제품 중에서 CM-550을 선택 후 `확인` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_05_kr.png)

8.  `업데이트 & 테스트` 를 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_06_kr.png)

9. `다음` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_07_kr.png)

10. 제어기가 연결된 포트를 선택합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_08_kr.png)

11. 제어기와 PC의 통신속도를 선택합니다 (기본 통신속도는 57600 bps로 고정되어 있습니다).

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_09_kr.png)

12. 제어기 검색이 완료되면 `다음` 을 클릭합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_10_kr.png)

13. 제어기와 연결된 부품의 펌웨어가 모두 최신 버전이라면 `다음` 을 클릭하거나, 업데이트가 필요한 경우 화면의 안내에 따라 펌웨어 업데이트를 진행합니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_11_kr.png)

14. 제어기와 PC가 성공적으로 연결이 되면, 아래 그림과 같이 컨트롤 테이블이 표시됩니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_12_kr.png)

15. 컨트롤 테이블을 스크롤해서 `139`번 주소의 `BLE Signal Power` 를 찾습니다.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_13_kr.png)

16. 화면 오른쪽의 `BLE Signal Power` 에서 값을 선택 후 저장합니다.  
  큰 값을 선택할수록 신호가 강해지며, 통신이 불안정할 경우 신호 세기를 높여주세요.  

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_14_kr.png)

    `BLE Signal Power` 값이 `UNKNOWN(0)`인 경우 1번 단계로 돌아가서 BT-410 마스터 또는 BT-410 동글의 전원이 꺼져있는지 확인하시기 바랍니다.
    {: .notice}

17. 마지막으로, `BLE Signal Power` 의 값이 저장되었는지 확인해주세요.

    ![](/assets/images/edu/engineer/kit1/BLE_signal_power_15_kr.png)

## [로봇 설정하기](#로봇-설정하기)

### [모터 조립확인](#모터-조립확인)
로보티즈 엔지니어에 사용된 다이나믹셀 ID 확인 및 작동 상태를 체크하는 기능입니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `MOTOR`를 선택하여 점검합니다  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor.png)

2. 화면에서 ID 번호를 선택하면 선택된 ID의 LED가 켜지고 중심 위치에서 좌우로 조금씩 움직입니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_2.png)

### [모터 오프셋 설정](#모터-오프셋-설정)
로보티즈 엔지니어에 사용된 다이나믹셀의 자세나 위치 값의 보정이 필요할 때 사용하는 기능입니다.  
오프셋 기능을 통해 보정된 값은 로봇의 전원을 끄더라도 저장됩니다.  
오프셋 기능을 숙지한 상태에서 미세하게 조정해야 하며 잘못된 값을 사용시 예제 동작이 잘 안되거나 로봇이 파손될 수 있습니다.

1. 각 예제를 선택한 후 메뉴의 옵션에서 `OFFSET`을 선택합니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset.png)

2. 오프셋 값을 보정하려는 ID를 선택하면 아래와 같은 팝업창이 나타납니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_2.png)

    - `+ / -` : ID 값을 증가시키거나 감소시킴  
    - `Torque On / Off` : 다이나믹셀의 토크를 켜거나 끄기  
    - `OK / CANCEL` : 오프셋 조정 값을 저장하거나 취소하기

3. `OK`를 눌러 저장하면 아래와 같은 확인 창이 나타납니다. 한 번 더 `OK`를 누르면 값이 저장되고 로봇에 반영됩니다.  
  ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_3.png)

4. 오프셋을 초기화 하거나 저장된 값을 불러오는 기능을 사용할 수 있습니다.  
    ![](/assets/images/edu/engineer/kit1/engineer_app_motor_offset_4.png)

    - `Reset Offset` : 선택시 팝업창이 나타나며 `OK`를 클릭하면 모든 ID의 오프셋을 `0`으로 초기화 합니다.  
    - `Initial Pose` : 최근에 저장된 오프셋 값을 불러오는 명령입니다. 관절을 잘못된 값으로 조정하였을 경우 저장된 값을 불러옵니다.

## [다운로드](#다운로드)
엔지니어 키트 사용에 필요한 앱 및 소프트웨어, 조립서, MARKER를 아래에서 다운로드 받을 수 있습니다.

### [앱 설치하기](#앱-설치하기)
엔지니어 키트2 는 엔지니어 키트 1와 동일한 소프트웨어(R+Task 3.0) 및 앱(로보티즈 엔지니어) 을 사용합니다. 다음과 같은 소프트웨어 및 앱을 설치 하지 경우, [앱 설치하기](/docs/kr/edu/engineer/kit1/#작동하기)를 참고하세요

### [로봇 예제 다운로드 하기](#로봇-예제-다운로드-하기)
- CM-550 제어기에는 최초 출하시 KIT2 타입에 맞는 프로그램이 기본적으로 다운로드되어 있습니다.  
- 종합예제는 `MAX-E2`, `Commando`, `Scorpi` 세가지 로봇이 모두 포함된 예제입니다.

| 기본 예제 |                                  파이썬 (.py)                                  |                                  모션 (.mtn3)                                  |
|:---------:|:------------------------------------------------------------------------------:|:------------------------------------------------------------------------------:|
|  MAX-E2   |  [01_ENG2_Max_E2_PY.py](https://www.robotis.com/service/download.php?no=1915)  | [01_ENG2_Max_E2_MO.mtn3](https://www.robotis.com/service/download.php?no=1916) |
| Commando  | [02_ENG2_Commando_PY.py](https://www.robotis.com/service/download.php?no=1917) |                                   포함 안됨                                    |
|  Scorpi   |  [03_ENG2_Scorpi_PY.py](https://www.robotis.com/service/download.php?no=1919)  | [03_ENG2_Scorpi_MO.mtn3](https://www.robotis.com/service/download.php?no=1918) |

| 추가 예제 |                                 파이썬 (.py)                                  |                                  모션 (.mtn3)                                   |
|:---------:|:-----------------------------------------------------------------------------:|:-------------------------------------------------------------------------------:|
|  AutoBot  | [04_ENG2_Autobot_PY.py](https://www.robotis.com/service/download.php?no=1920) | [04_ENG2_Autobot_MO.mtn3](https://www.robotis.com/service/download.php?no=1921) |
|  Strider  | [05_ENG2_Strider_PY.py](https://www.robotis.com/service/download.php?no=1922) |                                    포함 안됨                                    |

### [조립서 다운로드 받기](#조립서-다운로드-받기)

아래의 표에서 필요한 조립서를 다운로드 받으세요.

|  Model   | Download |
|:--------:|:---------|
|  MAX-E2  |          |
| Commando |          |
|  Scorpi  |          |

### [Commando Marker 다운로드 받기](#commando-marker-다운로드-받기)

- [Commando MARKER] 다운로드.

![](/assets/images/edu/engineer/kit2/marker_for_commando.png)

## [점검 및 자가진단](#점검-및-자가진단)

1. 로봇의 전원이 켜지지 않아요.  
  > 충전지의 연결 및 충전상태를 점검해 보세요.  

2. 충전지 잔량을 확인하고 싶어요.  
  > [충전지 잔량 확인 하기](#충전지-잔량-확인하기)를 참조하세요.

3. 로봇이 작동 중에 경고음이 들려요.  
  > 충전지의 잔량이 부족해서 나는 경고음입니다. [배터리를 충전](#배터리-충전하기)해 주세요.

4. 로봇이 정상적으로 작동하지 않아요.  
  > 로봇의 조립 방법 및 [다이나믹셀 ID](/docs/kr/edu/engineer/kit2_introduction/#다이나믹셀-id확인)를 확인해 보세요.  

5. 어댑터로는 동작하는데 충전지로 동작하지 않아요.  
  > 제어기의 퓨즈 상태를 확인하고 필요시 교체합니다. [퓨즈 교체하기](#퓨즈-교체하기)를 참고하세요.    

## [배터리 충전하기](#배터리-충전하기)

{% include kr/edu/engineer/battery_charge.md %}

## [충전지 잔량 확인하기](#충전지-잔량-확인하기)

{% include kr/edu/engineer/charge_level.md %}

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm-550.md %}

## [도면](#도면)

{% include kr/dxl/download_center_notice.md %}
