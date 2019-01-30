---
layout: archive
lang: kr
ref: rplus1_dynamixel_wizard
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus1/dynamixel_wizard/
sidebar:
  title: 다이나믹셀 위자드
  nav: "dynamixel_wizard"
---

# [개요](#개요)

다이나믹셀 위자드는 다이나믹셀들을 아주 편리하게 관리해줍니다.

이 프로그램의 주요 역할은 다음과 같습니다.

- 다이나믹셀의 펌웨어를 관리합니다.
- 다이나믹셀의 상태를 점검합니다.
- 사용에 필요한 모드 등을 설정할 수 있습니다.

  ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_main.png)

# [다이나믹셀 연결](#다이나믹셀-연결)

1. 다이나믹셀을 USB2Dynamixel을 통해 PC와 연결합니다.

    - 연결 방법은 [USB2Dynamixel 정보]를 참고하세요.
    - 다이나믹셀에 인가되는 전원선은 따로 연결해 주어야 합니다.

2. 사용할 통신 포트를 선택합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_connection1.png)

    만약, 해당 통신 포트가 사용중으로 나타나면 사용중인 프로그램을 찾아 사용을 해제해야 합니다.

3. 다이나믹셀을 검색합니다. 필요에 따라 검색 범위를 설정할 수 있습니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_connection2.png)

4. 검색되는 다이나믹셀을 왼쪽의 리스트에서 확인할 수 있습니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_connection3.png)

5. 관리를 시작합니다. (각 다이나믹셀별로 관리 방법을 참고하세요.)

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_connection4.png)

# [펌웨어 업데이트](#펌웨어-업데이트)

펌웨어는 다이나믹셀에 설치되어 있는 프로그램을 말하며, 다이나믹셀의 제어 역할을 담당하고 있습니다. 다이나믹셀 마법사는 인터넷을 통해 새 버전의 펌웨어를 자동으로 감지하여 항상 최신으로 유지시킵니다.

![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_information.png)

1. 다이나믹셀을 검색하면, 다음과 같이 다이나믹셀의 아이콘이 체크되며 펌웨어 업데이트가 가능함을 알립니다. 해당 다이나믹셀을 클릭하고 펌웨어 업데이트 버튼을 클릭 합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_update1.png)

2. 간단한 도움말과 함께 펌웨어 업데이트를 시작합니다. 특히, 업데이트 도중 연결이 끊기거나 전원이 꺼지지 않도록 유의하십시오.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_update2.png)

3. 현재 연결된 다이나믹셀의 모델명과 펌웨어 정보를 확인할 수 있습니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_update3.png)

4. 다음을 누르면 펌웨어 업데이트를 시작합니다. 완료될 때 까지 전원이 꺼지거나 케이블이 빠지지 않도록 유의합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_update4.png)

5. 다이나믹셀 펌웨어 설치 결과를 확인합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_update5.png)

# [펌웨어 복구](#펌웨어-복구)

다이나믹셀 마법사는 다이나믹셀의 펌웨어에 문제가 있는 경우 이를 복구 할 수 있습니다.

1. 다이나믹셀 펌웨어 복구 마법사 실행 도구 모음의 펌웨어 복구 버튼을 눌러 다이나믹셀 펌웨어 마법사를 실행합니다. COM 포트가 연결되어 있는 경우 해당 버튼이 비활성화 됩니다. 포트 연결을 끊고 펌웨어 복구 마법사를 실행해 주세요.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery1.png)

2. 간단한 도움말과 함께 다이나믹셀 펌웨어 복구 마법사를 시작합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery2.png)

3. 다이나믹셀 펌웨어 복구시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery3.png)

4. 다이나믹셀 연결 포트 선택 펌웨어를 인식하지 못하므로 다이나믹셀을 자동 검색할 수 없습니다. 따라서 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오. USB2Dynamixel이 연결된 포트를 선택하고 찾기 버튼을 누르십시오.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery4.png)

5. 다이나믹셀 전원 껐다 켜기 다이나믹셀을 찾기 위해 복구할 다이나믹셀의 전원을 껐다가 켜십시오.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery5.png)

6. 다이나믹셀 검색에 성공한 경우 다음과 같은 화면을 볼 수 있습니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery6.png)

7. 다이나믹셀 펌웨어 선택 다이나믹셀을 찾으면 다운로드 할 수 있는 펌웨어 정보가 나옵니다. 다이나믹셀 펌웨어 복구 모드에서는 모델명을 자동으로 인식할 수 없기 때문에, 사용자가 정확한 모델을 선택 해 주어야 합니다. 잘못된 모델을 선택하면 정상적으로 동작하지 않습니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery7.png)

8. 펌웨어 복구 다음 버튼을 클릭하면 펌웨어 복구를 시작합니다. 완료될 때까지 전원이 꺼지거나 케이블이 빠지지 않도록 주의하십시오.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery8.png)

9. 다이나믹셀 펌웨어 복구 결과를 확인합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_firmware_recovery9.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/PRVtfENb3Ok" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen="">
</iframe>

# [테스트 및 설정](#테스트-및-설정)

## [관리 화면](#관리-화면)

다이나믹셀의 테스트 및 설정을 위한 화면은 다음과 같습니다. 검색이 완료되면, 검색된 다이나믹셀은 왼쪽 리스트에 출력됩니다.

![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_2.png)

다음과 같이 다이나믹셀을 선택하고 테스트나 설정을 위해 테이블을 선택하면 오른쪽에 적절한 관리창이 나타납니다. 관리창은 사용자가 다이나믹셀을 쉽게 관리할 수 있도록 도와줍니다. 각 기능에 대한 자세한 사항은 각각의 다이나믹셀 메뉴얼을 참조하십시오.

![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_1.png)

# [MX 시리즈 보정하기](#mx-시리즈-보정하기)

기어교체등으로 인해 혼의 위치값이 틀어졌다면 Calibration 을 통해 위치를 다시 설정해 줄 수 있습니다.

### MX Series Calibration 방법

1. 하드웨어 연결 USB2Dynamixel 에 MX시리즈를 연결해주세요. 스위치는 통신방식에 따라 TTL 혹은 RS485로 향해 있어야 합니다. 별도의 전원이 공급되어야 하며 Calibration Adapter가 필요합니다.

    ![img](/assets/images/sw/rplus1/wizard/dynamixel_wizard_023.jpg)

2. Dynamixel Wizard 를 실행 후 캘리브레이션 아이콘을 클릭합니다. COM 포트가 연결되어 있는 경우 해당 버튼이 비활성화 됩니다. 포트 연결 전 상태에서 캘리브레이션 아이콘을 클릭해주세.요.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still028.jpg)

3. 간단한 도움말과 함께 다이나믹셀 캘리브레이션을 시작합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still029.jpg)

4. 다이나믹셀 캘리브레이션시에는 반드시 한개의 다이나믹셀만 연결되어 있어야 합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still030.jpg)

5. 다이나믹셀 연결 포트 선택 펌웨어를 인식하지 못하므로 다이나믹셀을 자동 검색할 수 없습니다. 따라서 사용자가 다이나믹셀이 연결된 포트를 수동으로 설정해 주어야 합니다. 포트가 사용중이면 다이나믹셀을 인식할 수 없으니 다른 프로그램을 종료하고 진행하십시오. USB2Dynamixel이 연결된 포트를 선택하고 찾기 버튼을 누르십시오.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still031.jpg)

6. 다이나믹셀 전원 껐다 켜기 다이나믹셀을 찾기 위해 다이나믹셀의 전원을 껐다가 켜십시오. 검색에 성공한경우 검색되었다는 메세지가 나옵니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still033.jpg)

7. 연결된 다이나믹셀을 선택하세요.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still034.jpg)

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still035.jpg)

8. 다이나믹셀에 캘리브레이션 펌웨어를 설치합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still036.jpg)

9. 첫번째 위치를 설정합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still045.jpg)

10. 두번째 위치를 설정합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still041.jpg)

11. 세번째 위치를 설정합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still042.jpg)

12. 네번째 위치를 설정합니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still043.jpg)

13. 캘리브레이션이 완료되었습니다.

    ![img](/assets/images/sw/rplus1/wizard/self_calibration_still044.jpg)

# [동영상](#동영상)

## [다이나믹셀 위자드 사용하기](#다이나믹셀-위자드-사용하기)

<iframe width="560" height="315" src="https://www.youtube.com/embed/YJ9b68hx5Qc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen="">
</iframe>

## [다이나믹셀 MX-28 셀프 캘리브레이션하기](#다이나믹셀-mx28-셀프-캘리브레이션하기)

<iframe width="560" height="315" src="https://www.youtube.com/embed/7qbYeKax48Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [다이나믹셀 MX-64/MX-106 셀프 캘리브레이션하기](#다이나믹셀-mx64mx106-셀프-캘리브레이션하기)

<iframe width="560" height="315" src="https://www.youtube.com/embed/mAm_9C1MoAs" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen="">
</iframe>

[usb2dynamixel 정보]: /docs/kr/parts/interface/usb2dynamixel/
