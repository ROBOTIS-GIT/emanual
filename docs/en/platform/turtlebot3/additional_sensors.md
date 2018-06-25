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

<!--[dummy Header 1]>
  <h1 id="basic-operation"><a href="#basic-operation">Basic Operation</a></h1>
<![end dummy Header 1]-->

## [Additional Sensors](#additional-sensors)
TurtleBot3 can be attach to additional sensors. Examples shown here can be that how to use additional sensors such as IR, ultrasonic, switch, etc. in OpenCR of TurtleBot3.


### [Bumper](#Bumper)
 * Device - [Touch_sensor (TS-10)](http://emanual.robotis.com/docs/en/parts/sensor/ts-10/)


![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor.png)

front side

![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor_front.png)

back side

![](/assets/images/platform/turtlebot3/additional_sensors/touch_sensor_back.png)

* Default PIN      

| Device       | PIN              |
|:-------------|:-----------------|
| Front sensor | OLLO connector 3 |
| Back sensor  | OLLO connector 4 |


**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

* Run with Turtlebot3

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

**[Remote PC]** Launch the bumper launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_bumper.launch
```


* Run with Arduino IDE

This example can be open [Arduino IDE](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#arduino-ide).

Select to `File` -> `Examples` -> `ROS` -> `2. Sensors` -> `a_Bumper`. Upload to OpenCR.

**[Remote PC]** Run ros serial_node package.

``` bash
$ rosrun rosserial_python serial_node.py __name:=turtlebot3_core _port:=/dev/ttyACM0 _baud:=115200
```

**WARNING** : If you upload examples to OpenCR, you have to re-upload [turtlebot3_core](http://emanual.robotis.com/docs/en/platform/turtlebot3/opencr_setup/#opencr-setup).
{: .notice--warning}

### [IR](#IR)

* Device - [IR_sensor (IRSS-10)](http://emanual.robotis.com/docs/en/parts/sensor/irss-10/)


![](/assets/images/platform/turtlebot3/additional_sensors/IR_sensor.png)

![](/assets/images/platform/turtlebot3/additional_sensors/IR_sensor_front.png)

* Default PIN

| Device    | PIN              |
|:----------|:-----------------|
| IR sensor | OLLO connector 2 |

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

* Run with Turtlebot3

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

**[Remote PC]** Launch the cliff launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_cliff.launch
```


* Run with Arduino IDE

This example can be open [Arduino IDE](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#arduino-ide).

Select to `File` -> `Examples` -> `ROS` -> `2. Sensors` -> `b_Cliff`. Upload to OpenCR.

**[Remote PC]** Run ros serial_node package.

``` bash
$ rosrun rosserial_python serial_node.py __name:=turtlebot3_core _port:=/dev/ttyACM0 _baud:=115200
```



### [Ultrasonic](#Ultrasonic)
* Device - Ultrasonic sensor (HC-SR04)

![](/assets/images/platform/turtlebot3/additional_sensors/sonar.png)


* Default PIN:


| Device  | PIN          |
|:--------|:-------------|
| trigger | BDPIN_GPIO_1 |
| echo    | BDPIN_GPIO_2 |

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

* Run with Turtlebot3

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

**[Remote PC]** Launch the sonar launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_sonar.launch
```

* Run with Arduino IDE

This example can be open [Arduino IDE](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#arduino-ide).

Select to `File` -> `Examples` -> `ROS` -> `2. Sensors` -> `c_Ultrasonic`. Upload to OpenCR.

**[Remote PC]** Run ros serial_node package.

``` bash
$ rosrun rosserial_python serial_node.py __name:=turtlebot3_core _port:=/dev/ttyACM0 _baud:=115200
```


### [Illumination](#Illumination)
*  Device - LDR sensor (Flying-Fish MH-sensor)

![](/assets/images/platform/turtlebot3/additional_sensors/illumination.png)

![](/assets/images/platform/turtlebot3/additional_sensors/illumination_front.png)

*  Default PIN

| Device | PIN |
|:-------|:----|
| analog | A1  |

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

* Run with Turtlebot3

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

**[Remote PC]** Launch the illumination launch file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_illumination.launch
```

* Run with Arduino IDE

This example can be open [Arduino IDE](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#arduino-ide).

Select to `File` -> `Examples` -> `ROS` -> `2. Sensors` -> `d_Illumination`. Upload to OpenCR.

**[Remote PC]** Run ros serial_node package.

``` bash
$ rosrun rosserial_python serial_node.py __name:=turtlebot3_core _port:=/dev/ttyACM0 _baud:=115200
```

### [LED](#LED)
*  Device - led (led101)

![](/assets/images/platform/turtlebot3/additional_sensors/led.png)

![](/assets/images/platform/turtlebot3/additional_sensors/led_top.png)

*  Default PIN

| Device      | PIN           |
|:------------|:--------------|
| front_left  | BDPIN_GPIO_4  |
| front_right | BDPIN_GPIO_6  |
| back_left   | BDPIN_GPIO_8  |
| back_right  | BDPIN_GPIO_10 |

**Tip :** If you want to use another PIN, refer to [OpenCR PIN Map](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice--info}

*  Run

This example is allways active when connected led. the leds show a specific pattern depend on the linear and angular velocity of Turtlebot3.
