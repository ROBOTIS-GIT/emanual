
# Quick Start Guide

## [PC Setup](#pc-setup)

**NOTE**: This instruction was tested on Windows with `Windows 10 IoT Enterprise` and `ROS1 Melodic Morenia` or `ROS1 Noetic Ninjemys`.
{: .notice--info}

{% capture warning_01 %}
**WARNING**
- This SBC Setup section for Windows is tested with `Intel Up²` or `Intel NUC` on TurtleBot3.
- This SBC will be operating as Remote PC and SBC at the same time.
- This process may take long time. Please do not use battery while following this section.
- An HDMI monitor and input devices such as a keyboard and a mouse will be required to complete this setup.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

### [Setup Remote PC](#setup-remote-pc)

1. If you do not already have `Windows 10` on your Remote PC (Desktop, Laptop or SBC), you can download a trial of Windows 10 IoT Enterprise from the following link:
  - [Download Windows 10 IoT Enterprise LTSC(Trial)](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise)

2. Please refer to the [ROS Wiki instructions](https://wiki.ros.org/Installation/Windows) for installing ROS on Windows.

3. Install LDS-01 Lidar driver
  - [CP2102 Driver](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)

4. Create workspace and download TurtleBot3 packages.  
  For more details, please refer to [Microsoft Instructions](https://ms-iot.github.io/ROSOnWindows/Turtlebot/Turtlebot3.html).
  ```
> mkdir c:\ws\turtlebot3\src
> cd c:\ws\turtlebot3\src
> curl -o tb3.repos https://raw.githubusercontent.com/ms-iot/ROSOnWindows/master/docs/Turtlebot/turtlebot3_ros1.repos
> vcs import src < tb3.repos
  ```

5. Customize TurtleBot3 Launch Files.  
  Modify the ROS Launch files to map the devices to the correct COM port. To determine which COM ports you require, right click on the Windows Start Menu, Select Device Manager.  
- Under the `Ports (COM & LPT)` node:  
  - USB Serial Device (COMx) is the OpenCR board.
  - Silicon Labs CP210x USB to UART Bridge (COMy) is the Lidar.  
- Enter the COM port in the correct fields in the launch files below:

        - turtlebot3_bringup/launch/turtlebot3_core.launch  

        ```
        <node pkg="rosserial_python" type="serial_node.py" name="turtlebot3_core" output="screen">
            <param name="port" value="COMx"/>
        ```
  
        - turtlebot3_bringup/launch/turtlebot3_lidar.launch

        ```
        <node pkg="hls_lfcd_lds_driver" type="hlds_laser_publisher" name="turtlebot3_lds" output="screen">
            <param name="port" value="COMy"/>
        ```

6. Build the Workspace
```
> cd c:\ws\turtlebot3
> catkin_make
> c:\ws\turtlebot3\devel\setup.bat
```

### [Network Configuration](#network-configuration)

To communicate from a Windows 10 system to a remote single board computer (SBC) running on the turtlebot, set the following environment variables:

```
> set ROS_MASTER_URI=http://<IP address of the PC>:11311
> set ROS_HOSTNAME=<name of the windows computer>
```
