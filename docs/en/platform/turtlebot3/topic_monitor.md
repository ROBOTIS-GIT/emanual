---
layout: archive
lang: en
ref: topic_monitor
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/topic_monitor/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 16
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 0"></div>

<!--[dummy Header 1]>
  <h1 id="basic-operation"><a href="#basic-operation">Basic Operation</a></h1>
<![end dummy Header 1]-->

## [Topic Monitor](#topic-monitor)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

In order to check the topics of TurtleBot3, we will use [rqt][rqt] provided by ROS. The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI.

**[Remote PC]** Run the rqt.
``` bash
$ rqt
```
![](/assets/images/platform/turtlebot3/example/rqt_1.png)

**TIP**: If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
{: .notice--info}

When rqt is first run, the topic values are not monitored. To monitor the topic, click the checkbox next to each topic.

![](/assets/images/platform/turtlebot3/example/rqt_2.png)

If you want to see more detail topic message, click the `▶` button next to each checkbox.

![](/assets/images/platform/turtlebot3/example/rqt_3.png)


- `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.

![](/assets/images/platform/turtlebot3/example/rqt_4.png)

- `/diagnostics` indicates a message the status of the components connected to the TurtleBot3, such as a MPU9250, a DYNAMIXEL X, a HLS-LFCD-LDS, a battery and a OpenCR.

![](/assets/images/platform/turtlebot3/example/rqt_5.png)

- `/odom` indicates a message the odometry of the TurtleBot3. This topic has orientation and position by the encoder data.  

![](/assets/images/platform/turtlebot3/example/rqt_6.png)

- `/sensor_state` indicates a message the encoder values, battery and torque.

![](/assets/images/platform/turtlebot3/example/rqt_7.png)

- `/scan` indicates a message all of the LDS data, such as angle_max and min, range_max and min, indicates, ranges.

![](/assets/images/platform/turtlebot3/example/rqt_8.png)

In addition, you can monitor topics through rqt whenever you have a topic added.

[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[rqt]: http://wiki.ros.org/rqt
