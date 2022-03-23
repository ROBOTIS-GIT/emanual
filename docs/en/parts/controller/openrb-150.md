---
layout: archive
lang: en
ref: openrb-150
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/openrb-150/
sidebar:
  title: OpenRB-150
  nav: "openrb-150"
---


# [Overview](#overview)

![](/assets/images/parts/controller/openrb-150/openrb-150_product.png)

> OpenRB-150

OpenRB-150은 아두이노 MKR 시리즈와 호환성을 높인 새로운 오픈소스 제어기입니다.  
편리한 아두이노 개발 환경(Arduino IDE)을 기본적으로 지원하며, 다이나믹셀의 편리한 설정과 유지관리를 위한 다이나믹셀 위자드 2.0을 지원합니다.  
아두이노 MKR 폼팩터에 맞춘 크기와 기능으로 여러 종류의 아두이노 MKR 쉴드를 통해 다양한 기능을 확장할 수 있습니다.

**참고** : 다이나믹셀 위자드 2.0을 사용하기 위해서는 OpenRB-150 보드매니저에서 제공하는 기본 펌웨어를 사용해야 합니다.
{: .notice}

The OpenRB-150 is a new open source controller that is highly compatible to the Arduino MKR products.  
This controller supports the Arduino IDE for handy project development, and provides access to the DYNAMIXEL Wizard 2.0 for configuring and maintaining DYNAMIXEL.  
The OpenRB-150 has an identical form factor to the Arduino MKR series which allows mounting various Arduino MKR Shields to utilize various features.

**NOTE** : A dedicated firmware in the OpenRB-150 board manager is required in order to use the DYNAMIXEL Wizard 2.0 with OpenRB-150.
{: .notice}

# [Tech Specs](#tech-specs)

| Item                        | Specification                                               |
|:----------------------------|:------------------------------------------------------------|
| MICROCONTROLLER             | SAMD21 Cortex-M0+ 32bit low power ARM® MCU                  |
| BOARD POWER SUPPLY          | (USB 3.0) 5 V<br />(VIN -or Terminal) 3.7 ~ 12.6 V          |
| SUPPORTED BATTERY(*)        | Li-Po 1 - 3 cell (3.7 - 11.1 V)<br />XT60 connector ready   |
| DC CURRENT FOR 3.3V PIN     | 1,200 mA                                                    |
| DC CURRENT FOR 5V PIN       | 300 mA                                                      |
| CIRCUIT OPERATING VOLTAGE   | 3.3 V                                                       |
| DIGITAL I/O PINS            | 24                                                          |
| PWM PINS                    | 12 (0, 1, 2, 3, 4, 5, 6, 7, 8, 10, A3 - or 18 -, A4 -or 19) |
| UART                        | 2                                                           |
| SPI                         | 1                                                           |
| I2C                         | 1                                                           |
| ANALOG INPUT PINS           | 7 (ADC 8/10/12 bit)                                         |
| ANALOG OUTPUT PINS          | 1 (DAC 10 bit)                                              |
| EXTERNAL INTERRUPTS         | 10 (0, 1, 4, 5, 6, 7, 8, A1 -or 16-, A2 - or 17)            |
| DC CURRENT PER I/O PIN      | 7 mA                                                        |
| FLASH MEMORY                | 256 KB                                                      |
| FLASH MEMORY FOR BOOTLOADER | 8 KB                                                        |
| SRAM                        | 32 KB                                                       |
| EEPROM                      | no                                                          |
| CLOCK SPEED                 | 32.768 kHz (RTC), 48 MHz                                    |
| LED_BUILTIN                 | 3                                                           |
| DYNAMIXEL TTL Port          | 4 (Max 3 Mbps)                                              |
| Board Dimensions            | 25 x 66 mm                                                  |

{% capture openrb-150_caution_01 %}
**WARNING**
- When using the USB power to operate DYNAMIXEL with 5V operating voltage, be aware not to draw more current than the USB port can supply.
- For a excessive movement or a high torque required application, please do not use the USB, but do use the terminal block as a power source.
- Drawing too much power from the USB port may damage the mainboard of the PC.
- Check the operating voltage of the DYNAMIXEL before connecting to the controller.
{% endcapture %}

<div class="notice--danger">{{ openrb-150_caution_01 | markdownify }}</div>

# [Hardware Layout](#hardware-layout)

## [Pinout](#pinout)

![](/assets/images/parts/controller/openrb-150/openrb-150_pinout.png)

## [Reset Button](#reset-button)
The Reset Button engages a hard reset of the microcontroller.  
Double clicking the Reset Button will reset the controller and enter the bootloader mode.  

In the bootloader mode, the firmware will not run.

**WARNING**  
Resetting the controller will turn off the [power switch of the DYNAMIXEL Port](#dynamixel-power-switch).  
Be aware of any possible damages that can be caused by turning off the DYNAMIXEL.
{: .notice--danger}

## [DYNAMIXEL Power Switch](#dynamixel-power-switch)
The power supply to DYNAMIXEL ports are controlled with the FET in the bottom of the controller.  
The FET works as a switch to control the power supplied to the DYNAMIXEL port.
The microcontroller turns on or off the FET, and by default, the FET is turned on when powered.

When the FET is turned on, the `DYNAMIXEL LED` will also be turned on to indicate the power status of the DYNAMIXEL Port.

![](/assets/images/parts/controller/openrb-150/openrb-150_switch.png)

## [Terminal VIN](#terminal-vin)
The terminal block provides wide range of power supply to the controller and DYNAMIXEL.  
It is recommended to use the Terminal VIN when operating DYNAMIXEL to gaurantee a sufficient power supply.  

The highest voltage among the USB(`VBUS` in the schematic), VIN(`Arduino_VIN` in the schematic), and Terminal VIN(`VIN` in the schematic) is selected as DYNAMIXEL power.  
The USB and VIN inputs are protected from the reverse voltage, but the Terminal VIN is **NOT** protected.  
Therefore, do not connect lower than 5V source such as 1 cell Li-Po battery to the `Terminal VIN` when the USB or VIN is connected to other power source.

![](/assets/images/parts/controller/openrb-150/openrb-150_power_inputs.png)

**CAUTION**  
Do not charge the battery when connected to the controller.
{: .notice--warning}

## [DYNAMIXEL Ports](#dynamixel-ports)
4 DYNAMIXEL Ports are ready for any TTL supported DYNAMIXEL.  
RS-485 supported DYNAMIXEL can also be used when connected with the [DYNAMIXEL Communication Bridge].

![](/assets/images/parts/interface/dxl_bridge/dxl_bridge_product_front.png)
> DYNAMIXEL Communication Bridge

{% include en/dxl/pinout_warning.md %}

## [Serial Port](#serial-port)
The Serial Port assigned to `Serial2` can be used to connect various devices for debugging the code or controlling the controller.

![](/assets/images/parts/controller/openrb-150/openrb-150_serial_port.png)

## [LEDs](#leds)
Three LED indicates the status of the OpenRB-150 controller.

- `Power LED` (Green) : This LED is turned on whenever the OpenRB-150 is powered.
- `USER LED` (Orange) : This LED can be controlled by user via Pin `32` or `LED_BUILTIN` in the Arduino sketch code.
- `DYNAMIXEL LED` (Red) : This LED will be turned on when the DYNAMIXEL port is powered on.

## [Pin Name Definitions](#pin-name-definitions)

```c++
// Battery
#define ADC_BATTERY	(33u)

// LEDs
#define PIN_LED     (32u)
#define LED_BUILTIN PIN_LED

// DYNAMIXEL POWER FET
#define DXL_PWR_SW  (31u)
```

# [Connecting Power](#connecting-power)

OpenRB-150 controller can be powered by three power sources:

1. USB C connector  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_usb.png)
2. VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_vin.png)
3. Terminal VIN  
  ![](/assets/images/parts/controller/openrb-150/openrb-150_power_terminal_vin.png)

**CAUTION**  
Be cautious with the polarity of the power source when connecting power to the VIN or the Terminal VIN.  
Reverse connecting the polarity can permanently damage the controller.
{: .notice--warning}

**DANGER**
When connecting the controller to the PC with a USB C cable, do NOT connect a power source less than 5V to the Terminal VIN as the reverse voltage from the USB can damage the power source connected to the Terminal VIN.  
This is extremely important when 1 cell Li-Po battery(3.7V) is connected to the Terminal VIN.  
![](/assets/images/parts/controller/openrb-150/openrb-150_power_danger.png)
{: .notice--danger}

However, it is possible to simultaneously connect the USB, VIN, and Terminal VIN as long as the Terminal VIN voltage level is the highest.  
Since the highest voltage will rule out other lower voltages from USB and VIN, DYNAMIXEL Ports will always be supplied with the highest voltage among the connected power sources.

# [Development Environment](#development-environment)

## [Install the Arduino IDE (Linux)](#install-the-arduino-ide-linux)

1. Download the Linux 64 bit version of Arduino IDE from the official arduino homepage.  
  ![](/assets/images/icon_download.png) [https://www.arduino.cc/en/software](https://www.arduino.cc/en/software)

2. Extract the downloaded file to the desired folder and execute the install script as below in the terminal.
```
$ ./install.sh
```

### [Run the Arduino IDE (Linux)](#run-the-arduino-ide-linux)

To run the Arduino IDE on Linux platform, enter the command below in the terminal.
```
$ arduino
```

#### [Porting the OpenCM9.04 board to the Arduino IDE (Linux)](#porting-the-openrb-150-board-to-the-arduino-ide-linux)

##### [Preferences (Linux)](#preferences-linux)
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_1.png)


##### [Install the OpenCM9.04 package via Boards Manager (Linux)](#install-the-openrb-150-package-via-boards-manager-linux)
Click Tools → Board → Boards Manager.

![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_2.png)

Type OpenCM9.04 into the textbox to find the OpenCM9.04 by ROBOTIS package. After it finds out, click Install.

![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_4.png)

See if OpenCM9.04 Board is now on the list of Tools → Board. Click this to import the OpenCM9.04 Board source.

![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_5.png)

##### [Port setting (Linux)](#port-setting-linux)
This step shows the port setting for the program uploads. The OpenCM9.04 should be connected to the PC and the OpenCM9.04 via the USB ports.

Select Tools → Port → /dev/ttyACM0.

The value of /dev/ttyACM0 may be different depending on the environment connected to the PC.
{: .notice}


![](/assets/images/parts/controller/openrb-150/opencm9.04_linux_6.png)

### [Install on Mac](#install-on-mac)

#### [Install the Arduino IDE (Mac)](#install-the-arduino-ide-mac)

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCM9.04 will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

#### [Run the Arduino IDE (Mac)](#run-the-arduino-ide-mac)

To run the Arduino IDE on Mac platform, click the Arduino IDE icon as follows.

![](/assets/images/parts/controller/openrb-150/arduino_mac_01.png)

![](/assets/images/parts/controller/openrb-150/arduino_mac_02.png)

#### [Porting the OpenCM9.04 board to the Arduino IDE (Mac)](#porting-the-openrb-150-board-to-the-arduino-ide-mac)

##### [Preferences (Mac)](#preferences-mac)
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/openrb-150/opencm9.04_mac_1.png)

##### [Install the OpenCM9.04 package via Boards Manager (Mac)](#install-the-openrb-150-package-via-boards-manager-mac)
Click Tools → Board → Boards Manager.

![](/assets/images/parts/controller/openrb-150/opencm9.04_mac_2.png)

Type OpenCM9.04 into the textbox to find the OpenCM9.04 by ROBOTIS package. After it finds out, click Install.

![](/assets/images/parts/controller/openrb-150/opencm9.04_mac_3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/parts/controller/openrb-150/opencm9.04_mac_4.png)

See if OpenCM9.04 Board is now on the list of Tools → Board. Click this to import the OpenCM9.04 Board source.

##### [Port setting (Mac)](#port-setting-mac)
This step shows the port setting for the program uploads. The OpenCM9.04 should be connected to the PC and the OpenCM9.04 via the USB ports.

Select Tools → Port → /dev/ttyACM0.

The value of /dev/ttyACM0 may be different depending on the environment connected to the PC.
{: .notice}

![](/assets/images/parts/controller/openrb-150/opencm9.04_mac_6.png)

### [Install on Windows](#windows-driver-installation)

#### [Install Virtual COM Port Driver](#install-virtual-com-port-driver)
To use OpenCM9.04's USB port as a serial port in Windows, you need a USB CDC driver.

- See [How to install ROBOTIS virtual COM port for Windows]{: .popup} 

Download the latest version of Arduino IDE from the official arduino homepage, and install it. Currently, the OpenCM 9.04 will be on service in the version 1.6.4 or later.

[https://www.arduino.cc/en/Main/Software](https://www.arduino.cc/en/Main/Software)

The Arduino IDE for Windows is available as an installation version and a compressed version, so you can install it using your preferred method.

#### [Porting the OpenCM 9.04 board to the Arduino IDE (Windows)](#porting-the-opencm-904-board-to-the-arduino-ide-windows)

##### [Preferences (Windows)](#preferences-windows)
After Arduino IDE is run, click File → Preferences in the top menu of the IDE. When the Preferences window appears, copy and paste following link to the Additional Boards Manager URLs textbox. (This step may take about 20 min.)

[https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json](https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/arduino/opencm_release/package_opencm9.04_index.json)

![](/assets/images/parts/controller/openrb-150/openrb-150_win_1.png)

##### [Install the OpenCM9.04 package via Boards Manager (Windows)](#install-the-openrb-150-package-via-boards-manager-windows)
Click Tools → Board → Boards Manager.

![](/assets/images/parts/controller/openrb-150/openrb-150_win_2.png)

Type OpenCM9.04 into the textbox to find the OpenCM9.04 by ROBOTIS package. After it finds out, click Install.

![](/assets/images/parts/controller/openrb-150/openrb-150_win_3.png)

After the installation, “INSTALLED” will be appeared.

![](/assets/images/parts/controller/openrb-150/openrb-150_win_4.png)

See if OpenCM9.04 Board is now on the list of Tools → Board. Click this to import the OpenCM9.04 Board source.

![](/assets/images/parts/controller/openrb-150/openrb-150_win_5.png)

##### [Port setting (Windows)](#port-setting-windows)
This step shows the port setting for the program uploads. The OpenCM9.04 should be connected to the PC and the OpenCM9.04 via the USB ports.

Select Tools > Port > COM1.

The value of COM1 may be different depending on the environment connected to the PC.
{: .notice}

### [Upload sketch](#upload-sketch)

The way to upload the sketch to the OpenCM9.04 board is similar to the way other common arduino boards do such as Arduino Uno.

Connect the OpenCM9.04 to the PC via USB cable and click on the Upload icon. 

Make sure that the board is properly entering the Bootloader (See the resulting output from the Arduino IDE), otherwise the OpenCM9.04 will fail to download the sketch. 

![](/assets/images/parts/controller/openrb-150/oencm904_upload_01.png)

**Note**: Uploading error could be occured by a firmware issue installed on the board. If you enters any error while uploading the code to the board, see [User Button](#user-button)
{: .notice}

{% include en/software/arduino/arduino_library_api.md %}

# [Examples](#examples)

You can find more examples after installing [DYNAMIXEL2Arduino library]

## [LED](#led)

It is a built-in LED test on the OpenCM9.04 board.

### [Test Example for LED](#test-example-for-led)
There are 1 LED available in OpenCM9.04, The LED connected to base 14 of Arduino.  
When the built-in LED pin is output as High / Low, the LED turns on / off.

```
#define BOARD_LED_PIN        14
```

It is a code that sequentially turns on and off all the LEDs.

```c++
int led_pin = 14;

void setup() {
  // Set up the built-in LED pin as an output:
  pinMode(led_pin, OUTPUT);

  Serial.begin(115200);
}

void loop() {
  int i;

  digitalWrite(led_pin, HIGH);  // set to as HIGH LED is turn-off
  Serial.println("led_off");
  delay(100);                   // Wait for 0.1 second
  digitalWrite(led_pin, LOW);   // set to as LOW LED is turn-on
  Serial.println("led_on");
  delay(100);                   // Wait for 0.1 second
}
```

## [Button](#button)

It is a built-in BUTTON test on the OpenCM9.04 board.

### [Test Example for Button](#test-example-for-button)
There is one Push switche in OpenCM9.04. The pin number is defined as below, so you can see the status of the current button when you input the data of that pin.

```
#define BOARD_BUTTON_PIN        23  
```

It is a code that outputs the button input status in serial. In order to use the built-in buttons, you need to set the port to pull-down.

```c++
void setup(){
  Serial.begin(115200);

  pinMode(BOARD_BUTTON_PIN, INPUT_PULLDOWN);
}

void loop(){
  int push_state;

  push_state  = digitalRead(BOARD_BUTTON_PIN)&lt;&lt;0;

  Serial.print("push_state = ");
  Serial.println(push_state, BIN);

  delay(100);
}
```

## [Buzzer](#buzzer)

Buzzer can be driven using Arduino tone API. Buzzer-enabled pins are available on all I / O pins in OpenCM 9.04.

### [Connection with Buzzer](#connection-with-buzzer)

![](/assets/images/parts/controller/openrb-150/buzzer_bb.png)


### [Arduino code for Buzzer](#arduino-code-for-buzzer)
The following example shows a change to the Buzzer pin in the basic tone example provided by Arduino, which uses the Buzzer to play the melody.

```c++
#include "pitches.h"

int buzzer_pin = A0;

// notes in the melody:
int melody[] = {
  NOTE_C4, NOTE_G3, NOTE_G3, NOTE_A3, NOTE_G3, 0, NOTE_B3, NOTE_C4
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 8, 8, 4, 4, 4, 4, 4
};

void setup() {
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote < 8; thisNote++) {

    // to calculate the note duration, take one second
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000 / noteDurations[thisNote];
    tone(buzzer_pin, melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(buzzer_pin);
  }
}
```

## [PWM](#pwm)

This is the PWM output test from the pin of the OpenCM9.04 board.

### [Test Example for PWM](#test-example-for-pwm)

The analogueWrite is used to output the PWM duty ratio to the corresponding ports. The resolution is 8 bits, from 0 to 255, and the frequency is 10 KHz.  
OpenCM 9.04 has 13 PWM pins in total. This is an example of PWM output on the six pins.

```c++
/*
 * PWM Pins : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
 */

int pwm_pins[6] = { 2, 3, 4, 5, 6, 7 };

void setup() {
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  int i;
  static uint8_t pwm_out = 0;

  for( i=0; i<6; i++ )
  {
    analogWrite(pwm_pins[i], pwm_out++);
  }
  delay(100);
}
```

## [EEPROM](#eeprom)

It is the EEPROM library test of OpenCM9.04 board.

### [Test](#test)

OpenCM9.04 does not have EEPROM memory, so it emulates a part of flash memory built in STM32F103 into EEPROM. The method of emulation was provided by ST as an example.  
The area used as EEPROM is 0x0801F800 ~ 0x08020000 (2KBytes) as shown below. Two sectors are used.

![](/assets/images/parts/controller/openrb-150/memory_map.png)

32 bits are used to store one data, the lower 16 bits are the data to be stored, and the upper 16 bits indicate the address of the corresponding data. When storing data, it is always stored in the new location. When you use one page while saving the data, only the latest values ​​from the saved page are copied to the new page and the existing page is deleted.
As a result, the number of flash memory erasures is reduced, thereby increasing the write-through life.

![](/assets/images/parts/controller/openrb-150/ex_eeprom_02.png)

![](/assets/images/parts/controller/openrb-150/ex_eeprom_03.png)

To use the EEPROM library, a header must be added, and the maximum size of the current EEPROM is 512bytes. Since the EEPROM library has ported what is supported in Arduino, the basic usage method is the same as that used in other existing Arduino boards. For more information on how to use it, please refer to the Arduino site.

[https://www.arduino.cc/en/Reference/EEPROM](https://www.arduino.cc/en/Reference/EEPROM)

```c++
#include <EEPROM.h>
```

```c++
#include <EEPROM.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  uint32_t tTime;
  static int i = 0;


  if( (millis()-tTime) > 100 )
  {
    Serial.print(EEPROM.read(0));
    Serial.print("\t");
    Serial.print(EEPROM.read(1));
    Serial.print("\t");
    Serial.print(EEPROM.read(2));
    Serial.println("\t");

    tTime = millis();
  }

  if (Serial.available())
  {
    uint8_t inByte = Serial.read();

    if( inByte == '1' )
    {
      EEPROM.write(0, i+1);
      EEPROM.write(1, i+2);
      EEPROM.write(2, i+3);
      i++;
    }
  }
}
```

## [Servo](#servo)

- Servo library is used to drive RC servo for RC.
- RC Servo Library uses OpenCM9.04 hardware timer and can be used by connecting to PWM output pin.
- A2 to D14 pins are PWM output pins.
- Be careful when using Servo library because other functions using hardware timer can not be used at the same time.
- See the list below for the hardware and channels used.

```c++
{GPIOA, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_0 , &hTIM2 ,   TIM_CHANNEL_1, 2       },  // 2
{GPIOA, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_1 , &hTIM2 ,   TIM_CHANNEL_2, 3       },  // 3
{GPIOA, GPIO_PIN_2,   &hADC1,   ADC_CHANNEL_2 , &hTIM2 ,   TIM_CHANNEL_3, 4       },  // 4
{GPIOA, GPIO_PIN_3,   &hADC1,   ADC_CHANNEL_3 , &hTIM2 ,   TIM_CHANNEL_4, 5       },  // 5
{GPIOA, GPIO_PIN_6,   &hADC1,   ADC_CHANNEL_6 , &hTIM3 ,   TIM_CHANNEL_1, 6       },  // 6
{GPIOA, GPIO_PIN_7,   &hADC1,   ADC_CHANNEL_7 , &hTIM3 ,   TIM_CHANNEL_2, 7       },  // 7
{GPIOB, GPIO_PIN_0,   &hADC1,   ADC_CHANNEL_8 , &hTIM3 ,   TIM_CHANNEL_3, 8       },  // 8
{GPIOB, GPIO_PIN_1,   &hADC1,   ADC_CHANNEL_9 , &hTIM3 ,   TIM_CHANNEL_4, 9       },  // 9

{GPIOA, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_1, 10      },  // 10
{GPIOA, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_2, 11      },  // 11
{GPIOA, GPIO_PIN_10,  NULL,     NO_ADC        , &hTIM1 ,   TIM_CHANNEL_3, 12      },  // 12
{GPIOB, GPIO_PIN_8,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_3, 13      },  // 13
{GPIOB, GPIO_PIN_9,   NULL,     NO_ADC        , &hTIM4 ,   TIM_CHANNEL_4, 14      },  // 14 LED
```

### [Connection with Servo](#connection-with-servo)

![](/assets/images/parts/controller/openrb-150/servo_bb.png)

### [Arduino code for servo](#arduino-code-for-servo)
This is an example of a Servo library and uses the A2 pin of OpenCM9.04. The range of the input value is 0 to 180 degrees.

```c++
#include <Servo.h>

Servo myservo;  // create servo object to control a servo

void setup() {
  myservo.attach(A2);  // attaches the servo on pin 2 to the servo object
}

void loop() {  
  myservo.write(0);                    // sets the servo position according to the scaled value
  delay(1000);                         // waits for the servo to get there
  myservo.write(180);                  // sets the servo position according to the scaled value
  delay(1000);                         // waits for the servo to get there
}
```

## [SD Card](#sd-card)

The Arduino IDE includes an SD card control library using the SPI library. OpenCM 9.04 supports the default SD library.

### [Connection with SD Card](#connection-with-sd-card)

- SD Card Connection(SPI port)

  ![](/assets/images/parts/controller/openrb-150/sdcard_bb.png)

### [Arduino code for SD Card](#arduino-code-for-sd-card)
The cardInfo example from the SD library and displays the file list after initializing the SD card. OpenCM9.04 SPI1 is used, and CS pin is used as No. 4.

```c++
// include the SD library:
#include <SPI.h>
#include <SD.h>

// set up variables using the SD utility library functions:
Sd2Card card;
SdVolume volume;
SdFile root;

// change this to match your SD shield or module;
// Arduino Ethernet shield: pin 4
// Adafruit SD shields and modules: pin 10
// Sparkfun SD shield: pin 8
// MKRZero SD: SDCARD_SS_PIN
const int chipSelect = 4;

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.print("\nInitializing SD card...");

  // we'll use the initialization code from the utility libraries
  // since we're just testing if the card is working!
  if (!card.init(SPI_HALF_SPEED, chipSelect)) {
    Serial.println("initialization failed. Things to check:");
    Serial.println("* is a card inserted?");
    Serial.println("* is your wiring correct?");
    Serial.println("* did you change the chipSelect pin to match your shield or module?");
    return;
  } else {
    Serial.println("Wiring is correct and a card is present.");
  }

  // print the type of card
  Serial.print("\nCard type: ");
  switch (card.type()) {
    case SD_CARD_TYPE_SD1:
      Serial.println("SD1");
      break;
    case SD_CARD_TYPE_SD2:
      Serial.println("SD2");
      break;
    case SD_CARD_TYPE_SDHC:
      Serial.println("SDHC");
      break;
    default:
      Serial.println("Unknown");
  }

  // Now we will try to open the 'volume'/'partition' - it should be FAT16 or FAT32
  if (!volume.init(card)) {
    Serial.println("Could not find FAT16/FAT32 partition.\nMake sure you've formatted the card");
    return;
  }

  // print the type and size of the first FAT-type volume
  uint32_t volumesize;
  Serial.print("\nVolume type is FAT");
  Serial.println(volume.fatType(), DEC);
  Serial.println();

  volumesize = volume.blocksPerCluster();    // clusters are collections of blocks
  volumesize *= volume.clusterCount();       // we'll have a lot of clusters
  volumesize *= 512;                            // SD card blocks are always 512 bytes
  Serial.print("Volume size (bytes): ");
  Serial.println(volumesize);
  Serial.print("Volume size (Kbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);
  Serial.print("Volume size (Mbytes): ");
  volumesize /= 1024;
  Serial.println(volumesize);

  Serial.println("\nFiles found on the card (name, date and size in bytes): ");
  root.openRoot(volume);

  // list all files in the card with date and size
  root.ls(LS_R | LS_DATE | LS_SIZE);
}

void loop(void) {

}
```

## [MS5540S](#ms5540s)

The MS5540S is a sensor that can measure water pressure and can calculate the depth in water by measuring the water pressure. SPI communication is used.

### [Connection with MS5540S](#connection-with-ms5540s)

| MS5540S | OpenCM9.04 | etc       |
|:--------|:-----------|:----------|
| VCC     | 3.3V       |           |
| GND     | GND        |           |
| MCLK    | D13        | 32.768Khz |
| DIN     | A7         | MOSI      |
| DOUT    | A6         | MISO      |
| SCLK    | A1         | SCK       |

### [Arduino code for MS5540S](#arduino-code-for-ms5540s)
Use SPI1 of OpenCM9.04 and input the clock of 32.768Khz to MCLK of MS5540S sensor. The analogWriteFreq function, which can adjust the frequency of the PWM pin of OpenCM 9.04, generates a clock of 32.768 KHz.

```c++
#include <SPI.h>

float water_depth;
float water_temp;

void ms5540s_reset();
void ms5540s_setup();
void ms5540s_loop();

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  ms5540s_setup();
}

void loop() {
  // put your main code here, to run repeatedly:
  static uint32_t pre_time[2];

  if( (millis() - pre_time[0]) >= 10 )
  {
    pre_time[0] = millis();
    ms5540s_loop();
  }

  if( (millis() - pre_time[1]) >= 100 )
  {
    pre_time[1] = millis();
    Serial.print(water_depth);
    Serial.print(" m\t");
    Serial.print(water_temp);
    Serial.println(" 'C");       
  }  
}

////////////////////////////////////////////
// MS5540S
////////////////////////////////////////////

#define FRESH_WATER  1000.0 // [kg/m^3]
#define SEA_WATER    1030.0 // [kg/m^3]


const int clock = 13;

const float water_type = SEA_WATER;
const int get_interval = 35;
static int ms5540s_state = 0;

float g;
float latitude = 37.0;
float lat_rad = ((37.0/57.29578) * PI / 180);
float x = sin(lat_rad)*sin(lat_rad);

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_reset
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_reset() //this function keeps the sketch a little shorter
{
 SPI.setDataMode(SPI_MODE0);
 SPI.transfer(0x15);
 SPI.transfer(0x55);
 SPI.transfer(0x40);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_setup() {
 SPI.begin(); //see SPI library details on arduino.cc for details
 SPI.setBitOrder(MSBFIRST);
 SPI.setClockDivider(SPI_CLOCK_DIV32); //divide 16 MHz to communicate on 500 kHz
 pinMode(clock, OUTPUT);
 analogWriteFreq(clock, 32768);
 delay(100);
}

/*---------------------------------------------------------------------------
     TITLE   : ms5540s_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void ms5540s_loop()
{
  static uint32_t tTime;

  unsigned int word1 = 0;
  unsigned int word11 = 0;
  unsigned int word2 = 0;
  unsigned int word3 = 0;
  byte word22 = 0;
  byte word33 = 0;
  unsigned int word4 = 0;
  byte word44 = 0;
  static long c1;
  static long c2;
  static long c3;
  static long c4;
  static long c5;
  static long c6;
  unsigned int presMSB = 0; //first byte of value
  unsigned int presLSB =0; //last byte of value
  static unsigned int D1 = 0;
  unsigned int tempMSB = 0; //first byte of value
  unsigned int tempLSB = 0; //last byte of value
  static unsigned int D2 = 0;
  long UT1 = 0;
  long dT = 0;
  long TEMP = 0;
  long OFF = 0;
  long SENS = 0;

  float p;
  static long PCOMP = 0;
  static long PCOMP2 = 0;
  static long PH2 = 0;
  static float TEMPREAL = 0;
  static float DEPTH = 0;

  long dT2 = 0;
  static float TEMPCOMP = 0;

  bool ret = false;

//////////////////////////////////////////
  switch( ms5540s_state )
  {
    case 0:      
      analogWrite (clock, 128) ;
      ms5540s_reset();//resets the sensor - caution: afterwards mode = SPI_MODE0!
      //Calibration word 1
      word1 = 0;
      word11 = 0;
      SPI.transfer(0x1D); //send first byte of command to get calibration word 1
      SPI.transfer(0x50); //send second byte of command to get calibration word 1
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      word1 = SPI.transfer(0x00); //send dummy byte to read first byte of word
      word1 = word1 << 8; //shift returned byte
      word11 = SPI.transfer(0x00); //send dummy byte to read second byte of word
      word1 = word1 | word11; //combine first and second byte of word
      ms5540s_reset();//resets the sensor
      //Calibration word 2; see comments on calibration word 1
      word2 = 0;
      word22 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x60);
      SPI.setDataMode(SPI_MODE1);
      word2 = SPI.transfer(0x00);
      word2 = word2 <<8;
      word22 = SPI.transfer(0x00);
      word2 = word2 | word22;
      ms5540s_reset();//resets the sensor
      //Calibration word 3; see comments on calibration word 1
      word3 = 0;
      word33 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0x90);
      SPI.setDataMode(SPI_MODE1);
      word3 = SPI.transfer(0x00);
      word3 = word3 <<8;
      word33 = SPI.transfer(0x00);
      word3 = word3 | word33;
      ms5540s_reset();//resets the sensor
      //Calibration word 4; see comments on calibration word 1
      word4 = 0;
      word44 = 0;
      SPI.transfer(0x1D);
      SPI.transfer(0xA0);
      SPI.setDataMode(SPI_MODE1);
      word4 = SPI.transfer(0x00);
      word4 = word4 <<8;
      word44 = SPI.transfer(0x00);
      word4 = word4 | word44;
////////////////////////////////////////////////////////////////////

      c1 = (word1 >> 1);
      c2 = ((word3 & 0x3F) << 6) | ((word4 & 0x3F));
      c3 = (word4 >> 6);
      c4 = (word3 >> 6);
      c5 = (word2 >> 6) | ((word1 & 0x1) << 10);
      c6 = (word2 & 0x3F);
      ms5540s_reset();//resets the sensor

      //Temperature:
      SPI.transfer(0x0F); //send first byte of command to get temperature value
      SPI.transfer(0x20); //send second byte of command to get temperature value

      tTime = millis();
      ms5540s_state = 1;
      break;

    case 1:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 2;
      }
      break;

    case 2:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      tempMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      tempMSB = tempMSB << 8; //shift first byte
      tempLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D2 = tempMSB | tempLSB; //combine first and second byte of value
      ms5540s_reset();//resets the sensor

     //Pressure:
      SPI.transfer(0x0F); //send first byte of command to get pressure value
      SPI.transfer(0x40); //send second byte of command to get pressure value

      tTime = millis();
      ms5540s_state = 3;
      break;

    case 3:
      if( (millis()-tTime) >= get_interval )
      {
        ms5540s_state = 4;
      }
      break;

    case 4:
      SPI.setDataMode(SPI_MODE1); //change mode in order to listen
      presMSB = SPI.transfer(0x00); //send dummy byte to read first byte of value
      presMSB = presMSB << 8; //shift first byte
      presLSB = SPI.transfer(0x00); //send dummy byte to read second byte of value
      D1 = presMSB | presLSB;   

      UT1 = (c5 * 8) + 20224;   //calculate calibration temperature
      //calculate actual temperature
      dT =(D2 - UT1);
      TEMP = 200 + ((dT * (c6 + 50))/1024);
      //TEMP = 20 + (dT * c6);
      //calculate temperature compensated pressure
      OFF = (c2*4) + (((c4 - 512) * dT)/4096);
      SENS = c1 + ((c3 * dT)/1024) + 24576;

      //0.1 mbar resolution
      PCOMP = ((((((SENS * (D1 - 7168))/16384)- OFF)*10)/32)+(250*10))/10;

      if(PCOMP > 1000)
      {
       PH2 = (-5*((PCOMP-1000)*(PCOMP-1000)))/(1<<19);
      }
      else
      {
        PH2 = 0;
      }
      PCOMP2 = PCOMP - PH2;

       // smaller than 1atm (1,013.25 hPa)
      //if(PCOMP2 < 1013.25) PCOMP2 = 0;

      TEMPREAL = TEMP/10;

      dT2 = dT - ((dT >> 7 * dT >> 7) >> 3);
      TEMPCOMP = (200 + (dT2*(c6+100) >>11))/10;

      if(water_type == FRESH_WATER)
      {
        DEPTH = PCOMP2 * 1.019716 / 1000;   // 1000mb = bar
      }
      else
      {
        g = 9.780318*(1.0 + ((5.2788*1/1000) + 2.36*1/100000 * x)*x) + (1.092*1/1000000*PCOMP2);
        DEPTH = (((((-1.82*1/1000000000000000)*PCOMP2 + (2.279*1/10000000000))*PCOMP2 - (2.2512*1/100000))*PCOMP2 + 9.72659)*PCOMP2)/g;
      }  

      water_depth = DEPTH;
      water_temp  = TEMPCOMP;
/*
      Serial.print("Pressure : ");      
      Serial.print(PCOMP);
      Serial.println(" mb(millibar)");   
      Serial.print("Temperature : ");      
      Serial.print(TEMPCOMP);
      Serial.println(" 'C");   
      Serial.print("WaterDepth : ");      
      Serial.print(DEPTH);
      Serial.println(" m");   
      Serial.println();
*/
      ret = true;
      ms5540s_state = 0;
      break;

    default:
      ms5540s_state = 0;
      break;
  }
}
```

## [MPU6050 DMP](#mpu6050-dmp)

The MPU6050 is a sensor consisting of three axes of acceleration / three axes of gyro. If a dedicated processor called DMP is used in the MPU6050, the MPU6050 performs sensor fusion processing for obtaining Roll / Pitch / Yaw.

### [Connection with MPU6050 DMP](#connection-with-mpu6050-dmp)

| MPU6050 | OpenCM9.04 | etc  |
|:--------|:-----------|:-----|
| VCC     | 5V         |      |
| GND     | GND        |      |
| SCL     | D24        | I2C2 |
| SDA     | D25        | I2C2 |
| INT     | A2         |      |

### [Arduino code for MPU6050 DMP](#arduino-code-for-mpu6050-dmp)
Enable the DMP function of MPU6050 and output Roll / Pitch / Yaw value in serial every 50ms. The full source code is downloaded from the link below.

- Source code download link
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Exam_MPU6050.zip)

```c++
#include "mpu.h"

MPU6050 mpu;

void setup()
{
  Serial.begin(115200);

  dmpDataReady();
  dmp_setup();
}

void loop()
{
  static uint32_t tTime[4];

  dmp_loop();

  if( (millis() - tTime[2]) >= 50 )
  {
    tTime[2] = millis();
    Serial.print("roll : ");
    Serial.print(String(roll, 2));
    Serial.print("  pitch : ");
    Serial.print(String(pitch, 2));
    Serial.print("  yaw : ");
    Serial.println(String(yaw, 2));
  }  
}

////////////////////////////////////////
//        IMU
/////////////////////////////////////////
/*---------------------------------------------------------------------------
     TITLE   : dmpDataReady
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmpDataReady() {
    mpuInterrupt = true;
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_setup
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_setup() {
    I2Cdev::begin(400);

    // initialize device
    Serial.println(F("Initializing I2C devices..."));
    mpu.initialize();
    pinMode(INTERRUPT_PIN, INPUT);

    // verify connection
    Serial.println(F("Testing device connections..."));
    Serial.println(mpu.testConnection() ? F("MPU6050 connection successful") : F("MPU6050 connection failed"));

    // wait for ready
    Serial.println(F("\nSend any character to begin DMP programming and demo: "));
  //  while (Serial.available() && Serial.read()); // empty buffer
  //  while (!Serial.available());                 // wait for data
  //  while (Serial.available() && Serial.read()); // empty buffer again

    // load and configure the DMP
    Serial.println(F("Initializing DMP..."));
    devStatus = mpu.dmpInitialize();

    // supply your own gyro offsets here, scaled for min sensitivity
    //mpu.setXGyroOffset(220);
    //mpu.setYGyroOffset(76);
    //mpu.setZGyroOffset(-85);
    //mpu.setZAccelOffset(1788); // 1688 factory default for my test chip

    // make sure it worked (returns 0 if so)
    if (devStatus == 0) {
        // turn on the DMP, now that it's ready
        Serial.println(F("Enabling DMP..."));
        mpu.setDMPEnabled(true);

        // enable Arduino interrupt detection
        Serial.println(F("Enabling interrupt detection (Arduino external interrupt 0)..."));
        attachInterrupt(digitalPinToInterrupt(INTERRUPT_PIN), dmpDataReady, RISING);
        mpuIntStatus = mpu.getIntStatus();

        // set our DMP Ready flag so the main loop() function knows it's okay to use it
        Serial.println(F("DMP ready! Waiting for first interrupt..."));
        dmpReady = true;

        // get expected DMP packet size for later comparison
        packetSize = mpu.dmpGetFIFOPacketSize();
    } else {
        // ERROR!
        // 1 = initial memory load failed
        // 2 = DMP configuration updates failed
        // (if it's going to break, usually the code will be 1)
        Serial.print(F("DMP Initialization failed (code "));
        Serial.print(devStatus);
        Serial.println(F(")"));
    }
}

/*---------------------------------------------------------------------------
     TITLE   : dmp_loop
     WORK    :
     ARG     : void
     RET     : void
---------------------------------------------------------------------------*/
void dmp_loop() {
    // if programming failed, don't try to do anything
    if (!dmpReady) return;

    // wait for MPU interrupt or extra packet(s) available
    if (!mpuInterrupt && fifoCount < packetSize) return;

    // reset interrupt flag and get INT_STATUS byte
    mpuInterrupt = false;
    mpuIntStatus = mpu.getIntStatus();

    // get current FIFO count
    fifoCount = mpu.getFIFOCount();

    // check for overflow (this should never happen unless our code is too inefficient)
    if ((mpuIntStatus & 0x10) || fifoCount == 1024) {
        // reset so we can continue cleanly
        mpu.resetFIFO();
      //  Serial.println(F("FIFO overflow!"));

    // otherwise, check for DMP data ready interrupt (this should happen frequently)
    } else if (mpuIntStatus & 0x02) {
        // wait for correct available data length, should be a VERY short wait
        while (fifoCount < packetSize) fifoCount = mpu.getFIFOCount();

        // read a packet from FIFO
        mpu.getFIFOBytes(fifoBuffer, packetSize);

        // track FIFO count here in case there is > 1 packet available
        // (this lets us immediately read more without waiting for an interrupt)
        fifoCount -= packetSize;

        // display Euler angles in degrees
        mpu.dmpGetQuaternion(&q, fifoBuffer);
        mpu.dmpGetGravity(&gravity, &q);
        mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);

        // store roll, pitch, yaw
        yaw = ypr[0] * 180/M_PI;
        roll = ypr[1] * 180/M_PI;
        pitch = ypr[2] * 180/M_PI;                       
    }
}
```

## [0.96" OLED LCD](#096-oled-lcd)

It is a 0.96 inch OLED monochrome LCD. It has 128x64 resolution and is controlled using the Adafruit_GFX_Library library.

![](/assets/images/parts/controller/openrb-150/AD304-2T.jpg)

### [Connection with LCD](#connection-with-lcd)

| OLED | OpenCM9.04 | etc  |
|:-----|:-----------|:-----|
| VCC  | 3.3V       |      |
| GND  | GND        |      |
| SCK  | D24        | I2C2 |
| SDA  | D25        | I2C2 |


### [Arduino code for LCD](#arduino-code-for-lcd)
Enable the DMP function of MPU6050 and output Roll / Pitch / Yaw value in serial every 50ms. The full source code is downloaded from the link below.

- `Download` Library. Copy the following two libraries into the Document > Arduino > libraries folder and unzip them.
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_GFX_Library.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_GFX_Library.zip)  
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_SSD1306.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Adafruit_SSD1306.zip)

- `Download` Source Code. Extract downloaded source code and open the code from Arduino IDE with File > Open.
  [https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Exam_ssd1306_128x64_i2c.zip](https://github.com/ROBOTIS-GIT/OpenCM9.04/blob/master/arduino/opencm_arduino/examples/Adafruit_SSD1306/Exam_ssd1306_128x64_i2c.zip)

```c++
/*********************************************************************
This is an example for our Monochrome OLEDs based on SSD1306 drivers

  Pick one up today in the adafruit shop!
  ------> http://www.adafruit.com/category/63_98

This example is for a 128x64 size display using I2C to communicate
3 pins are required to interface (2 I2C and one reset)

Adafruit invests time and resources providing this open source code,
please support Adafruit and open-source hardware by purchasing
products from Adafruit!

Written by Limor Fried/Ladyada  for Adafruit Industries.  
BSD license, check license.txt for more information
All text above, and the splash screen must be included in any redistribution
*********************************************************************/

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET 4
Adafruit_SSD1306 display(-1);

#define NUMFLAKES 10
#define XPOS 0
#define YPOS 1
#define DELTAY 2

#define LOGO16_GLCD_HEIGHT 16
#define LOGO16_GLCD_WIDTH  16
static const unsigned char PROGMEM logo16_glcd_bmp[] =
{ B00000000, B11000000,
  B00000001, B11000000,
  B00000001, B11000000,
  B00000011, B11100000,
  B11110011, B11100000,
  B11111110, B11111000,
  B01111110, B11111111,
  B00110011, B10011111,
  B00011111, B11111100,
  B00001101, B01110000,
  B00011011, B10100000,
  B00111111, B11100000,
  B00111111, B11110000,
  B01111100, B11110000,
  B01110000, B01110000,
  B00000000, B00110000 };

#if (SSD1306_LCDHEIGHT != 64)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

void setup()   {                
  Serial.begin(9600);

  // by default, we'll generate the high voltage from the 3.3v line internally! (neat!)
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);  // initialize with the I2C addr 0x3D (for the 128x64)
  // init done

  // Show image buffer on the display hardware.
  // Since the buffer is intialized with an Adafruit splashscreen
  // internally, this will display the splashscreen.
  display.display();
  delay(2000);

  // Clear the buffer.
  display.clearDisplay();

  // draw a single pixel
  display.drawPixel(10, 10, WHITE);
  // Show the display buffer on the hardware.
  // NOTE: You _must_ call display after making any drawing commands
  // to make them visible on the display hardware!
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw many lines
  testdrawline();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw rectangles
  testdrawrect();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw multiple rectangles
  testfillrect();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw mulitple circles
  testdrawcircle();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw a white circle, 10 pixel radius
  display.fillCircle(display.width()/2, display.height()/2, 10, WHITE);
  display.display();
  delay(2000);
  display.clearDisplay();

  testdrawroundrect();
  delay(2000);
  display.clearDisplay();

  testfillroundrect();
  delay(2000);
  display.clearDisplay();

  testdrawtriangle();
  delay(2000);
  display.clearDisplay();

  testfilltriangle();
  delay(2000);
  display.clearDisplay();

  // draw the first ~12 characters in the font
  testdrawchar();
  display.display();
  delay(2000);
  display.clearDisplay();

  // draw scrolling text
  testscrolltext();
  delay(2000);
  display.clearDisplay();

  // text display tests
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.println("Hello, world!");
  display.setTextColor(BLACK, WHITE); // 'inverted' text
  display.println(3.141592);
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.print("0x"); display.println(0xDEADBEEF, HEX);
  display.display();
  delay(2000);
  display.clearDisplay();

  // miniature bitmap display
  display.drawBitmap(30, 16,  logo16_glcd_bmp, 16, 16, 1);
  display.display();
  delay(1);

  // invert the display
  display.invertDisplay(true);
  delay(1000);
  display.invertDisplay(false);
  delay(1000);
  display.clearDisplay();

  // draw a bitmap icon and 'animate' movement
  testdrawbitmap(logo16_glcd_bmp, LOGO16_GLCD_HEIGHT, LOGO16_GLCD_WIDTH);
}

void loop() {

}

void testdrawbitmap(const uint8_t *bitmap, uint8_t w, uint8_t h) {
  uint8_t icons[NUMFLAKES][3];

  // initialize
  for (uint8_t f=0; f< NUMFLAKES; f++) {
    icons[f][XPOS] = random(display.width());
    icons[f][YPOS] = 0;
    icons[f][DELTAY] = random(5) + 1;

    Serial.print("x: ");
    Serial.print(icons[f][XPOS], DEC);
    Serial.print(" y: ");
    Serial.print(icons[f][YPOS], DEC);
    Serial.print(" dy: ");
    Serial.println(icons[f][DELTAY], DEC);
  }

  while (1) {
    // draw each icon
    for (uint8_t f=0; f< NUMFLAKES; f++) {
      display.drawBitmap(icons[f][XPOS], icons[f][YPOS], bitmap, w, h, WHITE);
    }
    display.display();
    delay(200);

    // then erase it + move it
    for (uint8_t f=0; f< NUMFLAKES; f++) {
      display.drawBitmap(icons[f][XPOS], icons[f][YPOS], bitmap, w, h, BLACK);
      // move it
      icons[f][YPOS] += icons[f][DELTAY];
      // if its gone, reinit
      if (icons[f][YPOS] > display.height()) {
        icons[f][XPOS] = random(display.width());
        icons[f][YPOS] = 0;
        icons[f][DELTAY] = random(5) + 1;
      }
    }
   }
}

void testdrawchar(void) {
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);

  for (uint8_t i=0; i < 168; i++) {
    if (i == '\n') continue;
    display.write(i);
    if ((i > 0) && (i % 21 == 0))
      display.println();
  }    
  display.display();
  delay(1);
}

void testdrawcircle(void) {
  for (int16_t i=0; i<display.height(); i+=2) {
    display.drawCircle(display.width()/2, display.height()/2, i, WHITE);
    display.display();
    delay(1);
  }
}

void testfillrect(void) {
  uint8_t color = 1;
  for (int16_t i=0; i<display.height()/2; i+=3) {
    // alternate colors
    display.fillRect(i, i, display.width()-i*2, display.height()-i*2, color%2);
    display.display();
    delay(1);
    color++;
  }
}

void testdrawtriangle(void) {
  for (int16_t i=0; i<min(display.width(),display.height())/2; i+=5) {
    display.drawTriangle(display.width()/2, display.height()/2-i,
                     display.width()/2-i, display.height()/2+i,
                     display.width()/2+i, display.height()/2+i, WHITE);
    display.display();
    delay(1);
  }
}

void testfilltriangle(void) {
  uint8_t color = WHITE;
  for (int16_t i=min(display.width(),display.height())/2; i>0; i-=5) {
    display.fillTriangle(display.width()/2, display.height()/2-i,
                     display.width()/2-i, display.height()/2+i,
                     display.width()/2+i, display.height()/2+i, WHITE);
    if (color == WHITE) color = BLACK;
    else color = WHITE;
    display.display();
    delay(1);
  }
}

void testdrawroundrect(void) {
  for (int16_t i=0; i<display.height()/2-2; i+=2) {
    display.drawRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, WHITE);
    display.display();
    delay(1);
  }
}

void testfillroundrect(void) {
  uint8_t color = WHITE;
  for (int16_t i=0; i<display.height()/2-2; i+=2) {
    display.fillRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, color);
    if (color == WHITE) color = BLACK;
    else color = WHITE;
    display.display();
    delay(1);
  }
}

void testdrawrect(void) {
  for (int16_t i=0; i<display.height()/2; i+=2) {
    display.drawRect(i, i, display.width()-2*i, display.height()-2*i, WHITE);
    display.display();
    delay(1);
  }
}

void testdrawline() {  
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(0, 0, i, display.height()-1, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=0; i<display.height(); i+=4) {
    display.drawLine(0, 0, display.width()-1, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(0, display.height()-1, i, 0, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=display.height()-1; i>=0; i-=4) {
    display.drawLine(0, display.height()-1, display.width()-1, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=display.width()-1; i>=0; i-=4) {
    display.drawLine(display.width()-1, display.height()-1, i, 0, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=display.height()-1; i>=0; i-=4) {
    display.drawLine(display.width()-1, display.height()-1, 0, i, WHITE);
    display.display();
    delay(1);
  }
  delay(250);

  display.clearDisplay();
  for (int16_t i=0; i<display.height(); i+=4) {
    display.drawLine(display.width()-1, 0, 0, i, WHITE);
    display.display();
    delay(1);
  }
  for (int16_t i=0; i<display.width(); i+=4) {
    display.drawLine(display.width()-1, 0, i, display.height()-1, WHITE);
    display.display();
    delay(1);
  }
  delay(250);
}

void testscrolltext(void) {
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(10,0);
  display.clearDisplay();
  display.println("scroll");
  display.display();
  delay(1);

  display.startscrollright(0x00, 0x0F);
  delay(2000);
  display.stopscroll();
  delay(1000);
  display.startscrollleft(0x00, 0x0F);
  delay(2000);
  display.stopscroll();
  delay(1000);    
  display.startscrolldiagright(0x00, 0x07);
  delay(2000);
  display.startscrolldiagleft(0x00, 0x07);
  delay(2000);
  display.stopscroll();
}
```

### [Video](#video)

<iframe width="560" height="315" src="https://www.youtube.com/embed/0E4cu4GE17k" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

# [Downloads](#downloads)

- `Download ZIP` [OpenCM 9.04 Manual]
- `Download PDF` [PCB Schematic]
- `Download PDF` [Top Gerber]
- `Download PDF` [Bottom Gerber]
- `Download PDF` [Gerber]
- `Download Software Link` [Arduino IDE]
- `Download Software Link` [OpenCM IDE]

# [References](#references)

## [Recovery Mode](#recovery-mode)

- If the board does not work due to corrupted firmware, you can force downloading default firmware from Roboplus Manager 1.0 / 2.0. Sketches also can be downloaded from Arduino IDE, OpenCM IDE.
- Disconnect other power sources and devices from OpenCM9.04. While holding down the User Button of OpenCM9.04, connect the board directly to PC with USB cable.

  ![](/assets/images/sw/mobile/mini_firmware_02.jpg)
  > User Button

  ![](/assets/images/parts/controller/openrb-150/openrb-150_08.png)

- If you enter recovery mode as shown below, the green LED will be turned on. When download is completed normally, the board will be reset and the green LED is turned off.

  ![](/assets/images/parts/controller/openrb-150/recovery_led.jpg)

**NOTE** [R+Manager 2.0 Firmware Recovery](/docs/en/software/rplus2/manager/#firmware-recovery).
{: .notice}

## [Windows Driver Installation](#windows-driver-installation)
- See [How to install ROBOTIS virtual COM port for Windows]{: .popup} 

<!-- 
## [Using DYNAMIXEL-X](#using-dynamixel-x)

To use ROBOTIS [software](/docs/kr/software/#roboplus-r) with DYNAMIXEL-X series on OpenCM 9.04 or OpenCM485 EXP board with OpenCM9.04, [Configuring DYNAMIXEL Channle](#configuring-dynamixel-channel) is required.

**NOTE**: [Arduino IDE](#arduino-ide) does not require DYNAMIXEL Channel configuration.
{: .notice}

**NOTE**: With OpenCM485 EXP Board, DYNAMIXEL-X with 24V and RS485 Communication Port can be used.  
![](/assets/images/sw/rplus2/manager/rplusmanager2_30_kr.jpg)  
{: .notice}

### [Configuring DYNAMIXEL Channel](#configuring-dynamixel-channel)

-->

{% include en/parts/controller/opencm904_dxl_channel.md %}

## [Dimension](#dimension)

![](/assets/images/parts/controller/openrb-150/openrb-150_28.png)

{% include en/dxl/download_center_notice.md %}

[DYNAMIXEL Communication Bridge]: /docs/en/parts/interface/dxl_bridge/