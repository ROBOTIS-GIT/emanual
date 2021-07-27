
Launch the open_manipulator_controller for Gazebo simulation.  
In order to run the controller for simulation environment, make sure to set the `use_platform` parameter to `false` so that the controller can be launched as a simulation controller as shown below.

``` bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
```

{% capture notice_01 %}
**NOTE**:
- If you want to manipulate the OpenMANIPULATOR-X using MoveIt! along with the Gazebo simulator, you should modify the `use_moveit` parameter value from `false` to `true` in open_manipulator_controller launch file.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

If the OpenMANIPULATOR-X controller for Gazebo simulation Launched successfully, the below messages will be printed on the terminal.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: False
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [9820]
[ INFO] [1544506914.862653563]: Ready to simulate /open_manipulator on Gazebo
```
