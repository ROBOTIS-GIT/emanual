This section explains how to configure and execute the TurtleBot3 ArUco Tracker function. The camera vision recognizes the ArUco marker and broadcasts it via TF conversion.  

**NOTE**:  
- The `turtlebot3_aruco_tracker` uses the RaspberryPi camera. To use camera module, you must follow [SBC Setup](/docs/en/platform/turtlebot3/sbc_setup/#rpi-camera).  
- If you want to perform Automatic Parking Vision, need to set the TurtleBot3 model to `waffle_pi`.
{: .notice}
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/6ZyaFREFhnk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

1. **Bringup TurtleBot3**
    1. Connect to the Raspberry Pi.  
    **[Remote PC]**  
    ```bash
    $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
    ```

    2. Bring up basic packages to start essential TurtleBot3 applications. You will need to specify your specific TurtleBot3 model.  
    **[TurtleBot3 SBC]**  
    ```bash
    $ export TURTLEBOT3_MODEL=burger
    $ ros2 launch turtlebot3_bringup robot.launch.py
    ```
    Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.  

2. **Start the Camear node**  
    1. Connect to the Raspberry Pi.  
    **[Remote PC]**  
    ```bash
    $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
    ```
    2. Run camera_node..  
    **[TurtleBot3 SBC]**  
    ```bash
    $ ros2 run camera_ros camera_node --ros-args -p format:='RGB888' -p width:=320 -p height:=240
    ```

3. **Visualizing TurtleBot3 and TF of ArUco markers in RViz**  
Launch the RViz to view the TurtleBot3’s movements and visualize TF.  
**[Remote PC]**
  ```bash
  $ ros2 launch turtlebot3_bringup rviz2.launch.py
  ```

4. **Tracking ArUco markers**  
Launch a node that tracks ArUco markers  
**[Remote PC]**
  ```bash
  $ ros2 launch turtlebot3_aruco_tracker turtlebot3_aruco_tracker.launch.py
  ```
