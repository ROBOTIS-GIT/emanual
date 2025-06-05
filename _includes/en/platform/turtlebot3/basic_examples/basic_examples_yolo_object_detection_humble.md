
**What is YOLO?**  
YOLO(You Only Look Once) is a real-time object detection model. It views the entire image in a single pass("only once") and predicts both the bounding boxes and class probabilities directly. This makes YOLO extremely fast and efficient, making it ideal for real-time applications on TurtleBot3.  
> In this example, we use *YOLOv8* to perform real-time object detection using the TurtleBot3 camera. We will train a custom model and integrate it into a ROS2 node for deployment on the robot. By the end of this tutorial, you’ll be able to train a YOLO model to recognize specific objects and run real-time detection directly on your TurtleBot3.   

**What Tools Are Used?**
- [Roboflow](https://roboflow.com/) : Dataset preparation & export in YOLO format
- [Google Colab](https://colab.google/) : Model training using GPU with PyTorch pre-installed

### [**Dataset Preparation**](#dataset-preparation)

**Step 1: Data Annotation (Labeling)**  
To create your own custom datset, you need to go through a *data annotation(labeling)* process. 
In this example, we are using a public dataset from Roboflow, which is already labeled. To explore a public dataset, go [here](https://universe.roboflow.com/).

**Step 2: Export the Dataset**  
Download and export the dataset in YOLO format.  
![](/assets/images/platform/turtlebot3/basic_examples/yolo_object_detection/download_dataset.png) 

### [**Model Training**](#model-training)
Google Colab provides a free GPU environment, which is especially useful if you don't have a local GPU setup.  

**Step 1: Change the runtime type to GPU**  
To enable GPU acceleration, go to `Runtime` → `Change runtime type`, and select `GPU` as the hardware accelerator. This will allow your training to run faster using Colab's free GPU resources.  
![](/assets/images/platform/turtlebot3/basic_examples/yolo_object_detection/colab_gpu.png) 

**Step 2: Install Ultralytics**  
**[Colab]**  
```bash
!pip install ultralytics
```  

**Step 3: Load the Dataset**  
Copy the dataset loading code from Roboflow. It is provided after exporting. Make sure the paths to the `train`, `val` and `test` image directories are correctly defined in the `data.yaml` file.  
- Example of `data.yaml` file  
![](/assets/images/platform/turtlebot3/basic_examples/yolo_object_detection/yaml.png) 

**Step 4: Train the Model**  
**[Colab]**  
```bash
from ultralytics import YOLO
model=YOLO("yolov8n.pt")
model.train(data='{data_path}/data.yaml',epochs=100)
```  
- In this example, we use `yolov8n.pt`, a lightweight model optimized for speed and efficiency. You may use other variants like `yolov8s`, `m`, or `l` based on your needs.  
- `epochs` refers to the number of times the model iterates over the entire dataset during training. If set too low, the model may not learn effectively. If set too high, training can take a long time or exceed Google Colab's GPU usage limit. 

**Step 5: Download the Trained Model**  
After training, the best-performing weights(`best.pt`) will be saved at `/content/runs/detect/train/weights`.  
**[Colab]**  
```bash
from google.colab import files
files.download('/content/runs/detect/train/weights/best.pt')
```  

**Step 6: Transfer to SBC**  
Transfer the `best.pt` model to your TurtleBot3 SBC.  
**[Remote PC]**  
```bash
$ scp ~/Downloads/best.pt ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}:/home/ubuntu/
```  
Replace `/home/ubuntu/` with the actual target directory on your SBC where you want to store the model file.

### [**SBC Environment Setup**](#sbc-environment-setup)  

**Step 1: ROS2 Package Setup**  
If you haven't already cloned and built the `turtlebot3_applications` package, run thr following commands first.  
**[TurtleBot3 SBC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install --packages-select turtlebot3_yolo_object_detection
``` 

**Step 2: Set up Python Virtual Environment**  
Creating a virtual environment helps isolate the YOLO-related dependencies from the system Python environment. This ensures compatibility and prevents version conflicts with other packages on your SBC.  
**[TurtleBot3 SBC]**  
```bash
$ sudo apt install python3-venv
$ mkdir ~/venv && cd ~/venv
$ python3 -m venv yolo_env
$ source ~/venv/yolo_env/bin/activate
```  

**Step 3: Install the Required Dependencies**  
Install PyTorch and Ultralytics.  
**[TurtleBot3 SBC]**  
```bash
$ pip3 install ultralytics
```  

### [**ROS2 Integration & Prediction**](#ros2-integration-prediction)  
The `turtlebot3_yolo_object_detection.py` script runs the YOLOv8 model on live camera images from TurtleBot3 and publishes the detection results with bounding boxes. This allows you to visually confirm which objects are detected in real-time.  

**Step 1: Customize the Script**  

Open and edit the following file to update the model path and other parameters.  
**[TurtleBot3 SBC]**  
```bash
$ nano ~/turtlebot3_ws/src/turtlebot3_applications/turtlebot3_yolo_object_detection/turtlebot3_yolo_object_detection/turtlebot3_yolo_object_detection.py
``` 

Update the line with the correct path to your `best.pt` file.
```bash
self.model = YOLO("/home/ubuntu/best.pt")  # Update with your actual model path
``` 

Then, build your workspace.  
**[TurtleBot3 SBC]**  
```bash
$ cd ~/turtlebot3_ws
$ colcon build --packages-select turtlebot3_yolo_object_detection
``` 

**Step 2: Launch the Camera Node**  
**[TurtleBot3 SBC]**  
```bash
 $ ros2 launch turtlebot3_bringup camera.launch.py
 ``` 

**Step 3: Run the Detection Node**  
**[TurtleBot3 SBC]**  
```bash
$ ros2 run turtlebot3_example turtlebot3_object_detection_node
``` 

**Step 4: Visualize the Detection Results**  
Open rqt_image_view and select the `/camera/detections/compressed` topic to view the camera feed with detection results.  
**[Remote PC]**  
```bash
$ rqt_image_view
``` 
