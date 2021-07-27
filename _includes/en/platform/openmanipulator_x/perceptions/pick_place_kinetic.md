In this example, OpenMANIPULATOR-X uses Raspberry Pi Camera V2 to pick and place blocks. Print the camera frame to the OpenMANIPULATOR-X using a 3D printer to mount the camera. Attach a 3cm x 3cm ar marker to the cube block. When you run the example package, you pick the ar marker's id 1, 2, and 3 in order and stack them on one side.

<iframe width="560" height="315" src="https://www.youtube.com/embed/jIO2lhit1g8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### Camera Frame

##### Raspberry Pi Camera V2

Download the .stl file in the path below and output it to the 3D printer.
- [OnShape](https://cad.onshape.com/documents/317f41cd6ef3f111631e9f97/w/be4693711e5767f7686bfed7/e/3490ca5c51c70a615d19ad93)
- [Thingiverse](https://www.thingiverse.com/thing:3069574)

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_picam.png" width="600">  
<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_picam_2.png" width="600">

##### Realsense D435

Download the .stl file in the path below and output it to the 3D printer.
- [OnShape](https://cad.onshape.com/documents/317f41cd6ef3f111631e9f97/w/be4693711e5767f7686bfed7/e/7dbdd6d59254066690fefc5a)
- [Thingiverse](https://www.thingiverse.com/thing:3069574)

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_d435.png" width="600">  
<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_d435_2.png" width="600">

#### Install ROS package

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- Make sure to run the [OpenMANIPULATOR controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
- Proceed from [Install Camera Package](/docs/en/platform/openmanipulator_x/ros_applications/#install-camera-package) and [Install AR Marker Package](/docs/en/platform/openmanipulator_x/ros_applications/#install-ar-marker-package).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_01 %}
**NOTE**:
- To use the **Raspberry Pi Camera V2**, install it on the **Remote PC**
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  ```bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_applications.git
  $ cd ~/catkin_ws && catkin_make
  ```
If the catkin_make command has been completed without any errors, all the preparations are done.


#### Execution Example
Please, open the terminal window, run roscore as entering following command.

```bash
$ roscore
```

After run roscore, Run **the controller of OpenMANIPULATOR**. Open the other terminal window and enter the following command in the terminal.      

```bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```
{% capture warning_01 %}

**WARNING**  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint postion out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

If the OpenMANIPULATOR controller has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: True
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [23452]
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[ INFO] [1544509070.096942788]: Succeeded to init /open_manipulator
```

And Open the other terminal window and enter the following command in the terminal. This command is to execute a package that recognizes the ar marker. Enter the type of camera you are using and the size of the ar marker. In this example, we use a Raspberry Pi Camera V2 and 3cm ar marker.

```bash
$ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam user_marker_size:=3.0
```

{% capture notice_01 %}
**NOTE**: To use the **Raspberry Pi Camera V2**, Run the camera node in Raspberry Pi.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

And Open the other terminal window and enter the following command in the terminal.
```bash
$ roslaunch open_manipulator_pick_and_place open_manipulator_pick_and_place.launch
```
So, you can see the following message in the terminal window. You can check the robot status.

```
-----------------------------
Pick and Place demonstration!
-----------------------------
1 : Home pose
2 : Pick and Place demo. start
3 : Pick and Place demo. Stop
-----------------------------
-----------------------------
Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
Present Tool Position: 0.000
Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
-----------------------------
```
There are three commands. Please enter that number in the terminal.
 
1. Home pose: Move to the home pose.
2. Pick and Place demo. Start: Start the Pick and Place demonstration.
3. Pick and Place demo. Stop: Stop the Pick and Place demonstration.