---
layout: archive
lang: en
ref: dms-80
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/sensor/dms-80/
sidebar:
  title: Distance Sensor(DMS-80)
  nav: "dms-80"
---

# [Introduction](#introduction)

![](/assets/images/parts/sensors/dms-80_product.jpg)

- DMS-80 is used to detect objects or walls within a fixed distance.
- The sensor is not affected by color as much as IR Sensors enabling it to measure precise distance.

`Compatibility Guide` [Controller Compatibility]

# [Specifications](#specifications)

- Weight : 4.4g
- Detecting Distance : 10 ~ 80cm
- Recommended Voltage Suppy : 4.5 ~ 5.5V

# [Pinout](#pinout)

![](/assets/images/parts/sensors/dms-80_pinout.png)

1. VCC(5V)
2. GND
3. ADC(Outputs the distance sensing value in analog signal)

# [Sensor Output](#sensor-output)

- This is a graph shows the analog output voltage on RoboPlus based on the distance changes from white paper which has a reflection percentage of 90% and gray paper which has a reflection percentage of 18%.
- Even if the color and reflection percentage change, you can see the output value for the distance barely changes.

![](/assets/images/parts/sensors/dms-80_voltage_graph.png)


# [Tutorials](#tutorials)

- RoboPlus Task : Please refer to [DMS-80] section in the Roboplus Task.


[Controller Compatibility]: /docs/en/faq/controller_compatibility/
[DMS-80]: /docs/en/software/rplus1/task/programming_02/#dms-sensor
