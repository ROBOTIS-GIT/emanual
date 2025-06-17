**NOTE**: The `turtlebot3_automatic_parking_vision` uses the RaspberryPi camera, the default platform used for this demo is TurtleBot3 Waffle Pi. Since it parks according to an AR marker on a visible wall, a printed AR marker should be prepared.
{: .notice}

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/dvpWdrD3bVs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
> TurtleBot3 Automatic Parking Vision -->

### Understanding the Automatic Parking Vision

Automatic Parking Vision uses sequence control. The following describes the sequences that make up the parking process.  
<br>
**Sequences of Parking Process**  
1. In the initial state, wait for a parking command (receiving a marker ID) to occur.
2. Find a marker to park on. Rotate the TurtleBot until a marker is detected.
3. When a marker is detected, align the TurtleBot's orientation to the center of the marker to calculate marker's pose.
4. TurtleBot performs the sub-process to position the TurtleBot in front of the marker.  
**Sequences of Nearby Process(sub-process)**  
    1. Record the initial TurtleBot and marker pose and then calculate the rotation angle to rotate it.
    2. Go straight so that the center of the TurtleBot is centered on the marker.
    3. Compares the current rotation to the initial rotation to calculate the desired angle and rotate.
    4. Signals the end of the move_nearby_parking_lot sequence and moves on to the next sequence in the overall parking process.
5. Determines the distance to the marker and controls the TurtleBot to stop in front of it. The TurtleBot's orientation is controlled by proportional control.
6. After parking is complete, reverse some distance and repeat sequences 3 through 5 one more time so that the turtlebot can park in a more precise location.
7. After the parking process is complete, stop the parking process and the internal state is initialized to prepare for the next parking action.

### Running the Automatic Parking Vision

1. **Installation**  
Before running the example, make sure the required packages is installed.  
**[Remote PC]**  
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
  $ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications_msgs.git
  $ cd ~/turtlebot3_ws/
  $ colcon build --symlink-install
  ```  
<br>

2. **Launch ArUco Tracker**  
This example uses the ArUco tracker example, so you'll need to follow the [ArUco tracker](/docs/en/platform/turtlebot3/basic_examples#aruco-tracker) section to run the ArUco tracker node.  
<br>

3. **Launch vision parking node**  
This node receives the `/target_marker_id` topic and performs the process of parking in front of the corresponding ArUco marker.  
**[Remote PC]**  
```bash
$ ros2 launch turtlebot3_automatic_parking_vision turtlebot3_automatic_parking_vision.launch.py
```
<br>

4. **Publish /target_marker_id topic.**  
To park in front of the desired ArUco marker, put the marker ID as an integer after `data: `. ( In this command, to park in front of marker ID 0. )  
**[Remote PC]**  
```bash
$ ros2 topic pub -1 /target_marker_id std_msgs/msg/Int32 "{data: 0}"
```
