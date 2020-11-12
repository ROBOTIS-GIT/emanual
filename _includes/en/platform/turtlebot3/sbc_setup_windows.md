
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 1"></div>


## [SBC Setup](#sbc-setup)

**WARNING**: This SBC Setup section for Windows is tested with [Up2](https://up-board.org/upsquared/specifications/) or `Intel Nuc` on TurtleBot3.
{: .notice--danger}

1. You can download a trial of Windows 10 IoT Enterprise Long Term Service (LTSC) from the following link:

   - [Download Windwos 10 IoT Enterprise LTSC(Trial)][windows_download_link]

   [windows_download_link]: https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise

2. Please refer to the [ROS Wiki instructions](https://wiki.ros.org/Installation/Windows) for installing ROS on Windows.
3. Please install the [CP2102 Driver from SI Labs](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers) in order to communicate with the Lidar.

Before starting to work with turtlebot3 with a Windows 10 Single Board Computer, you'll need to identify which COM port the lidar and OpenCR board are mounted on. To do this, visit the Windows Device Manager - which you can access by right clicking on the Start Menu icon, and selecting `Device Manager` and locate the COM port associated with the Lidar and OpenCR board.

Then modify the following files:

`turtlebot3_bringup/launch/turtlebot3_core-win.launch`

```xml
<node pkg="rosserial_python" type="serial_node.py" name="turtlebot3_core" output="screen">
    <param name="port" value="COMx"/>
```

`turtlebot3_bringup/launch/turtlebot3_lidar-win.launch`

```xml
 <node pkg="hls_lfcd_lds_driver" type="hlds_laser_publisher" name="turtlebot3_lds" output="screen">
    <param name="port" value="COMy"/>
```
