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
page_number: 3
---

<div style="counter-reset: h1 2"></div>

# [참고자료](#참고자료)

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


## [점검 및 자가진단](#점검-및-자가진단)

1. 로봇의 전원이 켜지지 않아요.  
  > 충전지의 연결 및 충전상태를 점검해 보세요.  

2. 충전지 잔량을 확인하고 싶어요.  
  > [충전지 잔량 확인 하기](#충전지-잔량-확인하기)를 참조하세요.

3. 로봇이 작동 중에 경고음이 들려요.  
  > 충전지의 잔량이 부족해서 나는 경고음입니다. [배터리를 충전](#배터리-충전하기)해 주세요.

4. 로봇이 정상적으로 작동하지 않아요.  
  > 로봇의 조립 방법 및 [다이나믹셀 ID](#다이나믹셀-id확인)를 확인해 보세요.  

5. 어댑터로는 동작하는데 충전지로 동작하지 않아요.  
  > 제어기의 퓨즈 상태를 확인하고 필요시 교체합니다. [퓨즈 교체하기](#퓨즈-교체하기)를 참고하세요.    

## [배터리 충전하기](#배터리-충전하기)

{% include kr/edu/engineer/battery_charge.md %}

## [충전지 잔량 확인하기](#충전지-잔량-확인하기)

{% include kr/edu/engineer/charge_level.md %}

## [퓨즈 교체하기](#퓨즈-교체하기)

{% include kr/parts/controller/fuse_cm-550.md %}

## [도면](#도면)

엔지니어 키트의 도면자료는 **[로보티즈 다운로드 센터](http://www.robotis.com/service/downloadpage.php?ca_id=70g0)** 에서 제공됩니다. 
{: .notice--success}
