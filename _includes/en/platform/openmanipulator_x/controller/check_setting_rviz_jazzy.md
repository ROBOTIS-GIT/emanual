{% capture warning_01 %}
**WARNING**: Before running RViz, make sure to terminate all controller nodes including the **bringup** and **other nodes** that were previously running.
{% endcapture %}
<div class="notice--danger">{{ warning_01 | markdownify }}</div>

Load OMX on RViz.  
```bash
$ ros2 launch open_manipulator_description omx.launch.py
```  
![](/assets/images/platform/openmanipulator_x/ros2_omx_rviz.png) 