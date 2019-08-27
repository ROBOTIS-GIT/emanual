---
layout: archive
lang: en
ref: task_parameters
read_time: true
share: false
author_profile: false
permalink: /docs/en/software/rplustask3/task_parameters/
sidebar:
  title: R+ Task 3.0
  nav: "rplustask3"
product_group: rplustask3
page_number: 4
---

<div style="counter-reset: h1 4"></div>

# [Task Parameters](#task-parameters)

This section explains parameters used in R+ Task 3.0. It classifies the parameters that can be used by each device. Refer to the explanation and example codes of each item for details.

## [Controller Device](#controller-device)

### [Accessory Device](#accessory-device)

#### [Port Nickname](#port-nickname)

A nickname can be assigned to accessory devices that can be connected to the ROBOTIS 5-pin port.

![](/assets/images/sw/rplus_task3/port_nickname_01.png)  

The following is an example of using the Port Nickname.  

![](/assets/images/sw/rplus_task3/port_nickname_02.png)  
![](/assets/images/sw/rplus_task3/port_nickname_03.png)

#### Geared Motor
- This is used to control the geared motor connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the Controller Functionality Comparison for more detail. Controller Functionality Comparison
- **Direction** : CW (Clock Wise), CCW (Counter Clock Wise)
- **Power** : The value ranges from 0 to 1023, where 0 means stop and 1023 is 100% power capacity.  
  ![](/assets/images/sw/rplus_task3/task3_070.png)

The following example is controlling the geared motor.

![](/assets/images/sw/rplus_task3/task3_071.png)

The following example is using the geared motor to move the robot forward.

![](/assets/images/sw/rplus_task3/task3_072.png)

#### Servo Motor (Speed, Position)

- This is used to control the servo motor connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the [Controller Compatibility] for more detail.

- Servo Mode : The Servo Motor can be set as Wheel or Joint mode.  
  ![](/assets/images/sw/rplus_task3/servo_mode_selection.png)

  - Wheel Mode : Set the speed of the servo motor.  
    ![](/assets/images/sw/rplus_task3/task3_073.png)

  - Joint Mode : Set the position of the servo motor.  
    ![](/assets/images/sw/rplus_task3/task3_074.png)

The following is an example of controlling the servo motor with Wheel Mode.

![](/assets/images/sw/rplus_task3/servo_velocity.png)

The following is an example of controlling the servo motor with Joint Mode.

![](/assets/images/sw/rplus_task3/servo_joint.png)

CM-550 doesn't require to set the Servo Mode as wheel control value or joint control value can be used in the option.  
![](/assets/images/sw/rplus_task3/cm550_servo_selection.png)  
![](/assets/images/sw/rplus_task3/cm550_servo_ex.png)


#### LED Module

- This is used to control the LED module connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the [Controller Compatibility] for more detail. Controller Functionality Comparison
- User can turn on/off the Right LED or Left LED.

  ![](/assets/images/sw/rplus_task3/task3_077.png)

The following is an example of controlling the LED module.

![](/assets/images/sw/rplus_task3/task3_078.png)

#### Various Sensors

- This is used to control the various sensors connected to the controller.
- Each Controller model has a different set of sensors that can be connected to it. Please refer to the [Controller Compatibility] for more detail.

##### Touch Sensor
Detects whether there is contact with the touch sensor. (Returns True for contact, False for no contact)
- [Touch Sensor Component Information]
- The following is an example of using the touch sensor.

  ![](/assets/images/sw/rplus_task3/task3_079.png)

##### Infrared Sensor
Measures the distance to the object (The value ranges from 0 to 1023, where the value increases from 0 as the object gets closer.)
- [Infrared Sensor Component Information]
- The following is an example of using the infrared sensor.

  ![](/assets/images/sw/rplus_task3/task3_080.png)

##### Distance Measurement Sensor
Measures the distance to the object (The value ranges from 0 to 1023, where the value increases from 0 as the object gets closer.)
- [Distance Measurement Sensor Component Information]
- The following is an example of using the distance measurement sensor.

  ![](/assets/images/sw/rplus_task3/task3_081.png)

##### Color Sensor
Detects the color of an object.
- The list of colors that the color sensor detects is as follows

  ![](/assets/images/sw/rplus_task3/task3_082.png)

- [Color Sensor Component Information]
- The following is an example of using the color sensor.

  ![](/assets/images/sw/rplus_task3/task3_083.png)

##### Magnetic Sensor
Detects magnetic materials near the sensor head (Returns True when magnetic property detected, False when not detected).
- [Magnetic Sensor Component Information]
- The following is an example of using the magnetic sensor.

  ![](/assets/images/sw/rplus_task3/task3_084.png)

##### Temperature Sensor
Measures the temperature of an object (Temperature Range : -20 ~ 120 &deg;C)
- [Temperature Sensor Component Information]
- The following is an example of using the temperature sensor.

  ![](/assets/images/sw/rplus_task3/task3_085.png)

##### Motion Detection (Passive infrared) Sensor
Detects the motion of an object.
- [Motion Detecting Sensor Component Information]
- The following is an example of using the motion detection sensor.

  ![](/assets/images/sw/rplus_task3/task3_086.png)

##### Temperature & Humidity (Thermo-hygro) Sensor
Measures the temperature and humidity of an object. (temperature range : -20 ~ 120 &deg;C, humidity range : 0 ~ 100 %)
- The following is an example of using the temperature and humidity sensor.

  ![](/assets/images/sw/rplus_task3/task3_087.png)

##### Illuminance Sensor (CDS)
Measures the brightness of the surroundings (The value ranges from 0 to 1023, where the value increases from 0 as the surroundings gets brighter).
- The following is an example of using the illuminance sensor.

  ![](/assets/images/sw/rplus_task3/task3_088.png)

##### User Device
Reads the output value of the user-created sensor.
- [Building a User Device]
- The following is an example of using the user device.

  ![](/assets/images/sw/rplus_task3/task3_089.png)

### [Motion Control](#motion-control)

- This section describes specific parameters for executing motions downloaded on controller via R+ Motion.
- Only specific controllers support motion control. (Supported controllers : [CM-200], [CM-5], [CM-510], [CM-530], [CM-550], [CM-700], [OpenCM 9.04])

#### Motion Index Number
Executes a motion by calling the corresponding Motion index number. If the Motion is being executed, you can read the current Motion index number.

![](/assets/images/sw/rplus_task3/motion_control_namelist.png)

The following is an example of using the Motion index number.

![](/assets/images/sw/rplus_task3/task3_090.png)

#### Motion Status
Returns True if motion is being executed, returns False if motion is not being executed.

The following is an example of using the Motion status to wait until the motion finishes.

![](/assets/images/sw/rplus_task3/task3_091.png)

#### Joint Offset
When a motion is executed, it adds a value between -255~255 to every joint. For instance, if the joint offset is -50 and the location values for the motion data have been set to 300 -> 400 -> 500, the location values will be changed to 250 -> 350 -> 450 and then executed.

The following is an example of applying an offset values to a specific joint.

![](/assets/images/sw/rplus_task3/task3_092.png)

The following is an example of configuring a specific joint to not be affected by the Motion data values.

![](/assets/images/sw/rplus_task3/task3_093.png)

#### Joint LED Auto ON

Turns on/off the DYNAMIXEL LED while a Motion is being executed. This feature is only supported in OpenCM 9.04

The following is an example of using the “turn on joint LED automatically” function when executing a Motion.

![](/assets/images/sw/rplus_task3/task3_094.png)

Pressing different buttons on the Remote Controller will execute their corresponding Motions.

![](/assets/images/sw/rplus_task3/task3_095.png)

### [Built-in Sensor](#built-in-sensor)
This option allows to access various sensors and features built in the controller.

#### Start Button Counter
Reads the number of `START` button click while the Controller is turning on. The value of the `Start Button Counter` ranges from 0 to 255.  
Supported Controllers : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-700], [OpenCM 7.0], [OpenCM 9.04]

The following is an example of using the Start button counter.

![](/assets/images/sw/rplus_task3/task3_099.png)

#### Controller Button / Button

Reads the status of the Controller’s buttons. Each Controller may have different buttons that can be used.

Supported Controllers : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-550], [CM-700], [OpenCM 7.0], [OpenCM 9.04]

The following is an example of using buttons for CM-5, CM-510, CM-530.

![](/assets/images/sw/rplus_task3/task3_100.png)

The following is an example of using buttons for OpenCM9.04.

![](/assets/images/sw/rplus_task3/task3_101.png)

#### Controller Button Released Event
When the START button of CM-550 is released, this value is updated to 1(True), and the value will be reset to 0(False) after the data is read.

#### Button Pressed Timer(ms)
Button Pressed Timer counts up in millisecond while pressing the button of CM-550.

#### Button Pressed Timer(s)
Button Pressed Timer counts up in second while pressing the button of CM-550.

#### Detected Clap Count
This function uses the Controller’s embedded mic to save the detected clap count. If you want to reset the counter, write `0` to the address.

Supported Controllers : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200], [CM-510], [CM-530], [CM-550], [CM-700], [OpenCM 7.0], [OpenCM 9.04]

The following is an example of using the Detected Clap Count.

![](/assets/images/sw/rplus_task3/task3_096.png)

#### Clap Counter
This function counts the number of claps. If next clap is not detected within 0.8 seconds, the counter will be reset to 0.

The following is an example of using the Clap Counter.

![](/assets/images/sw/rplus_task3/task3_097.png)

#### Infrared Sensors

- This function is used to read the value of the infrared sensor embedded in the Controller.
- The value of the infrared sensor ranges from 0 to 1023, where the value increases from 0 as the object gets closer.
- Each Controller model supports different types of sensors. Please refer to each Controller’s manual for more detail. (Supported Controllers : [CM-5], [CM-50], [CM-100A], [CM-150], [CM-200])

The following is an example of using the values of the infrared sensors of the Controller.

![](/assets/images/sw/rplus_task3/task3_098.png)

##### Left Infrared Sensor
Reads the value of the infrared sensor located at the bottom left side of the Controller.

##### Center Infrared Sensor
Reads the value of the infrared sensor located at the front and center of the Controller.

##### Right Infrared Sensor
Reads the value of the infrared sensor located at the bottom right side of the Controller.

#### Present Input Voltage
Reads the supplied voltage of the controller.

#### Controller Temperature
Reads present temperature of the CM-550.

#### Controller IMU Direction
Based on the assembly of CM-550, configure the orientation of CM-550 controller. Vertical and horizontal orientations can be defined as below.

| Controller Orientation | Value |
|:----------------------:|:-----:|
|        Vertical        |   0   |
|       Horizontal       |   1   |

#### Roll X / Pitch Y / Yaw Z
Read Roll / Pitch / Yaw data from the IMU in CM-550 controller. (Unit : 0.01 &deg;)

#### Gyro X / Y / Z
Read Gyro X / Y / Z data from the IMU in CM-550 controller. (Unit : 0.01 &deg;/s)

#### Accel X / Y / Z
Read Accelerometer X / Y / Z data from the IMU in CM-550 controller. (Unit : 0.001 G)

### [Buzzer](#buzzer)

#### Buzzer Index / Buzzer Timer

- This is used to play a musical scale or a melody using the Buzzer embedded in the Controller.
- The **Buzzer Timer** should be configured first before selecting the **Buzzer Index** in order for the Buzzer to sound properly.

The following figure shows the screens to select the type of buzzer.

![](/assets/images/sw/rplus_task3/task3_102.png)

The following is an example of playing a musical scale from the Controller. When playing a musical scale, the **Buzzer Timer** can be set between 0 ~ 5 seconds.

![](/assets/images/sw/rplus_task3/task3_103.png)

The following is an example of playing a melody from the Controller. When playing a melody, the **Buzzer Timer** should be set with `Play special melody` option.

![](/assets/images/sw/rplus_task3/task3_104.png)

### [Remote Controller](#remote-controller)

- These are the parameters that send and receive data with external devices using the wireless communication module (Bluetooth, IR, ZIGBee) connected to the Controller.
- It is generally used when controlling a robot with the RC-100 or smartphone virtual remote controller, but it can also be used to communicate with a user developed software.
- The data is restricted to 2 Byte value (0 ~ 65,535 or 0x0000 ~ 0xFFFF).

#### Remocon RXD
This function is used to read the received value of the Controller.

![](/assets/images/sw/rplus_task3/task3_105.png)

#### Remocon TXD
This function is used when the Controller transmits data to other devices.

![](/assets/images/sw/rplus_task3/task3_106.png)

#### Remocon Data Arrived
If the Controller receives data, this address is updated to True.

![](/assets/images/sw/rplus_task3/task3_107.png)

#### My ID
This address configures the ZIGBee ID of the controller.

![](/assets/images/sw/rplus_task3/task3_108.png)

#### Remocon ID
This address configures the ZIGBee ID of the remote controller.  

![](/assets/images/sw/rplus_task3/task3_109.png)

#### RC-100 Channel
Configures the IR receiver channel when using an infrared receiver (If this address is set to 255, RC-100 will operate as Bluetooth or ZIGBee).

![](/assets/images/sw/rplus_task3/task3_110.png)

The following is an example of processing a wireless data received from the Controller.

![](/assets/images/sw/rplus_task3/task3_111.png)

The following is an example of the Controller sending data to the outside.

![](/assets/images/sw/rplus_task3/task3_112.png)


### [Timer](#timer)
**Timer** and **High-resolution Timer** are used to set the time to count-down.

#### Timer
This is used to set the time of the Controller to count-down. The value of the Timer ranges from 0 to 255, and the unit is 0.128 second.

The following is an example of using Timer to wait approximately 1 second (1.024 seconds).

![](/assets/images/sw/rplus_task3/task3_113.png)

#### High-resolution Timer
This has the same function as Timer but counts the time more precisely. The value of the Timer ranges from 0 to 65,535, and the unit is 0.001 second.

The following is an example of using Precision Timer to wait exactly 1 second (1.000 second).

![](/assets/images/sw/rplus_task3/task3_114.png)

#### Delay
CM-550 supports `Delay` function that can simplifies the combined usage of `Timer` and `WAIT WHILE`.

![](/assets/images/sw/rplus_task3/cm550_delay_01.png)

![](/assets/images/sw/rplus_task3/cm550_delay_02.png)  

The following is an example of replacing `Timer` and `WAIT WHILE` with `Delay` function with CM-550.

![](/assets/images/sw/rplus_task3/cm550_delay_03.png)

#### Powersave Timer
This is used to control the power saving mode of controllers.
- The value of the Powersave Timer ranges from 0 to 255 (Unit : minute).
- The default value of the Powersave Timer is `5`.
- Setting this value to `0` will deactivate power saving mode except OpenCM7.0.
- It is recommended to use Powersave Timer to prevent battery over discharge.

|  Value   |       OpenCM7.0 Timer       |   Other Controller Timer    |
|:--------:|:---------------------------:|:---------------------------:|
|    0     |         60 minutes          | <sup>*</sup> Timer not used |
|  1 ∼ 60  |       1 ∼ 60 minutes        |       1 ∼ 60 minutes        |
| 61 ∼ 254 |         60 minutes          |       61 ∼254 minutes       |
|   255    | <sup>*</sup> Timer not used |         255 minutes         |

<sup>**`*`**</sup> Battery can be over discharged when power saving is deactivated.
{: .notice--warning}

**CAUTION**: Be aware that OpenCM7.0 has different configuration compare to other controllers.
{: .notice--warning}

The following is an example of using Powersave Timer to configure sleep mode for the Controller. If a new wireless data arrives within 5 minutes, it resets the Powersave Timer value.

![](/assets/images/sw/rplus_task3/task3_115.png)


### [Controller: Miscellaneous](#controller-miscellenous)

#### Random Number
Generate a random number between 0 and a maximum value. You can set a number as the maximum value. The valid value is from 0 to 255

The following is an example of using Random Number to execute a random motion. This is done by generating a random number between 0 and 15 to execute a corresponding motion.

![](/assets/images/sw/rplus_task3/task3_116.png)

#### Built-in LED
Control the build-in LED (Aux LED)

The following is an example of using a built-in LED. It is turning the built-in LED on and off every 0.512 second interval.

![](/assets/images/sw/rplus_task3/task3_117.png)

#### Print Screen
Print a specific value from the task code on the screen

#### Print Screen with line
Print a specific value from the task code on the screen, and print the new line.

The following is an example of using Print Screen and Print Screen with Line to print the sensor value.

![](/assets/images/sw/rplus_task3/task3_118.png)  
![](/assets/images/sw/rplus_task3/task3_119.png)

### [Controller: Custom](#controller-custom)

- Directly read from or write to the address of an external device such as a DYNAMIXEL.
- User can read/write by selecting the specified address in units of Byte, Word, or DWord. Write or read in Byte or DWORD variable to write/read on user accessed address
- Please refer to the DYNAMIXEL Control Table for more detail.


## [DYNAMIXEL Device](#dynamixel-device)

These are the parameters for reading or writing values in the DYNAMIXEL Control Table. Please refer to the DYNAMIXEL Control Table for more details.

### [DYNAMIXEL](#dynamixel)

- DX / RX / AX supported parameters  
  토크 켜기 / 끄기, LED, CW margin / CCW margin, CW slope / CCW slope, 목표 위치, 이동 속도, 토크 한계, 현재 위치, 현재 속도, 현재 하중, 현재 전압, 현재 온도, 움직임 유무,
- MX 시리즈에서 사용 가능한 파라미터  
  토크 켜기 / 끄기, LED, PID gain, 목표 위치, 이동 속도, 토크 한계, 현재 위치, 현재 속도, 현재 하중, 현재 전압, 현재 온도, 움직임 유무
- X 시리즈에서 사용 가능한 파라미터(XL 라인업은 일부 파라미터 미적용)  
  토크 켜기 / 끄기, LED, PID gain, 목표 위치, 목표 속도, 목표 전류, 목표 PWM, 프로파일 가속도, 프로파일 속도, 토크 한계, 현재 위치, 현재 속도, 현재 전류, 현재 PWM, 현재 하중, 현재 전압, 현재 온도, 움직임 유무

#### 작동 모드
다이나믹셀의 동작 모드를 설정합니다. 자세한 내용은 다이나믹셀의 Operating Mode를 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_216.png)

#### 토크 켜기 / 끄기
다이나믹셀의 토크를 켜거나 끄기 위해 사용합니다. True일 때 토크 켜짐, False일 때 토크 꺼짐으로 동작합니다.  
- 아래는 제어기의 버튼을 누르면 ID가 1인 다이나믹셀의 토크를 켜는 예제입니다.  
  ![](/assets/images/sw/rplus_task3/task3_120.png)

#### LED
다이나믹셀의 LED를 켜거나 끄기 위해 사용합니다. True일 때 LED 켜짐, False일 때 LED 꺼짐으로 동작합니다.

#### CW margin / CCW margin
다이나믹셀의 Margin 설정값을 읽어오거나 설정하기 위해 사용합니다. 값 범위는 0~ 254이며 가급적 기본값(1)을 바꾸지 않는 것이 좋습니다.  
자세한 설명은 해당 다이나믹셀의 컨트롤 테이블을 참고하세요.

#### CW slope / CCW slope
다이나믹셀의 Slope 설정값을 읽어오거나 설정하기 위해 사용합니다. 총 7단계로 설정가능하며 아래 표에 따라 대표값이 설정됩니다.  
자세한 설명은 해당 다이나믹셀의 컨트롤 테이블을 참고하세요.

| 단계 |       Data 값       | Data 대표 값 |
|:----:|:-------------------:|:------------:|
|  1   | 0 (0x00) ~ 3(0x03)  |   2 (0x02)   |
|  2   |  4(0x04) ~ 7(0x07)  |   4 (0x04)   |
|  3   |  8(0x08)~15(0x0F)   |   8 (0x08)   |
|  4   |  16(0x10)~31(0x1F)  |  16 (0x10)   |
|  5   |  32(0x20)~63(0x3F)  |  32 (0x20)   |
|  6   | 64(0x40)~127(0x7F)  |  64 (0x40)   |
|  7   | 128(0x80)~254(0xFE) |  128 (0x80)  |

#### PID Gains
다이나믹셀의 PID 설정값을 읽어오거나 설정하기 위해 사용합니다.  
P gain은 Proportional Gain으로 작은 값일수록 유격이 커지고, 목표위치 근처에서의 출력정도가 약해집니다.  
I gain은 Integral Gain 이며, D gain은 Derivative Gain 입니다.

#### 목표 위치
다이나믹셀의 목표 위치값을 읽어오거나 설정하기 위해 사용합니다.  
- 아래 그림과 같이 `모터 위치 값` 컨트롤을 사용하여 각도 위치를 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_121.png)

#### 목표 속도
다이나믹셀의 이동 속도를 읽어오거나 설정하기 위해 사용합니다.  
- 아래 그림과 같이 `모터 제어 값` 컨트롤을 사용하여 회전 방향과 출력 값을 설정할 수 있습니다.  
  ![](/assets/images/sw/rplus_task3/task3_122.png)

#### 프로파일 가속도
다이나믹셀 X 시리즈에서 프로파일의 가속도를 설정합니다. 자세한 내용은 X 시리즈의 [Profile Acceleration(108)](/docs/kr/dxl/x/xm430-w210/#profile-acceleration)을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_214.png)

#### 프로파일 속도
다이나믹셀 X 시리즈가 Position Control 또는 Extended Position Control 모드일 때 프로파일의 최대 속도를 설정합니다. 자세한 내용은 X 시리즈의 [Profile Velocity(112)](/docs/kr/dxl/x/xm430-w210/#profile-velocity)을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_215.png)

#### 목표 전류 / 토크
다이나믹셀의 전류 / 토크 한계를 설정하기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_207.png)

#### 현재 위치
다이나믹셀의 현재 위치를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_208.png)

#### 현재 속도
다이나믹셀의 현재 속도를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_209.png)

#### 현재 하중
다이나믹셀의 출력축이 받고있는 하중값과 하중의 방향을 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_210.png)

#### 현재 입력 전압
다이나믹셀의 내부 전압을 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_211.png)

#### 현재 온도
다이나믹셀의 내부 온도를 읽어오기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_212.png)

#### 움직임 유무
다이나믹셀의 움직임 유무를 읽어오기 위해 사용합니다. True일 때 움직이는 상태, False일 때 움직이지 않는 상태를 나타냅니다.  
![](/assets/images/sw/rplus_task3/task3_213.png)

### [SyncWrite](#syncwrite)

CM-550 제어기를 사용할 경우 [프로토콜 2.0 - SyncWrite](/docs/kr/dxl/protocol2/#sync-write) 명령어를 사용할 수 있습니다.

#### SyncWrite Command

SyncWrite 명령어를 사용합니다. 아래와 같이 지정된 파라미터에 따른 동작을 합니다.

| 파라미터 |          동작           |                         예시                         |
|:--------:|:-----------------------:|:----------------------------------------------------:|
|    0     | SyncWrite 패킷 시작하기 | ![](/assets/images/sw/rplus_task3/sync_write_01.png) |
|    1     | SyncWrite 패킷 입력하기 | ![](/assets/images/sw/rplus_task3/sync_write_02.png) |
|    2     | SyncWrite 패킷 전송하기 | ![](/assets/images/sw/rplus_task3/sync_write_03.png) |

#### SyncWrite Address

데이터가 전송될 주소를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_04.png)  
> 데이터가 전송될 시작주소를 116번지로 설정합니다.

#### SyncWrite Length

전송될 데이터의 길이를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_05.png)  
> 전송될 데이터의 길이를 4바이트로 설정합니다.

#### SyncWrite ID

데이터가 적용될 ID를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_06.png)  
> 데이터를 수신받을 다이나믹셀의 ID를 2로 설정합니다.

#### SyncWrite Data

전송될 데이터를 나타냅니다.

![](/assets/images/sw/rplus_task3/sync_write_07.png)  
> 10진수 값 2048을 전송할 데이터로 설정합니다.

#### SyncWrite 사용 예

다음은 SyncWrite 명령어를 이용해서 다이나믹셀 ID 2번과 3번의 116번 주소에 각각 2048의 값을 전달하는 방법입니다.

![](/assets/images/sw/rplus_task3/sync_write_example.png)

### [IR Array Sensor](#ir-array-sensor)

- 적외선 센서 값 (1~7번) : 적외선 센서 어레이의 적외선 센서 값을 읽어오기 위해 사용합니다. 벽이나 물체의 표면 색, 질감에 따라 측정값에 차이가 생길 수 있으며, 해당 센서는 0~5cm 이내에서 사용하도록 최적화 되었습니다.
- 적외선 감지 기준 값 (1~7번) : 적외선 센서 어레이가 흰색/검정색을 판단하는 기준 값입니다.

|                  | 검은색 감지 유무 | LED |
|:----------------:|:----------------:|:---:|
| 센서값 <= 기준값 |    해당 BIT 1    | ON  |
| 센서값 > 기준값  |    해당 BIT 0    | OFF |

- 버저 종류 : 적외선 센서 어레이의 버저 종류를 설정하기 위해 사용합니다.
- 버저 울림 시간 : 적외선 센서 어레이의 버저 사용시 소리가 지속될 시간을 설정하는데 사용합니다. 저 울림 시간을 먼저 설정한 후 버저 종류를 설정해야 설정에 맞게 소리가 납니다.
- 감지 기준 값 자동 설정 : 검정색 감지 기준값 자동 찾기의 시작과 마침을 결정하는데 사용합니다. 자세한 사용법은 아래 예제를 참고하세요.
- 적외선 물체 감지 유무 : 적외선 센서 어레이에 물체가 감지되었는지를 읽어오기 위해 사용합니다.

| 2 진수 값 | 10 진수 값 |        검은색 감지 유무        |
|:---------:|:----------:|:------------------------------:|
|  0000001  |     1      | 1번 적외선 센서에 검은 색 감지 |
|  0000010  |     2      | 2번 적외선 센서에 검은 색 감지 |
|  0000100  |     4      | 3번 적외선 센서에 검은 색 감지 |
|  0001000  |     8      | 4번 적외선 센서에 검은 색 감지 |
|  0010000  |     16     | 5번 적외선 센서에 검은 색 감지 |
|  0100000  |     32     | 6번 적외선 센서에 검은 색 감지 |
|  1000000  |     64     | 7번 적외선 센서에 검은 색 감지 |

아래 그림과 같이 그림을 보며 값을 체크할 수 있습니다.

![](/assets/images/sw/rplus_task3/task3_123.png)

### [DYNAMIXEL: Custom](#dynamixel-custom)

- 다이나믹셀 등의 외부 장치의 주소를 직접 접근하여 읽기와 쓰기 작업을 진행할 수 있습니다.
- 사용자가 지정한 주소를 Byte(1바이트), Word(2바이트), DWord(4바이트) 단위로 선택하여 읽거나 씁니다.
- 각 다이나믹셀 매뉴얼 내의 컨트롤 테이블을 참고하세요.  
![](/assets/images/sw/rplus_task3/task3_217.png)

## [Smart Device](#smart-device)

제어기와 블루투스로 연결된 앱(R+ Smart, R+ IoT, R+ ENGINEER)의 컨트롤 테이블 값을 읽거나 쓰기 위한 파라미터 입니다.

### [Camera](#camera)

스마트 기기의 카메라 기능을 사용하기 위한 파라미터입니다.

#### 카메라 선택
스마트 기기에 내장된 카메라 중 사용할 카메라를 선택합니다. 아래 예제는 후면 카메라와 전면 카메라를 번갈아 선택하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_124.png)  
![](/assets/images/sw/rplus_task3/task3_125.png)

#### 카메라 확대
스마트 기기의 카메라를 확대할 때 사용합니다 (값의 범위는 0~255 입니다).  
아래는 카메라를 1.024초에 한번씩 확대하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_126.png)  
![](/assets/images/sw/rplus_task3/task3_127.png)![](/assets/images/sw/rplus_task3/task3_128.png)

#### 카메라 센서
스마트 기기의 카메라를 센서모드로 동작시키기 위해 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_129.png)

**참고**: 카메라 센서의 자세한 사용법은 [비전](#비전)을 참고하세요.
{: .notice}

#### 사진 촬영
스마트 기기의 카메라로 사진을 촬영할 때 사용합니다. (True일 때 촬영, False일 때 촬영정지)  
아래는 스마트 기기의 후면 카메라를 이용하여 사진을 촬영하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_130.png)  
![](/assets/images/sw/rplus_task3/task3_131.png)

### [비전](#비전)

스마트 기기의 카메라를 “카메라 센서”로 설정시 사용하는 파라미터입니다.

#### 감지된 색상
“카메라 센서”의 “색상 감지 모드”를 사용하는 경우, 화면 가운데 부분에 표시되는 색상을 확인하기 위해 사용합니다.  
아래는 감지된 색상 값을 사용하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_132.png)

#### 감지할 라인 색상
“카메라 센서”의 “라인 감지 모드”를 사용하는 경우, 감지할 라인의 색상을 설정하기 위해 사용합니다.

#### 라인 감지 영역
“카메라 센서”의 “라인 감지 모드”를 사용하는 경우, 감지된 라인의 위치를 확인하기 위해 사용합니다.  
아래는 녹색 라인이 감지되면 해당 라인에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_133.png)  
![](/assets/images/sw/rplus_task3/task3_134.png)

#### 얼굴 감지 영역
“카메라 센서”의 “얼굴 감지 모드”를 사용하는 경우, 감지된 얼굴의 위치를 확인하기 위해 사용합니다.  
아래는 얼굴이 감지되면 해당 위치에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_135.png)  
![](/assets/images/sw/rplus_task3/task3_136.png)

#### 동작 감지 영역
“카메라 센서”의 “동작 감지 모드”를 사용하는 경우, 감지된 동작의 위치를 확인하기 위해 사용합니다.  
아래는 동작이 감지되면 해당 위치에 빨간색 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_137.png)  
![](/assets/images/sw/rplus_task3/task3_138.png)

### [표시](#표시)

스마트 기기의 화면에 배경, 그림, 도형, 문자, 숫자를 표시하기 위해 사용합니다.

#### 화면 회전
스마트 기기의 화면 방향을 설정할 때 사용합니다.  
아래는 스마트 기기의 화면 방향을 1.024초마다 번갈아 변경하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_139.png)  
![](/assets/images/sw/rplus_task3/task3_140.png)![](/assets/images/sw/rplus_task3/task3_141.png)

#### 배경 표시
스마트 기기의 화면에 그림 배경을 설정할 때 사용합니다.(스마트 기기 앱에 미리 등록해놓은 배경만 사용할 수 있습니다.)  
아래는 스마트 기기의 그림 배경을 아이템1로 설정하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_142.png)  
![](/assets/images/sw/rplus_task3/task3_143.png)

#### 그림 표시
스마트 기기의 화면에 그림을 배치할 때 사용합니다.(스마트 기기 앱에 미리 등록해놓은 그림만 사용할 수 있습니다.)  
아래는 스마트 기기의 위치2,3과 위치 4,3에 그림을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_144.png)  
![](/assets/images/sw/rplus_task3/task3_145.png)

#### 감지된 얼굴 그림 표시
“카메라 센서”의 “얼굴 감지 모드”를 사용할 경우, 감지된 얼굴에 덮어씌울 그림을 설정할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 그림만 사용할 수 있습니다.)  
아래는 스마트 기기의 카메라를 이용하여 얼굴을 감지한 후 감지된 얼굴 위에 그림을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_146.png)  
![](/assets/images/sw/rplus_task3/task3_147.png)

#### 도형 표시
스마트 기기의 화면에 도형을 배치할 때 사용합니다. (1 : 원, 2 : 사각형, 3 : 삼각형)  
아래는 위치3,3에 파란색 원형과 회색 삼각형을 번갈아 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_148.png)  
![](/assets/images/sw/rplus_task3/task3_149.png)![](/assets/images/sw/rplus_task3/task3_150.png)

#### 문자 표시
스마트 기기의 화면에 문자를 배치할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 문자만 사용할 수 있습니다.)  
아래는 위치1,3~5,3에 차례로 문자를 표시했다가 지우는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_151.png)  
![](/assets/images/sw/rplus_task3/task3_152.png)
![](/assets/images/sw/rplus_task3/task3_153.png)
![](/assets/images/sw/rplus_task3/task3_154.png)
![](/assets/images/sw/rplus_task3/task3_155.png)

#### 숫자 표시
스마트 기기의 화면에 숫자를 배치할 때 사용합니다. (별도의 문자 등록 없이 0~255 사이의 숫자를 사용할 수 있습니다.)  
아래는 위치3,3에 숫자를 증가하며 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_156.png)  
![](/assets/images/sw/rplus_task3/task3_157.png)![](/assets/images/sw/rplus_task3/task3_158.png)

### [멀티미디어](#멀티미디어)

스마트 기기의 화면과 스피커를 사용하여 영상을 출력하거나, 소리를 출력하기 위해 사용합니다.

#### 문자음성 자동변환(TTS)
스마트 기기의 문자음성 자동변환 서비스를 활용할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 문자만 사용할 수 있습니다.)  
아래는 문자아이템2, 문자아이템3을 번갈아 음성으로 변환하여 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_159.png)

#### 악기 연주
스마트 기기로 악기 소리를 낼 때 사용합니다.  
아래는 어쿠스틱 피아노로 도, 레, 미를 반복해서 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_160.png)

#### 오디오 재생
스마트 기기의 오디오 파일을 재생할 때 사용합니다.  
오디오 재생1과 오디오 재생2는 독립적으로 동작합니다. (스마트 기기 앱에 미리 등록해놓은 오디오 파일만 사용할 수 있습니다.)

#### 볼륨
스마트 기기의 사운드 볼륨을 설정할 때 사용합니다.  
값 범위는 0~255이며, 값이 클수록 볼륨이 커집니다. 기기에 따라 값의 범위가 다를 수 있습니다.  
아래는 오디오 재생1, 오디오 재생2, 볼륨을 이용하여 스마트 기기의 음원을 재생하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_161.png)

#### 동영상 재생
스마트 기기의 동영상 파일을 재생할 때 사용합니다. (스마트 기기 앱에 미리 등록해놓은 동영상만 사용할 수 있습니다.)

#### 동영상 일시정지
스마트 기기에서 동영상 파일이 재생되고 있을 때 일시 정지하기 위해 사용합니다.  
아래는 동영상 재생과 동영상 일시정지를 사용하여 화면을 터치하고 있는 동안 동영상 재생을 일시정지하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_162.png)

### [센서](#센서)

스마트 기기에 내장된 여러 가지 센서를 활용하기 위해 사용합니다.

#### 흔들림 센서
스마트 기기의 흔들림 센서를 활용하기 위해 사용합니다. 스마트 기기의 흔들림 정도에 따라 0~255사이 값이 출력됩니다.  
아래는 스마트 기기의 흔들림 정도를 읽어 값이 80이상일 때 화면에 표시한 도형의 색상을 바꾸는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_163.png)  
![](/assets/images/sw/rplus_task3/task3_164.png)![](/assets/images/sw/rplus_task3/task3_165.png)

#### 기울기 센서
스마트 기기의 기울기 센서를 활용하기 위해 사용합니다. (왼쪽), (오른쪽), (위쪽), (아래쪽)의 기울기를 각각 0~90도로 출력됩니다.  
아래는 스마트 기기의 기울기에 따라 화면에 기울어진 방향에 원을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_166.png)  
![](/assets/images/sw/rplus_task3/task3_167.png)![](/assets/images/sw/rplus_task3/task3_168.png)![](/assets/images/sw/rplus_task3/task3_169.png)

#### 조도 센서
스마트 기기의 조도 센서를 활용하기 위해 사용합니다. 주위 밝기에 따라 0~65535의 값이 출력됩니다. 기기에 따라 값의 범위가 다를 수 있습니다.  
아래는 조도를 측정하여 주위가 어두우면 회색 원을, 주위가 밝으면 흰색 원을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_170.png)  
![](/assets/images/sw/rplus_task3/task3_171.png)![](/assets/images/sw/rplus_task3/task3_172.png)

#### 자기장 센서
스마트 기기의 자기장 센서를 활용하기 위해 사용합니다. 주위 자기장에 따라 0~65535의 값이 출력됩니다.  
아래는 스마트 기기 주위의 자기장을 측정하여 값을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_173.png)  
![](/assets/images/sw/rplus_task3/task3_174.png)![](/assets/images/sw/rplus_task3/task3_175.png)

#### 방향 센서
스마트 기기의 방향 센서를 활용하기 위해 사용합니다. 방향에 따라 각도 단위로 0~359 사이의 값을 출력합니다. (0:북, 90:동, 180:남, 270:서)  
아래는 스마트 기기의 방향 값을 10으로 나누어 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_176.png)  
![](/assets/images/sw/rplus_task3/task3_177.png)

#### 소음 센서
스마트 기기의 소음 센서를 활용하기 위해 사용합니다. 소음에 따라 dB 단위로 0~255 사이의 값을 출력합니다.  
아래는 소음의 크기에 따라 도형을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_178.png)  
![](/assets/images/sw/rplus_task3/task3_179.png)![](/assets/images/sw/rplus_task3/task3_180.png)

#### 음성 인식
스마트 기기의 음성 인식 기능을 켜거나 끄기 위해 사용합니다. True일 때 “음성 인식 시작”, False일 때 “음성 인식 정지”로 동작합니다.  

#### 음성 인식 결과
“음성 인식”기능을 사용할 때, 인식된 결과를 확인하기 위해 사용합니다.  
인식된 결과가 숫자로 표시됩니다. 0일 때 “결과값 없음”, 1~199일 때 해당 문자아이템과 일치.  
아래는 음성 인식과 음성 인식 결과를 사용하여 화면을 터치했을 때 음성을 인식하여 인식된 결과를 화면 중앙에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_181.png)  
![](/assets/images/sw/rplus_task3/task3_182.png)![](/assets/images/sw/rplus_task3/task3_183.png)

#### 터치 위치
스마트 기기의 화면 터치 위치를 활용하기 위해 사용합니다. 터치 위치1은 첫 번째로 터치된 손가락을 의미하며 터치 위치2는 두 번째로 터치된 손가락을 의미합니다.  
아래는 터치한 위치에 도형을 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_184.png)  
![](/assets/images/sw/rplus_task3/task3_185.png)![](/assets/images/sw/rplus_task3/task3_186.png)

#### 제스처 인식
스마트 기기의 제스처 인식 기능을 활용하기 위해 사용합니다.  
아래는 제스처를 인식하여 해당 제스처의 번호를 화면에 출력하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_187.png)  
![](/assets/images/sw/rplus_task3/task3_188.png)![](/assets/images/sw/rplus_task3/task3_189.png)

### [스마트 장치: 기타](#스마트-장치-기타)
스마트 기기의 부가 기능을 활용하기 위해 사용합니다.

#### 디버그 정보 표시
스마트 기기의 주요기능들의 값을 화면에 표시하여 확인하기 위해 사용합니다.  
하위 비트(우측)부터 1로 설정 시 다음의 정보를 스마트 기기의 화면에 표시할 수 있습니다.

|  비트(Bit)  | 정보                                             |
|:-----------:|:-------------------------------------------------|
| 1번째 비트  | 비전 관련 위치, 색상 표시 (정수 입력 시 : 1)     |
| 2번째 비트  | 흔들림 값 표시 (정수 입력 시 : 2)                |
| 3번째 비트  | 기울기 상하좌우 값 표시 (정수 입력 시 : 4)       |
| 4번째 비트  | 조도 값 표시 (정수 입력 시 : 8)                  |
| 5번째 비트  | 자기장 값 표시 (정수 입력 시 : 16)               |
| 6번째 비트  | 방향 값 표시 (정수 입력 시 : 32)                 |
| 7번째 비트  | 소음 값 표시 (정수 입력 시 : 64)                 |
| 8번째 비트  | 터치 위치 1, 2값 표시 (정수 입력 시 : 128)       |
| 9번째 비트  | 음성입력 결과 값 표시 (정수 입력 시 : 256)       |
| 10번째 비트 | SMS 관련 전화번호, 내용 표시(정수 입력 시 : 512) |

아래는 디버그 정보 표시 기능을 이용하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_190.png)  
![](/assets/images/sw/rplus_task3/task3_191.png)

#### 화면 출력
태스크 코드에서 특정 값을 눈으로 확인하고 싶을 때 사용합니다. (스마트 앱 화면에 표시됩니다.)

#### 화면 출력 후 줄바꿈
태스크 코드에서 특정 값을 눈으로 확인하고 싶을 때 사용합니다. 출력 후 자동으로 다음 줄로 변경됩니다. (스마트 앱 화면에 표시됩니다.)  
아래는 스마트 기기의 화면출력 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_192.png)

#### 스마트 타이머
스마트 기기의 타이머를 설정하기 위해 사용합니다.

#### 진동 시간
스마트 기기의 진동 기능을 켤 때 사용합니다.

#### 진동 상태
스마트 기기가 현재 진동 중인지 확인하기 위해 사용합니다.  
아래는 스마트 타이머와 진동 시간을 이용하여 10초마다 1초 진동하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_193.png)

#### 현재 시간
스마트 기기로부터 현재시간을 읽어오기 위해 사용합니다.  
아래는 현재시간을 화면에 표시하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_194.png)  
![](/assets/images/sw/rplus_task3/task3_195.png)

#### 플래시 LED
스마트 기기의 카메라 플래시 LED를 켜거나 끄기 위해 사용합니다.  
아래는 조도센서로 주위 밝기를 측정하여 어두우면 플래시 LED를 켜는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_196.png)

#### 앱 실행하기
스마트 기기에 설치된 앱을 실행하기 위해 사용합니다.  
아래는 화면을 터치하면 등록된 앱을 실행하는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_197.png)

#### E-Mail 기능
촬영한 사진이나 동영상을 E-Mail로 발송하기 위해 사용합니다.

#### E-Mail 전송 상태
현재 E-Mail이 전송 중인지 확인하기 위해 사용합니다.  
아래는 E-Mail 전송 기능과 E-Mail 전송 상태를 사용하여 촬영된 사진을 메일로 보내는 예제입니다.  
![](/assets/images/sw/rplus_task3/task3_202.png)

#### 화면 넓이 / 화면 높이
스마트 기기 화면의 넓이와 높이를 읽기 위해 사용합니다.

### [사용자 데이터](#사용자-데이터)
스마트 기기의 특정 주소영역에 사용자의 데이터를 읽거나 쓸 수 있습니다.  

### [스마트 장치: 직접 입력](#스마트-장치-직접-입력)

- 스마트 기기의 주소를 직접 접근하여 읽기와 쓰기 작업을 진행할 수 있습니다.
- 사용자가 지정한 주소를 Byte 또는 Word, DWord 단위로 선택하여 읽거나 씁니다.
- 제품과 함께 사용되는 앱의 컨트롤 테이블을 참고하세요. [R+ Smart 컨트롤 테이블]

## [공통](#공통)

모든 장치에서 사용할 수 있는 기본적인 변수와 상수입니다.

### [변수](#변수)

- 프로그램 내부의 저장공간으로 여러 가지 데이터를 저장하거나 읽을 수 있습니다.
- 숫자를 기억하고 있어야 하는 경우나 공통된 값을 한꺼번에 변경해야 하는 경우 변수를 사용하면 유용합니다.
- 아래는 변수를 사용하는 예제입니다.

![](/assets/images/sw/rplus_task3/task3_203.png)

### [숫자](#숫자)

- 프로그램 내부에서 숫자를 직접 입력해야 하는 경우 사용합니다.
- 대체로 조건절에서 값을 비교할 때 사용합니다.
- 값 범위는 -2,147,483,648 ~ 4,294,967,295 입니다.

![](/assets/images/sw/rplus_task3/task3_204.png)

### [참/거짓](#참거짓)

- 프로그램 내부에서 참 / 거짓(True / False)를 직접 입력해야 하는 경우 사용합니다.
- 대체로 조건절에서 상태를 비교할 때 사용합니다.
- 값 범위는 0~1 입니다. False일 때 0, True일 때 1.

![](/assets/images/sw/rplus_task3/task3_205.png)

### [2진수 숫자](#2진수-숫자)

- 프로그램 내부에서 숫자를 직접 입력해야 하는 경우 사용합니다.
- 대체로 비트 연산을 해야한 경우 사용되며, 2진수로 표기됩니다.
- 값 범위는 0 ~ 4,294,967,295 입니다. (Hex : 00 00 00 00 ~ FF FF FF FF)  
![](/assets/images/sw/rplus_task3/task3_206.png)

### [모터 모드](#모터-모드)
SM-10 서보모터의 속도모드, 관절모드를 전환할 경우 사용합니다.  
![](/assets/images/sw/rplus_task3/task3_219.png)

## [모션 목록](#모션-목록)
모션 예제가 열려있는 경우 해당 예제의 모션 목록이 여기에 나타납니다.  
모션 예제가 열려있지 않은 경우 이 항목은 메뉴에 표시되지 않습니다.  
![](/assets/images/sw/rplus_task3/task3_218.png)

[Controller Compatibility]: /docs/en/parts/controller/controller_compatibility/
[접촉 센서 부품 정보]: /docs/kr/parts/sensor/ts-10/
[적외선 센서 부품 정보]: /docs/kr/parts/sensor/irss-10/
[컬러 센서 부품 정보]: /docs/kr/parts/sensor/cs-10/
[자석 센서 부품 정보]: /docs/kr/parts/sensor/mgss-10/
[온도 센서 부품 정보]: /docs/kr/parts/sensor/tps-10/
[절대 거리 센서 부품 정보]: /docs/kr/parts/sensor/dms-80/
[조도 센서 부품 정보]: /docs/kr/parts/sensor/cds-10/
[온습도 센서 부품 정보]: /docs/kr/parts/sensor/tms-10/
[동작감지 센서 부품 정보]: /docs/kr/parts/sensor/pir-10/
[Building a User Device]: /docs/en/edu/bioloid/premium/#make-your-own-sensor
[CM-50]: /docs/kr/parts/controller/cm-100/
[CM-100A]: /docs/kr/parts/controller/cm-100/
[CM-150]: /docs/kr/parts/controller/cm-150/
[CM-200]: /docs/kr/parts/controller/cm-200/
[CM-5]: /docs/kr/parts/controller/cm-5/
[CM-510]: /docs/kr/parts/controller/cm-510/
[CM-530]: /docs/kr/parts/controller/cm-530/
[CM-550]: /docs/kr/parts/controller/cm-550/
[CM-700]: /docs/kr/parts/controller/cm-700/
[OpenCM 7.0]: /docs/kr/parts/controller/opencm7/
[R+ Smart 컨트롤 테이블]: /docs/kr/software/mobile_app/rplussmart/#r-smart-control-table
[ROBOTIS DREAM]: /docs/kr/edu/dream/dream1-1/
[ROBOTIS SMART]: /docs/kr/edu/smart/smart1-1/
[ROBOTIS STEM]: /docs/kr/edu/bioloid/stem/
[ROBOTIS PREMIUM]: /docs/kr/edu/bioloid/premium/
[ROBOTIS GP]: /docs/kr/edu/bioloid/gp/
[ROBOTIS MINI]: /docs/kr/edu/mini/
[OpenCM 9.04]: /docs/kr/parts/controller/opencm904/
[BT-110]: /docs/kr/parts/communication/bt-110/
[BT-210]: /docs/kr/parts/communication/bt-210/
[BT-410]: /docs/kr/parts/communication/bt-410/
[제어기펌웨어 업데이트]: /docs/kr/software/rplus2/manager/getting_started/#펌웨어-업데이트
