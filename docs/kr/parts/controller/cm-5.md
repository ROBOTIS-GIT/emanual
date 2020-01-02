---
layout: archive
lang: kr
ref: cm-5
read_time: true
share: true
author_profile: false
permalink: /docs/kr/parts/controller/cm-5/
sidebar:
  title: CM-5
  nav: "cm-5"
---

# [부품 사진](#부품-사진)

 ![](/assets/images/parts/controller/cm-5/cm-5.jpg)

[CM-5]

※ CM-5 제어기는 현재 단종되어 더 이상 판매되지 않습니다.
{: .notice--warning}

# [주요 사양](#주요-사양)

|     항목      |                         사양                          |
|:-------------:|:-----------------------------------------------------:|
|     무게      |                 125.95g (배터리 제외)                 |
|   컨트롤러    |                       ATMega128                       |
|   동작 전압   | 허용 범위 : 7V ~ 12V, 권장 전압 : 11.1V (Li-PO 3cell) |
|  소모 전류량  |       IDLE 시 : 50mA, 전체 최대 전류 : 5A(Fuse)       |
|   동작 온도   |                  -5&deg;C ~ 70&deg;C                  |
| 외부 I/O 장치 |          AX/MX Series 다이나믹셀 커넥터 : 2           |

# [각 부 명칭](#각-부-명칭)

 ![](/assets/images/parts/controller/cm-5/cm5_figure.png)

- 전원 스위치 : 전원을 연결하기 위한 스위치 입니다.
- 전원잭 : 전원 공급기(SMPS)의 전원잭을 연결하는 소켓입니다.
- 시작 버튼 : 모드 선택을 위한 버튼입니다.
- 모드 버튼 : CM-5 의 동작 모드를  변경하기 위한 버튼입니다.
- 시리얼 케이블 연결잭 : 시리얼 케이블로 CM-510 과 PC 의 시리얼 포트를 연결하는 포트입니다. 태스크 코드 다운로드 또는 PC와의 통신용으로 사용됩니다.
- U / L / D / R 버튼 : 프로그램 동작 중 입력 수단으로 사용할 수 있도록 할당된 버튼입니다. 이 버튼들로 로봇에게 명령을 내릴 수 있습니다.
- 모드 표시 LED : 현재 CM-5의 동작 모드를 나타내는 LED 입니다. 보다 자세한 내용은 아래에 설명이 있습니다.

  **[ MANAGE ]**
    - 다이나믹셀 관리모드가 실행 중임을 나타냅니다.
    - RoboPlus Manager를 이용하여 CM-5, AX/MX 다이나믹셀 의 동작을 설정하거나 테스트하기 위해 사용합니다.
    - [RoboPlus Manager] 와 CM-5가 연결 되었을때 자동으로 실행됩니다.

  **[ PROGRAM ]**
    - 모션 편집 모드가 실행 중임을 나타냅니다.
    - RoboPlus Motion 을 이용하여 모션을 편집할 떄 사용합니다.
    - [RoboPlus Motion] 과 CM-5가 연결 되었을 때 자동으로 실행 됩니다.

  **[ PLAY ]**
    - 태스크 코드 모드가 실행 중임을 나타냅니다.
    - [RoboPlus Task] 를 이용하여 작성한 코드를 CM-5에 다운로드 한 뒤에 사용합니다.
    - PLAY LED가 깜빡거릴때 사용자가 직접 START 버튼을 눌러서 실행시켜야 합니다.

  
- 상태 표시 LED : 현재 CM-5 의 상태를 나타내는 LED 입니다. 보다 자세한 내용은 아래에 설명이 있습니다.
- POWER : 전원이 ON 이면 켜지고, 충전 중이면 깜빡입니다.
- TXD : CM-5 가 외부로 데이터를 송신하는 동안 켜집니다.
- RXD : CM-5 가 외부로부터 데이터를 수신하는 동안 켜집니다.
- AUX : 사용자가 프로그램에서 사용할 수 있도록 할달된 LED입니다. 태스크 코드를 이용하여 켜거나 끌 수 있습니다.



# [전원 연결](#전원-연결)

![](/assets/images/parts/controller/cm-5/cm5_poweron.png)

CM-5 에는 충전지가 내장되어 있습니다. 충전지가 충전되어 있을 경우 전원 스위치를 ON 으로 설정하면 전원이 켜집니다. 충전지를 사용하지 않고, 외부 전원을 연결하고자 할 경우 전원잭에 전원 공급기인 SMPS 를 꽂고 전원 스위치를 ON 으로 설정하면 전원이 켜집니다. 전원이 켜지면 Power LED 가 점등되며 모드 표시 LED 중 하나가 깜빡입니다.

# [작동 방법](#작동-방법)

![](/assets/images/parts/controller/cm-5/cm5_oprating1.png)

- [전원 켜기] : 전원 스위치를 OFF에서 ON으로 변경하시면 전원이 켜집니다.

만약 전원 스위치를 ON으로 연결했을경우에도 전원이 켜지지 않는다면 내부 배터리가 방전되었을 수 있습니다. [충전하기]를 참조하여 충전을 하시거나 전원공급기(SMPS)를 이용하여 전원을 연결하시기 바랍니다.
{: .notice}

- [ 시작 ] : 로봇을 동작시키기 위해서는 `모드 버튼`을 이용하여 PLAY로 이동시킵니다. LED가 PLAY에 깜빡이고 있을때 시작(START) 버튼을 눌러 실행을 시킵니다.

시작(START) 버튼을 누르면 PLAY의 LED가 더 이상 깜빡이지 않고 계속 LED가 켜져 있는 상태가 되야 올바로 실행 되고 있는 상태입니다.
{: .notice}

- [ 종료 ] : 실행되고 있는 동작을 중단하고 싶을 경우 모드(MODE) 버튼을 눌러서 다시 대기 모드 상태로 만들거나 전원 스위치로 전원을 OFF 합니다.


# [활용 방법](#활용-방법)

CM-5를 구 버전의 행동제어 프로그래머 대신 RoboPlus에서 사용하기 위해서는 펌웨어를 업데이트 해야합니다. 펌웨어를 업데이트 하는 방법은 RoboPlus Manager에서 [펌웨어 업데이트하기]를 참조하십시오.
{: .notice--warning}

- 다이나믹셀과 주변 장치를 제어하기 위해 사용되는 제어기로, 다이나믹셀(AX/MX Series... 등)을 연결할 수 있습니다.

- [RoboPlus Motion] 을 통해 특정 모션을 편집, 저장할 수 있습니다. 저장된 Motion (mtn파일) 은 [RoboPlus Task] 를 통해 필요할 때 언제든 실행할 수 있으며, 제어용 태스크 코드를 작성하여 각 부품들의 동작을 제어할 수 있습니다.

※ [RoboPlus Motion]

![](/assets/images/parts/controller/cm-5/cm700_roboplusmotion.jpg)

※ [RoboPlus Task]  

![](/assets/images/parts/controller/cm-5/cm700_roboplustask.jpg)

※ [RoboPlus Manager]  

![](/assets/images/parts/controller/cm-5/cm700_roboplusmanager.jpg)


# [PC 연결](#pc-연결)

PC 와 통신하기 위해서는 시리얼 케이블로 CM-5 의 '시리얼 케이블 연결잭'과 PC 의 시리얼 포트를 연결해야 합니다. 시리얼 포트가 없는 노트북에서 바이올로이드를 사용하고자 할 경우에는 본사에서 별도 판매하고 있는 USB2DYNAMIXEL 을 이용하시면 USB 포트로도 통신할 수 있습니다.

![](/assets/images/parts/controller/cm-5/cm5_connectpc.png)

# [무선 통신 모듈 연결](#무선-통신-모듈-연결)
- CM-5에는 ZIG-100 무선 통신 모듈을 연결할 수 있습니다.

![](/assets/images/parts/controller/cm-5/cm5_zig100.png)


# [충전 하기](#충전-하기)

로봇을 SMPS 를 연결하지 않고 동작시키기 위해서는 배터리를 사용해야 합니다. 배터리가 방전되었을 경우에는 아래 순서에 따라 충전하여 사용하십시오.

![](/assets/images/parts/controller/cm-5/bioloid_cm5_charging-01.png)

1. CM-5 에 SMPS 를 연결합니다.

    ![](/assets/images/parts/controller/cm-5/bioloid_cm5_charging-02.png)

2. CM-5 의 전원스위치를 켜고 CM-5 의 U 버튼을 누릅니다.

CM-5 가 충전 중일 때는 전원 LED 가 깜빡거립니다. 전원 LED 가 깜빡거리는 속도는 충전이 얼마나 남았는지 확인하는 지표입니다. 충전이 다 되어 갈수록 LED 의 깜빡거리는 속도는 점점 빨라집니다. 충전이 다 되면 약 2초에 한 번씩만 깜빡입니다.
{: .notice}


# [퓨즈 교체하기](#퓨즈-교체하기)

CM-5 내부에는 과전류가 흘러서 회로가 망가지는 것을 막기 위한 퓨즈(Fuse)가 있습니다.  
퓨즈가 끊어지면 다음과 같은 증상이 나타납니다.

- CM-5가 SMPS로만 전원이 켜집니다.
- 충전을 하기 위해 U버튼을 눌러도 LED가 깜박거리지 않습니다.

CM-5 에 사용되는 퓨즈는 일반 전파상에서 쉽게 구할 수 있습니다.(퓨즈의 용량 : 220V/5A)
{: .notice}

![](/assets/images/parts/controller/cm-5/cm5_fuse.png)


# [관련동영상](#관련동영상)

## 로보플러스 매니저 사용하기(CM-5편)

<iframe width="560" height="315" src="https://www.youtube.com/embed/I-_ceAQ_Ea4" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## 배터리 충전하기

<iframe width="560" height="315" src="https://www.youtube.com/embed/AjLCuMORQIM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>


[RoboPlus Manager]: /docs/kr/software/rplus1/manager/
[RoboPlus Motion]: /docs/kr/software/rplus1/motion/
[RoboPlus Task]: /docs/kr/software/rplus1/task/getting_started/
[충전하기]: /docs/kr/edu/bioloid/beginner/#충전하기
[펌웨어 업데이트하기]: /docs/kr/software/rplus1/manager/#펌웨어-업데이트
