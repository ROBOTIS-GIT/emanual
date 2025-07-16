Gravity compensation is a feature that compensates for the gravitational force acting on the manipulator. This feature helps to reduce the load on the actuators and improve the accuracy of the manipulator.

{% capture warning_01 %}
**WARNING**: Gravity compensation is an experimental feature and may not work properly in all situations. Use with caution.
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

To enable gravity compensation, you need to modify the controller configuration. The gravity compensation parameters are defined in the URDF file and the controller configuration files.

For more information about gravity compensation, please refer to the [ROS 2 Control documentation](https://control.ros.org/jazzy/).