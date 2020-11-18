
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>


## [SBC Setup](#sbc-setup)

{% capture warning_01 %}
**WARNING**
- This SBC Setup section for Windows is tested with [Up2](https://up-board.org/upsquared/specifications/) or `Intel NUC` on TurtleBot3.
- This process may take long time. Please do not use battery while following this section.
- An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

**NOTE**: This instruction was tested on Windows with `Windows 10 IoT Enterprise` and `ROS1 Melodic Morenia`.
{: .notice--info}

1. You can download a trial of Windows 10 IoT Enterprise Long Term Service (LTSC) from the following link:

   - [Download Windows 10 IoT Enterprise LTSC(Trial)](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise)

2. Please refer to the [ROS Wiki instructions](https://wiki.ros.org/Installation/Windows) for installing ROS on Windows.

3. Please install the [CP2102 Driver from SI Labs](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers) in order to communicate with the Lidar.

4. Install and build TurtleBot3 packages.
  ```bash
> mkdir c:\ws\turtlebot3\src
> cd c:\ws\turtlebot3\src
> catkin_init_workspace
> sudo apt install ros-melodic-hls-lfcd-lds-driver
> sudo apt install ros-melodic-turtlebot3-msgs
> sudo apt install ros-melodic-dynamixel-sdk
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
> cd c:\ws\turtlebot3
> rosdep update
> rosdep install --from-paths src --ignore-src -r -y
> catkin_make
> devel\setup.bat
  ```

### Network Configuration
In case of connecting to a Windows 10 remote PC, set the following environment variables:

```bash
> set ROS_MASTER_URI=http://<IP address of the SBC>:11311
> set ROS_HOSTNAME=<name of the SBC>
```


Before starting to work with turtlebot3 with a Windows 10 Single Board Computer, you'll need to identify which COM port the lidar and OpenCR board are mounted on. To do this, visit the Windows Device Manager - which you can access by right clicking on the Start Menu icon, and selecting `Device Manager` and locate the COM port associated with the Lidar and OpenCR board.

Then modify the following files:

- `turtlebot3_bringup/launch/turtlebot3_core-win.launch`
  ```xml
<node pkg="rosserial_python" type="serial_node.py" name="turtlebot3_core" output="screen">
    <param name="port" value="COMx"/>
  ```

- `turtlebot3_bringup/launch/turtlebot3_lidar-win.launch`
  ```xml
<node pkg="hls_lfcd_lds_driver" type="hlds_laser_publisher" name="turtlebot3_lds" output="screen">
    <param name="port" value="COMy"/>
  ```
