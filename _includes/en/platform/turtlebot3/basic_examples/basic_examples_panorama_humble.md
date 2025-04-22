
### **What is Panorama?**  
This example allows the TurtleBot3 to rotate in place while capturing images and stitching them into a panoramic image using OpenCV’s Stitcher module.  

The application supports *three* capture modes:  

- **SNAP_AND_ROTATE**: The robot stops to take a snapshot, then rotates to the next angle.  
- **CONTINUOUS**: The robot keeps rotating while taking snapshots. (slower, for smoother capture)   
- **STOP**: Stops an ongoing panorama creation.  

The final stitched panorama is published as a ROS topic and saved as a JPEG file locally.  

{% capture notice_04 %}
**NOTE**:
- A working camera is required to run this example. Depending on your system setup, you can use a Raspberry Pi Camera with a compatible driver such as `camera-ros` or `v4l2-camera`.  

{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

### **Installation**
Before running the panorama example, make sure to clone and build the required packages.
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
**[TurtleBot3 SBC]**  
- For `camera-ros`  
```bash
$ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=640 -p height:=480
```
- For `v4l2-camera`  
```bash
$ ros2 run v4l2_camera v4l2_camera_node --ros-args -p image_size:=[640,480] -p camera_info_url:="file:///home/ubuntu/calibration.yaml" -p output_encoding:="yuv422_yuy2"
```

**Step 3:  Launch the panorama application**  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_panorama turtlebot3_panorama.launch.py
```

**Step 4: Start panorama capture**  
**[Remote PC]**  
- SNAP_AND_ROTATE mode  
```bash
$ ros2 service call /take_pano turtlebot3_applications_msgs/srv/TakePanorama "{mode: 0}"
```

- CONTINUOUS mode
```bash
$ ros2 service call /take_pano turtlebot3_applications_msgs/srv/TakePanorama "{mode: 1}"
```

- STOP mode  
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
