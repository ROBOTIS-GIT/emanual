
**NOTE**:  
Please launch the [OpenMANIPULATOR-X Controller](#launch-controller) before running this section.
{: .notice--info}

Load OpenMANIPULATOR-X on RViz.

``` bash
$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz.launch.py 
```

{% capture notice_01 %}
**NOTE**:
- If the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) is running when the RViz is launched, the robot model on RViz will be synchronized with the actual pose of OpenMANIPULATOR-X.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_x/ros2_OpenManipulator_rviz.png)
