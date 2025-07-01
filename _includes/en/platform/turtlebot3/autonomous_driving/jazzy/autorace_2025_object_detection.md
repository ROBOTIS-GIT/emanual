- **Description**  
<div style="margin-left: 2em;">
In the Object Detection mission, the goal is to detect store signs(*pizza*,*burger*,*chicken*) and room numbers(*101*,*102*,*103*) from camera images using a YOLO-based vision model. Once detected, the results are sent to the Task Manager.  

**NOTE**: The Object Detection module is based on the [YOLO Object Detection](/docs/en/platform/turtlebot3/basic_examples/#yolo-object-detection) example.
{: .notice}  
</div>

- **Running Module**  
<div style="margin-left: 2em;">

1. Launch the camera node.  
**[TurtleBot3 SBC]**  
```bash
 $ ros2 launch turtlebot3_bringup camera.launch.py
 ```

2. Run the Object Detection node.  
```bash
$ ros2 launch turtlebot3_autorace_detect object_detection.launch.py model_path:=<path_to_best.pt> test_mode:=true
```

- Replace `<path_to_best.pt>` with your actual model path. For reference, the model file `best.pt` is stored at `/turtlebot3_ws/src/turtlebot3_autorace/turtlebot3_autorace_detect/model/best.pt`.  
- Use `test_mode:=true` for standalone testing. In test mode, the node continuously performs object detection without waiting for service responses or shutting down. This allows you to freely test and visualize detections without the full Autorace system.  

3. Activate the life cycle node.  
The node uses the ROS 2 Lifecycle interface, so you need to manually transition it.  
```bash
$ ros2 lifecycle set /object_detection_node configure
$ ros2 lifecycle set /object_detection_node activate
```
4. Verify the output.  
You can check the detection result via terminal logs or rqt.  
**[Terminal Logs]**
```bash
[INFO] Detected stores: ['chicken', 'pizza', 'burger'], Detected rooms: ['101', '102', '103']
```
**[rqt]**
Open the rqt and subscribe 
```bash
$ rqt_image_view
```
   ![](/assets/images/platform/turtlebot3/autorace_2025/autorace_object_detection_rqt.png)
</div>
