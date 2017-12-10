---
layout: archive
lang: en
ref: irss-10
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/sensor/irss-10/
sidebar:
  title: IR Sensor(IRSS-10)
  nav: "irss-10"
---

# IR Sensor(IRSS-10)

![](/assets/images/parts/sensors/ir.jpg)

# [Introduction](#introduction)

- It uses a method which produces infrared lights and calculates the amount reflected back.
- Infrared light is not suitable to measure distance between objects because even though two objects are at the same distance, the reflected amount can be varied depending on the color and brightness.

`Compatibility Guide` [Controller Compatibility]

# [Specifications](#specifications)

- Weight : 4g
- Dimensions : 24mm x 18mm x 12mm

# [Pinout](#pinout)

![](/assets/images/parts/sensors/irss-10_pinout.png)

1. SIG1 : Maintains low signal
2. GND
3. ADC : Outputs the value detected from IR receiver into analog signals
4. VCC ( 3.3V )
5. SIG2 : Can turn on the LED by sending High Signals

`Caution` Cables can may be damaged when not properly connected (i.e. wrong orientation), or use of excessive force during connection.
{: .notice--warning}
 
`Caution` Make connections to the controlled while unpowered. Making connections while the controller is powered may cause it to malfunction or/and damage.
{: .notice--warning}

# [Sensor Output](#sensor-output)

- Below is a graph representing a rough estimate of the sensor value’s changes from the white object’s distance. The sensor’s value is subject to change depending on the object’s color and surrounding environment.
- The IR sensor is divided into a receiver and transmitter. When an object is too close, the angle where the reflected infrared light comes is not even making it difficult to know the area which the sensor value decreases. Also, it can barely detect object further than 15cm.

![](/assets/images/parts/sensors/irss-10_output.png)


# [Tutorials](#tutorials)

- RoboPlus Task : Please refer to [IR Sensor] section in the Roboplus Task.

# [Videos](#videos)

<iframe width="560" height="315" src="https://www.youtube.com/embed/-qRy_NDd5eU" frameborder="0" allowfullscreen></iframe>

[Controller Compatibility]: /docs/en/parts/controller/controller_compatibility/
[DMS-80]: /docs/en/software/rplus1/task/programming_02/#dms-sensor
