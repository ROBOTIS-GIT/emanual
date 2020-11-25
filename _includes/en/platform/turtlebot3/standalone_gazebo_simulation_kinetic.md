
**NOTE**: This tutorial is developed only for user who want to simulate TurtleBot3 without ROS. However, we highly recommend to run simulation on ROS.
{: .notice--info}

1. Install Library for Gazebo7
```bash
$ sudo apt-get install libgazebo7-dev
```

2. Download Source Code from Github
```bash
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_gazebo_plugin
```

3. Add Gazebo Plugin Path in `.bashrc` File
```bash
$ nano ~/.bashrc
```

    **NOTE**: turtlebot3_gazebo_plugin path = ~/turtlebot3_gazebo_plugin
    {: .notice--info}

    ```bash
    export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${turtlebot3_gazebo_plugin path}/build
    export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${turtlebot3_gazebo_plugin path}/models
    ```

4. Make and Build
```bash
$ cd ${turtlebot3_gazebo_plugin path}
$ mkdir build
$ cd build
$ cmake ..
$ make
```

5. Execute Gazebo Plugin.  
  Replace the **${TB3_MODEL}** with the TurtleBot3 model you want to use: `burger`, `waffle`, `waffle_pi`.
  ```bash
$ cd ${turtlebot3_gazebo_plugin}
$ gazebo worlds/turtlebot3_${TB3_MODEL}.world
  ```  
  ![](/assets/images/platform/turtlebot3/simulation/gazebo_waffle_pi.png)  
  ![](/assets/images/platform/turtlebot3/simulation/gazebo_burger.png)

6. Teleoperation with Keyboard
```bash
w - set linear velocity up
x - set linear velocity down
d - set angular velocity up
a - set angular velocity down
s - set all velocity to zero
```

7. Topic Subscribe Command
  - Show all topic
```bash
$ gz topic -l
```
- Subscribe scan data
```bash
$ gz topic -e /gazebo/default/user/turtlebot3_${TB3_MODEL}/lidar/hls_lfcd_lds/scan
```
- Subscribe image data
  - For Waffle
    ```bash
    $ gz topic -e /gazebo/default/user/turtlebot3_waffle/image/intel_realsense_r200/image
    ```
  - For Waffle Pi
    ```bash
    $ gz topic -e /gazebo/default/user/turtlebot3_waffle_pi/image/raspberry_pi_cam/image
    ```

8. Execute listener
```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./lidar_listener ${TB3_MODEL}
```

9. Open a new terminal window and enter below command.
```bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./image_listener ${TB3_MODEL}
```
