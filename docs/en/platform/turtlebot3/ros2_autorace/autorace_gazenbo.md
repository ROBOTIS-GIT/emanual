---
layout: archive
lang: en
ref: autorace_gazenbo
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/autonomous_driving/autorace_gazebo
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
---

<div style="counter-reset: h1 13"></div>
<div style="counter-reset: h2 6"></div>

## [AutoRace with Gazebo](#autorace-with-gazebo)
The AutoRace is provided by Gazebo. We created a environment TurtleBot3 AutoRace 2017 in R-BIZ Challenge.

- Recommended specification

| CPU     | Intel Core i5 / 2 GHz Dual Core Processor      |
| RAM     | 4GB                                            |
| Storage | 20Gb of free hard drive space                  |
| GPU     | NVIDIA GeForce GTX 9 series                    |

**WARNING**: Do not confuse your real camera calibration configure files and Gazebo calibration configure files.
{: .notice--warning}

**NOTE**: The `turtlebot3_autorace` package requires `turtlebot3_simulations` package as a prerequisite. If you did not install it in the [Installation TurtleBot3 Simulations](#simulation), install it first.
{: .notice--info}

1. `Remote PC` Run AutoRace Gazebo. You can see the AutoRace 2017 map in Gazebo.

    ``` bash
    $ roslaunch turtlebot3_gazebo turtlebot3_autorace.launch
    ```

    ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_map.png)

2. `Remote PC` Run Mission launch. You can see `Traffic Light`, `Parked TurtleBot3` and `Toll Gate` in Gazebo. When TurtleBot3 approaches the mission area, they operate automatically.

    ``` bash
    $ roslaunch turtlebot3_gazebo turtlebot3_autorace_mission.launch
    ```

    ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_map_mission.png)

3. `Remote PC` Run AutoRace launch. If you want to run AutoRace in real, you have to calibrate your camera.

    ``` bash
    $ export GAZEBO_MODE=true
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_EX_CALIB=action
    $ export AUTO_DT_CALIB=action
    $ export TURTLEBOT3_MODEL=burger
    $ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
    ```

5. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
    ```


- Video : AutoRace with Gazebo

  <iframe width="640" height="360" src="https://www.youtube.com/embed/5fZmuPxMZz0" frameborder="0" allowfullscreen></iframe>
