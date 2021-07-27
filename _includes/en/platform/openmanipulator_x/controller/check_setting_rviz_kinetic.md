
**NOTE**:  
Please launch the [OpenMANIPULATOR-X Controller](#launch-controller) before running this section.
{: .notice--info}

Load OpenMANIPULATOR-X on RViz.

``` bash
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```

{% capture notice_01 %}
**NOTE**:
- If the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) is running when the RViz is launched, the robot model on RViz will be synchronized with the actual pose of OpenMANIPULATOR-X.
- Installing the joint_state_publisher_gui package allows to simply test the OpenMANIPULATOR-X model. Make sure to install the package and launch the RViz with additional option.
  - Install the joint_state_publisher_gui
  ```bash
  $ sudo apt-get install ros-kinetic-joint-state-publisher-gui
  ```
  - Launch the RViz with the GUI option
  ```bash
  $ roslaunch open_manipulator_description open_manipulator_rviz.launch use_gui:=true
  ```
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_x/OpenManipulator_rviz.png)
