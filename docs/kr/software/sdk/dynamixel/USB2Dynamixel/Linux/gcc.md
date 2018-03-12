# gcc

Linux gcc 를 이용한 예제입니다.

## 환경 설정

#### Dynamixel API 사용하기

STEP1)  Header 파일 지정
소스 파일에 #include <dynamixel.h>을 추가합니다.

STEP2) 함수호출
소스 상에서 필요한 함수를 호출하면 됩니다. 각 함수의 사용법은 [API Reference]를 참고하시기 바랍니다.

## Read/Write Example

다이나믹셀의 Read / Write예제입니다.  

### 준비

USB2Dynamixel의 통신 모드를 환경에 맞게 선택합니다.

![img](/assets/images/sw/sdk/u2d_select.png)

스위치 위치에 따른 통신 모드에 대한 정보는 다음과 같습니다.

1 - TTL Mode

AX-Series, MX(TTL)-Series 와 같은 3핀 케이블을 사용하는 장치와 통신할 수 있습니다.

2 - RS485 Mode

DX-Series, RX-Series, EX-Series, MX(RS485)-Series 등 4핀 케이블을 사용하는 장치와 통신할 수 있습니다.

3 - RS232 Mode

CM-5, CM-510 등과 같이 시리얼 케이블을 사용하는 장치와 통신할 수 있습니다.

1개의 다이나믹셀이 USB2Dynamixel에 연결되어 있어야 합니다.
사용하는 다이나믹셀은 ID 는 1, 통신 속도는 1Mbps로 설정되어야 합니다.  

EX 시리즈의 다이나믹셀을 사용하는 경우에는 EX시리즈용 소스로 바꿔야 합니다.

![img](/assets/images/sw/sdk/c++_rw.png)

### 소스

#### 초기화

```
///////// Open USB2Dynamixel ////////////
if( dxl_initialize(deviceIndex, baudnum) == 0 )
{
  printf( "Failed to open USB2Dynamixel!\n" );
  printf( "Press Enter key to terminate...\n" );
  getchar();
  return 0;
}
else
  printf( "Succeed to open USB2Dynamixel!\n"
```

위 소스는 초기화가 제대로 되었는지를 확인합니다.

초기화가 성공하였으면 1, 실패할경우엔 0이 반환 되므로 if문에는 실패했을 경우에 대한 소스가 들어가게 되고, else문 안에는 성공했을 경우의 소스가 들어가게 됩니다.

dynamixel API 중 [dxl_initialize]함수를 호출 합니다.
deviceIndex는 통신장치가 연결되어 있는 번호를 의미 합니다.
baudnum 는 Baud Rate의 설정값을 의미 합니다.
deviceIndex 과 baudnum 은 사용자의 상황에 맞게 설정하셔야 합니다.
deviceIndex은 0, baudnum 은 1Mbps 로  기본 셋팅이 되어있습니다.

#### 종료

```
// Close device
dxl_terminate();
```

위 소스는 종료하는 소스입니다.

dynamixel API 중 [dxl_teminate] 함수를 호출하여 연결을 종료 시킵니다.

#### 목표 위치로 이동하기

```
// Write goal position
dxl_write_word( DEFAULT_ID, P_GOAL_POSITION_L, GoalPos[index] );
```

위 소스는 다이나믹셀을 목표 지점으로 이동시키는 소스입니다.
dynamixel API 중 [dxl_write_word]함수를 호출 합니다.
DEFAULT_ID 는 현재 연결되어있는 다이나믹셀의 아이디값을 의미합니다.
P_GOAL_POSITION_L은 다이나믹셀의 [Control Table]의 GOAL_POSITION의 해당하는 번지의 시작 주소값 (30) 을 미리 선언해준 값입니다.
GoalPos(index)는 이동하고 싶은 GoalPosition 값을 배열로 선언하여 인덱스가 바뀔때마다 해당하는 값을 전달해줍니다.

`notice` 다이나믹셀에 값을 읽고 쓸 경우에 쓰는 함수는 word형 과 byte형이 있습니다.{:. caption}

[Control Table] 내의 다이나믹셀에서의 값들이 byte형일 경우에는 dxl_write_byte , dxl_read_byte 같은 함수를 사용하고, word형일 경우엔 dxl_write_word , dxl_read_word 함수를 사용합니다.
Position 정보는 word형 함수이기 때문에 밑의 예제들은 word형 함수를 사용하였습니다.

#### 현재 위치 읽어오기

```
// Read present position
PresentPos = dxl_read_word( DEFAULT_ID, P_PRESENT_POSITION_L );
```


위 소스는 PresentPos 변수에 현재 다이나믹셀의 포지션값을 읽어 드리는 소스입니다.
dynamixel API 중 [dxl_read_word] 함수를 호출 합니다.
DEFAULT_ID 는 현재 연결되어있는 다이나믹셀의 아이디값을 의미합니다.
P_PRESENT_POSITION_L은 다이나믹셀의 현재위치를 저장 하고 있는 번지의 시작 주소값(36)을 미리 선언해준 값입니다.

#### 패킷 통신 결과 확인

```
CommStatus = dxl_get_result();
if( CommStatus == COMM_RXSUCCESS )
{
  PrintErrorCode();
}
else
{
  PrintCommStatus(CommStatus);
}
```

위 소스는 패킷 통신결과를 CommStatus 변수에 저장하는 소스입니다.
통신결과가 제대로 되었는지 확인하는 함수 [dxl_get_result]를 이용하여 확인합니다.
통신결과가 성공일때 PrintErrorCode함수를 호출하여 다이나믹셀의 동작 중에 발생된 오류 상태를 점검합니다.
통신결과가 실패일때 dxl_get_result 함수로 부터 리턴받은 에러정보를 PrintCommStatus함수에 전달하여 에러 정보를 화면에 출력하여 줍니다.

- PrintErrorCode함수

  ```
  void PrintErrorCode()
  {
    // Method 2. using function
    if(dxl_get_rxpacket_error(ERRBIT_VOLTAGE) == 1)
    printf("Input voltage error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_ANGLE) == 1)
    printf("Angle limit error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_OVERHEAT) == 1)
    printf("Overheat error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_RANGE) == 1)
    printf("Out of range error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_CHECKSUM) == 1)
    printf("Checksum error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_OVERLOAD) == 1)
    printf("Overload error!\n");
    if(dxl_get_rxpacket_error(ERRBIT_INSTRUCTION) == 1)
    printf("Instruction code error!\n");
  }
  ```

  PrintErrorCode함수는 [dxl_get_rxpacket_error]함수를 호출하여 Status Packet의 오류를 검사하는 함수 입니다.

- PrintCommStatus함수

  ```
  void PrintCommStatus(int CommStatus)
  {
    switch(CommStatus)
    {
    case COMM_TXFAIL:
    printf("COMM_TXFAIL: Failed transmit instruction packet!\n");
    break;
    case COMM_TXERROR:
    printf("COMM_TXERROR: Incorrect instruction packet!\n");
    break;
    case COMM_RXFAIL:
    printf("COMM_RXFAIL: Failed get status packet from device!\n");
    break;
    case COMM_RXWAITING:
    printf("COMM_RXWAITING: Now recieving status packet!\n");
    break;
    case COMM_RXTIMEOUT:
    printf("COMM_RXTIMEOUT: There is no status packet!\n");
    break;
    case COMM_RXCORRUPT:
    printf("COMM_RXCORRUPT: Incorrect status packet!\n");
    break;
    default:
    printf("This is unknown error code!\n");
    break;
    }
  }
  ```
  PrintCommStatus는 [dxl_get_result] 함수로 부터 리턴받은 값으로부터 에러정보를 화면에 출력해주는 함수입니다.

#### 움직임 유무

```
// Check moving done
Moving = dxl_read_byte( DEFAULT_ID, P_MOVING );
```

위 소스는 Moving 변수에 [dxl_read_byte]를 이용하여 현재 다이나믹셀이 움직이고 있는지를 검사하여 저장합니다.

DEFAULT_ID 는 해당 다이나믹셀의 id값을 의미합니다.

P_MOVING은 다이나믹셀의  [Control Table]의 Moving부분의 번지값 (46) 을 의미합니다.

Moving은 byte형 데이터이기 때문에 dxl_read_byte를 이용해 Moving값을 검사합니다.

## Sync Write Example

### 준비

3개의 다이나믹셀이 USB2Dynamixel에 연결되어야 합니다.
각  다이나믹셀은 ID는 1,2,3이고 통신 속도는 1Mbps로  설정 되어야 합니다.
EX 시리즈의 다이나믹셀을 사용하는 경우에는 EX시리즈용 소스로 바꿔 사용하셔야 합니다.

### 소스

#### 아이디 값 및 phase값 셋팅 하기

```
for( i=0; i<NUM_ACTUATOR; i++ )
{
  id[i] = i+1;
  phase[i] = 2*PI * (float)i / (float)NUM_ACTUATOR;
}
```

위 소스는 id 배열에 다이나믹셀의 아이디 값을  넣는 소스 입니다.
예제에 사용 되는 다이나믹셀을 ID 값이 1,2,3 인 다이나믹셀을 사용했습니다.
다른 ID값을 갖고 있는 다이나믹셀을 이용할 경우엔 다이나믹셀의 ID값을 바꾸거나 ,
소스내의 id배열에 값을 해당 다이나믹셀 id값으로 넣어 주셔야 합니다.
phase는 각 다이나믹셀의 초기 상을 의미합니다.

#### 패킷 만들기

```
dxl_set_txpacket_id(BROADCAST_ID);
dxl_set_txpacket_instruction(INST_SYNC_WRITE);
dxl_set_txpacket_parameter(0, P_GOAL_POSITION_L);
dxl_set_txpacket_parameter(1, 2);
for( i=0; i<NUM_ACTUATOR; i++ )
{
  dxl_set_txpacket_parameter(2+3*i, id[i]);
  GoalPos = (int)((sin(theta+phase[i]) + 1.0) * (float)AmpPos);
  printf( "%d  ", GoalPos );
  dxl_set_txpacket_parameter(2+3*i+1, dxl_get_lowbyte(GoalPos));
  dxl_set_txpacket_parameter(2+3*i+2, dxl_get_highbyte(GoalPos));
}
dxl_set_txpacket_length((2+1)*NUM_ACTUATOR+4);

printf( "\n" );

dxl_txrx_packet();
CommStatus = dxl_get_result();
```

위 소스는 syncwrite 패킷을 만드는 소스입니다.
패킷의 구조는 [다이나믹셀 패킷 구조]를 참조하여 [패킷을 만드는데  필요한 함수]를 이용하여 패킷을 만들어야 합니다.

[API Reference]: ??
[dxl_initialize]: ??
[dxl_teminate]: ??
[Control Table]: ??
[dxl_read_word]: ??
[dxl_get_result]: ??
[dxl_get_rxpacket_error]: ??
[dxl_get_result]: ??
[dxl_read_byte]: ??
[다이나믹셀 패킷 구조]: ??
[패킷을 만드는데  필요한 함수]: ??
