### AI Teleoperation Execution  
After accessing the Docker container, use the following command:  
```
ros2 launch open_manipulator_bringup omy_ai.launch.py
```  
This command will sequentially execute the following procedures:  
1. Move to Follower's initial position
2. Start Leader's gravity compensation
3. Synchronize Leader and Follower

After these steps, the Leader-Follower system will be operational.

<img src="/assets/images/platform/omy/ai_teleop.gif" width="700"/>

{% capture notice_01 %}
**NOTE:** AI Teleoperation is only supported between OMY_F3M and OMY_L100 models.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify}}</div>

(The basic commands in this manual are written for OMY_F3M. When running with the OMY_3M model, replace omy_f3m with omy_3m in the commands. )  
`ros2 launch open_manipulator_bringup omy_3m.launch.py`
