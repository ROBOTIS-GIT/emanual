---
layout: archive
lang: en
ref: mgss-10
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/sensor/mgss-10/
sidebar:
  title: Magnetic Sensor(MGSS-10)
  nav: "mgss-10"
---

# [Introduction](#introduction)

![](/assets/images/parts/sensors/mgss-10_product.gif)

- This sensor detects magnetism.
- The sensor behaves as a touch sensor and detects a magnet close or far.
- Place the magnet approximately 5 mm in front of the sensor for touch-sensor-like behavior.

`Compatibility Guide` [Controller Compatibility]

# [Specifications](#specifications)

- Weight : 3g
- Dimensions : 24mm x 18mm x 12mm

## [Sensing Range](#sensing-range)

- The maximum detectable distance of the magnet's N/S pole and the front of the sensor : 1.5Cm

![](/assets/images/parts/sensors/mgss-10_01.png)

`Caution` Won't be detected if the sensing distance is shorter than 5mm
{: .notice--warning}

# [Pinout](#pinout)

![](/assets/images/parts/sensors/mgss-10_pinout.gif)

1. Not used
2. GND
3. ADC : magnetismdetection status
4. VCC (3.3V)
5. Not used

`Caution` Cables can may be damaged when not properly connected (i.e. wrong orientation), or use of excessive force during connection.
{: .notice--warning}

`Caution` Make connections to the controlled while unpowered. Making connections while the controller is powered may cause it to malfunction or/and damage.
{: .notice--warning}

# [Tutorials](#tutorials)

- Reading Data is similar to that of IR sensor.
- RoboPlus Task : Please refer to [IR Sensor] section in the Roboplus Task.

# [Videos](#videos)

<iframe width="560" height="315" src="https://www.youtube.com/embed/LJ1x6tMrFRE" frameborder="0" allowfullscreen></iframe>

[Controller Compatibility]: /docs/en/faq/controller_compatibility/
[IR Sensor]: /docs/en/software/rplus1/task/programming_02/#ir-sensor
