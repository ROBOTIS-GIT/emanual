In the Object Detection mission, the goal is to detect store signs(*pizza*,*burger*,*chicken*) and room numbers(*101*,*102*,*103*) from camera images using a YOLO-based vision model. Once detected, the results are sent to the result to the Task Manager, and a state transition is triggered.  

**NOTE**: The Object Detection module is based on the [YOLO Object Detection](/docs/en/platform/turtlebot3/basic_examples/#yolo-object-detection) example.
{: .notice} 

**Mission Scenario**  
The Object Detection module is used in three main phases of the Autorace delivery mission.  
1. **Order Information Recognition**: Detect one store and one room number per delivery cycle.  
2. **Store Pickup**: Move the robot to the detected store for pickup.
3. **Delivery**: Confirm the delivery destination using the detected room number.  

**Launch the Object Detection Node**  
1. **Launch the camera node.**  
**[TurtleBot3 SBC]**  
```bash
 $ ros2 launch turtlebot3_bringup camera.launch.py
 ``` 

2. **Open a new terminal and run the Object Detection node.**  
Replace `<path_to_best.pt>` with your actual model path. For reference, the model file `best.pt` is stored at `/turtlebot3_ws/src/turtlebot3_autorace/turtlebot3_autorace_detect/model/best.pt`. You can fine-tune the model using your own dataset or replace it with a different YOLOv8 model.  
```bash
$ ros2 launch turtlebot3_autorace_detect object_detection.launch.py model_path:=<path_to_best.pt>
```

3. **Activate the life cycle node.**  
The node uses the ROS 2 Lifecycle interface, so you need to manually transition it.  
**Configure**  
```bash
$ ros2 lifecycle set /object_detection_node configure
```
**Activate**  
```bash
$ ros2 lifecycle set /object_detection_node activate
```
4. **Verify the output.**  
You can check the detection result via terminal logs or rqt.    
**Terminal Logs**
```bash
[INFO] Detected stores: ['chicken', 'pizza', 'burger'], Detected rooms: ['101', '102', '103']
```
**rqt**
```bash
$ rqt_image_view
```
   ![](/assets/images/platform/turtlebot3/autorace_2025/autorace_object_detection_rqt.png)

Once object detection is finalized, the node sends the result and waits for a response. So the node may appear to be paused. So restart the node manually if you want to run detection again.  
