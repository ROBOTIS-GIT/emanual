**Last Modified** : Feburary 22nd, 2021

# CM-550 MicroPython API  

## **Table of Contents**

**[Abstract](#abstract)**  

**[pycm module](#pycm-module)**  
- [Definition](#definition)
- [How to use](#how-to-use)

**[System Functions](#system-functions)**  
- [delay()](#delay)
- [console()](#console)
- [print()](#print)

**[Submodule of pycm(CM-550)](#submodule-of-pycmcm-550)**
- [buzzer](#buzzer)
  - [buzzer.melody()](#buzzermelody)
  - [buzzer.wait()](#buzzerwait)
  - [buzzer.note()](#buzzernote)
- [led](#led)
  - [led.set()](#ledset)
  - [led.toggle()](#ledtoggle)
  - [Constant values for led](#constant-values-for-led)
- [button](#button)
  - [button.pressed()](#buttonpressed)
  - [button.released()](#buttonreleased)
  - [button.millis()](#buttonmillis)
  - [button.seconds()](#buttonseconds)
- [imu](#imu)
  - [eeprom.imu_type(direction)](#eepromimutypedirection)
  - [imu.accel_x() / imu.accel_y() / imu.accel_z()](#imuaccelx--imuaccely--imuaccelz)
  - [imu.gyro_x() / imu.gyro_y() / imu.gyro_z()](#imugyrox--imugyroy--imugyroz)
  - [imu.roll()](#imuroll)
  - [imu.pitch()](#imupitch)
  - [imu.yaw()](#imuyaw)
- [mic](#mic)
  - [mic.counting()](#miccounting)
  - [mic.counted()](#miccounted)
  - [mic.clear()](#micclear)
- [rc](#rc)
  - [rc.received()](#rcreceived)
  - [rc.read()](#rcread)
  - [Constant values for rc](#constant-values-for-rc)
- [motion](#motion)
  - [motion.wait()](#motionwait)
  - [motion.play()](#motionplay)
  - [motion.status()](#motionstatus)
  - [motion.count()](#motioncount)
- [OLLO APIs](#ollo-apis)
  - [OLLO()](#ollo)
  - [object.read()](#objectread)
  - [object.write()](#objectwrite)
  - [Constant values for OLLO](#constant-values-for-ollo)

# [Abstract](#abstract)

This is MicroPython APIs documentation of the ROBOTIS CM-550 controller.

# [pycm module](#pycm-module)  

## [Definition](#definition)

pycm is a module for controlling CM-550 hardware with MicoroPython, and it contains submodules for each function such as pycm.buzzer and pycm.led.

## [How to use](#how-to-use)

### Example 1

pycm can be omitted when using its submodules.

```py
# import pycm and all its submodules
from pycm import *

# Turn on Green LED
led.set(const.GREEN)
delay(1000)
```

### Example 2

pycm should be specified when using submodules

```py
# import pycm module only
import pycm

# Turn on Green LED (pycm must be specified before led module)
pycm.led.set(const.GREEN)
delay(1000)
```

# [System Functions](#system-functions)  

## [delay()](#delay)

### Description

wait for specified length of time (unit : 0.001 sec)

### Syntax

- delay(ms)

### Parameters

- ms: type: uint32_t, unit: milliseconds

### Returns

- None

### Example

```py
# wait for 0.8 sec
delay(800)
```

## [console()](#console)

### Description

Configure communication port for print() function

### Syntax

- console(port)

### Parameters

- port: const.BLE(default port) / const.USB / const.UART

### Returns

- None

### Example

```py
# print through BLE
console(const.BLE)

# print through USB
console(const.USB)

# print through UART(4 pin port)
console(const.UART)
```

## [print()](#print)

### Description

print number and/or text

### Syntax

- print(content)

### Parameters

- content: number OR string

### Returns

- None

### Example

```py
# Change line after print
print('Print with newline')

# Do not change line after print
print('without new line ', end = '')

# print the value of a variable
n = 791
print(n)

# print several values with SPACE between them
print('string', 1024, n)

# print several values without SPACE between them
print('string', 1024, n, sep='')
```

# [Submodule of pycm(CM-550)](#submodule-of-pycmcm-550)

Unless otherwise specified, the data type of function parameter is integer.

## [buzzer](#buzzer)

### [buzzer.melody()](#buzzermelody)

#### Description

play the melody of specified index number

#### Syntax

- buzzer.melody(index)

#### Parameters

- index : 0 ~ 25

#### Returns

- None

#### Example

- See the example of buzzer.wait()

### [buzzer.wait()](#buzzerwait)

#### Description

wait until melody or scale playing is finished

#### Syntax

- buzzer.wait()

#### Parameters

- None

#### Returns

- None

#### Example

```py
from pycm import *


# play No. 1 melody
buzzer.melody(1)

# wait while the melody is playing
buzzer.wait()
```

### [buzzer.note()](#buzzernote)

#### Description

play the scale of specified index

#### Syntax

- buzzer.note(index, ms)

#### Parameters

- index : 0 ~ 51

- ms : 1 ~ 5000 (unit: 0.001 sec)

#### Returns

- None

#### Example

```py
from pycm import *


# play No.20 scale for 0.8 sec
buzzer.note(20, 800)

# wait while the scale is playing
buzzer.wait()
```

## [led](#led)

### [led.set()](#ledset)

#### Description

turn on specified LEDs or turn off all LEDs

#### Syntax

- led.set(leds)
- led.set()

#### Parameters

- leds : const.RED, const.GREEN, const.BLUE, const.ALL(combination of RED|GREEN|BLUE)
- None : Turn off all LEDs

#### Returns

- None

#### Example

```py
from pycm import *

# Turn on Red and Green LED
led.set(const.RED | const.GREEN)
delay(800)

# Turn off all LEDs
led.set()
```

### [led.toggle()](#ledtoggle)

#### Description

toggle the specified LEDs (ON -> OFF, OFF -> ON)

#### Syntax

- led.toggle(leds)

#### Parameters

- leds : const.RED, const.GREEN, const.BLUE, const.ALL(combination of RED|GREEN|BLUE)

#### Returns

- None

#### Example

```py
from pycm import *

# Toggle Green and Blue LED
led.toggle(const.GREEN | const.BLUE)
delay(800)

# Toggle Green and Blue LED
led.toggle(const.GREEN | const.BLUE)
delay(800)
```

### [Constant values for led](#constant-values-for-led)

- const.RED
- const.GREEN
- const.BLUE
- const.ALL

## [button](#button)

### [button.pressed()](#buttonpressed)

#### Description

If START button is pressed or not

#### Syntax

- button.pressed()

#### Parameters

- None

#### Returns

- True on pressed
- False on NOT pressed

#### Example

```py
from pycm import *

while True:
    # GREEN LED on if START button is pressed
    # GREEN LED off if not pressed
    if button.pressed() == True :
        led.set(const.GREEN)
    else:
        led.set()
```

### [button.released()](#buttonreleased)

#### Description

If START button is pressed then released

#### Syntax

- button.released()

#### Parameters

- None

#### Returns

- True on pressed then released
- False on NOT pressed or pressed but not released

#### Example

```py
from pycm import *

while True:
    # toggle GREEN if START button is pressed then released
    if button.released() == True :
        led.toggle(const.GREEN)
```

### [button.millis()](#buttonmillis)

#### Description

Number of milliseconds START button was pressed

#### Syntax

- button.millis()

#### Parameters

- None

#### Returns

- milliseconds of START button was pressed

#### Example

```py
from pycm import *
console(USB)

while True:
    if button.released() == True:
        ms = button.millis()
        print(ms)
```

### [button.seconds()](#buttonseconds)

#### Description

Number of seconds START button was pressed

#### Syntax

- button.seconds()

#### Parameters

- None

#### Returns

- seconds of START button was pressed

#### Example

```py
from pycm import *
console(USB)

while True:
    if button.released() == True:
        s = button.seconds()
        print(s)
```

## [imu](#imu)

### [eeprom.imu_type(direction)](#eepromimutypedirection)

#### Description

- Configures the direction of controller for imu sensing

#### Syntax

- eeprom.imu_type(direction)

#### Parameters

- direction : const.V or const.H
  - const.V (vertical)  
    ![image_v]()
  - const.H (horizontal)  
    ![image_h]

#### Returns

- None 

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
```

### [imu.accel_x() / imu.accel_y() / imu.accel_z()](#imuaccelx--imuaccely--imuaccelz)

#### Description

Acceleration value in X/Y/Z-axis

#### Syntax

- imu.accel_x(), imu.accel_y(), imu.accel_z()

#### Parameters

- None

#### Returns

- acceleration value of range -32768 ~ 32767 (unit: 0.001G)  
  ![image_accel_range]()

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
while True:
    ax = imu.accel_x()
    ay = imu.accel_y()
    az = imu.accel_z()
    print(ax, ay, az)
    delay(500)
```

### [imu.gyro_x() / imu.gyro_y() / imu.gyro_z()](#imugyrox--imugyroy--imugyroz)

#### Description

gyroeration value in X/Y/Z-axis

#### Syntax

- imu.gyro_x(), imu.gyro_y(), imu.gyro_z()

#### Parameters

- None

#### Returns

- Gyro value of range -32768 ~ 32767 (unit: 0.01&deg;/s)  
  ![image_gyro_range]()

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
while True:
    gx = imu.gyro_x()
    gy = imu.gyro_y()
    gz = imu.gyro_z()
    print(gx, gy, gz)
    delay(500)
```

### [imu.roll()](#imuroll)

#### Description

roll value

#### Syntax

- imu.roll()

#### Parameters

- None

#### Returns

- roll value of range -18000 ~ 18000 (unit: 0.01&deg;)  
  ![image_rpy_range]()

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
while True:
    r = imu.roll()
    print(r)
    delay(500)
```

### [imu.pitch()](#imupitch)

#### Description

pitch value

#### Syntax

- imu.pitch()

#### Parameters

- None

#### Returns

- pitch value of range -9000 ~ 9000 (unit: 0.01&deg;)  
  ![image_rpy_range]()

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
while True:
    p = imu.pitch()
    print(p)
    delay(500)
```

### [imu.yaw()](#imuyaw)

#### Description

yaw value

#### Syntax

- imu.yaw()

#### Parameters

- None

#### Returns

- yaw value of range -18000 ~ 18000 (unit: 0.01&deg;)  
  ![image_rpy_range]()

#### Example

```py
from pycm import *

console(USB)

eeprom.imu_type(const.V)
while True:
    y = imu.yaw()
    print(y)
    delay(500)
```

## [mic](#mic)

### [mic.counting()](#miccounting)

#### Description

The counting number of clapping sound currently playing continuously

#### Syntax

- mic.counting()

#### Parameters

- None

#### Returns

- 0 : no clapping sound currently (not started or finished)
- N(1~255) : N continuous clapping until now

#### Example

```py
from pycm import *
console(USB)

while True:
    now = mic.counting()
    print(now)
    delay(600)
```

### [mic.counted()](#miccounted)

#### Description

The counting number of previously finished clapping sound

#### Syntax

- mic.counted()

#### Parameters

- None

#### Returns

- 0 : clapping sound not finished or this value is cleared
- N(1~255) : the number of last continuous clapping is N

#### Example

```py
from pycm import *

console(USB)
while True:
    now = mic.counting()
    final = mic.counted()
    print(now, final)
    delay(600)
```

#### Result

```bash
0  0
0  0
1  0     # clapping started
2  0     # counting() +1
3  0     # counting() +1
4  0     # counting() +1
5  0     # counting() +1
0  5     # clapping stopped, counting() become 0, counted() changed to 5
0  5     # counted() is still 5
```

### [mic.clear()](#micclear)

#### Description

Clear mic.counted() value to 0

#### Syntax

- mic.clear()

#### Parameters

- None

#### Returns

- None

#### Example

```py
from pycm import *

console(USB)
while True:
    if mic.counted() > 0 :
        print('final_detect =', mic.counted())
        mic.clear()
        print('cleared_count =', mic.counted())
```

#### Result

```bash
final_detect = 3
cleared_count = 0
final_detect = 2
cleared_count = 0
final_detect = 13
cleared_count = 0
final_detect = 10
cleared_count = 0
```

## [rc](#rc)

### [rc.received()](#rcreceived)

#### Description

If a unread remocon packet is available

#### Syntax

- rc.received()

#### Parameters

- None

#### Returns

- True : A remocon packet is arrived but not read by rc.read() function yet
- False : A unread packet is not available.

#### Example

```py
from pycm import *

while True:
    if rc.received() == True:
        led.set(CONST.RED)
    else:
        led.set()
```

### [rc.read()](#rcread)

#### Description

read the value of the last arrived remocon packet

#### Syntax

- rc.read()

#### Parameters

- None

#### Returns

- 0~65535: as a raw number, especially, we can use rc.BTN_X constant to represent RC-100B keys
- rc.BTN_U (1) : Button U of RC-100B remote controller
- rc.BTN_D (2) : Button D of RC-100B remote controller
- rc.BTN_L (4) : Button L of RC-100B remote controller
- rc.BTN_R (8) : Button R of RC-100B remote controller
- rc.BTN_1 (16) : Button 1 of RC-100B remote controller
- rc.BTN_2 (32) : Button 2 of RC-100B remote controller
- rc.BTN_3 (64) : Button 3 of RC-100B remote controller
- rc.BTN_4 (128) : Button 4 of RC-100B remote controller
- rc.BTN_5 (256) : Button 5 of RC-100B remote controller
- rc.BTN_6 (512) : Button 6 of RC-100B remote controller
- OR(|) combination of rc.BTN_X keys

#### Example

```py
from pycm import *

console(USB)
while True:
  if rc.received() == True :
    r = rc.read()

    print('Receive :')

    if r & rc.BTN_U > 0:
      print('U key')
    if r & rc.BTN_D > 0:
      print('D key')
    if r & rc.BTN_L > 0:
      print('L key')
    if r & rc.BTN_R > 0:
      print('R key')
```

### [Constant values for rc](#constant-values-for-rc)

- rc.BTN_U
- rc.BTN_D
- rc.BTN_L
- rc.BTN_R
- rc.BTN_1
- rc.BTN_2
- rc.BTN_3
- rc.BTN_4
- rc.BTN_5
- rc.BTN_6

## [motion](#motion)

### [motion.wait()](#motionwait)

#### Description

Wait until the currently playing motion is finished

#### Syntax

- motion.wait()

#### Parameters

- None

#### Returns

- None

#### Example

```py
from pycm import *

motion.play(1)
motion.wait()

led.set(CONST.GREEN)

delay(1000)
```

### [motion.play()](#motionplay)

#### Description

play specified motion

#### Syntax

- motion.play(motion_number)
- motion.play(motion_number, next_motion)

#### Parameters

- motion_number:  
  - 0 : Stop motion using an Exit Motion unit.
  - 1~65532 : Play motion
  - 65533 : Stop motion immediately
  - 65534 : Stop motion at the current keyframe
  - 65535 : Stop motion at the current motion unit
- next_motion: The motion number that is reserved for smooth play after motion_number motion is finished. But the user should call motion.play(motion_number) to start next_motion motion.
- None : Turn off all LEDs

#### Returns

- None

#### Example

```py
from pycm import *
console(USB)

while True:
    motion.play(1)
    print('play motion 1')
    motion.wait()
    print('play motion 2\n')
    motion.play(2)
    motion.wait()
    delay(1000)

    motion.play(1, 2)
    print('play motion 1 (with motion 2 reserved)')
    motion.wait()
    print('play motion 2\n')
    motion.play(2)
    motion.wait()
    delay(1000)
```

### [motion.status()](#motionstatus)

#### Description

If any motion is playing currently

#### Syntax

- motion.status()

#### Parameters

- None

#### Returns

- True : A motion is being played now
- False : No motion is being played now

#### Example

```py
from pycm import *

motion.play(1)

while True:
    if motion.status() == True:
        led.set(CONST.RED)
    else:
        led.set()
```

### [motion.count()](#motioncount)

#### Description

The number of motions stored in CM-550 controller

#### Syntax

- motion.count()

#### Parameters

- None

#### Returns

- 0~1020

#### Example

```py
from pycm import *

console(USB)

print(motion.count())
```

## [OLLO APIs](#ollo-apis)

### [OLLO()](#ollo)

#### Description

Generate an object for the specified 5-pin port with specified 5-pin module type

#### Syntax

- OLLO(port_num, module_type)

#### Parameters

|         module_type         | port_num  |
|:---------------------------:|:---------:|
|   const.OLLO_WHEEL_SPEED    |   1, 2    |
|  const.OLLO_JOINT_POSITION  |   1, 2    |
|   const.OLLO_JOINT_SPEED    |   1, 2    |
|        const.OLLO_IR        |   1, 2    |
|     const.OLLO_MOISTURE     |   1, 2    |
|  const.OLLO_MOISTURE_TEMP   |   1, 2    |
|  const.OLLO_RED_BRIGHTNESS  |   1, 2    |
| const.OLLO_BLUE_BRIGHTNESS  |   1, 2    |
|       const.OLLO_DMS        | 1,2,3,4,5 |
|      const.OLLO_TOUCH       | 1,2,3,4,5 |
|       const.OLLO_LED        | 1,2,3,4,5 |
|       const.OLLO_USER       | 1,2,3,4,5 |
|   const.OLLO_TEMPERATURE    | 1,2,3,4,5 |
|      const.OLLO_MAGNET      | 1,2,3,4,5 |
| const.OLLO_MOTION_DETECTION | 1,2,3,4,5 |
|      const.OLLO_COLOR       | 1,2,3,4,5 |
|    const.OLLO_BRIGHTNESS    | 1,2,3,4,5 |

#### Returns

- 5-pin module object

#### Example

```py
from pycm import *


# object stands for Wheel Motor connected to port 1
wheel_1 = OLLO(1, const.OLLO_WHEEL_SPEED)
# set wheel speed to 500, CCW
wheel_1.write(500)

delay(4000)
```

### [object.read()](#objectread)

#### Description

Read sensing value of specified 5-pin module object

#### Syntax

- object.read()

#### Parameters

- None

#### Returns

| module_type (device link) | Function | Meaning of return value                | Range                                                                                   |
|:--------------------------|:--------:|:---------------------------------------|:----------------------------------------------------------------------------------------|
| OLLO_WHEEL_SPEED          |  read()  | Wheel motor speed                      | [0, 1023] CCW<br>[1024, 2047] CW                                                        |
| OLLO_JOINT_POSITION       |  read()  | Servo motor position                   | [0, 1023]                                                                               |
| OLLO_JOINT_SPEED          |  read()  | Servo motor speed                      | [0, 1023]                                                                               |
| OLLO_IR                   |  read()  | IR sensor value                        | [0, 1023]                                                                               |
| OLLO_MOISTURE             |  read()  | Relative humidity value                | [0, 100] (%)                                                                            |
| OLLO_MOISTURE_TEMP        |  read()  | Temperature value                      | [-20, 105] (&deg;C)                                                                     |
| OLLO_RED_BRIGHTNESS       |  read()  | Red brightness of Red-Blue LED Module  | [0, 100] (%)                                                                            |
| OLLO_BLUE_BRIGHTNESS      |  read()  | Blue brightness of Red-Blue LED Module | [0, 100] (%)                                                                            |
| OLLO_DMS                  |  read()  | DMS sensor value                       | [0, 1023]                                                                               |
| OLLO_TOUCH                |  read()  | Tact switch sensor status              | 0 : Released<br>1 : Pushed                                                              |
| OLLO_LED                  |  read()  | LED module status                      | 0 : Both OFF<br>1 : Left OFF, Right ON<br>2 : Left ON, Right OFF<br>3 : Both ON         |
| OLLO_USER                 |  read()  | Analog value of User Device            | [0, 1023]                                                                               |
| OLLO_TEMPERATURE          |  read()  | temperature value                      | [-20, 105] (&deg;C)                                                                     |
| OLLO_MAGNET               |  read()  | Magnet sensor status                   | 0 : No magnet<br>1 : Magnet detected                                                    |
| OLLO_MOTION_DETECTION     |  read()  | Motion sensor status                   | 0 : No motion<br>1 : Motion detected                                                    |
| OLLO_COLOR                |  read()  | Sensed color index                     | 0 : Unknown<br>1 : White<br>2 : Black<br>3 : Red<br>4 : Green<br>5 : Blue<br>6 : Yellow |
| OLLO_BRIGHTNESS           |  read()  | Brightness                             | [0, 1023]                                                                               |

#### Example

```py
from pycm import *

console(USB)

servo_1 = OLLO(1, const.OLLO_JOINT_POSITION)

position = servo_1.read()
print('servo 1 position = ', position)
```

### [object.write()](#objectwrite)

#### Description

Change 5-pin module object’s parameter 

#### Syntax

- object.write(parameter1, parameter2,...)

#### Parameters

| module_type (device link) |      Function      | Meaning of parameter                                                     | Range                            |
|:--------------------------|:------------------:|:-------------------------------------------------------------------------|:---------------------------------|
| OLLO_WHEEL_SPEED          |  write(velocity)   | Wheel motor velocity                                                     | [0, 1023] CCW<br>[1024, 2047] CW |
| OLLO_JOINT_POSITION       |  write(position)   | Servo motor position                                                     | [0, 1023]                        |
| OLLO_JOINT_SPEED          |    write(speed)    | Servo motor speed for position control                                   | [0, 1023]                        |
| OLLO_LED                  | write(left, write) | left : control value for left LED<br>right : control value for right LED | 0 : OFF<br>1 : ON                |
| OLLO_USER                 | write(out1, out2)  | out1 : control value for OUT1 pin<br>out2 : control value for OUT2 pin   | 0 : 0V<br>1 : 5V                 |

#### Returns

- None

#### Example

```py
from pycm import *

ledl_1 = OLLO(1, const.OLLO_LED)
# turn on left LED, turn off right LED
led_1.write(1, 0)

delay(4000)
```

### [Constant values for OLLO](#constant-values-for-ollo)

- const.OLLO_WHEEL_SPEED
- const.OLLO_JOINT_POSITION
- const.OLLO_JOINT_SPEED
- const.OLLO_IR
- const.OLLO_MOISTURE
- const.OLLO_MOISTURE_TEMP
- const.OLLO_RED_BRIGHTNESS
- const.OLLO_BLUE_BRIGHTNESS
- const.OLLO_DMS
- const.OLLO_TOUCH
- const.OLLO_LED
- const.OLLO_USER
- const.OLLO_TEMPERATURE
- const.OLLO_MAGNET
- const.OLLO_MOTION_DETECTION
- const.OLLO_COLOR
- const.OLLO_BRIGHTNESS
