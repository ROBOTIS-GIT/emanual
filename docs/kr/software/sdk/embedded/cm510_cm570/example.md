# 예제

## LED 제어

제어기의 각 LED를 제어할 수 있습니다.

### 준비물

CM-510 혹은 700

### 이론

제어기의 마이크로 컨트롤러는 I/O포트를 통해 제어기와 연결된 LED등의 주변 장치를 제어할 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 LED를 제어해 볼 수 있습니다.
예제에서는 제어기의 PORTC를 사용합니다. 제어기 포트맵을 확인하시기 바랍니다.

### 소스

```
PORTC = ~(1<<i);
_delay_ms(250);
```
PORTC를 제어하여 제어기의 LED를 순서대로 켭니다.

### 결과

제어기의 모든 LED가 순차적으로 점등됩니다.

## 버튼

제어기 버튼 입력을 받을 수 있습니다.

### 준비물

CM-510 혹은 700

### 이론

제어기의 마이크로 컨트롤러의 I/O포트를 통해 제어기와 연결된 장치의 전기적 신호를 읽을 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 스위치의 눌림 상태를 확인할 수 있습니다.
예제에서는 제어기의 PORTC와 PORTE를 사용합니다. 제어기 포트맵을 확인하시기 바랍니다.

**소스**
```
CM-510예제입니다.
if(~PINE & BTN_UP)
PORTC &= ~LED_MANAGE;
else if(~PINE & BTN_DOWN)
PORTC &= ~LED_AUX;
else if(~PINE & BTN_LEFT)
PORTC &= ~LED_PROGRAM;
else if(~PINE & BTN_RIGHT)
PORTC &= ~LED_PLAY;
else if(~PIND & BTN_START)
PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
```

PORTD와 PORTE를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.
PORTD와 PORTE를 통해 입력값을 얻는 방법은 PIND와 PINE 매크로 함수를 사용합니다.
PIND와 PINE는 1바이트이며, 각 비트에는 PORTD, PORTE의 핀이 대응되어 있습니다.
따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.

**CM-700예제입니다.**
```
if(~PIND & BTN_START)
PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
```
PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.
PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.
PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.
따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.

### 결과

버튼을 누르면, 눌린 버튼에 따라 서로 다른 LED가 켜집니다.

## 시리얼 통신

PC와 제어기가 시리얼 통신을 할 수 있습니다.

### 준비물

제어기의 시리얼 케이블이 PC와 연결된 상태.
예제의 통신 속도는 57600bps로 설정되어 있습니다.

### 이론

시리얼 통신은 제어기의 값을 PC로 전송하여 사용자에게 보여줄 수 있는 가장 기본적인 수단입니다. 이 예제를 통해 제어기와 시리얼 통신을 해볼 수 있습니다.

### 소스

```
serial_initialize(57600); // USART Initialize
sei(); // set enable interrupt
```

시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.

sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.

![img](/assets/images/sw/sdk/embedded_046.png)

```
unsigned char ReceivedData = getchar();
if(ReceivedData == 'u')
Value++;
else if(ReceivedData == 'd')
Value--;
printf("%d\r\n", Value);
```

받은 무선 데이터가 u인 경우 1을 더하고, d인 경우 1을 빼서 출력하는 부분입니다.
getchar()함수를 이용하여 데이터를 수신합니다. 만약, 데이터가 수신되지 않았으면 대기합니다.

### 결과

키보드로 'u'키를 입력하면 제어기에서 현재 기억된 숫자에 1을 더하여 출력하며, 'd'키를 입력하면 1을 빼서 출력합니다.

![img](/assets/images/sw/sdk/embedded_047.png)

## 버저

제어기의 버저를 사용할 수 있습니다.

### 준비물

CM-510 (CM-700은 버저가 없습니다.)

### 이론

마이크로 컨트롤러의 I/O 포트를 통해 버저 회로의 신호를 제어할 수 있습니다. 버저는 신호 주파수를 조절하여 서로 다른 음계를 연주할 수 있습니다.

예제에서는 제어기의 PORTB와 PORTC, PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

음계과 주파수의 관계는 다음을 참조하십시오.
시간은 주파수의 역수입니다. 주파수를 시간으로 변환하는 공식은 다음과 같습니다.

> 시간(초) =  1 / (주파수)

( 단위 : Hz )

| Octave<br>=====<br>Scale | 1       | 2        | 3        | 4        | 5        | 6        | 7        | 8        |
| ---------------- | ------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| C                | 32.7032 | 65.4064  | 130.8128 | 261.6256 | 523.2511 | 1046.502 | 2093.005 | 4186.009 |
| C#               | 34.6478 | 69.2957  | 138.5913 | 277.1826 | 554.3653 | 1108.731 | 2217.461 | 4434.922 |
| D                | 36.7081 | 73.4162  | 146.8324 | 293.6648 | 587.3295 | 1174.659 | 2349.318 | 4698.636 |
| D#               | 38.8909 | 77.7817  | 155.5635 | 311.1270 | 622.2540 | 1244.508 | 2489.016 | 4978.032 |
| E                | 41.2034 | 82.4069  | 164.8138 | 329.6276 | 659.2551 | 1318.510 | 2637.020 | 5274.041 |
| F                | 43.6535 | 87.3071  | 174.6141 | 349.2282 | 698.4565 | 1396.913 | 2793.826 | 5587.652 |
| F#               | 46.2493 | 92.4986  | 184.9972 | 369.9944 | 739.9888 | 1479.978 | 2959.955 | 5919.911 |
| G                | 48.9994 | 97.9989  | 195.9977 | 391.9954 | 783.9909 | 1567.982 | 3135.963 | 6271.927 |
| G#               | 51.9130 | 103.8262 | 207.6523 | 415.3047 | 830.6094 | 1661.219 | 3322.438 | 6644.875 |
| A                | 55.0000 | 110.0000 | 220.0000 | 440.0000 | 880.0000 | 1760.000 | 3520.000 | 7040.000 |
| A#               | 58.2705 | 116.5409 | 233.0819 | 466.1638 | 932.3275 | 1864.655 | 3729.310 | 7458.620 |
| G                | 61.7354 | 123.4708 | 246.9417 | 493.8833 | 987.7666 | 1975.533 | 3951.066 | 7902.133 |

### 소스

CM-510예제입니다. 버저가 없는 CM-700에서는 적용할 수 없습니다.
```
if(~PIND & SW_START)
{
PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
_delay_ms(1);
PORTB |= 0x20;
_delay_ms(1);
PORTB &= ~0x20;
}
else
{
PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
PORTB &= ~0x20;
}
```

PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTB와 PORTC를 제어하여 LED 및 버저를 켜고 끄는 부분입니다.
PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.
PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.
따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.
Start 버튼이 눌린 경우 모든 LED를 켬과 동시에 PORTB를 통해 버저를 울립니다.

### 결과

Start 버튼을 누르는 동안 모든 LED가 켜지고 버저에서 같은 음으로 계속 소리가 납니다.

## 마이크

제어기의 마이크를 사용하여 외부 소리를 감지할 수 있습니다.

### 준비물

CM-510 (CM-700은 마이크가 없습니다.)

### 이론

마이크 회로는 일정 크기 이상의 소리를 감지하면 마이크로 컨트롤러의 I/O포트에 신호를 발생하게 됩니다. 이 신호를 감지하여 외부 소리를 감지할 수 있습니다.

예제에서는 제어기의 PORTC와 PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

### 소스

CM-510예제입니다.  **마이크가 없는 CM-700에서는 적용할 수 없습니다.**
```
if(~PIND & MIC_SIGNAL)
{
PORTC = ~(LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY);
_delay_ms(1000);
}
else PORTC = LED_BAT|LED_TxD|LED_RxD|LED_AUX|LED_MANAGE|LED_PROGRAM|LED_PLAY;
```
PORTD를 통해 눌린 버튼을 판단하고, 눌린 버튼에 따라 PORTC를 제어하여 LED를 켜고 끄는 부분입니다.
PORTD를 통해 입력값을 얻는 방법은 PIND 매크로 함수를 사용합니다.
PIND는 1바이트이며, 각 비트에는 PORTD의 핀이 대응되어 있습니다.
따라서 &연산 등을 통해 특정 핀의 값을 읽어낼 수 있습니다.
PORTD를 통해 마이크 신호가 감지되면 모든 LED를  켜고, 1초동안 대기합니다.

### 결과

마이크에 소리가 감지되면, 1초 동안 모든 LED가 켜졌다 꺼집니다.

## 적외선 센서

외부포트의 ADC를 사용하는 법을 배웁니다.
(본 예제에서는 적외선 센서를 사용하여 설명합니다.)

### 준비물

CM-510 혹은 700, [적외선 센서] (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

### 이론

제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 적외선 센서나 자이로 센서 등의 아날로그 전압값을 읽어올 수 있습니다.

예제에서는 제어기의 PORTA를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
serial_initialize(57600);
sei();
ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1); // ADC Enable, Clock 1/64div.
ADMUX = ADC_PORT_1; // ADC Port 1 Select
```

시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.
sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.
그외 ADC제어를 위한 레지스터 설정이 있는데, 이는 Atmega2561 데이터 시트를 참조하십시오.
데이터시트는 [http://www.atmel.com](http://www.atmel.com/) 에서 다운로드 받을 수 있습니다.

![img](/assets/images/sw/sdk/embedded_048.png)
```
PORTA &= ~0x80; // ADC Port 1 IR ON

_delay_us(12); // Short Delay for rising sensor signal
ADCSRA |= (1 << ADIF); // AD-Conversion Interrupt Flag Clear
ADCSRA |= (1 << ADSC); // AD-Conversion Start

while( !(ADCSRA & (1 << ADIF)) ); // Wait until AD-Conversion complete

PORTA = 0xFC; // IR-LED Off

printf( "%d\r\n", ADC); // Print Value on USART
_delay_ms(50);
```

PORTA를 통해 감지된 아날로그 신호를 분석하여 시리얼로 전송하는 부분입니다.
우선 PORTA의 1번 IR LED를 켜고, 수광된 빛의 양을 디지털값으로 변환을 시작합니다.
변환이 끝나면, IR LED를 끄고, 시리얼 통신으로 값을 전송합니다.

### 결과

PC와 시리얼로 연결 되어있을 때, 화면에 IR센서값을 출력합니다.

## 다이나믹셀 읽기/쓰기

다이나믹셀의 위치를 읽거나 설정할 수 있습니다.
 (보다 자세한 사항은 Dynamixel SDK를 확인 하세요)

### 준비물

제어기와 다이나믹셀이 연결된 상태
이 예제는 다이나믹셀 ID가 1일 때 동작합니다.

### 이론

다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

### 소스
```
unsigned short GoalPos[2] = {0, 1023};
//unsigned short wGoalPos[2] = {0, 4095}; // for EX series
```
EX 106+과 같이 위치 범위가 0~4095인 액츄에이터는 위쪽 줄을 주석처리 하고, 아래 줄을 주석 해제하여 주십시오.
```
serial_initialize(57600);
dxl_initialize( 0, DEFAULT_BAUDNUM ); // Not using device index
sei(); // Interrupt Enable
```
시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.
sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.
[dxl_initialize()] 함수의 경우 인자로 device index와 통신 속도를 넘겨주면, 제어기의 통신 환경을 초기화합니다.
DEFAULT_BAUDNUM은 1입니다.
특별한 경우가 아니면 device index는 0입니다.
```
// Check moving done
bMoving = dxl_read_byte( id, P_MOVING );
CommStatus = dxl_get_result();
if( CommStatus == COMM_RXSUCCESS )
{
if( bMoving == 0 )
{
// Change goal position
if( index == 0 )
index = 1;
else
index = 0;
// Write goal position
dxl_write_word( id, P_GOAL_POSITION_L, GoalPos[index] );
}
PrintErrorCode();

// Read present position
wPresentPos = dxl_read_word( id, P_PRESENT_POSITION_L );
printf( "%d   %d\n",GoalPos[index], wPresentPos );
}
else
PrintCommStatus(CommStatus);
```
다이나믹셀을 특정 위치로 보냄과 동시에 현재 위치를 읽어오는 부분입니다.
먼저, 현재 움직임 상태를 읽고 모터가 움직이지 않는 상태이면 [dxl_write_word()]함수를 통해 설정된 위치로 이동 명령을 내립니다.
[dxl_write_word()]함수의 인자는 각각 (연결된 다이나믹셀 id, address, position 값) 입니다.
이후, 현재 위치를 읽어와 시리얼 통신으로 전송합니다.

### 결과

다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

## 다이나믹셀 동기 제어

여러개의 다이나믹셀을 동기화하여 제어할 수 있습니다.
 (보다 자세한 사항은 [Dynamixel SDK]를 확인 하세요)

### 준비물

제어기와 다이나믹셀이 연결된 상태
이 예제는 다이나믹셀 ID가 1부터 순차적으로 3까지 설정되어 있을 때 동작합니다.

### 이론

다이믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

### 소스
```
int AmpPos = 512;
//int AmpPos = 2048; // for EX series
```
EX 106+와 같이 위치 범위가 0~4095인 액츄에이터는 위쪽 줄을 주석처리 하고, 아래 줄을 주석 해제하여 주십시오.
```
serial_initialize(57600);
dxl_initialize( 0, DEFAULT_BAUDNUM ); // Not using device index
sei(); // Interrupt Enable
```
시리얼 통신을 사용하기 위해 초기화 하는 부분입니다. 시리얼 초기화 함수는 serial 라이브러리에 포함되어 있으며, 인자로 통신 속도를 전달 해 주면, 시리얼 포트가 초기화 됩니다.
sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.
dxl_initialize() 함수의 경우 인자로 device index와 통신 속도를 넘겨주면, 제어기의 통신 환경을 초기화합니다.
DEFAULT_BAUDNUM은 1입니다.
특별한 경우가 아니면 device index는 0입니다.
```
for( i=0; i<NUM_ACTUATOR; i++ )
{
id[i] = i+1;
phase[i] = 2*PI * (float)i / (float)NUM_ACTUATOR;
}
// Set goal speed
dxl_write_word( BROADCAST_ID, P_GOAL_SPEED_L, 0 );
// Set goal position
dxl_write_word( BROADCAST_ID, P_GOAL_POSITION_L, AmpPos );
_delay_ms(1000);
```
각 다이나믹셀의 초기 위치를 계산 및 위치 초기화하는 부분입니다.
dxl_write_word()함수를 이용해 모든 다이나믹셀의 속도를 최대속도로 설정하고, 위치를 중앙 위치로 설정합니다.
```
// Make syncwrite packet
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
```
패킷 생성 부분입니다. 패킷의 구조는 [다이나믹셀 패킷 구조]를 참조하십시오.
연결된 모든 액츄에이터의 패킷을 생성하고 전송합니다.
```
printf( "\n" );

dxl_txrx_packet();
CommStatus = dxl_get_result();
if( CommStatus == COMM_RXSUCCESS )
PrintErrorCode();
else
PrintCommStatus(CommStatus);

theta += STEP_THETA;
if( theta > 2*PI )
theta -= 2*PI;
_delay_ms(CONTROL_PERIOD);
```
결과 패킷 수신 후 에러가 있다면 에러 코드를 출력합니다.
위치 경계값 계산하여, 경계값을 초과하면 증감 방향을 반대로 전환합니다.

### 결과

여러개의 다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

## RC100과 Zigbee

RC-100을 이용하여 제어기를 동작시킬 수 있습니다.

 (보다 자세한 사항은 [Zigbee SDK]를 확인 하세요)

### 준비물

CM-510 혹은 700

[Zig-100/110] 1쌍
[RC-100]

### 이론

Zig100이 장착되어있는 RC100 리모컨으로 제어기를 제어할 수 있습니다.

예제에서는 제어기의 PORTC와 PORTD를 사용합니다. [제어기 포트맵]을 확인하시기 바랍니다.

### 소스

![img](/assets/images/sw/sdk/embedded_049.png)

ZigBee 사용을 위한 환경 설정. PORTD의 환경을 다음과 같이 설정해야 함.
```
PORTD &= ~0x80; //PORT_LINK_PLUGIN = 0;   // no pull up
PORTD &= ~0x20; //PORT_ENABLE_RXD_LINK_PC = 0;
PORTD |= 0x40; //PORT_ENABLE_RXD_LINK_ZIGBEE = 1;
```

ZigBee 통신을 사용하기 위해 초기화 하는 부분입니다. 초기화 함수는 Zigbee 라이브러리에 포함되어 있으며, 인자로 device index를 전달하면 Zigbee가 초기화 됩니다. 특별한 경우가 아니면, device index는 0입니다.

sei()경우 인터럽트를 사용할 수 있도록 하는 내부 명령어입니다.
```
if(zgb_rx_check() == 1)
{
RcvData = zgb_rx_data();
if(RcvData & RC100_BTN_1)
PORTC &= ~LED_MANAGE;
else
PORTC |= LED_MANAGE;
if(RcvData & RC100_BTN_2)
PORTC &= ~LED_PROGRAM;
else
PORTC |= LED_PROGRAM;
if(RcvData & RC100_BTN_3)
PORTC &= ~LED_PLAY;
else
PORTC |= LED_PLAY;
}
```

[zgb_rx_data()]함수를 이용하여 Zigbee모듈에 수신된 데이터를 읽어옵니다.

수신 패킷이 RC100버튼이면, RC100의 눌린 버튼에 따라 PORTC를 제어하여 제어기의 LED를 켜거나 끕니다.

`caption` ZigBee와 시리얼통신 라이브러리를 같은 소스에서 사용하면 UART공유로 인해 충돌이 일어납니다. 만약, 동시 사용을 원한다면 소스를 수정해야 합니다.{:. caption}

### 결과

Zigbee가 정상적으로 연결된 경우, RC-100의 버튼을 누를 때 마다 제어기의 LED가 켜졌다 꺼집니다.

[제어기 포트맵]: ??
[적외선 센서]: ??
[dxl_initialize()]: ??
[dxl_write_word()]: ??
[Dynamixel SDK]: ??
[다이나믹셀 패킷 구조]: ??
[zgb_rx_data()]: ??
