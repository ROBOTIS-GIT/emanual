---
layout: archive
lang: en
ref: opencmide_api_reference
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/opencm_ide/api_reference/
sidebar:
  title: OpenCM IDE
  nav: "opencmide"
---

<div style="counter-reset: h1 3">
</div>

# [API References](#api-references)

## [EEPROM Class](#eeprom-class)

The STM32 micro-processor of OpenCM9.04 will read and write user data directly on the flash memory.  
Flash memory reads and writes by unit of a page so the EEPROM Class can be used to permanently save user data by unit of bytes.  
Flash memory also preserves its data even if the power is turned off.  
From the total of 128Kbyte of flash memory of the OpenCM9.04, the EEPROM Class can only use 2Kbyte (0x0801F800~0x08001FFFF). 2Kbyte corresponds to 2 Pages.

```c
class EEPROM
```

This is the EEPROM Class, and since it is not predefined you need to create an instance variable in order to use it.
 
```c
void EEPROM::begin()
```

Performs initialization for the access of the flash memory. In order to use EEPROM this must be performed in setup().
 
```c
uint16 EEPROM::write(int vAddress, int data)
```

This is the method used to write on the 2kbyte of EEPROM field assigned to the flash memory of STM32. EEPROM data is composed as an address-data pair. The address uses an unsigned integer value of 2 bytes arbitrarily and saves them in order.
  - vAddress : A virtual address value composed of an unsigned integer value of 2 bytes. Access is made by vAddress when reading data.
  - data : 2byte data to be saved in the virtual address(vAddress).
 
```c
int EEPROM::read(int vAddress)
```

Reads and returns the data saved in the virtual address vAddress.
 
```c
void EEPROM::erase(int page)
```

Erases EEPROM by unit of a page(1Kbyte).
 
```c
void EEPROM::eraseAll()
```

Erases all the pages of EEPROM.
 
### Example
 
An instance variable of the EEPROM Class has to be defined in order to use the EEPROM memory. It is provided in the form of a library so it is necessary to write #include “EEPROM.h”.

```c
#include "EEPROM.h"
EEPROM myEEPROM;
#include "EEPROM.h"
EEPROM myEEPROM;
void setup(){  
  myEEPROM.begin();
  for(int i=0;i < 10;i++){
    myEEPROM.write(i,i*2);  // write i*2 to virtual address 0~9
  }
}
void loop() {
for(int i=0;i < 10;i++){
    SerialUSB.print("EEPROM Example = ");
    SerialUSB.println(myEEPROM.read(i));  // read data from virtual address 0~9
  }
}
```

## [BKP Class](#bkp-class)

The STM32 micro-processor of OpenCM9.04 contains ten Backup Register(BKP) memories of 16bit each that can save user data.  
The Backup Register memory preserves the data as long as the power is maintained so even if the processor is restarted by a hard or soft reset the data will be preserved.  
However completely removing the power will make the data disappear. The BKP memory is very useful when using data from previous operational conditions even after a system reset.

```c
class BKP
```

This is the BKP(Backup Register) Class, and since it is not predefined you need to create an instance variable in order to use it.

```c 
void BKP::begin()
```

Set up a BKP object for controlling backup register. This method must be called before attempting to use the BKP object (typically, you call this in your setup() function).
 
```c
uint16 BKP::write(uint8 reg, uint16 wData)
```

This is the method used to save 2byte(16bit) data on the Backup Register.
  - reg : This is the Backup Register address and a value between 1 and 10 can be used.
  - wData : This signifies the 2byte(16bit) data to be saved in the Backup Register.

```c 
void BKP:: write(uint8 reg, uint8 bData)
```

This is the method used to save a 1byte data on the Backup Register.
- reg : This is the Backup Register address and a value between 1 and 10 can be used.
- bData : This signifies a 1byte(8bit) data to be saved in the Backup Register.
 
```c
void BKP:: write(uint8 reg, int wData)
```

This is the method used to save an Integer(4byte) data on the Backup Register. It does not save the whole of the 4bytes but rather only the low-order 2bytes, so you must be cautious of data loss.
  - reg : This is the Backup Register address and a value between 1 and 10 can be used.
  - wData : This signifies a Integer data to be saved in the Backup Register.

```c
void BKP::enable()
```

You must use enable() in order to write data in the Backup Register. However reading data can be done regardless of the use of enable().
 
```c
void BKP::disable()
```

You must use disable() after you are done writing in the Backup Register. Again, reading data can be done regardless of the use of disable().
 
### Example
 
An instance variable of the BKP Class has to be defined in order to use the BKP memory. It is provided in the form of a library so it is necessary to write #include “BKP.h”.
 
```c
#include "BKP.h"
BKP BKP_MEMORY;
```

You must use the enable() method to activate the Backup Register in order to have write access to the BKP memory. After you finish with the write access you must use the disable() method to deactivate the Backup Register. You can use the read() method to read data regardless of the use of enable() or disable().
 
```c
void setup() {
 /* Initialize clock and registers for BKP*/
  BKP_MEMORY.begin();
  /* If you want to write data to BKP registers, you need to execute enable method */
  BKP_MEMORY.enable();
  for(i=1; i<11;i++){
    BKP_MEMORY.write(i,i*10);//CM-900 and CM-904 has only 1~10 BKP registers(16-bit)
  }
  /* After writing data, must be disabled writing data to BKP Register*/
BKP_MEMORY.disable();
}
void loop() {
for(i=1; i<11;i++){
    /* You can check the data written in setup() using SerialUSB*/
    SerialUSB.print("BKP Memory example = ");
    /* Just to read data from BKP, pass BKP register number(1~10) to read() method */
    SerialUSB.println(BKP_MEMORY.read(i));
  }
}
```

## [RC100 Class](#rc100-class)

This is a Class that facilitates the use of RC100 in OpenCM9.04 and CM-900. It can be operated in two modes as shown below.
1. Remote control using Zigbee or Bluetooth
2. Remote control using Infrared
 
Each button of the RC100 is already defined as shown below, making them convenient to use.

```c
#define RC100_BTN_U       (1)
#define RC100_BTN_D       (2)
#define RC100_BTN_L        (4)
#define RC100_BTN_R       (8)
#define RC100_BTN_1       (16)
#define RC100_BTN_2       (32)
#define RC100_BTN_3       (64)
#define RC100_BTN_4       (128)
#define RC100_BTN_5       (256)
#define RC100_BTN_6       (512)
```

```c
class RC100
```

This is the RC100 Class, and since it is not predefined you need to create an instance variable in order to use it.

```c
void RC100::begin(int num)
```

Initializes Serial2 in order to use the RC100.
- num : Decides the operation mode of RC100. When set to 1 it will operate by Zigbee or Bluetooth wireless module, and when set to 2 it will operate by Infrared wireless module.
 
```c
void RC100::end(void)
```
Finishes the use of devices of the RC100 Class. It disables the Serial2 device.

```c
int RC100::available()
```

If there is a received data from the RC100, then it returns the number of bytes of the received data.
 
```c
int RC100::readData()
```

Returns the analyzed data of the received data packet.
 
```c
int RC100::writeData(int data)
```

Sends a packet data to the RC100. The RC100 cannot receive data so it is used when exchanging data in RC100 packets with a PC or smart device.
 
```c
void RC100::writeRaw(byte temp)
```

Sends raw data as it is, not as a packet data.
 
```c
byte RC100::readRaw(void)
```

Receives raw data as it is without packet analysis.
 
### Example
 
An instance variable of the RC100 Class has to be defined in order to use the RC100 Class. It is provided in the form of a library so it is necessary to write #include “RC100.h”.
 
```c
#include "RC100.h"
RC100 Controller;
```

As with the Serial device, you use the available() method to detect whether there is any received data and then use the readData() method to receive the real data that has been processed from the received packet data.
 
```c
#include <RC100.h>
RC100 Controller;
#define WIRELESS_MODE    1
#define IR_MODE          2
void setup(){  
  pinMode(BOARD_LED_PIN, OUTPUT);
  Controller.begin(IR_MODE); // RC100 init as IR mode
}
int RcvData =0;
void loop() {
if(Controller.available()){
      RcvData = Controller.readData(); // 패킷 데이터를 분석한 실제 데이터를 받아온다.
      SerialUSB.print("RcvData = ");
      SerialUSB.println(RcvData);
      if(RcvData & RC100_BTN_1)
      digitalWrite(BOARD_LED_PIN,LOW); // RC100의 버튼1을 누르면 Status LED ON
      delay(100);
   }
  digitalWrite(BOARD_LED_PIN,HIGH);
}
```

## [Interrupt](#interrupt)

### attachInterrupt()

Used to specify a function to call when an external interrupt occurs.
 
```c
void attachInterrupt(uint8 pin, voidFuncPtr handler, ExtIntTriggerMode mode)
```
 
Registers an interrupt handler on a pin. The interrupt will be triggered on a given transition on the pin, as specified by the mode parameter. The handler runs in interrupt context. The new handler will replace whatever handler is currently registered for the pin, if any.
 
#### Parameters
- pin : OpenCM GPIO pin number.
- handler : Function to run upon external interrupt trigger. The handler should take no arguments, and have void return type.
- mode : Type of transition to trigger on, e.g. falling, rising, etc.
- ExtIntTriggerMode enum : The kind of transition on an external pin which should trigger an interrupt.
  - RISING : To trigger an interrupt when the pin transitions LOW to HIGH.
  - FALLING : To trigger an interrupt when the pin transitions HIGH to LOW.
  - CHANGE : To trigger an interrupt when the pin transitions from LOW to HIGH or HIGH to LOW (i.e., when the pin changes).
 
**NOTE** : You should set the pin mode of your desired pin to an input mode (e.g. INPUT, INPUT_PULLUP, INPUT_PULLDOWN). Because the function will run in interrupt context, inside of it, delay() won’t work, and the value returned by millis() will not increment. Serial data received while in the function may be lost. You should declare as volatile any global variables that you modify within the attached function.
{: .notice}

#### Return Values
- None
 
#### Example
The following example blinks the LED any time pin 0 changes from HIGH to LOW or vice versa.
 
```c
volatile int state = LOW; // must declare volatile, since it's
                          // modified within the blink() handler
void setup() {
    pinMode(BOARD_LED_PIN, OUTPUT);
    pinMode(0, INPUT);
    attachInterrupt(0, blink, CHANGE);
}
void loop() {
    digitalWrite(BOARD_LED_PIN, state);
}
void blink() {
    if (state == HIGH) {
        state = LOW;
    } else { // state must be LOW
        state = HIGH;
    }
}
```

In this example, the function blink() is the interrupt handler. Whenever the state on pin 0 changes, blink() gets called.  
It reacts to the change by changing the state variable to LOW if it is HIGH, and to HIGH if it is LOW. It then exits,  
letting the board get back to calling loop(). Since loop() sets the LED pin to whatever state is, changing the voltage on pin 0 will toggle the LED.

```c
Serial, SerialUSB attachInterrupt method
```

You can attach a user interrupt using the attachIntterupt method in Serial1,2,3 and SerialUSB.

```c
void HardwareSerial::attachInterrupt(voidFunctionPtrUart handler)
```

Attach user interrupt to Serial devices, ROBOTIS implemented
 
```c
typedef void (*voidFuncPtrUart)(byte);
 
void HardwareSerial::detachInterrupt(void)
```

Disable user interrupt to Serial devices, ROBOTIS implemented
 
```c
void USBSerial::attachInterrupt(voidFuncPtrUsb handler)
```

Attach user interrupt to USB peripheral.
 
```c
typedef void (*voidFuncPtrUsb)(byte*, byte );

void USBSerial::detachInterrupt(void)
```
Disable user interrupt to USB peripheral.
 
See : Serial, SerialUSB

### detachInterrupt()

Used to disable an interrupt specified with attachInterrupt().
 
```c
void detachInterrupt(uint8 pin)
```
 
#### Parameters
- pin : Number of pin to configure

#### Return Values
- None
 
### interrupts()

Re-enables interrupts (after they’ve been disabled by noInterrupts()). Interrupts allow certain important tasks to happen in the background, and certain interrupts are enabled by default.  
Some functions will not work while interrupts are disabled, and both incoming and outgoing communication may be ignored.  
Interrupts can slightly disrupt the timing of code, however, and may be disabled for particularly critical sections of code.
 
```c
void interrupts()
```

#### Parameters

- None
 
#### Return Values
 
- None
 
#### Example

```c
void setup() {}
void loop() {
  noInterrupts();
  // critical, time-sensitive code here
  interrupts();
  // other code here
}
```

### nolnterrupts()

Disables interrupts. Interrupts allow certain important tasks to happen in the background and are enabled by default.  
Some functions will not work while interrupts are disabled, and incoming communication may be ignored.  
Interrupts can slightly disrupt the timing of code, however, and may be disabled for particularly critical sections of code.
 
```c
void noInterrupts()
```

#### Parameters
 
- None
 
#### Return Values
 
- None
 
#### Example

```c
void setup() {}
void loop() {
  noInterrupts();
  // critical, time-sensitive code here
  interrupts();
  // other code here
}
```

`License and Attribution`  
Portions of this page were adapted from the Maple Reference Documentation, which is released under aCreative Commons Attribution-ShareAlike 3.0 License.

## [GPIO](#gpio)

### pinMode()

Configure behavior of a GPIO pin.
 
```c
void pinMode(uint8 pin, WiringPinMode mode);
```

#### Parameters
- pin : Number of pin to configure.
- mode : Mode corresponding to desired pin behavior(WiringPinMode enum).
  - OUTPUT : Basic digital output: when the pin is HIGH, the voltage is held at +3.3v (Vcc) and when it is LOW, it is pulled down to ground.
  - OUTPUT_OPEN_DRAIN : In open drain mode, the pin indicates “low” by accepting current flow to ground and “high” by providing increased impedance. An example use would be to connect a pin to a bus line (which is pulled up to a positive voltage by a separate supply through a large resistor). When the pin is high, not much current flows through to ground and the line stays at positive voltage; when the pin is low, the bus “drains” to ground with a small amount of current constantly flowing through the large resistor from the external supply. In this mode, no current is ever actually sourced from the pin.
  - INPUT : Basic digital input. The pin voltage is sampled; when it is closer to 3.3v (Vcc) the pin status is high, and when it is closer to 0v (ground) it is low. If no external circuit is pulling the pin voltage to high or low, it will tend to randomly oscillate and be very sensitive to noise (e.g., a breath of air across the pin might cause the state to flip).
  - INPUT_ANALOG : This is a special mode for when the pin will be used for analog (not digital) reads. Enables ADC conversion to be performed on the voltage at the pin.
  - INPUT_PULLUP : The state of the pin in this mode is reported the same way as with INPUT, but the pin voltage is gently “pulled up” towards +3.3v. This means the state will be high unless an external device is specifically pulling the pin down to ground, in which case the “gentle” pull up will not affect the state of the input.
  - INPUT_PULLDOWN : The state of the pin in this mode is reported the same way as with INPUT, but the pin voltage is gently “pulled down” towards 0v.
  This means the state will be low unless an external device is specifically pulling the pin up to 3.3v, in which case the “gentle” pull down will not affect the state of the input.
  - INPUT_FLOATING : Synonym for INPUT.
  - PWM : This is a special mode for when the pin will be used for PWM output (a special case of digital output).
  - PWM_OPEN_DRAIN : Like PWM, except that instead of alternating cycles of LOW and HIGH, the voltage on the pin consists of alternating cycles of LOW and floating (disconnected).

#### Return Values

- None
 
#### Example
This example uses pinMode() to set up the pin connected to the built-in LED as an output. Once this is done,digitalWrite() can be used to turn the pin HIGH and LOW, which turn the LED on and off.

```c
void setup() {
    pinMode(BOARD_LED_PIN, OUTPUT);      // sets the LED pin as output
}
void loop() {
    digitalWrite(BOARD_LED_PIN, HIGH);   // sets the LED on
    delay(1000);                         // waits for a second
    digitalWrite(BOARD_LED_PIN, LOW);    // sets the LED off
    delay(1000);                         // waits for a second
}
```

#### Arduino Compatibility
 
On OpenCM, pinMode() supports the INPUT and OUTPUT modes in the same way as Arduino (however, remember that the OpenCM, as a 3.3V device, will only drive 3.3V to an OUTPUT pin that has been set HIGH, instead of 5V like on Arduino).  
INPUT_ANALOG and PWM modes were added because the OpenCM doesn’t separate the analog and digital pins the same way Arduino does.  
Unlike on Arduino, you must call pinMode() to set up a pin for these purposes before a call to, e.g., analogRead(). This should only add a few lines to your setup() function.

### digitalWrite()

Write a HIGH or a LOW value to a pin configured as OUTPUT. The pin must have its mode set to OUTPUT or OUTPUT_OPEN_DRAIN. If the pin has been configured as an OUTPUT with pinMode() its voltage will be set to the corresponding value: 3.3V for HIGH, and 0V (ground) for LOW.
  
```c
void digitalWrite(uint8 pin, uint8 value)
```

#### Parameters
- pin : Pin to write to.
- value : Either LOW (write a 0) or HIGH (write a 1).
  - see pinMode()
 
#### Return Values
- None

See Also
 
- pinMode (링크)
- digitalRead(링크)
- BOARD_LED_PIN(링크)
- toggleLED() (링크)
- togglePin() (링크)
 
#### Example
The following example sets the built-in LED pin to HIGH, makes a one-second-long delay, sets the pin back to LOW, and delays again, causing a blinking pattern (you could also use toggleLED()):
 
```c
void setup() {
  pinMode(BOARD_LED_PIN, OUTPUT);      // sets the digital pin as output
}
void loop() {
  digitalWrite(BOARD_LED_PIN, HIGH);   // sets the LED on
  delay(1000);                         // waits for a second
  digitalWrite(BOARD_LED_PIN, LOW);    // sets the LED off
  delay(1000);                         // waits for a second
}
```

### digitalRead()

Reads the value from a specified digital pin, either HIGH or LOW. The pin must have its mode set to one of INPUT, INPUT_PULLUP, and INPUT_PULLDOWN. If the pin isn’t connected to anything, digitalRead() can return either HIGH or LOW (and this will change in a way that seems random).
 
```c
uint32 digitalRead(uint8 pin)
```
 
#### Parameters
- pin : Pin to read from (see pinMode())

#### Return Values
- LOW(0) or HIGH(1).
 
#### Example
The following example turns the LED on or off when the button is pressed:

```c 
void setup() {
  pinMode(BOARD_LED_PIN, OUTPUT);
  pinMode(BOARD_BUTTON_PIN, INPUT_PULLDOWN);
}
void loop() {
  int val = digitalRead(BOARD_BUTTON_PIN);   // reads the input pin
  digitalWrite(BOARD_LED_PIN, val); //write val to BOARD_LED_PIN
}
```

### analogRead()

Read an analog value from pin. This function blocks during ADC conversion, and has 12 bits of resolution. The pin must have its mode set to INPUT_ANALOG.  
Reads the value from the specified analog pin. The OpenCM boards contain 16-channel, 12-bit analog to digital converters.  
This means that a converter will map input voltages between 0 and 3.3 volts into integer values between 0 and 4095.  
However, a number of factors interfere with getting full accuracy and precision.  

The Arduino board contains a 6 channel (8 channels on the Mini and Nano, 16 on the Mega), 10-bit analog to digital converter with an input voltage range of 0V–5V.  
This means that it will map input voltages between 0 and 5 volts (which is larger than OpenCM’s range of 0V-3.3V) into integer values between 0 and 1023 (which is smaller than the OpenCM’s range of 0–4095).  
 
```c
uint16 analogRead(uint8 pin)
```

#### Parameters

- pin : Pin to read from.(see pinMode())
 
The pin parameter is the number of the analog input pin to read from.
The pins which support analog to digital conversion have ANALOG IN printed in silkscreen above them in the OpenCM9.04 PCB’s TOP-side.
 
#### Return Values
 
- Converted voltage, in the range 0–4095, (i.e. a 12-bit ADC conversion).
 
#### Example
 
```c
int analogPin = 3;     // Potentiometer wiper (middle terminal) connected
                       // to analog pin 3. outside leads to ground and +3.3V.
                       // You may have to change this value if your board
                       // cannot perform ADC conversion on pin 3.
int val = 0;           // variable to store the value read
void setup() {
  pinMode(analogPin, INPUT_ANALOG); // set up pin for analog input
}
void loop() {
  val = analogRead(analogPin);    // read the input pin
  SerialUSB.println(val);         // print the value, for debugging with
  delay(100);                     // a serial monitor
}
```

### analogWrite()

analogWrite() is used to create a PWM wave on a pin. You can use this to make an LED get brighter or dimmer, control a servomotor, etc.  analogWrite() is an alias for pwmWrite()  
you must set up the pin for PWM output using pinMode(), with argument PWM. This also means that you can’t later call digitalRead() or digitalWrite() on that pin(unless some time in between, you use pinMode() to reconfigure that pin for INPUT or OUTPUT; see the pinMode() page for more information).
 
```c
void analogWrite(uint8 pin, uint16 duty_cycle)
```
 
#### Parameters
- pin : PWM output pin
- duty_cycle : Duty cycle to set. Using Arduino’s analogWrite(), the duty cycle ranges between 0–255 (always off – always on). Using OpenCM’s analogWrite() or pwmWrite(), the duty cycle ranges from 0–65,535 by default

#### Return Values
- None
 
#### Example
Sets the output to the LED proportional to the value read from the potentiometer:

```c 
int analogPin = 3;    // potentiometer connected to analog pin 3
void setup() {
  pinMode(BOARD_LED_PIN, PWM);   // sets the LED pin as output
  pinMode(analogPin, INPUT_ANALOG); // sets the potentiometer pin as
                                    // analog input
}
void loop() {
  int val = analogRead(analogPin);        // read the input pin
  analogWrite(BOARD_LED_PIN, val * 16);  // analogRead values go from 0
                                      // to 4095, pwmWrite values
                                      // from 0 to 65535, so scale roughly
}
```

#### Arduino Compatibility
 
The frequency of the PWM signal (i.e., the frequency of a complete on/off cycle) on the Arduino is approximately 490 Hz.  
On the Maple, the frequency is configurable, defaulting to about 1100 Hz, or 1.1 KHz. This is because the PWM frequency is the frequency of the timer which controls PWM output on the particular pin (the PWM tutorial has the details).

If your application definitely requires Arduino’s PWM frequency, then the steps are:
 
1. Figure out which timer controls PWM output on your pin (your board’s Timer Pin Map is your friend here).
2. Let’s say it’s timer n, where n is some number. You’ll then need to put “HardwareTimer timer(n);” with your variables, as described in the HardwareTimer reference.
3. In your setup(), put “timer.setPeriod(2041);”. This will set the timer’s period to approximately 2041 microseconds, which is a frequency of approximately 490 Hz.
 
Be aware that this will change the period for the entire timer, and will affect anything else in your program that depends on that timer. The important examples are timer interrupts and PWM.
 
See Also
 
- PWM
- pwmWrite()

### togglepin()

Switches a digital output pin from HIGH to LOW, or from LOW to HIGH. The pin must have its mode set to OUTPUT.
 
```c
void togglePin(uint8 pin)
```
 
#### Parameters
 
- pin : the pin to toggle. If the pin is HIGH, set it LOW. If it is LOW, set it HIGH (see pinMode())
 
#### Return Values
- None
 
See Also
- toggleLED()
 
#### Example
This example uses togglePin() to pin 14, pin 14 is connected to built-in LED.
 
```c
void setup() {
    pinMode(14, OUTPUT);      // sets pin 14 as output
}
void loop() {
    togglePin(14); // toggles pin 14 every 100ms intervals
    delay(100);                         
}
```

### toggleLED()

Toggle the built-in LED: switch it from off to on, or on to off.
 
The LED must its mode set to OUTPUT. This can be accomplished portably over  OpenCM9.04 and CM-900 by calling pinMode(BOARD_LED_PIN, OUTPUT) before calling this function.
 
```c
void toggleLED()
```
 
#### Parameters
 
- None(see pinMode())


#### Return Values
 
- None
 
#### Example
This example sets up the board’s LED pin for output, then toggles the LED every 100 milliseconds:
 
```c
void setup() {
    pinMode(BOARD_LED_PIN, OUTPUT);
}
void loop() {
    toggleLED();
    delay(100);
}
```

See Also
 
- BOARD_LED_PIN
- togglePin()
 
`License and Attribution`   
Portions of this page were adapted from the Leaflabs Reference Documentation, which is released under a Creative Commons Attribution-ShareAlike 3.0 License.

## [OLLO Class](ollo-class)

This is a Class that facilitates the use of the 5-pin port of OpenCM9.04. Does not support CM-900.
 
```c
class OLLO
```

This is the OLLO Class, and since it is not predefined you need to create an instance variable in order to use it.

```c 
void OLLO::begin(int devNum)
```

Initializes the OLLO Class.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04.

```c
void OLLO::begin(int devNum, OlloDeviceIndex device_index)
```
Initializes the OLLO Class.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04.
- device_index : Specifies the type of device connected to the 5-pin port. For the OlloDeviceIndex data type please refer below.

```c
typedef enum OLLO_DEVICE_INDEX {
    IR_SENSOR,
    TOUCH_SENSOR,
    GYRO_SENOSR,
    DMS_SENSOR,
    PIR_SENSOR,
    MAGNETIC_SENSOR,
    COLOR_SENSOR,
    ULTRASONIC_SENSOR,
    LED_DISPLAY,
    TEMPERATURE_SENSOR
}OlloDeviceIndex;
```

```c
void OLLO::begin(int devNum, OlloDeviceIndex device_index, voidFuncPtr handler)
```

Initializes the OLLO Class. This initialization method is useful when using a touch sensor in an interrupt method.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04.
- device_index : Specifies the type of device connected to the 5-pin port.
- handler : Designates the interrupt handler to be connected with the touch(button) sensor. Please refer below for the handler’s function prototype.
 
```c
int OLLO::read(int devNum)
```

Reads and returns the ADC value of the device connected to the corresponding port.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04.
 
```c
int OLLO::read(int devNum, OlloDeviceIndex device_index)
```

Reads and returns the ADC value of the device connected to the corresponding port
- devNum : Inputs the number of the 5-pin port of OpenCM9.04.
- device_index : Specifies the type of device connected to the 5-pin port.
 
```c
void OLLO::write(int devNum, uint8 leftVal, uint8 rightVal)
```

This is a method to digitally output the SIG1, SIG2 pins of the corresponding port. This method is useful when the device to be used is an LED Display.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04. (1~4)
- leftVal : Sets the SIG1 pin as HIGH/LOW. You can put in either 0 or 1.
- rightVal : Sets the SIG2 pin as HIGH/LOW. You can put in either 0 or 1.
 
```c
void OLLO::write(int devNum, uint8 leftVal, uint8 centerVal, uint8 rightVal)
```

This is a method to digitally output the SIG1, ADC, SIG2 pins of the corresponding port.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04. (1~4)
- leftVal : Sets the SIG1 pin as HIGH/LOW. You can put in either 0 or 1.
- centerVal : Sets the ADC pin as HIGH/LOW. You can put in either 0 or 1.
- rightVal : Sets the SIG2 pin as HIGH/LOW. You can put in either 0 or 1.
 
```c
void OLLO::writeLED(int devNum, uint8 leftVal, uint8 rightVal)
```

This is a method to control the LED module.
- devNum : Inputs the number of the 5-pin port of OpenCM9.04. (1~4)
- leftVal : Used to turn the left LED on/off. The LED is turned on when set as LOW, and the LED is turned off when set as HIGH.
- rightVal : Used to turn the right LED on/off. The LED is turned on when set as LOW, and the LED is turned off when set as HIGH.
 
#### Example
 
An instance variable of the OLLO Class has to be defined in order to use the OLLO memory. It is provided in the form of a library so it is necessary to write #include “OLLO.h”.
 
```c
#include "OLLO.h"
 
OLLO myOLLO;
```
 
The instructions to use the basic sensor is shown below.
 
```c
#include <OLLO.h>
OLLO myOLLO;
#define PORT1 1
#define PORT2 2
void setup(){  
  myOLLO.begin(PORT1);  //Performs basic initialization of Port 1.
myOLLO.begin(PORT2);  //Performs basic initialization of Port 2.
}
void loop() {
SerialUSB.print("X-Axis ADC = ");
  SerialUSB.print(myOLLO.read(PORT1)); //read X-Axis ADC value from OLLO port 1
  SerialUSB.print("  Y-Axis ADC = ");
  SerialUSB.println(myOLLO.read(PORT1)); //read Y-Axis ADC value from OLLO port 2
  delay(60); //Prevents fast output.
}
```

An example of using the IR Sensor module is shown below.

```c
#include <OLLO.h>
OLLO myOLLO;
#define PORT1 1
void setup(){  
  myOLLO.begin(PORT1, IR_SENSOR);//Initializes Port 1 as an IR sensor module.
}
void loop() {
SerialUSB.print("IR Sensor ADC = ");
  SerialUSB.println(myOLLO.read(PORT1, IR_SENSOR)); //read ADC value from OLLO port 1
delay(60); //Prevents fast output.
}
```

```c
#include <OLLO.h>
OLLO myOLLO;
void setup(){
  myOLLO.begin(3);//LED Display Module must be connected at port 3.
}
void loop(){
  //write( port number, left LED(blue), right LED(yellow) )
  myOLLO.write(3,1,0);// or use myOLLO.writeLED(3,1,0);
  delay(100);
  myOLLO.write(3,0,1);// or use myOLLO.writeLED(3,0,1);
  delay(100);
}
```

The Color Sensor is initialized with COLOR_SENSOR.
 
The read() method returns the following result. The color value that is detected from Color Read= is output.
 
- 0 -> Error
- 1 -> White
- 2 -> Black
- 3 -> Red
- 4 -> Green
- 5 -> Blue
- 6 -> Yellow
 
```c
#include <OLLO.h>
OLLO myOLLO;
void setup(){
  myOLLO.begin(2,COLOR_SENSOR);//OLLO Color Module must be connected at port 2.
  
}
void loop(){
  SerialUSB.print("COLOR Read = ");
  SerialUSB.println(myOLLO.read(2, COLOR_SENSOR));
  delay(100);
}
```

## [Serial Class](#serial-class)

### Serial Class(Seial1, Serial2, Serial3)

All of the Serial[1,2,3] objects are instances of the HardwareSerial class, which is documented in this section. (This means that you can use any of these functions on any of Serial1, Serial2, and Serial3).
 
```c
class HardwareSerial
```

Serial port class. Predefined instances are Serial1, Serial2, and Serial3.
 
```c
void HardwareSerial::begin(unsigned int baud)
```

Set up a HardwareSerial object for communications. This method must be called before attempting to use theHardwareSerial object (typically, you call this in your setup() function).
 
```c
void HardwareSerial::end()
```

Disables the USART associated with this object, allowing any associated communication pins to be used for other purposes.
 
```c
unsigned int HardwareSerial::available()
```

Returns the number of bytes available for reading.

```c 
unsigned char HardwareSerial::read()
```

Returns the next available, unread character. If there are no available characters(you can check this withavailable), the call will block until one becomes available.
 
```c
void HardwareSerial::flush()
```

Throw away the contents of the serial port’s receiver (RX) buffer. That is, clears any buffered characters, so that the next character read is guaranteed to be new.
 
```c
void HardwareSerial::print(unsigned char b)
```

Print the given byte over the USART.
 
```c
void HardwareSerial::print(char c)
```

Print the given character over the USART. 7-bit clean characters are typically interpreted as ASCII text.
 
```c
void HardwareSerial::print(const char* str)
```

Print the given null-terminated string over the USART.
 
```c
void HardwareSerial::print(int n)
```

Print the argument’s digits over the USART, in decimal format. Negative values will be prefixed with a '-'character.
 
```c
void HardwareSerial::print(unsigned int n)
```

Print the argument’s digits over the USART, in decimal format.
 
```c
void HardwareSerial::print(long n)
```

Print the argument’s digits over the USART, in decimal format. Negative values will be prefixed with a '-'character.
 
```c
void HardwareSerial::print(unsigned long n)
```

Print the argument’s digits over the USART, in decimal format.
 
```c
void HardwareSerial::print(long n, int base)
```

Print the digits of n over the USART, in base base (which may be between 2 and 16). The base value 2 corresponds to binary, 8 to octal, 10 to decimal, and 16 to hexadecimal. Negative values will be prefixed with a'-' character.
 
```c
void HardwareSerial::print(double n)
```

Print n, accurate to 2 digits after the decimal point.
 
```c
void HardwareSerial::println(char c)
```

Like print(c), followed by "\r\n".
 
```c
void HardwareSerial::println(const char* c)
```

Like print(c), followed by "\r\n".
 
```c
void HardwareSerial::println(unsigned char b)
```

Like print(b), followed by "\r\n".
 
```c
void HardwareSerial::println(int n)
```

Like print(n), followed by "\r\n".
 
```c
void HardwareSerial::println(unsigned int n)
```

Like print(n), followed by "\r\n".
 
```c
void HardwareSerial::println(long n)
```

Like print(n), followed by "\r\n".
 
```c
void HardwareSerial::println(unsigned long n)
```

Like print(n), followed by "\r\n".
 
```c
void HardwareSerial::println(long n, int base)
```

Like print(n, b), followed by "\r\n".
 
```c
void HardwareSerial::println(double n)
```

Like print(n), followed by "\r\n".
 
```c
void HardwareSerial::println()
```

Prints "\r\n" over the USART.
 
```c
void HardwareSerial::write(unsigned char ch)
```

Sends one character over the USART. This function is currently blocking. This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.

```c
void HardwareSerial::write(const char* str)
```

Send the given null-terminated character string over the USART. This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.
 
```c
void HardwareSerial::write(void* buf, unsigned int size)
```

Writes the first size bytes of buf over the USART. Each byte is transmitted as an individual character. This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.
 
```c
int HardwareSerial::txPin()
```

Return the number of the TX (transmit) pin.
 
```c
int HardwareSerial::rxPin()
```

Return the number of the RX (receive) pin.
 
```c
void HardwareSerial::attachInterrupt(voidFunctionPtrUart handler)
```

Attach user interrupt to Serial devices, ROBOTIS implemented
 
```c
void HardwareSerial::detachInterrupt(void)
```

Disable user interrupt to Serial devices, ROBOTIS implemented
 
#### Arduino Compatibility
Unlike the Arduino, none of the OpenCM’s serial ports is connected to the USB port on the OpenCM board. If you want to communicate using the built-in USB port, use SerialUSB instead. You will need an additional USB-to-serial adapter to communicate between a USART and your computer.
 
##### Getting Started
First, decide which serial port you wish to use, and connect its pins to the device you’re communicating with. (The TX and RX pins for a serial port are labeled on your board’s silkscreen; for example, serial port 3 has pins labeled RX3", You can easily use the communication module with the 4pin communication port.).
 
The variable for controlling a serial port is the word Serial, plus the serial port’s number. For example,  you can control serial port 1 with the variable Serial1, serial port 2 with Serial2, and so on.
 
In order to get started using your serial port, you’ll first need to turn it on. Do this by calling your serial port’s begin() function, giving it the baud rate you wish it to communicate at. Put this call to begin() in your setup(), like in the following example:

One common use for serial ports is to print strings and other debugging information to a computer. You can print numbers or strings using print() and println() in your loop():
 
```c
void setup() {
    // 57600 is the baud rate to use.  The baud rate determines how
    // fast the communication goes.
    Serial2.begin(57600);
}
void loop() {
    // Communicate using Serial2 here
 Serial2.print("First, print this string.  Then print a number: ");
    Serial2.print(42);
    Serial2.print(".  You can print floating point values, too: ");
    Serial2.print(3.14);
    Serial2.println(". Using println() instead of print() ends the line.");
    Serial2.println("This sentence starts on a new line.");
}
```

```c
void setup() {
  //Initialize Serial2 as 57600 bps
  Serial2.begin(57600);
}
char temp=0;
void loop() {
  if(Serial2.available()){  // if data is available from Serial2
      temp = Serial2.read();  // read one byte data from Serial2
      Serial2.print(temp);    // print out the data to Serial2 device
  }
}
```

```c
void setup(){
  //Serial2 Serial initialize
  Serial2.begin(57600);
  //You can attach your serial interrupt
  //or, also detach the interrupt by detachInterrupt(void) method
  Serial2.attachInterrupt(serialInterrupt);
  pinMode(BOARD_LED_PIN, OUTPUT);  //toggleLED_Pin_Out
}
//Serial Interrupt type must have the below proto-type
//void interrupt_name (byte variable){}
void serialInterrupt(byte buffer){
  Serial2.print((char)buffer);
}
void loop(){
  toggleLED();
  delay(50);
}
```

### SerialUSB class

Used for communication between the OpenCM board and a computer.  
In addition to three serial ports, the OpenCM’s STM32 microprocessor includes a dedicated USB peripheral.  
This peripheral is used to emulate a regular serial port for use as a terminal and download a program to the board.  
Library access to the emulated serial port is provided through the SerialUSB object.  
You can mostly use SerialUSB as a drop-in replacement for Serial1, Serial2, and Serial3.  

{% capture opencm_warning_01 %} 
**WARNING** :  
The SerialUSB functionality includes a 50 millisecond timeout for writes, and does not try to detect if the USB host is “really” connected, or just enumerated and initialized.  
This means that if you have a number of calls to one of the SerialUSB write() or print() functions in your code, and you are not monitoring SerialUSB on a computer, your program will run much slower than if it is being monitored or totally disconnected (run off of a battery).  
You can avoid this behavior by deciphering the port status using the DTR and RTS line status (the behavior of these control lines is platform dependent and we no longer interpret them by default).  
{% endcapture %}

<div class="notice--warning">{{ opencm_warning_01 | markdownify }}</div>

The SerialUSB object is an instance of the USBSerial class, which is documented in this section.  
This means that you can use any of these functions by writing SerialUSB.functionName(arguments...).  
For example, to print the message “hello, world!”, you can write USBSerial.println("hello,world!").
 
```c
class USBSerial
```

Emulated serial-over-USB class. SerialUSB is the predefined (singleton) instance.
 
```c
USBSerial::begin()
```

Set up the USB peripheral for emulated serial communication. The peripheral is configured this way by default; calling this function should only be necessary if you have disabled the peripheral using SerialUSB.end().
 
```c
USBSerial::end()
```

Disables the USB peripheral. Note that using this function will terminate all USB communications between the OpenCM and the PC; in particular, it implies that you won’t be able to download any new programs without resetting the board or using recovery mode.
 
```c
unsigned int USBSerial::available()
```

Returns the number of bytes available for reading.
 
```c
unsigned char USBSerial::isConnected()
```

Returns 1 if USB is connected to host(or PC), otherwise returns 0.
 
```c
unsigned char USBSerial::read()
```

Returns the next available, unread character. If there are no available characters (you can check this with available), the call will block until one becomes available.
 
```c
USBSerial::print(unsigned char b)
```

Print the given byte over the USB connection.
 
```c
USBSerial::print(char c)
```

Print the given character over the USB connection. 7-bit clean characters are typically interpreted as ASCII text.
 
```c
USBSerial::print(const char* str)
```

Print the given null-terminated string over the USB connection.
 
```c
USBSerial::print(int n)
```

Print the argument’s digits over the USB connection, in decimal format. Negative values will be prefixed with a '-' character.
 
```c
USBSerial::print(unsigned int n)
```

Print the argument’s digits over the USB connection, in decimal format.
 
```c
USBSerial::print(long n)
```

Print the argument’s digits over the USB connection, in decimal format. Negative values will be prefixed with a '-' character.
 
```c
USBSerial::print(unsigned long n)
```

Print the argument’s digits over the USB connection, in decimal format.
 
```c
USBSerial::print(long n, int base)
```

Print the digits of n over the USB connection, in base base (which may be between 2 and 16). The base value 2 corresponds to binary, 8 to octal, 10 to decimal, and 16 to hexadecimal. Negative values will be prefixed with a '-' character.
 
```c
USBSerial::print(double n)
```

Print n, accurate to 2 digits after the decimal point.
 
```c
USBSerial::println(char c)
```

Like print(c), followed by "\r\n".
 
```c
USBSerial::println(const char* c)
```

Like print(c), followed by "\r\n".
 
```c
USBSerial::println(unsigned char b)
```

Like print(b), followed by "\r\n".
 
```c
USBSerial::println(int n)
```

Like print(n), followed by "\r\n".
 
```c
USBSerial::println(unsigned int n)
```

Like print(n), followed by "\r\n".
 
```c
USBSerial::println(long n)
```

Like print(n), followed by "\r\n".
 
```c
USBSerial::println(unsigned long n)
```

Like print(n), followed by "\r\n".
 
```c
USBSerial::println(long n, int base)
```

Like print(n, b), followed by "\r\n".
 
```c
USBSerial::println(double n)
```

Like print(n), followed by "\r\n".
 
```c
USBSerial::println()
```

Prints "\r\n" over the USB connection.
 
```c
USBSerial::write(unsigned char ch)
```

Sends one character over the USB connection. This function is currently blocking, although nonblocking writes are a planned future extension.
This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.
 
```c
USBSerial::write(const char* str)
```

Send the given null-terminated character string over the USB connection.This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.
 
```c
USBSerial::write(void* buf, unsigned int size)
```

Writes the first size bytes of buf over the USB connection. Each byte is transmitted as an individual character.   
This is a low-level function. One of the print() or println() functions is likely to be more useful when printing multiple characters, when formatting numbers for printing, etc.
 
```c
void USBSerial::attachInterrupt(voidFuncPtrUsb handler)
```

Attach user interrupt to USB peripheral.
 
```c
typedef void (*voidFuncPtrUsb)(byte*, byte );
 
void USBSerial::detachInterrupt(void)
```

Disable user interrupt to USB peripheral.
 
### Example
Safe print: This function should run smoothly and not block; the LED should blink at roughly the same speed whether being monitored, running from battery, or connected but not monitored.
 
```c
#define LED_PIN BOARD_LED_PIN
void setup() {
    /* Set up the LED to blink  */
    pinMode(LED_PIN, OUTPUT);
}
void loop() {
    // LED will stay off if USB is disconnected(battery power, etc.), and
    // will blink quickly if USB is plugged.
    if(SerialUSB.isConnected()) {
        digitalWrite(LED_PIN, 1);
    }
    delay(100);
digitalWrite(LED_PIN, 0);
    delay(100);
}
```
```c
volatile int nCount=0;
void setup() {
  //Initialize USB Serial
  SerialUSB.begin();
}
void loop() {
  //print "Hello World!!" to PC though USB Virtual COM port
  SerialUSB.println("Hello World!!");
  SerialUSB.print("nCount : "); // display nCount variable and increase nCount.
  SerialUSB.println(nCount++);//SerialUSB.print("\r\n");  
  
  delay(1000);
}
```

```c
void setup() {
  //Initialize USB Serial
  SerialUSB.begin();
}
char temp=0;
void loop() {
  if(SerialUSB.available()){  // if data is available from USB
      temp = SerialUSB.read();  // read one byte data from SerialUSB
      SerialUSB.print(temp);    // print out the data
  }
}
```

```c
void setup() {
  //Initialize USB Serial
  SerialUSB.begin();
}
char temp=0;
void loop() {
  if(SerialUSB.available()){  // if data is available from USB
      temp = SerialUSB.read();  // read one byte data from SerialUSB
      SerialUSB.print(temp);    // print out the data
  }
}
```

```c
void setup(){
  //USB Serial initialize
  SerialUSB.begin();
  //You can attach your serialUSB interrupt
  //or, also detach the interrupt by detachInterrupt(void) method
  SerialUSB.attachInterrupt(usbInterrupt);
  pinMode(BOARD_LED_PIN, OUTPUT);  //toggleLED_Pin_Out
}
//SerialUSB Interrupt type must have the below proto-type
//void interrupt_name (byte* buffer, byte nCount){}
//USB max packet data is maximum 64byte, so nCount can not exceeds 64 bytes
//int i=0;
void usbInterrupt(byte* buffer, byte nCount){
  SerialUSB.print("nCount =");
  SerialUSB.println(nCount);
  for(unsigned int i=0; i < nCount;i++)  //printf_SerialUSB_Buffer[N]_receive_Data
    SerialUSB.print((char)buffer[i]);
  SerialUSB.println("");
}
void loop(){
  toggleLED();
  delay(100);
}
```

`License and Attribution`  
Portions of this page were adapted from the Maple Reference Documentation, which is released under a Creative Commons Attribution-ShareAlike 3.0 License

## [API](#api)

### pinMode()

Configure behavior of a GPIO pin.
 
```c
void pinMode(uint8 pin, WiringPinModemode);
```
 
#### Parameters
- pin : Number of pin to configure.
- mode : Mode corresponding to desired pin behavior.

#### Return Values
- None
 
#### Example
This example uses pinMode() to set up the pin connected to the built-in LED as an output. Once this is done,digitalWrite() can be used to turn the pin HIGH and LOW, which turn the LED on and off.

```c
void setup() {
  pinMode(BOARD_LED_PIN, OUTPUT);      // sets the LED pin as output
}
void loop() {
  digitalWrite(BOARD_LED_PIN, HIGH);   // sets the LED on
  delay(100);                         // waits for a second
  digitalWrite(BOARD_LED_PIN, LOW);    // sets the LED off
  delay(100);                         // waits for a second
}
```

## [Utilities](#utilities)

### [millis()](#millis)

Returns the number of milliseconds since the board began running the current program. This number will overflow (go back to zero) after approximately 50 days.
 
```c
uint32 millis(void)
```

#### Parameters
 
- None (See: micros()(링크))
 
#### Return Values
 
- Returns time (in milliseconds) since the beginning of program execution. On overflow, restarts at 0.
 
#### Example
The following time prints the value returned by millis() roughly once per second:

```c 
unsigned int time;
void setup() {
}
void loop() {
  SerialUSB.print("Time: ");
  time = millis();
  // prints time since program started
  SerialUSB.println(time);
  // wait a second so as not to send massive amounts of data
  delay(1000);
}
```

Since the return value for millis() is an unsigned long, overflow errors may occur if you try to do math with other data types, such aschars.
 
Also See
 
- micros
- delay
- delayMicroseconds

### micros()

Returns the number of microseconds since the board began running the current program. This number will overflow (go back to zero), after approximately 70 minutes.
 
**NOTE** : There are 1,000 microseconds in a millisecond, and 1,000,000 microseconds in a second.
{: .notice}
 
```c
uint32 micros(void)
```
 
#### Parameters
 
- None (See: millis())
 
#### Return Values
 
- Returns time (in microseconds) since the beginning of program execution. On overflow, restarts at 0.
 
#### Example

```c
unsigned int time;
void setup() {
}
void loop() {
  SerialUSB.print("Time: ");
  time = micros();
  // prints time since program started
  SerialUSB.println(time);
  // wait a second so as not to send massive amounts of data
  delay(1000);
}
```
 
Also See
 
- millis()
- delay()
- delayMicroseconds()
 
### delay()

Pauses the program for at least a given number of milliseconds. (There are 1000 milliseconds in a second.)
Interrupts, etc. may cause the actual number of milliseconds to exceed ms. However, this function will return no less than ms milliseconds from the time it is called.
 
```c
void delay(unsigned long ms)
```
 
#### Parameters
 
- ms : the number of milliseconds to delay. (See: delayMicroseconds())

#### Return Values
 
- None
 
#### Example

```c
void setup() {
    // set up the built-in LED pin for output:
    pinMode(BOARD_LED_PIN, OUTPUT);
}
void loop() {
    digitalWrite(BOARD_LED_PIN, HIGH);   // sets the LED on
    delay(1000);                         // waits for a second
    digitalWrite(BOARD_LED_PIN, LOW);    // sets the LED off
    delay(1000);                         // waits for a second
}                                              
```

See Also
- millis()
- micros()
- delayMicroseconds()
 
### delayMicroseconds()

Pauses the program for the amount of time (in microseconds) specified as parameter.  
There are a thousand microseconds in a millisecond, and a million microseconds in a second.  
Interrupts, etc. may cause the actual number of microseconds to exceed us.  
However, this function will return no less than us microseconds from the time it is called.
 
```c
void delayMicroseconds(uint32 us)
```
 
#### Parameters
- us : the number of microseconds to delay.
 
#### Return Values
 
- None
 
#### Example

The following example shows how to read IR sensor module in ROBOTIS OLLO library.
 
```c
void setup() {
    pinMode(17, OUTPUT);      // sets the Emitting-LED pin as output
pinMode(2, INPUT_ANALOG);
}
void loop() {
    digitalWrite(7, HIGH);   // turn on emitting LED
    delayMicroseconds(15);            // waits for 15us
    int adc_value =anologRead(2);     // read ADC value from receiving LED
    SerialUSB.print(“IR ADC = ”);   // print out ADC value
SerialUSB.println(adc_value);
digitalWrite(7, LOW); // turn off emitting LED
}                                              
```

#### Arduino Compatibility
 
ROBOTIS cannot guarantee it will behave as the Arduino implementation down to the microsecond, especially for smaller values of us.  
The longest time delayMicroseconds() can delay is bounded by its argument type and the STM32 clock rate to be (2^32 - 1) / 12 microseconds, or less than 6 minutes. For longer pauses, use of delay() is possible.
 
See Also
- millis
- micros
- delay
 
### min()

(Macro) Calculates the minimum of two numbers.
 
```c
#define min(a,b)                ((a)<(b)?(a):(b))
```

#### Parameters
 
- a : the first number; may be any number or numeric expression
- b : the second number; may be any number or numeric expression.
 
#### Return Values
 
- The smaller of the two numbers.
 
#### Example

```c
sensVal = min(sensVal, 100); // assigns sensVal to the smaller of sensVal or 100
                             // ensuring that it never gets above 100.
```
 
Perhaps counter-intuitively, max() is often used to constrain the lower end of a variable’s range, while min() is used to constrain the upper end of the range.
 
**WARNING** : Because of the way min() is implemented, avoid using other functions inside the parentheses. It may lead to incorrect results:

min(a++, 100);   // avoid this - yields incorrect results
a++;            // use this instead -
min(a, 100);    // keep other operations outside min()
 
#### Arduino Compatibility
 
The OpenCM version of min() is compatible with Arduino and Maple.
 
See Also
- max()
- constrain()
 
### max()

(Macro) Calculates the maximum of two numbers.
 
```c
#define min(a,b)                ((a)<(b)?(a):(b))
```
 
#### Parameters
- a :  the first number; may be any number or numeric expression.
- b : the second number; may be any number or numeric expression.
 
#### Return Values
- The larger of the two parameter values.
 
#### Example

```c
sensVal = max(senVal, 20); // assigns sensVal to the larger of sensVal or 20
                           // (effectively ensuring that it is at least 20)
```
 
Perhaps counter-intuitively, max() is often used to constrain the lower end of a variable’s range, while min() is used to constrain the upper end of the range.
 
**WARNING** : Because of the way max() is implemented, avoid using other functions inside the parentheses. It may lead to incorrect results:
 
max(a--, 0);   // avoid this - yields incorrect results
a--;           // use this instead -
max(a, 0);     // keep other operations outside max()
 
#### Arduino Compatibility
 
The OpenCM version of max() is compatible with Arduino and Maple.
 
See Also
- min()
- constrain()
 
### abs()

(Macro) computes the absolute value of a number.
 
```c
#define abs(x) (((x) > 0) ? (x) : -(x))
```
 
#### Parameters
- x : the number.
 
#### Return Values
 
- x : if x is greater than or equal to 0.
- -x : if x is less than 0.
 
**WARNING** : Because of the way abs() is implemented, avoid using other functions or causing side effects inside the parentheses, as it may lead to incorrect results:
 
abs(a++);   // avoid this - yields incorrect results
abs(a);       // use this instead -
a++;          // keep other operations outside abs()
 
#### Arduino Compatibility
Maple’s implementation of abs() is compatible with Arduino.
 
### constrain()

(Macro) Constrains a number to be within a range.
 
```c
constrain(x, a, b)
```
 
#### Parameters
 
- x : the number to constrain
- a : the lower end of the range
- b :  the upper end of the range
 
#### Return Values
 
- x: if x is between a and b
- a: if x is less than a
- b: if x is greater than b
 
#### Example

```c
// limits range of sensor values to between 10 and 150:
sensVal = constrain(sensVal, 10, 150);
```

See Also
- min()
- max()
 
### map()

Re-maps a number from one range to another.  
That is, a value equal to fromStart gets mapped to toStart, a value of fromEnd to toEnd, and other values are mapped proportionately  
Does not constrain value to lie within [fromStart, fromEnd].  
If a “start” value is larger than its corresponding “end”, the ranges are reversed, so map(n, 1, 10, 10, 1) would reverse the range [1,10].  
Negative numbers may appear as any argument.
 
```c
long map(long value, long fromStart, long fromEnd, long toStart, long toEnd)
```

#### Parameters
- value : the value to map.
- fromStart : the beginning of the value’s current range.
- fromEnd : the end of the value’s current range.
- toStart :  the beginning of the value’s mapped range.
- toEnd :  the end of the value’s mapped range.
 
#### Return Values
- the mapped value.
 
#### Example

```c
/* Map an ADC reading (12 bits) to 16-bit PWM (0 to 65,535) */
void setup() {
    pinMode(0, INPUT_ANALOG);
    pinMode(9, PWM);
}
void loop() {
    int val = analogRead(0);
    val = map(val, 0, 4095, 0, 65535);
    analogWrite(9, val);
}
```
 
#### Discussion
map() does not constrain values to within the range, because out-of-range values are sometimes intended and useful.
The constrain()macro may be used either before or after this function, if limits to the ranges are desired.
 
Note that the “lower bounds” of either range may be larger or smaller than the “upper bounds” so that map() may be used to reverse a range of numbers; for example:
 
```c
y = map(x, 1, 50, 50, 1);
```
 
The function also handles negative numbers well, so that this example

```c
y = map(x, 1, 50, 50, -100);
```
 
is also valid.
 
The map() function uses integer math (its arguments and return values all have type long), so it will not generate fractions,
when the math might indicate that it should do so. Fractional remainders are truncated, and are not rounded or averaged.
 
See Also
- constrain()
 
### pow()

Calculates the value of a number raised to a power.
 
```c
double pow(double x, double y)
```

Compute an exponentiation.
 
#### Parameters
- x : the base. This value cannot be zero if y <= 0. This value cannot be negative if y is not an integral value.
- y : the exponent.
 
#### Return Values
 
- x raised to the power y.
 
#### Example

```c
void setup() {    
}
void loop() {
 for(int i=0;i<8;i++){
      SerialUSB.println(pow(2,i)); // print out 2^i
      delay(100);
    }
}
```
 
### sqrt()

Calculates the square root of a number. Compute the square root of a number.
 
```c
double sqrt(double x)
```

Compute an exponentiation.
 
#### Parameters
 
- x : The number whose square root to find. This value cannot be negative.
 
#### Return Values
 
- The square root of x. The return value is never negative.
 
#### Arduino Compatibility
The Maple versino of sqrt() is compatible with Arduino.
 
### sin()

Calculates the sine of an angle, in radians.
 
```c
double sin(double x)
```

Compute an exponentiation.
 
#### Parameters
- x : The radian measure of the angle.
 
#### Return Values
- The sine of x. This value will be between -1 and 1.
 
#### Arduino Compatibility
The OpenCM version of sin() is compatible with Arduino.
 
See Also
- cos
- tan
- float
- double
 
### cos()

Calculates the cosine of an angle, in radians.
 
```c
double cos(double x)
```

Compute an exponentiation.
 
#### Parameters
- x : The radian measure of the angle.
 
#### Return Values
- The cosine of x. This value will be between -1 and 1.
 
#### Arduino Compatibility
The OpenCM version of cos() is compatible with Arduino.
 
See Also
- cos
- tan
- float
- double
 
### tan()

Calculates the tangent of an angle, in radians
 
```c
double tan(double x)
```

Compute an exponentiation.
 
#### Parameters
- x : The radian measure of the angle.
 
#### Return Values
- The tangent of x. There are no limits on the return value of this function.
 
#### Arduino Compatibility
The OpenCM version of tan() is compatible with Arduino.
 
See Also
- cos
- tan
- float
- double
 
### randomSeed()

randomSeed() initializes the pseudorandom number generator, causing it to start at an arbitrary point in its random sequence. This sequence, while very long, and random, is always the same.
 
```c
void randomSeed(unsigned int seed)
```

#### Parameters
- seed : the number used to initialize the seed; cannot be zero.
 
#### Return Values
- None
 
#### Example
The following sketch initializes the random seed based on an ADC reading of pin 0.
If this pin is unconnected, the Sketch should print different values to the serial monitor each time it is run:
 
```c
long randNumber;
void setup() {
  pinMode(0, INPUT_ANALOG);
  randomSeed(analogRead(0));
}
void loop() {
  randNumber = random(300);
  SerialUSB.println(randNumber);
  delay(50);
}
```

If it is important for a sequence of values generated by random() to differ, on subsequent executions of a sketch, use randomSeed() to initialize the random number generator with a fairly random input, such as analogRead() on an unconnected pin.  
Conversely, it can occasionally be useful to use pseudorandom sequences that repeat exactly.  
This can be accomplished by callingrandomSeed() with a fixed number, before starting the random sequence.
 
See Also
- random()
 
### random()

The random() function generates pseudo-random numbers
 
```c
random(long max)
```

Same as a call to random(0, max).
 
```c
random(long min, long max)
```

Generate a pseudo-random number with given lower and upper bounds.
 
#### Parameters
- min : Lower bound on the returned value, inclusive
- max : Upper bound on the returned value, exclusive

#### Return Values
- A pseudo-random number in the range [min, max)
 
#### Example
The following sketch initializes the random seed based on an ADC reading of pin 0. If this pin is unconnected, the Sketch should print different values to the serial monitor each time it is run:
 
```c
long randNumber;
void setup() {
  pinMode(0, INPUT_ANALOG);
  randomSeed(analogRead(0));
}
void loop() {
  randNumber = random(300);
  SerialUSB.println(randNumber);
  delay(50);
}
```

See Also
- randomSeed()
 
 
### lowByte()

Extracts the low-order (rightmost) byte of a variable (e.g. a word).

```c
lowByte(x)
```
 
#### Parameters
- x : a value of any type. However, if a non-integral type is used, the results will be strange.
 
#### Return Values
 
- The low byte’s value (this will be between 0 and 255).
 
#### Example
This example uses lowByte, highByte to send 1 byte (at a time) to the Goal position address on the Dynamixel control table.
 
```c
Dynamixel Dxl(1);
void setup() {
    Dxl.begin(1);
}
int goal_pos = 1023;
void loop() {
Dxl.writeByte(1,30, lowByte(goal_pos));
    Dxl.writeByte(1,31, highByte(goal_pos));
 
    delay(1000);                         // waits for a second
}
```

### highByte()

(Macro) Extracts the second lowest byte of an integral data type.
  
```c
highByte(x)
```
 
#### Parameters
- x : a value of any integral type.
 
#### Return Values
 
- Second lowest byte in x
 
#### Example
This example uses lowByte, highByte to send 1 byte (at a time) to the Goal position address on the Dynamixel control table.
 
```c
Dynamixel Dxl(1);
void setup() {
    Dxl.begin(1);
}
int goal_pos = 1023;
void loop() {
Dxl.writeByte(1,30, lowByte(goal_pos));
    Dxl.writeByte(1,31, highByte(goal_pos));
 
    delay(1000);                         // waits for a second
}
``` 

#### Other example

```c
int x = 0xDEADBEEF;
SerialUSB.println(x, HEX); // prints "BE"
```
 
### bitRead()

(Macro) Gets the value of a bit in a number.
 
```c
bitRead(x, n)
```

#### Parameters
- x : the number from which to read the bit.
- n : which bit to read, starting at 0 for the least-significant (rightmost) bit
 
#### Return Values
- The value of the bit (0 or 1).
 
See Also
- bit()
- bitWrite()
- bitSet()
- bitClear()
 
### bitWrite()

(Macro) Writes a bit of a numeric variable.
 
```c
bitWrite(x, n, b)
```
 
#### Parameters
- x : the numeric variable whose bit to write.
- n : which bit of the number to write, starting at 0 for the least-significant (rightmost) bit.
- b : the value to write to the bit (0 or 1).
 
#### Return Values
 
- None
 
See Also
- bit()
- bitWrite()
- bitSet()
- bitClear()
 
### bitSet()

(Macro) Sets (writes a 1 to) a bit of a numeric variable.
 
```c
bitSet(x,n)
```
 
#### Parameters
- x : the numeric variable whose bit to set
- n : which bit to set, starting at 0 for the least-significant (rightmost) bit
 
#### Return Values
- None
 
See Also
- bit()
- bitRead()
- bitWrite()
- bitClear()
 
### bitClrear()

(Macro) Clears (writes a 0 to) a bit of a numeric variable.
 
```c
bitClear(x, n)
```

#### Parameters
 
- x : the numeric variable whose bit to clear
- n : which bit to clear, starting at 0 for the least-significant (rightmost) bit
 
#### Return Values
 
- None
 
See Also
- bit()
- bitRead()
- bitWrite()
- bitSet()
 
### bit()

(Macro) Computes the value of an (unsigned) integer with the specified bit set (bit(0) is 1, bit(1) is 2, bit(2) is 4, then 8, 16, 32, etc.).
 
```c
bit(n)
```
 
#### Parameters
- n : the bit to set.
 
#### Return Values
 
- The value of an integer with the given bit set.
 
See Also
- bitRead()
- bitWrite()
- bitSet()
- bitClear()
 
`License and Attribution`   
Portions of this page were adapted from the Maple Reference Documentation, which is released under aCreative Commons Attribution-ShareAlike 3.0 License.
