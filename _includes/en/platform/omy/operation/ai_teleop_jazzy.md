
#### AI Teleoperation Execution  
After accessing the Docker container, use the following command:  
```
ros2 launch open_manipulator_bringup ai_teleoperation.launch.py
```  
This command will sequentially execute the following procedures:  
1. Move to Follower's initial position
2. Start Leader's gravity compensation
3. Synchronize Leader and Follower

After these steps, the Leader-Follower system will be operational.
