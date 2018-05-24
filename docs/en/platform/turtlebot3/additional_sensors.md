---
layout: archive
lang: en
ref: additional_sensors
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/additional_sensors/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 3"></div>

## [Additional Sensors](#additional-sensors)
TurtleBot3 can be attach to additional sensors. Examples shown here can be that how to use additional sensors such as IR, ultrasonic, switch, etc. in OpenCR of TurtleBot3.

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

### [Bumper](#Bumper)
#### 1) Device - [Touch_sensor (TS-10)](http://emanual.robotis.com/docs/en/parts/sensor/ts-10/)


![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor.png)

front side

![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor_front.png)

back side

![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor_back.png)

#### 2) Default PIN     
| Device       | PIN               |
|------------- |------------------ |
| Front sensor | OLLO connector 3  |
| Back sensor  | OLLO connector 4  |


**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### 3) Run
**[Remote PC]** Launch the bumper launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_bumper.launch
```

### [IR](#IR)

#### 1) Device - [IR_sensor (IRSS-10)](http://emanual.robotis.com/docs/en/parts/sensor/irss-10/)


![](/assets/images/platform/turtlebot3/additional_sensors/IR_sensor.png)

![](/assets/images/platform/turtlebot3/additional_sensors/IR_sensor_front.png)

#### 2) Default PIN

| Device  | PIN                    |
|-------- |-----------------       |
| IR sensor | OLLO connector 2     |

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### 3) Run
**[Remote PC]** Launch the cliff launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_cliff.launch
```

### [Ultrasonic](#Ultrasonic)
#### 1) Device - Ultrasonic sensor (HC-SR04)

![](/assets/images/platform/turtlebot3/additional_sensors/sonar.png)

#### 2) Default PIN
| Device | PIN     |
|-------- |----------------- |
| trigger | BDPIN_GPIO_1     |
| echo    | BDPIN_GPIO_2     |    

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### 3) Run
**[Remote PC]** Launch the sonar launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_sonar.launch
```

### [Illumination](#Illumination)
#### 1) Device - LDR sensor (Flying-Fish MH-sensor)

![](/assets/images/platform/turtlebot3/additional_sensors/illumination.png)

![](/assets/images/platform/turtlebot3/additional_sensors/illumination_front.png)

#### 2) Default PIN
| Device  | PIN    |
|-------- |------- |
| analog  | A1     |   

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### 3) Run
**[Remote PC]** Launch the illumination launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_illumination.launch
```
### [LED](#LED)
#### 1) Device - led (led101)

![](/assets/images/platform/turtlebot3/additional_sensors/led.png)

![](/assets/images/platform/turtlebot3/additional_sensors/led_top.png)

#### 2) Default PIN
| Device     | PIN    |
|--------    |------- |
| front_left   | BDPIN_GPIO_4     |   
| front_right  | BDPIN_GPIO_6     |   
| back_left    | BDPIN_GPIO_8     |   
| back_right   | BDPIN_GPIO_10    |   

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

#### 3) Run
This example is allways active when connected led. the leds show a specific pattern depend on the linear and angular velocity of Turtlebot3.
