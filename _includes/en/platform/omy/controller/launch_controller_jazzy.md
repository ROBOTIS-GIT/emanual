The OMY controller has been restructured to utilize the ros2_control framework and MoveIt for enhanced flexibility, modularity, and usability. This updated controller allows for seamless integration with ROS 2-based systems, offering advanced features such as trajectory planning, real-time control, and state feedback.

### Launch Controller
Open a new terminal and launch the OMY packages.
- When operating with `U2D2`  
Close all terminal and enter the command below in each new terminal.
```bash
$ ros2 launch open_manipulator_bringup hardware_y.launch.py
```

- When operating with `OpenCR`  
Close all terminal and enter the command below in the new terminal.
```bash
$ ros2 launch open_manipulator_bringup hardware_y.launch.py port_name:=/dev/ttyACM0
```
{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check firmware to use ROBOTIS software ([DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))  
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
**NOTE**: OpenMANIPULATOR-X controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/) which supports `MX 2.0`, `X` and `Pro` series. [Protocol 1.0](/docs/en/dxl/protocol1/) does not support SyncRead instructions to access to multiple DYNAMIXEL's's simultaneously.  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>
