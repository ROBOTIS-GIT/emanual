---
layout: archive
lang: en
ref: python_porthandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplustask3/python_api/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 5
---

<div style="counter-reset: h1 5"></div>

# [Task Python API](#task-python-api)

## [pycm Module](#pycm-module)

Here we introduce two ways to use pycm module.

1. 

```python
import pycm # pycm should NOT be omitted in the following code

pycm.led.on(pycm.const.RED)
```

2.

```python
from pycm import * # pycm should be omitted in the following code

led.on(const.RED)
```

We assume the SECOND case in the following description.


| Methods                             | Description                                    |Parameter                      |Return          | Example                     |
|:------------------------------------|:-----------------------------------------------|-------------------------------|----------------|-----------------------------|
| ``` console(ch: int) -> None ```    | Configure controller's communication channel   |BLE (0)<br>UART (1)<br>USB (2) | None           |``` console(BLE) ```         |
| ``` delay(ms: int) -> None ```      | Delay in milliseconds                          |0 ~ 4,294,967,295              | None           | ``` delay(1000) ```         |
| ``` millis() -> None ```            | Milliseconds since controller turns on         |None                           | 0 ~ 4294967295 | ``` pre_time = millis() ``` |
| ``` micros() -> None ```            | Microseconds since controller turns on         |None                           | 0 ~ 4294967295 | ``` pre_time = micros() ``` |


## [Submodules of pycm](#submodules-of-pycm)

| Submodules of pycm                          | Description                                                |
|:--------------------------------------------|:-----------------------------------------------------------|
| **[const](#const-submodule)**               | Constant values                                            |
| **[led](#led-submodule)**                   | LED control                                                |
| **[info](#info-submodule)**                 | Controller's information                                   |
| **[eeprom](#eeprom-submodule)**             | Controller's parameters stored in EEPROM area              |
| **[rc](#rc-submodule)**                     | Remote control                                             |
| **[etc](#etc-submodule)**                   | Miscellaneous functions                                    |
| **[timer](#timer-submodule)**               | Timer functions                                            |
| **[button](#button-submodule)**             | Buttons                                                    |
| **[dxlbus](#dxlbus-submodule)**             | Batch controlling Dynamixel actuators                      |
| **[motion](#motion-submodule)**             | Motion control                                             |
| **[buzzer](#buzzer-submodule)**             | Buzzer                                                     |
| **[mic](#mic-submodule)**                   | Microphone                                                 |
| **[imu](#imu-submodule)**                   | IMU(Inertial Measurement Unit)                             |
| **[OLLO](#ollo-submodule)**                 | 5-pin port extension interface                             |
| **[DXL](#dxl-submodule)**                   | Dynamixel actuator                                         |
| **[rpi](#rpi-submodule)**                   | Raspberry Pi interface                                     |


## [Const Submodule](#const-submodule)

| Constant members of const             | Description                                                  | Example                                           |
|:--------------------------------------|:-------------------------------------------------------------|:--------------------------------------------------|
| RED                                   | Red color constant for controller's RGB LED                  | ``` led.on(const.RED) ```                         |
| GREEN                                 | Green color constant for controller's RGB LED                | ``` led.on(const.GREED) ```                       |
| BLUE                                  | Blue color constant for controller's RGB LED                 | ``` led.on(const.BLUE) ```                        |
| ALL                                   | White color constant for controller's RGB LED                | ``` led.on(const.ALL) ```                         |
| OLLO_WHEEL_SPEED                      | Use 5-pin servo motor in wheel mode                          | ``` wheel = OLLO(1, const.OLLO_WHEEL_SPEED) ```   |
| OLLO_JOINT_POSITION                   | Use 5-pin servo motor in joint mode and control its position | ``` joint = OLLO(1, const.OLLO_JOINT_POSITION) ``` |
| OLLO_JOINT_SPEED                      | Use 5-pin servo motor in joint mode and control its speed    | ``` speed = OLLO(1, const.OLLO_JOINT_SPEED) ```   |
| OLLO_IR                               | IR sensor 5-pin device                                       | ``` ir = OLLO(1, const.OLLO_IR) ```               |
| OLLO_DMS                              | DMS sensor 5-pin device                                      | ``` dms = OLLO(1, const.OLLO_DMS) ```             |
| OLLO_TOUCH                            | Touch sensor 5-pin device                                    | ``` touch = OLLO(1, const.OLLO_TOUCH) ```         |
| OLLO_LED                              | LED module 5-pin device                                      | ``` led = OLLO(1, const.OLLO_LED) ```             |
| OLLO_USER                             | 5-pin user device                                            | ``` user = OLLO(1, const.OLLO_USER) ```           |
| OLLO_TEMPERATURE                      | Temperature sensor 5-pin device                              | ``` temperature = OLLO(1, const.OLLO_TEMPERATURE) ``` |
| OLLO_MAGNET                           | Magnet sensor 5-pin device                                   | ``` magnet = OLLO(1, const.OLLO_MAGNET) ```       |
| OLLO_MOTION_DETECTION                 | Motion detecting sensor 5-pin device                         | ``` motion_detection = OLLO(1, const.OLLO_MOTION_DETECTION) ``` |
| OLLO_COLOR                            | Color sensor 5-pin device                                    | ``` color = OLLO(1, const.OLLO_COLOR) ```         |
| OLLO_MOISTURE                         | Moisture value of Moisture-Temperature sensor 5-pin device   | ``` moisture = OLLO(1, const.OLLO_MOISTURE) ```   |
| OLLO_MOISTURE_TEMP                    | Temperature value of Moisture-Temperature sensor 5-pin device| ``` temperature = OLLO(1, const.OLLO_MOISTURE_TEMP) ``` |
| OLLO_BRIGHTNESS                       | Brightness sensor 5-pin device                               | ``` brightness = OLLO(1, const.OLLO_BRIGHTNESS) ``` |
| OLLO_RED_BRIGHTNESS                   | Brightness of red LED of Red-Blue LED                        | ``` red = OLLO(1, const.OLLO_RED_BRIGHTNESS) ```  |
| OLLO_BLUE_BRIGHTNESS                  | Brightness of blue LED of Red-Blue LED                       | ``` blue = OLLO(1, const.OLLO_BLUE_BRIGHTNESS) ``` |
| V                                     | Vertical mode                                                | ``` imu.imu_type(const.V)```                       |
| H                                     | Horizontal mode                                              | ``` imu.imu_type(const.H)```                      |
| JOINT                                 | Joint mode of Dynamixel actuator                             | ``` DXL(2).mode(const.JOINT) ```                  |
| WHEEL                                 | Wheel mode of Dynamixel actuator                             | ``` DXL(3).mode(const.WHEEL) ```                  |


## [Led Submodule](#led-submodule)

| Methods                               | Description                                    |Parameter                                                             |Return| Example                                     |
|:--------------------------------------|:-----------------------------------------------|:---------------------------------------------------------------------|:-----|:--------------------------------------------|
| ``` on(color: int) -> None ```        | Turn on specified color of controller's LED    |```color```: LED name<br>- ```const.RED / const.BLUE / const.GREEN``` | None |``` led.on(const.RED) ```                    |
| ``` off(color: int) -> None ```       | Turn off specified color of controller's LED   |```color```: LED name<br>- ```const.RED / const.BLUE / const.GREEN``` | None | ``` led.off(const.RED \| const.GREEN) ```   |
| ``` set(color: int) -> None ```       | Set controller's LED as specified color        |```color```: LED name<br>- ```const.RED / const.BLUE / const.GREEN``` | None |``` led.set(const.BLUE) ```                  |
| ``` toggle(color: int) -> None ```    | Toggle specified color of controller's LED     |```color```: LED name<br>- ```const.RED / const.BLUE / const.GREEN``` | None |``` led.toggle(const.GREEN \| const.BLUE) ```|


## [Info Submodule](#info-submodule)

| Methods of info submobule        | Description                                  | Example                                           |
|:---------------------------------|:---------------------------------------------|:--------------------------------------------------|
| ```model_number() -> int```      | Return controller's model number (450)       | ``` info.model_number() ```                       |
| ```fw_version() -> int```        | Return controller's firmware version         | ``` info.fw_version() ```                         |
| ```id() -> int```                | Return controller's id (200)                 | ``` info.id() ```                                 |
| ```boot_version() -> int```      | Return controller's bootloader version       | ``` info.boot_version() ```                       |
| ```voltage() -> int```           | Return controller's voltage (unit: 0.1V)     | ``` info.voltage() ```                            |
| ```temperature() -> int```       | Return controller's temperature (unit: °C)   | ``` info.temperature() ```                        |
| ```address() -> str```           | Return controller's BLE MAC address as string| ``` info.address() ```                            |


## [EEPROM Submodule](#eeprom-submodule)

| Methods of eeprom submobule        | Description                                  | Parameter  | Return     | Example                             |
|:-----------------------------------|:---------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```dxl_baud() -> int ```           | Return controller's dynamixel bus baudrate   | None       |0 : 9600bps<br>1 : 57600bps<br>2 : 115200bps<br>3 : 1000000bps<br>4 : 2000000bps<br>5 : 3000000bps<br>6 : 4000000bps<br>7 : 4500000bps  | ``` eeprom.dxl_baud() ```           |
| ```dxl_baud(baud: int) -> None```  | Set controller's dynamixel bus baudrate      |0 : 9600bps<br>1 : 57600bps<br>2 : 115200bps<br>3 : 1000000bps<br>4 : 2000000bps<br>5 : 3000000bps<br>6 : 4000000bps<br>7 : 4500000bps  | None |  ``` eeprom.dxl_baud(3) ```       |
| ```uart_baud() -> int```           | Return controller's uart port baudrate       | None       |0 : 9600bps<br>1 : 57600bps<br>2 : 115200bps<br>3 : 1000000bps<br>4 : 2000000bps<br>5 : 3000000bps<br>6 : 4000000bps<br>7 : 4500000bps  | ``` eeprom.uart_baud() ```          |
| ```uart_baud(baud: int) -> None``` | Set controller's uart port baudrate          |0 : 9600bps<br>1 : 57600bps<br>2 : 115200bps<br>3 : 1000000bps<br>4 : 2000000bps<br>5 : 3000000bps<br>6 : 4000000bps<br>7 : 4500000bps  | None | ``` eeprom.uart_baud(1) ```      |
| ```imu_type() -> int```            | Return controller's imu direction type       | None       | 0 : VERTICAL<br>1 : HORIZONTAL | ``` eeprom.imu_type() ```           |
| ```imu_type(type:int) -> None```   | Set controller's imu direction type          | const.V<br>const.H | None | ``` eeprom.imu_type(const.V) ```       |



## [RC Submodule](#rc-submodule)

| Methods of rc submobule        | Description                                       | Parameter  | Return     | Example                             |
|:-------------------------------|:--------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```port(ch: int) -> None```    | Set controller's remote control channel           |BLE (0)<br>UART (1)<br>USB (2) | None |``` rc.port(BLE) ```               |
| ```received() -> bool```       | Return if reveived a new remote control packet    | None | True : new packet arrived<br>False : new packet not arrived | ``` rc.received() ```               |
| ```read() -> int```            | Return last received remote control packet value  | None | 0 ~ 65535 | ``` rc.read() ```                   |
| ```write(data: int) -> None``` | Send remote control packet value                  | 0 ~ 65535 | None | ``` rc.write(128) ```              |


## [Etc Submodule](#etc-submodule)

| Methods of etc submobule                | Description                                           | Parameter                       | Return   | Example                                    |
|:----------------------------------------|:------------------------------------------------------|:--------------------------------|:---------|:-------------------------------------------|
| ```print_screen(val: int) -> None```    | Print an integer value to task monitor with a space   | -2,147,483,647 ~ 2,147,483,647  | None     |``` etc.print_screen(100) ```               |
| ```println_screen(val: int) -> None```  | Print an integer value to task monitor with a new line| -2,147,483,647 ~ 2,147,483,647  | None     |``` etc.println_screen(100) ```             |
| ```print_string(str: str) -> None```    | Print a string to task monitor with a space           | max 19 bytes                    | None     |``` etc.print_string("Hello world!") ```    |
| ```println_string(str: str) -> None```  | Print a string to task monitor with a new line        | max 19 bytes                    | None     |``` etc.println_string("Hello world!") ```  |
| ```port(ch: int) -> None```             | Set controller's print screen channel                 |BLE (0)<br>UART (1)<br>USB (2)   | None     |``` etc.port(BLE) ```                       |

## [Timer Submodule](#timer-submodule)

| Methods of etc submobule                       | Description                                           | Parameter  | Return     | Example                             |
|:-----------------------------------------------|:------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```init(ms: int, func: function) -> None```    | Register a callback function which will be called periodically<br>Only one function can be registered   |  ```ms```<br>function calling period in millisecond<br>```func```<br>function to be called | None |``` timer.init(1000, func) ```   |
| ```start() -> None```                          | Start the registered function callback process        | None       | None       |``` timer.start() ```                |
| ```stop() -> None```                           | stop the registered function callback process         | None       | None       |``` timer.stop() ```                 |

## [Button Submodule](#button-submodule)

| Methods of button submobule        | Description                                                  | Parameter  | Return     | Example                             |
|:-----------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```pressed() -> bool ```           | Return if controller's user button is pressed                | None       |True : pressed<br>False : not pressed | ``` button.pressed() ``` |
| ```released() -> bool ```          | Return if controller's user button is released after pressed | None       |True : release event happened<br>False : release event not happened | ``` button.released() ``` |
| ```millis() -> int ```             | Return last pressed time in milliseconds                     | None       | 0 ~ 65535 | ``` button.millis() ``` |
| ```seconds() -> int ```            | Return last pressed time in seconds                          | None       | 0 ~ 255   | ``` button.seconds() ``` |


## [Dxlbus Submodule](#dxlbus-submodule)

| Methods of dxlbus submobule        | Description                                                  | Parameter  | Return     | Example                             |
|:-----------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```power_on() -> None ```          | Turn on power for dynamixel bus                              | None       | None       | ``` dxlbus.power_on() ``` |
| ```power_off() -> None ```         | Turn off power for dynamixel bus                             | None       | None       | ``` dxlbus.power_off() ``` |
| ```scan() -> int ```               | Scan dynamixels, return the number of dynamixels found       | None       | 0 ~ 253    | ``` dxlbus.scan() ``` |
| ```count() -> int ```              | Return the number of found dynamixel(s)                      | None       | 0 ~ 253    | ``` dxlbus.count() ``` |
| ```torque_on() -> None ```         | Turn on torque for all found dynamixel(s)                    | None       | None       | ``` dxlbus.torque_on() ``` |
| ```torque_off() -> None ```        | Turn off torque for all found dynamixel(s)                   | None       | None       | ``` dxlbus.torque_off() ``` |
| ```reboot() -> None ```            | Reboot all dynamixel(s)                                      | None       | None       | ``` dxlbus.reboot() ``` |


## [Motion Submodule](#motion-submodule)

| Methods of motion submobule          | Description                                                  | Parameter  | Return     | Example                             |
|:-------------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```speed() -> int ```                | Return motion speed (%)                                  | None       | 20% ~ 200% | ``` motion.speed() ``` |
| ```speed(speed: int) -> int ```      | Set motion speed (%)                                     | 20% ~ 200% | None       | ``` motion.speed(150) ``` |
| ```play(motion: int) -> None ```     | Play a specified motion page or stop current motion                 | 0 : Stop motion using an Exit Motion Unit<br>1~65532 : Play motion with a specified page<br>65533 : Stop motion immediately<br>65534 : Stop motion at the current Key Frame<br>65535 : Stop motion at current unit | None       | ``` motion.play(1) ``` |
| ```play(motion: int, next: int) -> None ``` | Play a specified motion with a motion reserved for playing contiguously | ```motion```<br>0 : Stop motion using an Exit Motion Unit<br>1~65532 : Play motion with a specified page<br>65533 : Stop motion immediately<br>65534 : Stop motion at the current Key Frame<br>65535 : Stop motion at current unit<br><br>```next```<br>0~65534 : Page to move next.<br>65535 : No next page | None       | ``` motion.play(1, 2) ``` |
| ```next(next: int) -> None ``` | Reserve the next motion to play contiguously. This function must be used before ```motion.play(motion)``` | ```next```<br>0~65534 : Page to move next.<br>65535 : No next page | None       | ``` motion.next(2) ``` |
| ```status() -> bool ```              | Return motion play status                                | None      | True : Motion is being played<br>False : Motion is NOT being played       | ``` motion.status() ``` |
| ```count() -> int ```                | Return the number of motions stored in FLASH memory      | None      | 0 ~ 1023       | ``` motion.count() ``` |
| ```wait() -> None ```                | Wait until current motion stops playing                  | None      | None       | ``` motion.wait() ``` |



## [Buzzer Submodule](#buzzer-submodule)

| Methods of buzzer submobule          | Description                                                  | Parameter  | Return     | Example                             |
|:-------------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```melody(index) -> None ```         | Play the specified melody by index.                          | 0 ~ 25     | None       | ``` buzzer.melody(1) ```            |
| ```note(index) -> None ```           | Play the specified note by index for 0.3 sec                 | 0 ~ 51     | None       | ``` buzzer.note(1) ```              |
| ```note(index, ms) -> None ```       | Play the specified note by index for specified time length   |```index```<br> 0 ~ 51<br>```ms```(unit: 0.1s)<br>0 ~ 50 : 0 ~ 5.0s       | ``` buzzer.note(1, 10) ```              |
| ```wait() -> None ```                | Wait until current melody or note ends                       | None       | None       | ``` buzzer.wait() ``` |


## [Mic Submodule](#mic-submodule)

| Methods of mic submobule          | Description                                                                 | Parameter  | Return     | Example                             |
|:----------------------------------|:----------------------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```counted() -> int ```           | Return the final number of detected sound after the clapping finishes       | None       | 0 ~ 255    | ``` mic.counted() ```               |
| ```counting() -> int ```          | Return the real-time number of detected sound while the clapping continues  | None       | 0 ~ 255    | ``` mic.counting() ```              |
| ```clear() -> int ```             | Clear the final number of detected sound to zero                            | None       | None       | ``` mic.clear() ```                 |



## [IMU Submodule](#imu-submodule)

| Methods of imu submobule          | Description                                                  | Parameter  | Return                                   | Example                      |
|:----------------------------------|:-------------------------------------------------------------|:-----------|:-----------------------------------------|:-----------------------------|
| ```roll() -> int ```              | Return the roll value of CM-550 controller                   | None       | -18000 ~ 18000                           | ``` imu.roll() ```           |
| ```pitch() -> int ```             | Return the pitch value of CM-550 controller                  | None       | -9000 ~ 9000                             | ``` imu.pitch() ```          |
| ```yaw() -> int ```               | Return the yaw value of CM-550 controller                    | None       | -9000 ~ 9000                             | ``` imu.yaw() ```            |
| ```gyro_x() -> int ```            | Return the Gyro X axis value of CM-550 controller            | None       | -32768 ~ 32767 (unit: 0.01degree/sec)    | ``` imu.gyro_x() ```         |
| ```gyro_y() -> int ```            | Return the Gyro Y axis value of CM-550 controller            | None       | -32768 ~ 32767 (unit: 0.01degree/sec)    | ``` imu.gyro_y() ```         |
| ```gyro_z() -> int ```            | Return the Gyro Z axis value of CM-550 controller            | None       | -32768 ~ 32767 (unit: 0.01degree/sec)    | ``` imu.gyro_z() ```         |
| ```accel_x() -> int ```           | Return the accelerometer X axis value of CM-550 controller   | None       | -32768 ~ 32767 (unit: 0.01G)             | ``` imu.accel_x() ```        |
| ```accel_y() -> int ```           | Return the accelerometer Y axis value of CM-550 controller   | None       | -32768 ~ 32767 (unit: 0.01G)             | ``` imu.accel_y() ```        |
| ```accel_z() -> int ```           | Return the accelerometer Z axis value of CM-550 controller   | None       | -32768 ~ 32767 (unit: 0.01G)             | ``` imu.accel_z() ```        |


## [OLLO Submodule](#ollo-submodule)

| Methods of OLLO submobule          | Description                                                  | Parameter  | Return     | Example                             |
|:-------------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```OLLO(port, mode) -> object```        | Create an object with Port Number and Device Mode     |```mode```<br> const.OLLO_WHEEL_SPEED (```port```: 1 ~ 2)<br>const.OLLO_JOINT_POSITION (```port```: 1 ~ 2)<br>const.OLLO_JOINT_SPEED (```port```: 1 ~ 2)<br>const.OLLO_IR (```port```: 1 ~ 2)<br>const.OLLO_MOISTURE (```port```: 1 ~ 2)<br>const.OLLO_MOISTURE_TEMP (```port```: 1 ~ 2)<br>const.OLLO_RED_BRIGHTNESS (```port```: 1 ~ 2)<br>const.OLLO_BLUE_BRIGHTNESS (```port```: 1 ~ 2)<br>const.OLLO_DMS (```port```: 1 ~ 5)<br>const.OLLO_TOUCH (```port```: 1 ~ 5)<br>const.OLLO_LED (```port```: 1 ~ 5)<br>const.OLLO_USER (```port```: 1 ~ 5)<br>const.OLLO_TEMPERATURE (```port```: 1 ~ 5)<br>const.OLLO_MAGNET (```port```: 1 ~ 5)<br>const.OLLO_MOTION_DETECTION (```port```: 1 ~ 5)<br>const.OLLO_COLOR (```port```: 1 ~ 5)<br>const.OLLO_BRIGHTNESS (```port```: 1 ~ 5)<br>      | 5-pin port object    | ``` obj = OLLO(1, OLLO_WHEEL_SPEED) ```            |
| ```read() -> int ```           | Return the value of object            | None     | 0 ~ 2047 (```mode```: const.OLLO_WHEEL_SPEED)<br>0 ~ 1023 (```mode```: const.OLLO_JOINT_POSITION)<br>0 ~ 1023 (```mode```: const.OLLO_JOINT_SPEED)<br>0 ~ 1023 (```mode```: const.OLLO_IR)<br>0 ~ 100 (```mode```: const.OLLO_MOISTURE, unit: %)<br>-19 ~ 105 (```mode```: const.OLLO_MOISTURE_TEMP, unit: ℃)<br>0 ~ 100 (```mode```: const.OLLO_RED_BRIGHTNESS, unit: %)<br>0 ~ 100 (```mode```: const.OLLO_BLUE_BRIGHTNESS, unit: %)<br>0 ~ 1023 (```mode```: const.OLLO_DMS)<br>0, 1 (```mode```: const.OLLO_TOUCH)<br>0 ~ 3 (```mode```: const.OLLO_LED)<br>0 ~ 1023 (```mode```: const.OLLO_USER)<br>-20 ~ 120 (```mode```: const.OLLO_TEMPERATURE, unit: ℃)<br>0, 1 (```mode```: const.OLLO_MAGNET)<br>0 ~ 1 (```mode```: const.OLLO_MOTION_DETECTION)<br>0 ~ 6 (```mode```: const.OLLO_COLOR)<br>0 ~ 100 (```mode```: const.OLLO_BRIGHTNESS, unit: %)<br>    | ``` obj.read() ```            |
| ```write(speed) -> None ```         | Set wheel speed of object of wheel mode<br>(```mode```: const.OLLO_WHEEL_SPEED)          | 0 ~ 1023 : CCW (Counter clock wise) speed<br>1024 ~ 2047 : CW (Clockwise) speed     | None       | ``` obj.write(512) ```            |
| ```write(position) -> None ```         | Set joint poistion of object of joint mode<br>(```mode```: const.OLLO_JOINT_POSITION)          | 0 ~ 1023    | None       | ``` obj.write(512) ```            |
| ```write(speed) -> None ```         | Set moving speed of object of joint mode<br>(```mode```: const.OLLO_JOINT_POSITION)          | 0 ~ 1023    | None       | ``` obj.write(256) ```            |
| ```write(pwm) -> None ```         | Set pwm duty cycle of object of LED brightness mode<br>(```mode```: const.OLLO_RED_BRIGHTNESS / OLLO_BLUE_BRIGHTNESS)          | 0 ~ 100 (unit: %)    | None       | ``` obj.write(50) ```            |
| ```write(left, right) -> None ```         | Set LED status of left and right LED of LED module<br>(```mode```: const.OLLO_LED)          | 0, 1  | None       | ``` obj.write(1, 0) ```            |
| ```write(left, right) -> None ```         | Set LED status of left and right output port of User Device<br>(```mode```: const.OLLO_USER)          | 0, 1  | None       | ``` obj.write(1, 1) ```            |


## [DXL Submodule](#dxl-submodule)

| Methods of DXL submobule          | Description                                                  | Parameter  | Return     | Example                             |
|:-------------------------------------|:-------------------------------------------------------------|:-----------|:-----------|:------------------------------------|
| ```DXL(id) -> object ```           | Create an Dynamixel object with specified ID                      | 0 ~ 252 : Single ID<br>254 : Broadcast ID     | Dynamixel object    | ``` obj = DXL(1) ```            |
| [```mode() -> int ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#operating-mode11)           | Return mode number of Dynamixel object                      | None     | 1 : Velocity Control Mode<br>3 : Position Control Mode<br>4 : Multi-turn Mode<br>    | ``` obj.mode() ```            |
| [```mode(mode) -> None ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#operating-mode11)           | Set mode for Dynamixel object                      | 1 : Velocity Control Mode<br>3 : Position Control Mode<br>4 : Multi-turn Mode<br> | None   | ``` obj.mode(3) ```            |
| ```torque_on() -> None ```           | Turn on torque for Dynamixel object                 | None    | None   | ``` obj.torque_on() ```            |
| ```torque_off() -> None ```          | Turn off torque for Dynamixel object                 | None    | None   | ``` obj.torque_off() ```            |
| ```led_on() -> None ```          | Turn on LED for Dynamixel object                 | None    | None   | ``` obj.led_on() ```            |
| ```led_off() -> None ```          | Turn off LED for Dynamixel object                 | None    | None   | ``` obj.led_off() ```            |
| ```led_toggle() -> None ```       | Toggle LED for Dynamixel object                 | None    | None   | ``` obj.led_toggle() ```            |
| [```goal_velocity() -> int ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#goal-velocity104)       | Return goal velocity value                 | None    | -1023 ~ 1023 (unit: 0.229 rev/min)  | ``` obj.goal_velocity() ```            |
| [```goal_velocity(v) -> None ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#goal-velocity104)       | Set goal velocity value                 | -1023 ~ 1023  (unit: 0.229 rev/min)   |  None  | ``` obj.goal_velocity(100) ```            |
| [```goal_position() -> int ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#goal-position116)       | Return goal position value                 | None    | -4095 ~ 4095  | ``` obj.goal_position() ```            |
| [```goal_position(p) -> None ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#goal-position116)       | Set goal position value                 | -4095 ~ 4095   |  None  | ``` obj.goal_position(1024) ```            |
| [```is_moving() -> bool ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#moving122)       | Return moving status                 | None    | True : Dynamixel is moving<br>False : Dyanmixel is not moving  | ``` obj.is_moving() ```            |
| [```present_velocity() -> int ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#present-velocity128)       | Return present velocity value                 | None    | -1023 ~ 1023 (unit: 0.229 rev/min)  | ``` obj.present_velocity() ```            |
| [```present_position() -> int ```](https://emanual.robotis.com/docs/en/dxl/x/xl430-w250/#present-position132)       | Return present position value                 | None    | -4095 ~ 4095  | ``` obj.present_position() ```            |


## [RPI Submodule](#rpi-submodule)

| Methods of rpi submodule      | Description                                                    | Parameter                | Return                                 | Example                 |
|:------------------------------|:---------------------------------------------------------------|:-------------------------|:---------------------------------------|:------------------------|
| `mode() -> int`               | Return mode number of connected Raspberry Pi                   | None                     | 0 : Standby<br>1 : Color Detection<br>2 : Face Detection<br>3 : Streaming | `rpi.mode()`             |
| `mode(mode: int) -> None`     | Set the mode of the connected Raspberry Pi                     | `mode`<br>0 : Standby<br>1 : Color Detection<br>2 : Face Detection<br>3 : Streaming            | None                                   | `rpi.mode(1)`            |
| `sub_mode() -> int`           | Return the sub-mode of the current mode<br>(only for Color Detection Mode) | None            | 1 : Red<br>2 : Orange<br>3 : Yellow<br>4 : Green<br>5 : Blue<br>6 : Purple<br>7 : White                        | `rpi.sub_mode()`         |
| `sub_mode(mode: int) -> None` | Set the sub-mode of the current mode<br>(only for Color Detection Mode)  | `mode`<br>1 : Red<br>2 : Orange<br>3 : Yellow<br>4 : Green<br>5 : Blue<br>6 : Purple<br>7 : White | None                                   | `rpi.sub_mode(1)`        |
| `ip() -> tuple`               | Return the IP address of the connected Raspberry Pi as a tuple with 4 integers   | None                     | IP address as a tuple<br>eg. (192, 168, 13, 5)                 | `rpi.ip()`               |
| `position_x() -> int`         | Return the x-coordinate of the camera detection position       | None                     | X-coordinate value                     | `rpi.position_x()`       |
| `position_y() -> int`         | Return the y-coordinate of the camera detection position       | None                     | Y-coordinate value                     | `rpi.position_y()`       |
| `area() -> int`               | Return the detection area of the camera                        | None                     | Area value                             | `rpi.area()`             |
| `resolution_w() -> int`       | Return the width of the camera resolution                      | None                     | Width in pixels                        | `rpi.resolution_w()`     |
| `resolution_h() -> int`       | Return the height of the camera resolution                     | None                     | Height in pixels                       | `rpi.resolution_h()`     |
| `h_max() -> int`              | Return the maximum hue value for color detection               | None                     | 0 ~ 179                                | `rpi.h_max()`            |
| `h_max(h_max: int) -> None`   | Set the maximum hue value for color detection                  | 0 ~ 179                  | None                                   | `rpi.h_max(179)`         |
| `h_min() -> int`              | Return the minimum hue value for color detection               | None                     | 0 ~ 179                                | `rpi.h_min()`            |
| `h_min(h_min: int) -> None`   | Set the minimum hue value for color detection                  | 0 ~ 179                  | None                                   | `rpi.h_min(0)`           |
| `s_max() -> int`              | Return the maximum saturation value for color detection        | None                     | 0 ~ 255                                | `rpi.s_max()`            |
| `s_max(s_max: int) -> None`   | Set the maximum saturation value for color detection           | 0 ~ 255                  | None                                   | `rpi.s_max(255)`         |
| `s_min() -> int`              | Return the minimum saturation value for color detection        | None                     | 0 ~ 255                                | `rpi.s_min()`            |
| `s_min(s_min: int) -> None`   | Set the minimum saturation value for color detection           | 0 ~ 255                  | None                                   | `rpi.s_min(0)`           |
| `v_max() -> int`              | Return the maximum value (brightness) for color detection      | None                     | 0 ~ 255                                | `rpi.v_max()`            |
| `v_max(v_max: int) -> None`   | Set the maximum value (brightness) for color detection         | 0 ~ 255                  | None                                   | `rpi.v_max(255)`         |
| `v_min() -> int`              | Return the minimum value (brightness) for color detection      | None                     | 0 ~ 255                                | `rpi.v_min()`            |
| `v_min(v_min: int) -> None`   | Set the minimum value (brightness) for color detection         | 0 ~ 255                  | None                                   | `rpi.v_min(0)`           |








