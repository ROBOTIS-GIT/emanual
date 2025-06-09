
**What is YOLO?**  
YOLO(You Only Look Once) is a real-time object detection model. It views the entire image in a single pass("only once") and predicts both the bounding boxes and class probabilities directly. This makes YOLO extremely fast and efficient, making it ideal for real-time applications on TurtleBot3.  
> In this example, we use *YOLOv8* to perform real-time object detection using the TurtleBot3 camera. We will train a custom model and integrate it into a ROS2 node for deployment on the robot. By the end of this tutorial, you’ll be able to train a YOLO model to recognize specific objects and run real-time detection directly on your TurtleBot3.   

**What Tools Are Used?**
- [Roboflow](https://roboflow.com/) : Dataset preparation & export in YOLO format
- [Google Colab](https://colab.google/) : Model training using GPU with PyTorch pre-installed

### [**Dataset Preparation**](#dataset-preparation)

**Step 1: Data Annotation (Labeling)**  
To create your own custom datset, you need to go through a *data annotation(labeling)* process. 
- Option A: Upload Your Own Images  
1. Go to [Roboflow](https://roboflow.com/) and create a new project  
2. Upload your images (from TurtleBot3 camera or bag files)
3. Click `Annotate` and draw bounding boxes for each object  
3. Create class names  
4. Click `Generate` to finalize the dataset  

For detailed guidance, see the official [Roboflow Annotate Documentation](https://docs.roboflow.com/annotate/use-roboflow-annotate).

{% capture notice_04 %}
**NOTE**:
- Label at least 50–100 images per class
- Ensure variation in lighting, angles, and backgrounds
- Include some empty images (no objects) to reduce false positives    

{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

- Option B: Use Public Dataset (Quick Start)
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
- `data_path` refers to the directory where your dataset and `data.yaml` file are located.  

**Step 5: Download the Trained Model**  
After training, the best-performing weights(`best.pt`) will be saved at `/content/runs/detect/train/weights`.  
**[Colab]**  
```bash
from google.colab import files
files.download('/content/runs/detect/train/weights/best.pt')
```  

### [**Remote PC Setup**](#remote-pc-setup)  

**Step 1: ROS2 Package Setup**  
If you haven't already cloned and built the `turtlebot3_applications` package, run the following commands first.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_applications.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install --packages-select turtlebot3_yolo_object_detection
$ source install/setup.bash
``` 

**Step 2: Customize the Script**  
The `turtlebot3_yolo_object_detection.py` script runs the YOLOv8 model on live camera images from TurtleBot3 and publishes the detection results with bounding boxes. This allows you to visually confirm which objects are detected in real-time.  

Open and edit the following file to update the model path and other parameters.  
**[Remote PC]**  
```bash
$ nano ~/turtlebot3_ws/src/turtlebot3_applications/turtlebot3_yolo_object_detection/turtlebot3_yolo_object_detection/turtlebot3_yolo_object_detection.py
``` 
Update the line with the correct path to your `best.pt` file.
```bash
self.model = YOLO("~/Downloads/best.pt")  # Update with your actual model path
``` 
Then, build your workspace.  
**[Remote PC]**  
```bash
$ cd ~/turtlebot3_ws && colcon build --symlink-install --packages-select turtlebot3_yolo_object_detection
$ source install/setup.bash
``` 

**Step 3: Install the Required Dependencies**  
Install PyTorch and Ultralytics.  
Visit the official [PyTorch Installation Guide](https://pytorch.org/get-started/locally/) to install the correct version for your system.  
**[Remote PC]**  
```bash
# For CPU-only (example)
$ pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
```  
Once PyTorch is installed,  
**[Remote PC]**  
```bash
$ pip3 install ultralytics opencv-python "numpy<2.0"
```  

### [**Camera Stream Setup**](#camera-stream-setup)  

**Launch the Camera Node**  
Ensure that the SBC and Remote PC are on the same network and ROS2 DDS communication is properly set(e.g., `ROS_DOMAIN_ID`, `ROS_LOCALHOST_ONLY=0`).  
**[TurtleBot3 SBC]**  
```bash
 $ ros2 launch turtlebot3_bringup camera.launch.py format:=BGR888
 ``` 

### [**Prediction**](#prediction)  

**Step 1: Run the Detection Node**  
**[Remote PC]**  
```bash
$ ros2 run turtlebot3_yolo_object_detection turtlebot3_yolo_object_detection
``` 

**Step 2: Visualize the Detection Results**  
Open rqt_image_view and select the `/camera/detections/compressed` topic to view the camera feed with detection results. The detection node publishes the result as annotated image to the `/camera/detections/compressed` topic using OpenCV.  
**[Remote PC]**  
```bash
$ rqt_image_view
``` 
