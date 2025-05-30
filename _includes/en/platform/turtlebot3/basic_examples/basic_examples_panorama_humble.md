
### **What is Panorama?**  
This example allows the TurtleBot3 to rotate in place while capturing images and combining them into a panoramic image using OpenCV’s Stitcher module. The process is initiated via a ROS service call, and depending on the selected mode, the robot either pauses to take snapshots or rotates continuously. The final stitched panorama is published as a ROS topic and saved as a JPEG file locally.  
<iframe width="560" height="315" src="https://www.youtube.com/embed/hsi4WSZwX_c" frameborder="0" allowfullscreen></iframe>  

### **Installation**
Before running the panorama example, make sure to clone and build the required packages.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs.git

$ cd ~/turtlebot3_ws/
$ colcon build --symlink-install
$ source ~/.bashrc
```  

### **How to Run?**

**Step 1: Launch TurtleBot3 Bringup**  
Connect to the Raspberry Pi via SSH.  
**[Remote PC]**  
```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
```
**[TurtleBot3 SBC]**  
```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**Step 2: Run the camera node**   
Connect to the Raspberry Pi via SSH.  
**[Remote PC]**  
```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
```
Depending on your setup, use one of the following:  

{% capture notice_04 %}
**NOTE**:
- A working camera is required to run this example. Depending on your system setup, you can use a Raspberry Pi Camera with a compatible driver such as `camera-ros` or `v4l2-camera`. Please refer to [SBC Setup](/docs/en/platform/turtlebot3/sbc_setup/#raspberry-pi-camera) to use the Pi Camera.    

{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

- For `camera-ros`  
**[TurtleBot3 SBC]**  
```bash
$ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=640 -p height:=480
```
- For `v4l2-camera`  
Adding `-r __ns:=/camera` organizes all topics published by the node under the `/camera` namespace.   
**[TurtleBot3 SBC]**  
```bash
$ ros2 run v4l2_camera v4l2_camera_node --ros-args -p image_size:=[640,480] -p camera_info_url:="file:///home/ubuntu/calibration.yaml" -p output_encoding:="yuv422_yuy2" -r __ns:=/camera
```

**Step 3:  Launch the panorama application**  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_panorama turtlebot3_panorama.launch.py
```

**Step 4: Start panorama capture**  
The application supports *three* capture modes:  

- **SNAP_AND_ROTATE**: The robot rotates by a fixed angle, stops completely, and then takes a snapshot. This process repeats until a full sweep(180°) is completed. It ensures more stable images by avoiding motion blur and is suitable for environments where sharpness and stitching accuracy are important.  
**[Remote PC]**  
```bash
$ ros2 service call /take_pano turtlebot3_applications_msgs/srv/TakePanorama "{mode: 0}"
```

- **CONTINUOUS**: The robot rotates continuously while taking snapshots. This mode captures the scene more quickly and smoothly, but may result in slightly less precise stitching due to motion blur or misalignment.   
**[Remote PC]**  
```bash
$ ros2 service call /take_pano turtlebot3_applications_msgs/srv/TakePanorama "{mode: 1}"
```

- **STOP**: Stops an ongoing panorama creation process that was started using either the SNAP_AND_ROTATE or CONTINUOUS mode. This command can be used at any time to immediately halt rotation and discard the images collected so far.  
**[Remote PC]**  
```bash
$ ros2 service call /take_pano turtlebot3_applications_msgs/srv/TakePanorama "{mode: 2}"
```

**Step 5: Viewing the result**  
Images will be saved automatically under `~/panorama_results/`. You can simply open the saved image files from your home directory to view them.  
- Files saved:  
> Individual snapshots: snapshot_1.jpg, snapshot_2.jpg, ...  
> Final panorama: stitched_result.jpg  

  ![](/assets/images/platform/turtlebot3/application/panorama_stitched_result.jpg)
  *Example of the final stitched panorama image(stitched_result.jpg) captured by TurtleBot3.*