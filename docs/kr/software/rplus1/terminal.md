---
layout: archive
lang: kr
ref: rplus1_terminal
read_time: true
share: true
author_profile: false
permalink: /docs/kr/software/rplus1/terminal/
sidebar:
  title: 로보플러스 터미널
  nav: "rplusterminal"
---

# [개요](#개요)

로보플러스 터미널은 텍스트 기반 UI로 제어기를 관리할 수 있는 도구입니다. 터미널 프로그램은 아스키 코드를 기반으로 제어기와 통신을 하며, 사용자에게 제어기로부터 전송되는 여러 가지 정보를 출력합니다.

![](/assets/images/sw/rplus1/terminal/roboplus_terminal_001.png)

# [통신 포트 설정](#통신-포트-설정)

로보플러스 터미널을 이용하여 제어기에 접속하기 위해서는, 연결할 통신 포트를 설정해야 합니다.  

로보플러스 터미널을 처음 실행하면 과거의 연결 정보를 그대로 복원합니다. 만약 시리얼 포트의 이름이 바뀌었거나 다른 프로그램에서 시리얼 포트를 사용 중에 있다면, 제어기와 연결되지 않을 수 있습니다.

통신 포트는 접속이 끊어진 상태에서 `Setup` > `Connect`을 실행하면 다음과 같이 포트 선택창을 볼 수 있으며, 제어기가 연결된 시리얼 포트 및 통신 속도를 선택하고 OK를 누르면 됩니다.

**참고**: 제어기의 기본 연결 속도는 `57,600bps`입니다.
{: .notice}

![img](/assets/images/sw/rplus1/terminal/connection.png)

로보플러스 터미널의 시리얼 통신 설정은 다음과 같습니다.

- Parity bit : no parity
- Stop bit : 1bit
- Data bit : 8bit
- Hardware Control: none

# [입력 처리](#입력-처리)

로보플러스 터미널은 키보드 입력을 받아서 시리얼 통신을 통해 PC와 연결된 제어기로 신호를 전송합니다.  
각 키에 따른 데이터는 다음과 같습니다.

- 특수 키 처리

| ASCII            | Key       |
| ---------------- | --------- |
| 0x08             | Backspace |
| 0x0d, 0x0a       | Enter     |
| 0x1b             | ESC       |
| 0x1b, 0x5b, 0x41 | 커서 up     |
| 0x1b, 0x5b, 0x42 | 커서 down   |
| 0x1b, 0x5b, 0x43 | 커서 right  |
| 0x1b, 0x5b, 0x44 | 커서 left   |
| 0x1b, 0x5b, 0x48 | Home      |
| 0x1b, 0x5b, 0x4b | End       |

- 그 외의 알파벳 키는 해당 ASCII 코드를 전송합니다. (한글 및 유니 코드는 지원하지 않습니다.)

## [화면 지우기](#화면-지우기)

로보 플러스 터미널에서는 화면 지우기 기능을 지원합니다. 복잡해진 화면을 지우기 위해서는 메뉴의 Clear Screen 명령을 실행하면 됩니다.

![img](/assets/images/sw/rplus1/terminal/clearscreen.png)

# [제어기 출력 처리](#제어기-출력-처리)

로보플러스 터미널은 연결된 제어기로 부터 신호를 받아서 화면에 그 내용을 출력합니다.

![img](/assets/images/sw/rplus1/terminal/text_output.png)

## [커서 제어](#커서-제어)

- 터미널 화면 크기는 80x36(가로x세로)입니다.
- 커서 제어 문자열은 다음과 같으며 ANSI 커서 제어 방법과 동일합니다. 제어기에서 다음과 같은 형식으로 문자를 전송하면, 로보플러스 터미널은 지정한 위치로 커서를 이동시킵니다. (ESC키의 코드는 27입니다.)

  ESC[Y;XH 혹은 ESC[Y;Xf 
  예) 27[10:20f => X=20, Y=10으로 이동 (화면 좌표 index는 1부터 시작합니다.)

- 그 외 일반적으로 사용하는 제어 문자열은 다음과 같습니다.

| ASCII       | Key                   |
| ----------- | --------------------- |
| 0x08        | Backspace: 커서 한 글자 뒤로 |
| 0x0a        | /LF: 다음줄 첫 번째로 커서 이동  |
| 0x0d        | /CR: 그 줄 첫 번째로 커서 이동  |
| 0x20        | Space: 커서 한 글자 다음     |
| 0x21 ~ 0x7e | ASCII 글자 출력 (!에서 ~까지) |

# [데이터 전송/수신](#데이터-전송수신)

로보플러스 터미널은 연결된 제어기와 대량의 데이터를 주고 받을 수 있습니다. 데이터 전송 프로토콜은 없습니다.

![img](/assets/images/sw/rplus1/terminal/file_mgt.png)

## [데이터 전송](#데이터-전송)

로보플러스 터미널은 파일의 내용을 바이너리 포맷으로 연결된 제어기에 전송할 수 있습니다.  
확장자가 hex인 경우는 인텔 HEX 포맷에 근거하여 바이너리로 변환하여 전송합니다. 그 외의 확장자는 변환 없이 그대로 전송합니다.  
파일을 전송하는 순서는 다음과 같습니다.
- 연결된 제어기가 데이터를 수신할 수 있도록 준비합니다.
- 메뉴에서 Transmit file을 선택합니다.
- 전송할 파일을 선택합니다.
- 만약 최근에 전송한 파일을 그대로 사용한다면 Page Down키를 단축키로 활용할 수 있습니다.
- 전송 중에는 로보플러스 터미널 하단에서 전송 상황을 확인할 수 있습니다. 전송을 취소하려면 ESC키를 누릅니다.

  ![img](/assets/images/sw/rplus1/terminal/downloadstatus.png)

### [ByteSum](#bytesum)

ByteSum이란 전송된 데이터의 손실 유무를 판단할 수 있는 데이터입니다.  
ByteSum은 전송하는 모든 바이트 단위 데이터를 더했을 때, 마지막 1바이트를 의미합니다.  
예를 들어, FD 23 4D 2D 를 전송한다면, 각 바이트를 모두 더했을 때 01 9A가 나오며, 이 중 가장 하위 바이트인 9A가 ByteSum입니다.

![img](/assets/images/sw/rplus1/terminal/option.png)

메뉴에서 bytesum을 체크해 두면, 파일 전송시에 파일 패킷의 마지막 부분에 bytesum 패킷을 덧붙여 전송합니다.  
데이터를 수신한 제어기에서 로보플러스 터미널로부터 받은 bytesum과 직접 계산한 bytesum을 비교하여 데이터 손실 유무를 확인할 수 있습니다.

## [데이터 수신](#데이터-수신)

로보플러스 터미널은 연결된 제어기로부터 데이터를 받아서 파일로 저장할 수 있습니다. 파일을 수신하는 순서는 다음과 같습니다.
- 메뉴에서 Recieve File을 선택합니다.
- 저장할 파일 이름을 설정합니다.
- 만약 최근에 저장했던 파일을 그대로 사용한다면 Page Up키를 단축키로 활용할 수 있습니다.
- 제어기에서 데이터 전송을 시작합니다.
- 데이터 수신 중에 로보플러스 터미널 하단에서 수신 상황을 확인할 수 있습니다.

  ![img](/assets/images/sw/rplus1/terminal/uploadstatus.png)

- 데이터 수신이 완료되면 키보드의 End키를 눌러서 데이터 수신을 끝냅니다

# [옵션 설정](#옵션-설정)

로보플러스 터미널의 옵션을 설정합니다.

## [색상 설정하기](#색상-설정하기)

로보 플러스 터미널의 배경색과 텍스트 색상을 설정할 수 있습니다.

![img](/assets/images/sw/rplus1/terminal/color_setting.png)
