# 예제

## LED 제어

제어기의 각 LED를 제어할 수 있습니다.

### 준비물

CM-530

### 이론

제어기의 마이크로 컨트롤러는 I/O포트를 통해 제어기와 연결된 LED등의 주변 장치를 제어할 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 LED를 제어해 볼 수 있습니다.

포트번호와 핀번호는 "01 LED\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* Configure the GPIO ports */
  GPIO_Configuration();
  SysTick_Configuration();

  while(1)
  {
    GPIO_SetBits(PORT_LED_POWER, PIN_LED_POWER);
    GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    mDelay(250);
    GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
    mDelay(250);
    GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
    GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    mDelay(250);
    GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
    mDelay(250);
    GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
    GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
    mDelay(250);
    GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
    GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
    mDelay(250);
    GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
    GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);
    mDelay(250);
  }
  return 0;
}
```
### 결과

제어기의 모든 LED가 순차적으로 점등됩니다.

## 버튼

제어기 버튼 입력을 받을 수 있습니다.

### 준비물

CM-530

### 이론

제어기의 마이크로 컨트롤러의 I/O포트를 통해 제어기와 연결된 장치의 전기적 신호를 읽을 수 있습니다. 이 예제를 통해 제어기에 장착되어 있는 스위치의 눌림 상태를 확인할 수 있습니다.

포트번호와 핀번호는 "02 BUTTON\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  GPIO_Configuration();
  /* Configure the GPIO ports */
  NVIC_Configuration();
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    if( GPIO_ReadInputDataBit(PORT_SW_UP, PIN_SW_UP) != SET )
    GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    else if( GPIO_ReadInputDataBit(PORT_SW_DOWN, PIN_SW_DOWN) != SET )
    GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
    else if( GPIO_ReadInputDataBit(PORT_SW_LEFT, PIN_SW_LEFT) != SET )
    GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
    else if( GPIO_ReadInputDataBit(PORT_SW_RIGHT, PIN_SW_RIGHT) != SET )
    GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    else if( GPIO_ReadInputDataBit(PORT_SW_START, PIN_SW_START) != SET )
    {
    GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
    GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
    GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
    GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
    }
    else
    {
    GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
    GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
    GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
    GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
    }
  }
  return 0;
}
```

### 결과

버튼을 누르면, 눌린 버튼에 따라 서로 다른 LED가 켜집니다.

## 시리얼 통신

PC와 제어기가 시리얼 통신을 할 수 있습니다.

### 준비물

CM-530과 PC가 USB케이블을 통해 연결된 상태.
예제의 통신 속도는 57600bps로 설정되어 있습니다.

### 이론

시리얼 통신은 제어기의 값을 PC로 전송하여 사용자에게 보여줄 수 있는 가장 기본적인 수단입니다. 이 예제를 통해 제어기와 시리얼 통신을 해볼 수 있습니다.

제어기와 PC사이의 시리얼 통신은 USART3채널을 통해 이루어집니다.

포트번호와 핀번호는 "03 SERIAL COMMUNICATION\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* Configure the GPIO ports */
  GPIO_Configuration();
  SysTick_Configuration();
  /* USART Configuration */
  USART_Configuration(57600);
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    ReceivedData = RxDByte_PC();
    if(ReceivedData == 'w')
    TxDString("Welcome!\r\n");
    else if(ReceivedData == 'g')
    TxDString("Goodbye!\r\n");
  }
  return 0;
}
```

### 결과

PC에서 'w' 버튼을 누르면 "Welcome!", 'g'버튼을 누르면 "Goodbye!"가 출력됩니다.
![img](/assets/images/sw/sdk/embedded_084.png)

## 버저

제어기의 버저를 사용할 수 있습니다.

### 준비물

CM-530

### 이론

마이크로 컨트롤러의 I/O 포트를 통해 버저 회로의 신호를 제어할 수 있습니다. 버저는 신호 주파수를 조절하여 서로 다른 음계를 연주할 수 있습니다.

포트번호와 핀번호는 "04 BUZZER\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

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
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* NVIC configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    if( GPIO_ReadInputDataBit(PORT_SW_UP, PIN_SW_UP) != SET )
    {
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
      GPIO_ResetBits(PORT_BUZZER, PIN_BUZZER);
      mDelay(1);
      GPIO_SetBits(PORT_BUZZER, PIN_BUZZER);
      mDelay(1);
    }
    else
    {
      GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
      GPIO_SetBits(PORT_BUZZER, PIN_BUZZER);
    }
  }
  return 0;
}
```

### 결과

Start 버튼을 누르는 동안 전원LED를 제외한 여섯 LED가 켜지고 버저에서 같은 음으로 소리가 납니다.

## 마이크

제어기의 마이크를 사용하여 외부 소리를 감지할 수 있습니다.

### 준비물

CM-530

### 이론

마이크 회로는 일정 크기 이상의 소리를 감지하면 마이크로 컨트롤러의 I/O포트에 신호를 발생하게 됩니다. 이 신호를 감지하여 외부 소리를 감지할 수 있습니다.

포트번호와 핀번호는 "05 MIC\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* NVIC configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    if( GPIO_ReadInputDataBit(PORT_MIC, PIN_MIC) != SET)
    {
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_ResetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_ResetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_ResetBits(PORT_LED_AUX, PIN_LED_AUX);
      mDelay(1000);
    }
    else
    {
      GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      GPIO_SetBits(PORT_LED_TX, PIN_LED_TX);
      GPIO_SetBits(PORT_LED_RX, PIN_LED_RX);
      GPIO_SetBits(PORT_LED_AUX, PIN_LED_AUX);
    }
  }
  return 0;
}
```

### 결과

마이크에 소리가 감지되면, 전원LED를 제외한 여섯 LED가 1초간 켜졌다 꺼집니다.

## 올로 서보모터 (회전방향제어)

올로 서보모터의 회전방향을 제어하는 방법을 배웁니다.

### 준비물

CM-530
올로 서보모터 (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

### 이론

제어기는 마이크로 컨트롤러의 SIG_MOT1+와 SIG+MOT1- 핀을 통해 1번 외부포트의 MOT1+ 와 MOT1-핀의 값을 제어함으로써 올로 서보모터의 회전방향을 제어합니다.

![img](/assets/images/sw/sdk/embedded_085.png)
![img](/assets/images/sw/sdk/embedded_086.png)

포트번호와 핀번호는 "06 OLLO MOTOR ROTATE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* GPIO configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
  GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    GPIO_SetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    mDelay(5000);
    GPIO_SetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    mDelay(5000);
    GPIO_SetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
    GPIO_SetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
    mDelay(2000);
  }

  return 0;
}
```
### 결과

1번 외부포트에 연결된 올로 서보모터는 역시침 방향으로 5초간 회전하고 순시침 방향으로 5초간 회전 한 후 2초간 정지하는 운동을 반복합니다.

## 올로 서보모터 (위치값 읽기)

올로 서보모터 혼(horn) 위치값을 읽는 방법을 배웁니다.

### 준비물

CM-530
올로 서보모터

### 이론

제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 올로 서보모터 혼 위치를 나타내는 아날로그 전압값을 AD 변환할 수 있습니다.

포트번호와 핀번호는 "06 OLLO MOTOR ROTATE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

![img](/assets/images/sw/sdk/embedded_087.png)
![img](/assets/images/sw/sdk/embedded_088.png)

ANALOG MUX (74HC4052D) 를 이용한 이유는 외부 임피던스를 차단 하고, 5V -> 3.3V로 레벨 변환을 하기 위해서입니다.

위의 ADC MUX회로에서 ADC_SELECT0, ADC_SELECT1 두 신호값 조합에 의해 SIG_ADC0은 ADC1, ADC2, ADC3 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 SIG_ADC1은 ADC4, ADC5, ADC6 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 마이크로 컨트롤러는 이 아날로그값을 AD변환합니다.

포트번호와 핀번호는 "07 OLLO MOTOR POSITION\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* GPIO configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  /* ADC configuration */
  ADC_Configuration();
  GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
  GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
  GPIO_ResetBits(PORT_SIG_MOT2P,PIN_SIG_MOT2P);
  GPIO_ResetBits(PORT_SIG_MOT2M,PIN_SIG_MOT2M);
  GPIO_ResetBits(PORT_SIG_MOT3P,PIN_SIG_MOT3P);
  GPIO_ResetBits(PORT_SIG_MOT3M,PIN_SIG_MOT3M);
  GPIO_ResetBits(PORT_SIG_MOT4P,PIN_SIG_MOT4P);
  GPIO_ResetBits(PORT_SIG_MOT4M,PIN_SIG_MOT4M);
  GPIO_ResetBits(PORT_SIG_MOT5P,PIN_SIG_MOT5P);
  GPIO_ResetBits(PORT_SIG_MOT5M,PIN_SIG_MOT5M);
  GPIO_ResetBits(PORT_SIG_MOT6P,PIN_SIG_MOT6P);
  GPIO_ResetBits(PORT_SIG_MOT6M,PIN_SIG_MOT6M);
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
    GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
    mDelay(10);
    /* Start ADC1,ADC2 Software Conversion */
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    ADC_SoftwareStartConvCmd(ADC2, ENABLE);
    mDelay(10);
    POT_1 = (ADC_GetConversionValue(ADC1))>>2;
    POT_4 = (ADC_GetConversionValue(ADC2))>>2;
    GPIO_SetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
    GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
    mDelay(10);
    /* Start ADC1,ADC2 Software Conversion */
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    ADC_SoftwareStartConvCmd(ADC2, ENABLE);
    mDelay(10);
    POT_2 = (ADC_GetConversionValue(ADC1))>>2;
    POT_5 = (ADC_GetConversionValue(ADC2))>>2;
    GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
    GPIO_SetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
    mDelay(10);
    /* Start ADC1,ADC2 Software Conversion */
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    ADC_SoftwareStartConvCmd(ADC2, ENABLE);
    mDelay(10);
    POT_3 = (ADC_GetConversionValue(ADC1))>>2;
    POT_6 = (ADC_GetConversionValue(ADC2))>>2;
    TxDWord16(POT_1);
    TxDByte_PC(' ');
    TxDWord16(POT_2);
    TxDByte_PC(' ');
    TxDWord16(POT_3);
    TxDByte_PC(' ');
    TxDWord16(POT_4);
    TxDByte_PC(' ');
    TxDWord16(POT_5);
    TxDByte_PC(' ');
    TxDWord16(POT_6);
    TxDByte_PC(' ');
    TxDByte_PC('\r');
    TxDByte_PC('\n');
  }
  return 0;
}
```
### 결과

임의의 외부포트에 올로 서보모터를 연결하면 출력되는 화면을 통해 서보모터 혼의 위치값을 알 수 있습니다. 출력값 범위는 0~0x03FF 입니다.

아래 그림은 3번 외부포트에 올로 서보모터를 연결했을 때 출력화면입니다.
![img](/assets/images/sw/sdk/embedded_089.png)

## 적외선 센서

적외선 센서를 사용하는 방법을 배웁니다.

### 준비물

CM-530과 PC를 USB케이블을 통해 연결합니다.

[적외선 센서] (1번 외부포트에 연결해야 예제를 동작시킬 수 있습니다.)

### 이론

제어기의 마이크로 컨트롤러는 아날로그 신호를 디지털값으로 변경할 수 있습니다. 이 예제를 통해 제어기 외부에 연결된 적외선 센서의 아날로그 전압값을 AD 변환할 수 있습니다.

![img](/assets/images/sw/sdk/embedded_087.png)
![img](/assets/images/sw/sdk/embedded_088.png)

ANALOG MUX (74HC4052D) 를 이용한 이유는 외부 임피던스를 차단 하고, 5V -> 3.3V로 레벨 변환을 하기 위해서입니다.

위의 ADC MUX회로에서 ADC_SELECT0, ADC_SELECT1 두 신호값 조합에 의해 SIG_ADC0은 ADC1, ADC2, ADC3 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 SIG_ADC1은 ADC4, ADC5, ADC6 중에서 하나를 선택하여 마이크로 컨트롤러에 입력하고 마이크로 컨트롤러는 이 아날로그랎을 AD변환합니다.

포트번호와 핀번호는 "08 IR SENSOR\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* GPIO configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  /* ADC configuration */
  ADC_Configuration();
  GPIO_ResetBits(PORT_SIG_MOT1P,PIN_SIG_MOT1P);
  GPIO_ResetBits(PORT_SIG_MOT1M,PIN_SIG_MOT1M);
  //GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    GPIO_SetBits(PORT_SIG_MOT1P, PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M, PIN_SIG_MOT1M);
    GPIO_ResetBits(PORT_ADC_SELECT0,PIN_ADC_SELECT0);
    GPIO_ResetBits(PORT_ADC_SELECT1,PIN_ADC_SELECT1);
    uDelay(30);
    /* Start ADC1,ADC2 Software Conversion */
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    //ADC_SoftwareStartConvCmd(ADC2, ENABLE);
    uDelay(5);
    IR_1 = (ADC_GetConversionValue(ADC1));
    GPIO_ResetBits(PORT_SIG_MOT1P, PIN_SIG_MOT1P);
    GPIO_ResetBits(PORT_SIG_MOT1M, PIN_SIG_MOT1M);
    TxDWord16(IR_1);
    TxDByte_PC('\r');
    TxDByte_PC('\n');
    mDelay(5);
  }
  return 0;
}
```

### 결과

1번 외부포트에 적외선 센서를 연결하면 화면에 적외선 센서값을 출력합니다.
다이나믹셀의 위치를 읽거나 설정할 수 있습니다.
 (보다 자세한 사항은 [Dynamixel SDK]를 확인 하세요)

### 준비물

CM-530
이 예제는 다이나믹셀 ID가 1일 때 동작합니다.

### 이론

다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

마이크로 컨트롤러와 다이나믹셀의 통신은 USART1 채널을 통해 이루어집니다
![img](/assets/images/sw/sdk/embedded_090.png)

위의 그림은 다이나믹셀과의 통신을 위한 HALF DUPLEX BUFFER 회로 입니다.
포트번호와 핀번호는 "09 DXL READ_WRITE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* GPIO configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  Timer_Configuration();
  dxl_initialize( 0, 1 );
  USART_Configuration(USART_PC, Baudrate_PC);

  while(1)
  {
    bMoving = dxl_read_byte( id, P_MOVING );
    CommStatus = dxl_get_result();
    if( CommStatus == COMM_RXSUCCESS )
    {
    if( bMoving == 0 )
    {
      // Change goal position
      if( INDEX == 0 )
      INDEX = 1;
      else
      INDEX = 0;
      // Write goal position
      dxl_write_word( id, P_GOAL_POSITION_L, GoalPos[INDEX] );
      }
      PrintErrorCode();
      // Read present position
      wPresentPos = dxl_read_word( id, P_PRESENT_POSITION_L );
      TxDWord16(GoalPos[INDEX]);
      TxDString("   ");
      TxDWord16(wPresentPos);
      TxDByte_PC('\r');
      TxDByte_PC('\n');
    }
    else
      PrintCommStatus(CommStatus);
  }
  return 0;
}
```
### 결과

다이나믹셀이 지정된 위치를 왕복하며, 제어기와 PC가 연결 되였을 때 다이나믹셀의 현재 위치를 터미널을 통해 출력합니다.

## 다이나믹셀 동기 제어

여러개의 다이나믹셀을 동기화하여 제어할 수 있습니다.
(보다 자세한 사항은 [Dynamixel SDK]를 확인 하세요)

### 준비물

CM-530과 다이나믹셀이 연결된 상태
이 예제는 다이나믹셀 ID가 1부터 순차적으로 3까지 설정되어 있을 때 동작합니다.

### 이론

다이나믹셀은 정해진 패킷을 전송하여 제어할 수 있습니다. 제공되는 라이브러리를 활용하여 다이나믹셀의 위치 제어를 할 수 있습니다.

마이크로 컨트롤러와 다이나믹셀의 통신은 USART1 채널을 통해 이루어집니다.
![img](/assets/images/sw/sdk/embedded_090.png)

위의 그림은 다이나믹셀과의 통신을 위한 HALF DUPLEX BUFFER 회로 입니다.
포트번호와 핀번호는 "10 DXL SYNC WRITE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* GPIO configuration */
  GPIO_Configuration();
  SysTick_Configuration();
  Timer_Configuration();
  dxl_initialize( 0, 1 );
  USART_Configuration(USART_PC, Baudrate_PC);
  for( i=0; i<NUM_ACTUATOR; i++ )
  {
    id[i] = i+1;
  }
  // Set goal speed
  dxl_write_word( BROADCAST_ID, P_GOAL_SPEED_L, 0 );
  // Set goal position
  dxl_write_word( BROADCAST_ID, P_GOAL_POSITION_L, AmpPos );
  mDelay(1000);

  while(1)
  {
    // Make syncwrite packet
    dxl_set_txpacket_id(BROADCAST_ID);
    dxl_set_txpacket_instruction(INST_SYNC_WRITE);
    dxl_set_txpacket_parameter(0, P_GOAL_POSITION_L);
    dxl_set_txpacket_parameter(1, 2);
    for( i=0; i<NUM_ACTUATOR; i++ )
    {
      dxl_set_txpacket_parameter(2+3*i, id[i]);
      dxl_set_txpacket_parameter(2+3*i+1, dxl_get_lowbyte(GoalPos));
      dxl_set_txpacket_parameter(2+3*i+2, dxl_get_highbyte(GoalPos));
      TxDByte_PC('\r');
      TxDByte_PC('\n');
      TxDWord16(GoalPos);
    }
    dxl_set_txpacket_length((2+1)*NUM_ACTUATOR+4);
    dxl_txrx_packet();
    CommStatus = dxl_get_result();
    if( CommStatus == COMM_RXSUCCESS )
      PrintErrorCode();
    else
      PrintCommStatus(CommStatus);
      GoalPos += 100;
    if( GoalPos > MAX_POSITION )
      GoalPos -= MAX_POSITION;
    mDelay(CONTROL_PERIOD);
  }
  return 0;
}
```

### 결과

여러개의 다이나믹셀이 지정된 위치를 왕복하며, 현재 위치를 터미널을 통해 출력합니다.

## RC100과 Zigbee

RC-100을 이용하여 제어기를 동작시킬 수 있습니다.
(보다 자세한 사항은 [Zigbee SDK] 를 확인 하세요)

### 준비물

CM-530
[Zig-100/110] 1쌍
[RC-100]

### 이론

Zig100이 장착되어있는 RC100 리모컨으로 제어기를 제어할 수 있습니다.
마이크로 컨트롤러와 RC100의 통신은 UART5 채널을 통해 이루어집니다.
![img](/assets/images/sw/sdk/embedded_091.png)

위 그림은 Zigbee 커넥터와 Zigbee의 전원공급회로입니다.

포트번호와 핀번호는 "11 RC100 ZIGBEE\APP\src\main.c" 또는 [제어기 포트맵]을 확인하시기 바랍니다.

### 소스
```
int main(void)
{
  /* System Clocks Configuration */
  RCC_Configuration();
  /* NVIC configuration */
  NVIC_Configuration();
  /* Configure the GPIO ports */
  GPIO_Configuration();
  SysTick_Configuration();
  zgb_initialize(0);
  USART_Configuration(USART_PC, 57600);
  GPIO_ResetBits(PORT_LED_POWER, PIN_LED_POWER);

  while(1)
  {
    if(zgb_rx_check() == 1)
    {
      RcvData = zgb_rx_data();
      TxDWord16(RcvData);
      TxDByte_PC('\r');
      TxDByte_PC('\n');
      if(RcvData & RC100_BTN_1)
      GPIO_ResetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
    else
      GPIO_SetBits(PORT_LED_MANAGE, PIN_LED_MANAGE);
      if(RcvData & RC100_BTN_2)
      GPIO_ResetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      else
      GPIO_SetBits(PORT_LED_PROGRAM, PIN_LED_PROGRAM);
      if(RcvData & RC100_BTN_3)
        GPIO_ResetBits(PORT_LED_PLAY, PIN_LED_PLAY);
      else
        GPIO_SetBits(PORT_LED_PLAY, PIN_LED_PLAY);
    }
  }
  return 0;
}
```
### 결과

Zigbee가 정상적으로 연결된 경우, RC-100의 버튼을 누를 때 마다 제어기의 LED가 켜졌다 꺼집니다.

[제어기 포트맵]: ??
[적외선 센서]: ??
[Dynamixel SDK]: ??
[Zigbee SDK]: ??
[Zig-100/110]: ??
[RC-100]: ??
