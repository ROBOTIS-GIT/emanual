### Launch Gazebo

{% capture Gazebo_01 %}
It is recommended to run on a PC other than OMY.
{% endcapture %}
<div class="notice--danger">{{ Gazebo_01 | markdownify }}</div>

1. Refer to [Software Setup](/docs/en/platform/omy/quick_start_guide/#software-setup) to prepare the OM container.
2. Press Ctrl + Alt + T to open a new terminal and enter the following command.
```bash
xhost +
```
3. Access the container.
```bash
# Enter the running container
./docker/container.sh enter
```

4. Run Gazebo with the following command.
``` bash
$ ros2 launch open_manipulator_bringup omy_f3m_gazebo.launch.py
```
2. Run [MoveIt 2, GUI Operation](/docs/en/platform/omy/ros2_operation) in Gazebo simulation.

#### OMY_F3M
<img src="/assets/images/platform/omy/omy_f3m_gazebo.png" width="700"/>

#### OMY_3M
<img src="/assets/images/platform/omy/omy_3m_gazebo.png" width="700"/>
