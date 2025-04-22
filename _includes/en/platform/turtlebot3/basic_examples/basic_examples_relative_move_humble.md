
**What is Relative Move?**  
This example demonstrates how *TurtleBot3* can move to a relative position and orientation based on its current pose. Users input the relative position `(x, y)` and heading angle `theta` via the terminal. The robot will then move accordingly using *odometry* data.  

<iframe width="640" height="360" src="https://www.youtube.com/embed/GKH3LYh6ttw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>  

The movement is carried out in *three steps*:  

> 1. **Rotate** toward the target direction based on (x, y)
> 2. **Move forward** to the target position
> 3. **Rotate** to the desired final orientation (theta)  


**How it works?**  
- `turtlebot3_relative_move` Node Overview  
**1.** Subscribes to the `/odom` topic to get the robot's current position and orientation.  
**2.** Calculates the target global pose using the relative input `x, y` and `theta`.  
**3.** Publishes velocity commands to the `cmd_vel` topic to move accordingly.  


### [**How to run?**](#how-to-run)

**Step 1: Launch TurtleBot3 Bringup**  
Open a new terminal on the remote PC (e.g., your laptop) and connect to the Raspberry Pi via SSH:  
  **[Remote PC]**  
  ```bash
  $ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
  ```  

Once connected, launch the essential TurtleBot3 bringup package:  
**[TurtleBot3 SBC]**  
  ```bash
  $ export TURTLEBOT3_MODEL=burger
  $ ros2 launch turtlebot3_bringup robot.launch.py
  ```

Wait until the bringup process finishes and the TurtleBot3 is ready before proceeding.

**Step 2: Run the Relative Move Node**  
Open a new terminal and run:  
  **[Remote PC]**  
  ```bash
  $ ros2 run turtlebot3_example turtlebot3_relative_move
  ```
The node will initialize and prompt you to enter the relative coordinates.

**Step 3: Type Input Values**  
You will see the following terminal prompt:  

```bash
TurtleBot3 Relative Move
------------------------------------------------------
From the current pose,
x: goal position x (unit: m)
y: goal position y (unit: m)
theta: goal orientation (range: -180 ~ 180, unit: deg)
------------------------------------------------------
```   
*Example Input:*  
```bash
Input x: 1.0
Input y: 1.0
Input theta (deg): 90
```
*The robot will move 1 meter **forward** and 1 meter to the **left**, then rotate to **90 degrees** from its current heading. The robot first turns 45° to face the target point, and rotates an **additional 45°** to reach the final heading of 90° after moving forward.*  

{% capture notice_04 %}
**NOTE**:
- If you manually move the robot, it can cause a **drift or error** in odometry, resulting in inaccurate movement or a wrong final pose.  

{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>
