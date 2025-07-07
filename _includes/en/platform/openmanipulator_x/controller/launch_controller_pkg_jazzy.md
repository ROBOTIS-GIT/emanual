The OMX controller has been restructured to utilize the ros2_control framework and MoveIt for enhanced flexibility, modularity, and usability. This updated controller allows for seamless integration with ROS 2-based systems, offering advanced features such as trajectory planning, real-time control, and state feedback.

{% capture notice_01 %}
**NOTE**:
- Make sure ROS 2 Jazzy dependencies are installed before performing these instructions
- [Install ROS Packages](/docs/en/platform/openmanipulator_x/quick_start_guide/#install-ros-packages)
- Docker installation is recommended for ROS 2 Jazzy
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div> 