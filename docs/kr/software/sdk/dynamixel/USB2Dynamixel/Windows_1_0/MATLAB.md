# MATLAB

MATLAB용 예제입니다.
본 예제는 MATLAB 7.0에서 테스트 되었습니다.

## 환경 설정

예제를 실행하기 위해서는 MATLAB에서 환경 설정을 해주어야 합니다.

#### 경로 등록 하기

MATLAB 에서 다이나믹셀 SDK의 API를 사용하기 위해서는 경로를 등록하셔야 합니다.

1.  메뉴의 File -> Set Path 를 클릭합니다.
![img](/assets/images/sw/sdk/matlab_config.png)

2. ADD Folder를 클릭 합니다.
![img](/assets/images/sw/sdk/matlab_config2.png)

3. MATLAB에 dynamixel.dll과 dynamixel.h의 위치를 등록합니다. USB2Dynamixel이 설치된 폴더에서 bin폴더와, import폴더 안에 있습니다.

    >(예: C:\Program Files\ROBOTIS\USB2Dynamixel\bin\dynamixel.dll
    >C:\Program Files\ROBOTIS\USB2Dynamixel\import\dynamixel.h )

    ![img](/assets/images/sw/sdk/matlab_config3.png)

4. 경로가 추가된것을 확인하고 SAVE 버튼을 눌러 저장하고 창을 닫습니다.
![img](/assets/images/sw/sdk/matlab_config4.png)

#### Dynamixel API 사용하기

(STEP 1) 라이브러리를 로드 합니다.
 loadlibrary(‘dynamixel’, ‘dynamixel.h’)

(STEP 2) 라이브러리 함수 목록을 확인합니다.
libfunctions(‘dynamixel’)

(STEP 3) 함수를 호출합니다. 각 함수의 사용 법은 [API Reference]를 참고합니다.
반환 값 = calllib(‘dynamixel’, ‘함수 이름’, 함수 인자1, 함수 인자2, … )
(예, value = calllib(‘dynamixel’, ‘dxl_read_word’, 1, 36 ) )
(STEP 4) 프로그램 종료 시 라이브러리를 해제합니다.
unloadlibrary(‘dynamixel’)

```
loadlibrary('dynamixel', 'dynamixel.h');
libfunctions('dynamixel');
DEFAULT_PORTNUM = 3;  //COM3
DEFAULT_BAUDNUM = 1;  //1Mbps

calllib('dynamixel', 'dxl_initialize', DEFAULT_PORTNUM, DEFAULT_BAUDNUM);

unloadlibrary('dynamixel');
```

## Read/Write Example

다이나믹셀의 Read / Write예제입니다.  

### 준비

USB2Dynamixel의 통신 모드를 환경에 맞게 선택합니다.

![img](http://support.robotis.com/ko/images/product/auxdevice/interface/u2d_select.png)

스위치 위치에 따른 통신 모드에 대한 정보는 다음과 같습니다.

1 - TTL Mode

AX-Series, MX(TTL)-Series 와 같은 3핀 케이블을 사용하는 장치와 통신할 수 있습니다.

2 - RS485 Mode

DX-Series, RX-Series, EX-Series, MX(RS485)-Series 등 4핀 케이블을 사용하는 장치와 통신할 수 있습니다.

3 - RS232 Mode

CM-5, CM-510 등과 같이 시리얼 케이블을 사용하는 장치와 통신할 수 있습니다.

1개의 다이나믹셀이 USB2Dynamixel에 연결되어 있어야 합니다.
사용하는 다이나믹셀은 ID 는 1, 통신 속도는 1Mbps로 설정되어야 합니다.

EX 시리즈의 다이나믹셀을 사용하는 경우에는 EX시리즈용 소스로 바꿔 사용하셔야 합니다.

![img](/assets/images/sw/sdk/matlab_rw.png)

### 소스

#### 초기화

```
%open device
res = calllib('dynamixel','dxl_initialize',DEFAULT_PORTNUM,DEFAULT_BAUDNUM);
```

위 소스는 res라는 변수를 통해 초기화가 제대로 되었는지를 확인합니다.
초기화가 성공하였으면 1, 실패할경우엔 0이 저장되게 됩니다.
매트랩의 calllib함수를 이용해 dynamixel API 중 [dxl_initialize] 함수를 호출 합니다.

DEFAULT_PORTNUM는 통신장치가 연결되어 있는 번호를 의미 합니다.
DEFAULT_BAUDNUM는 Baud Rate의 설정값을 의미 합니다.
DEFAULT_PORTNUM 과 DEFAULT_BAUDNUM 은 사용자의 상황에 맞게 설정하셔야 합니다.
PORTNUM은 COM3, DEFAULT_BAUDNUM은 1Mbps 로  기본 셋팅이 되어있습니다.

#### 종료

```
%Close Device
calllib('dynamixel','dxl_terminate');
```

위 소스는 종료하는 소스입니다.
매트랩의 calllib함수를 이용해 dynamixel API 중 [dxl_teminate] 함수를 호출하여 연결을 종료 시킵니다.

#### 목표 위치로 이동하기

```
%Write goal position
calllib('dynamixel','dxl_write_word',id,P_GOAL_POSITION,GoalPos(index));  
```

위 소스는 다이나믹셀을 목표 지점으로 이동시키는 소스입니다.
매트랩의 calllib함수를 이용해 dynamixel API 중 [dxl_write_word] 함수를 호출 합니다.
id는 현재 연결되어있는 다이나믹셀의 아이디값을 의미합니다.
P_GOAL_POSITION은 다이나믹셀의 [Control Table]의 GOAL_POSITION의 해당하는 번지값 (30) 을 미리 선언해준 값입니다.
GoalPos(index)는 이동하고 싶은 GoalPosition 값을 배열로 선언하여 인덱스가 바뀔때마다 해당하는 값을 전달해줍니다.

`caption` 다이나믹셀에 값을 읽고 쓸 경우에 쓰는 함수는 word형 과 byte형이 있습니다.{:. caption}

[Control Table] 내의 다이나믹셀에서의 값들이 byte형일 경우에는 dxl_write_byte , dxl_read_byte 같은 함수를 사용하고, word형일 경우엔 dxl_write_word , dxl_read_word 함수를 사용합니다.

Position 정보는 word형 함수이기 때문에 밑의 예제들은 word형 함수를 사용하였습니다.

#### 현재 위치 읽어오기

```
%Read Present position
PresentPos = int32(calllib('dynamixel','dxl_read_word',id,P_PRESENT_POSITION));
```

위 소스는 PresentPos 변수에 현재 다이나믹셀의 포지션값을 읽어 드리는 소스입니다.
매트랩의 calllib함수를 이용해 dynamixel API 중 [dxl_read_word]함수를 호출 합니다.
id는 현재 연결되어있는 다이나믹셀의 아이디값을 의미합니다.
P_PRESENT_POSITION은 다이나믹셀의 현재위치를 저장 하고 있는 번지값(36)을 미리 선언해준 값입니다.

#### 패킷 통신 결과 확인

```
CommStatus = int32(calllib('dynamixel','dxl_get_result'));
if CommStatus == COMM_RXSUCCESS
PrintErrorCode();
else
             PrintCommStatus(CommStatus);
```             

위 소스는 패킷 통신결과를 CommStatus 변수에 저장하는 소스입니다.
통신결과가 제대로 되었는지 확인하는 함수 [dxl_get_result]를 이용하여 확인합니다.

통신결과가 성공일때 PrintErrorCode함수를 호출하여 다이나믹셀의 동작 중에 발생된 오류 상태를 점검합니다.

통신결과가 실패일때 dxl_get_result 함수로 부터 리턴받은 에러정보를 PrintCommStatus함수에 전달하여 에러 정보를 화면에 출력하여 줍니다.

- PrintErrorCode함수
  ```
  function [] = PrintErrorCode()
  global ERRBIT_VOLTAGE
  ERRBIT_VOLTAGE     = 1;
  global ERRBIT_ANGLE
  ERRBIT_ANGLE       = 2;
  global ERRBIT_OVERHEAT
  ERRBIT_OVERHEAT    = 4;
  global ERRBIT_RANGE
  ERRBIT_RANGE       = 8;
  global ERRBIT_CHECKSUM
  ERRBIT_CHECKSUM    = 16;
  global ERRBIT_OVERLOAD
  ERRBIT_OVERLOAD    = 32;
  global ERRBIT_INSTRUCTION
  ERRBIT_INSTRUCTION = 64;
   if int32(calllib('dynamixel','dxl_get_rxpacket_error', ERRBIT_VOLTAGE))==1
       disp('Input Voltage Error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_ANGLE))==1
       disp('Angle limit error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_OVERHEAT))==1
       disp('Overheat error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_RANGE))==1
       disp('Out of range error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_CHECKSUM))==1
       disp('Checksum error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_OVERLOAD))==1
       disp('Overload error!');
   elseif int32(calllib('dynamixel','dxl_get_rxpacket_error',ERRBIT_INSTRUCTION))==1
       disp('Instruction code error!');
   end
  ```
  PrintErrorCode함수는 [dxl_get_rxpacket_error]함수를 호출하여 Status Packet의 오류를 검사하는 함수 입니다.

- PrintCommStatus함수
  ```
  function [] = PrintCommStatus( CommStatus )
  global COMM_TXSUCCESS
  COMM_TXSUCCESS     = 0;
  global COMM_RXSUCCESS
  COMM_RXSUCCESS     = 1;
  global COMM_TXFAIL
  COMM_TXFAIL        = 2;
  global COMM_RXFAIL
  COMM_RXFAIL        = 3;
  global COMM_TXERROR
  COMM_TXERROR       = 4;
  global COMM_RXWAITING
  COMM_RXWAITING     = 5;
  global COMM_RXTIMEOUT
  COMM_RXTIMEOUT     = 6;
  global COMM_RXCORRUPT
  COMM_RXCORRUPT     = 7;
  switch(CommStatus)
      case COMM_TXFAIL
          disp('COMM_TXFAIL : Failed transmit instruction packet!');
      case COMM_TXERROR
          disp('COMM_TXERROR: Incorrect instruction packet!');
      case COMM_RXFAIL
          disp('COMM_RXFAIL: Failed get status packet from device!');
      case COMM_RXWAITING
          disp('COMM_RXWAITING: Now recieving status packet!');
      case COMM_RXTIMEOUT
          disp('COMM_RXTIMEOUT: There is no status packet!');
      case COMM_RXCORRUPT
          disp('COMM_RXCORRUPT: Incorrect status packet!');
      otherwise
          disp('This is unknown error code!');

  end
  ```
  PrintCommStatus는 [dxl_get_result]함수로 부터 리턴받은 값으로부터 에러정보를 화면에 출력해주는 함수입니다.

#### 움직임 유무

```
%Check moving done
Moving = int32(calllib('dynamixel','dxl_read_byte',id,P_Moving));
```

위 소스는 Moving 변수에 [dxl_read_byte]를 이용하여 현재 다이나믹셀이 움직이고 있는지를 검사하여 저장합니다.
id는 해당 다이나믹셀의 id값을 의미합니다.
P_Moving은 다이나믹셀의  [Control Table]의 Moving부분의 번지값 (46) 을 의미합니다.

Moving은 byte형 데이터이기 때문에 dxl_read_byte를 이용해 Moving값을 검사합니다.

## Sync Write Example

### 준비

3개의 다이나믹셀이 USB2Dynamixel에 연결되어야 합니다.
각  다이나믹셀은 ID는 1,2,3이고 통신 속도는 1Mbps로  설정 되어야 합니다.
EX 시리즈의 다이나믹셀을 사용하는 경우에는 EX시리즈용 소스로 바꿔 사용하셔야 합니다.

### 소스

#### 아이디 값 셋팅 하기

```
for i = 1:1:NUM_ACTUATOR
    id(i) = i;
end
```

위 소스는 id 배열에 다이나믹셀의 아이디 값을  넣는 소스 입니다.
예제에 사용 되는 다이나믹셀을 ID 값이 1,2,3 인 다이나믹셀을 사용했습니다.
다른 ID값을 갖고 있는 다이나믹셀을 이용할 경우엔 다이나믹셀의 ID값을 바꾸거나 ,

소스내의 id배열에 값을 해당 다이나믹셀 id값으로 넣어 주셔야 합니다.

#### 패킷 만들기

```
% Make syncwrite packet
calllib('dynamixel','dxl_set_txpacket_id',BROADCAST_ID);
calllib('dynamixel','dxl_set_txpacket_instruction',INST_SYNC_WRITE);
calllib('dynamixel','dxl_set_txpacket_parameter',0,P_GOAL_POSITION);
calllib('dynamixel','dxl_set_txpacket_parameter',1,2);
for i = 0:1:NUM_ACTUATOR-1
calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i,id(i+1));
              GoalPos = ((sin(theta+phase(i+1)) + 1) * AmpPos);
              Position(i+1) = int32(GoalPos);
              low = calllib('dynamixel','dxl_get_lowbyte',GoalPos);
              calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+1,low);
              high = calllib('dynamixel','dxl_get_highbyte',GoalPos);
              calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+2,high);
end
calllib('dynamixel','dxl_set_txpacket_length',(2+1)*NUM_ACTUATOR+4);
calllib('dynamixel','dxl_txrx_packet');
```

위 소스는 syncwrite 패킷을 만드는 소스입니다.

패킷의 구조는 [다이나믹셀 패킷 구조]를 참조하여 [패킷을 만드는데  필요한 함수]를 이용하여 패킷을 만들어야 합니다.

[API Reference]: ??
[dxl_initialize]: ??
[dxl_teminate]: ??
[dxl_read_byte]: ??
[dxl_read_word]: ??

[dxl_write_word]: ??
[dxl_get_result]: ??
[dxl_get_rxpacket_error]: ??
[Control Table]: ??
[다이나믹셀 패킷 구조]: ??
[패킷을 만드는데  필요한 함수]: ??
