---
layout: archive
lang: en
ref: op3_advanced_tutorials
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/advanced_tutorials/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 6
---

<style>body {counter-reset: h1 5 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Advanced Tutorials](#advanced-tutorials)


## Real-Time Ball Detection with YOLOv8 and OpenVINO on ROBOTIS-OP3

This tutorial provides a comprehensive guide to implementing real-time ball detection on the ROBOTIS-OP3 humanoid robot using the YOLOv8 object detection model and Intel OpenVINO toolkit. The goal is to transition from traditional computer vision methods to a deep learning-based approach, significantly improving detection accuracy and robustness in dynamic sports environments.  

<iframe width="1024" height="576" src="https://www.youtube.com/embed/phvHhRuzCzI" title="Real-Time Ball Detection with YOLOv8 and OpenVINO on ROBOTIS-OP3" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### Limitations and Problems of Existing Methods

The current ball detection method of ROBOTIS-OP3 relies on multi-stage manual feature extraction and rule-based processing. This approach sequentially applies HSV color space filtering, morphological operations, and Hough circle transform to detect balls. However, this approach reveals several serious limitations.

- **Vulnerability of color-based filtering**: Dramatic degradation in detection performance when the ball's color changes due to lighting variations, shadows, reflections, etc.
- **Lack of response to shape changes**: Hough circle transform assumes perfect circular objects, so it fails to detect when balls appear elliptical due to motion blur from high-speed movement or when balls are partially occluded.
- **Complexity of parameter adjustment**: 23 different parameters must be manually adjusted according to the environment, which greatly limits the system's versatility.


### Deep Learning-Based Object Detection Solution

Deep learning-based object detection models provide an innovative approach that can fundamentally solve the limitations of traditional methods.

- **Automatic feature learning**: Deep learning models automatically learn complex features and patterns from large amounts of data instead of manually designed features. This enables robust detection performance even under various lighting conditions, viewpoint changes, and partial occlusion situations.
- **Real-time processing performance**: YOLO (You Only Look Once) series models perform object detection with a single network pass, enabling real-time processing and efficient operation even on high-resolution videos.
- **Utilization of transfer learning**: By applying transfer learning based on pre-trained models, high performance can be achieved with relatively small amounts of specialized data.


### Necessity and Expected Effects of System Transition

The transition from existing rule-based systems to deep learning-based object detection represents not just a technical upgrade but a fundamental paradigm shift.

- **Performance improvement**: Latest deep learning models achieve high detection accuracy and show stable performance even in complex situations that are difficult to solve with traditional methods.
- **Improved maintainability**: System performance can be improved through data-centric approaches instead of complex parameter adjustments, and adaptation to new environments can be automated through retraining.
- **Securing scalability**: Once built, deep learning models can be easily applied to various environments and are easy to integrate with additional object detection tasks.

Under this background, this tutorial will provide step-by-step guidance on the specific methods and actual implementation process for transitioning from existing traditional computer vision-based ball detection systems to state-of-the-art deep learning-based object detection models.

### Lightweight Object Detection Model Selection and Performance Analysis

One of the most important decisions in building a deep learning-based ball detection system is selecting an appropriate object detection model. In real-time sports environments, the balance between accuracy and speed is crucial, and hardware constraints must also be considered.

#### **YOLO Series Model Performance Comparison**

Let's compare major candidates from the YOLO series, which is currently the most widely used real-time object detection model.


| Model | Parameters | mAP@0.5-0.95 | CPU Inference Time | GPU Inference Time |
| :-- | :-- | :-- | :-- | :-- |
| YOLOv5n | 2.6M | 28.0% | 73.6ms | 1.12ms |
| YOLOv8n | 3.2M | 37.3% | 80.4ms | 1.47ms |
| YOLOv8s | 11.2M | 44.9% | 128.4ms | 2.66ms |
| YOLOv8m | 25.9M | 50.2% | 234.7ms | 5.86ms |
| YOLOv8l | 43.7M | 52.9% | 375.2ms | 9.06ms |

**YOLOv8 Advantage**: The YOLOv8 series achieves **9-10% higher mAP** compared to YOLOv5 models of the same size, with YOLOv8n showing **33% improved accuracy** over YOLOv5n. This is the result of latest architectural improvements, enabling more stable detection performance in complex sports environments.

#### **Comparison with Lightweight Models**

Comparison with lightweight models for mobile and edge devices is also important:


| Model | Size | Inference Time | Average Precision |
| :-- | :-- | :-- | :-- |
| EfficientDet-Lite0 | 4.4MB | 37ms | 25.69% |
| EfficientDet-Lite4 | 19.9MB | 260ms | 41.96% |
| SSD MobileNetV2 | 6.7MB | 24ms | 20.2% |
| YOLOv8n | - | 80.4ms | 37.3% |

EfficientDet and SSD MobileNet series have **smaller model sizes and faster inference speeds**, but show significant differences in accuracy compared to YOLOv8. Especially considering the complex backgrounds and fast movements in sports environments, these accuracy differences greatly affect practicality.

#### Performance Improvement through OpenVINO Optimization

Using Intel OpenVINO toolkit can improve YOLOv8 model CPU inference speed by up to 3 times. This is key technology that enables real-time processing even in environments without GPUs.

- **Optimization effect**: For YOLOv8m model, OpenVINO optimization can reduce inference time from 234.7ms to about 78ms, achieving 12-13FPS performance even on a single CPU.

OpenVINO automatically utilizes various hardware including Intel CPUs, integrated GPUs, and VPUs to provide additional performance improvements. This allows maximum utilization of available hardware resources without code changes.

#### Final Model Selection

Based on comprehensive analysis, using YOLOv8m model with OpenVINO optimization is the optimal choice.

- **Accuracy advantage**: Provides the highest detection accuracy among real-time models with 50.2% mAP, ensuring stable performance in complex sports environments.
- **Real-time performance**: Achieves real-time processing goals even on CPU through OpenVINO optimization, enabling efficient operation without separate GPUs.
- **Robustness**: Maintains consistent detection performance under various lighting conditions and complex backgrounds, fundamentally solving traditional method limitations.
- **Scalability**: Easy customization for specific sports or environments through transfer learning based on pre-trained models.

Through this selection, we can overcome the limitations of existing HSV + Hough transform methods and build a ball detection system that simultaneously satisfies the high accuracy and real-time performance required in actual sports environments.

### Environment Setup

- **Python Environment**: Create a Python virtual environment to prevent package conflicts.

```bash
sudo apt install python3.12-venv
python3 -m venv ~/yolo_env
source ~/yolo_env/bin/activate
pip install --upgrade pip
```

- **Ultralytics YOLOv8 Installation**:

```bash
pip install ultralytics
pip install typeguard
```

After installation, loading the model with `YOLO('yolov8m.pt')` will automatically download pre-trained weights.
- **OpenVINO Installation**: Use Intel's PyPI distribution for OpenVINO acceleration. After installing OpenVINO runtime, check available devices.

```bash
pip install openvino
python3 -c "from openvino import Core; print(Core().available_devices)"
```

- **ICD (Installable Client Driver) Installation**: Driver system that enables OpenCL parallel computing on Intel integrated graphics cards

```bash
sudo apt install intel-opencl-icd
```

- **NumPy Version Downgrade**:
    - Binary compatibility issues occur due to version mismatch between NumPy version installed in virtual environment (NumPy 2.2.6) and NumPy version used when building `cv_bridge`, one of ROS2 Jazzy's core libraries (typically NumPy 1.x version).
    - Need to downgrade NumPy version in `yolo_env` virtual environment to version below 2.0 compatible with `cv_bridge`

1. Activate `yolo_env` virtual environment (skip if already activated):

```bash
source ~/yolo_env/bin/activate
```

2. Downgrade NumPy version:

```bash
pip install "numpy<2.0"
```


### ROS2 Package Creation and Node Implementation (YOLOv8m + OpenVINO-based Ball detection)

This section explains the complete process of creating a ROS2 package from scratch for use in ROBOTIS-OP3, completing and running a YOLOv8m + OpenVINO-based ball detection node.

#### 1. ROS2 Package Creation (Python-based)

```bash
cd ~/robotis_ws/src
ros2 pkg create op3_advanced_detector \
  --build-type ament_python \
  --dependencies rclpy std_msgs sensor_msgs geometry_msgs cv_bridge op3_ball_detector_msgs
```


#### 2. Package Directory Structure

The created `op3_advanced_detector` directory has the following structure:

```bash
op3_advanced_detector/
├── op3_advanced_detector/
│   └── __init__.py
├── package.xml
└── setup.py
```


#### 3. Node Basic File Creation

The final created `op3_advanced_detector` directory has the following structure:

```bash
op3_advanced_detector/
├── config/
│   ├── camera_param.yaml
│   └── detector_config.yaml
├── launch/
│   ├── advanced_detector.launch.py
│   └── ball_detector_from_usb_cam.launch.py
├── op3_advanced_detector/
│   ├── __init__.py
│   └── op3_advanced_detector.py
├── resource/
│   └── op3_advanced_detector
├── package.xml
├── setup.cfg
└── setup.py
```


### Code Structure and Description

#### Main Class: OP3AdvancedDetector class

```python
class OP3AdvancedDetector(Node):
    """Advanced object detector for ROBOTIS OP3"""
```

**Key Features:**

- Inherits ROS2 Node for integration with ROS system
- Real-time ball detection based on YOLO v8 + OpenVINO
- Built-in performance optimization and monitoring functions

**Class Constants:**

```python
    SUPPORTED_MODELS = {'yolov8n', 'yolov8s', 'yolov8m', 'yolov8l', 'yolov8x'}
    DEFAULT_INPUT_SIZE = (320, 320)
    
    # === Class constants ===
    BALL_CLASS_ID = 32  # COCO sports ball class
    DEFAULT_CONF_THRESHOLD = 0.25
    DEFAULT_IOU_THRESHOLD = 0.5
    MAX_DETECTIONS = 3  # Maximum number of balls to detect for better performance
```


#### Initialization Functions

**`__init__(self)`: Main Constructor**

```python
    def __init__(self):
        super().__init__('op3_advanced_detector')
        
        # === Initialization sequence ===
        self._init_parameters()
        self._setup_environment()
        self._init_ros_interfaces()
        self._init_detection_model()
        self._init_performance_tracking()
        
        self.get_logger().info(f"✅ Ball Detector ready | {self.device_info}")
```

**Role:**

- ROS2 node initialization
- Execute 5-stage initialization process
- Output system ready message

**Why initialization order is important:**

- Parameters first: Basis for all other settings
- Environment setup: System variables for performance optimization
- ROS interfaces: Build communication channels
- AI model: Most time-consuming task
- Performance tracking: Prepare for post-execution monitoring

**`_init_parameters(self)`: ROS2 Parameter Initialization**

```python
    def _init_parameters(self) -> None:
        """Initialize ROS2 parameters and configuration"""
        # Declare ROS2 parameters
        params = [
            ('yolo_model', 'yolov8s'),
            ('openvino_precision', 'FP32'),
            ('camera_topic', '/usb_cam_node/image_raw'),
            ('confidence_threshold', 0.25),
            ('iou_threshold', 0.5),
            ('input_size', [320, 320]),
            ('frame_skip', 2),
            ('debug_mode', True),
            ('enable_performance_log', True)
        ]
        
        for name, default in params:
            self.declare_parameter(name, default)
```

**Key Functions:**

- Parameter declaration: Register with ROS2 parameter system
- Value validation: Input value validity check
- Default value setting: Provide safe default settings

**Key Parameter Description:**


| **Parameter** | **Default** | **Description** | **Impact** |
| :-- | :-- | :-- | :-- |
| `yolo_model` | 'yolov8s' | YOLO model to use | Accuracy vs speed |
| `confidence_threshold` | 0.25 | Detection confidence threshold | Sensitivity control |
| `input_size` |  | Input image size | Performance vs accuracy |
| `frame_skip` | 2 | Processing frame interval | CPU usage |

**`_setup_environment(self)`: System Environment Optimization**

```python
    def _setup_environment(self) -> None:
        """System environment optimization"""
        # Multithreading optimization
        env_vars = {
            'OMP_NUM_THREADS': '2',
            'MKL_NUM_THREADS': '2', 
            'NUMEXPR_NUM_THREADS': '2',
            'OV_CACHE_DIR': '/tmp/ov_cache'
        }
        
        for key, value in env_vars.items():
            os.environ[key] = value
```

**Optimization Purpose:**

- Memory usage limitation: Prevent memory explosion due to multithreading
- Performance stabilization: Minimize thread contention
- Cache management: Specify OpenVINO model cache location

**`_init_ros_interfaces(self)`: ROS2 Communication Interface Setup**

```python
    def _init_ros_interfaces(self) -> None:
        """Initialize ROS2 communication interfaces"""
        self.bridge = CvBridge()
        
        # Detect image topic type and create appropriate subscriber
        self._setup_image_subscriber()
        
        # Publishers - compatible with original op3_ball_detector
        self.circle_pub = self.create_publisher(CircleSetStamped, '/ball_detector_node/circle_set', 10)
        self.status_pub = self.create_publisher(String, '/ball_detector_node/status', 10)
        
        # Debug publishers
        self.debug_pub = (
            self.create_publisher(Image, '/ball_detector_node/image_out', 10) 
            if self.debug_mode else None
        )
        
        # Additional publishers for backward compatibility
        self.ball_pub = self.create_publisher(Point, '/ball_position', 10)
```

**Topic Structure:**

- Input: `/usb_cam_node/image_raw` (camera image)
- Output:
    - `/ball_detector_node/circle_set` (detected ball information)
    - `/ball_position` (first ball position)
    - `/ball_detector_node/status` (system status)
    - `/ball_detector_node/image_out` (debug image)

**`_init_detection_model(self)`: AI Model Initialization**

```python
    def _init_detection_model(self) -> None:
        """Initialize ball detection model"""
        self.device_info = "Unknown"
        self.is_openvino = False
        
        # Try OpenVINO
        if OPENVINO_AVAILABLE and self._try_openvino_setup():
            return
            
        # PyTorch fallback
        self._setup_pytorch_model()
```

**Model Selection Priority:**

1. OpenVINO (Intel optimization): Best performance
2. PyTorch CPU: Compatibility backup

#### Image Processing Functions

**`image_callback(self, msg)`: Main Image Processing Loop**

```python
    def image_callback(self, msg: Image) -> None:
        """Main image processing loop"""
        self.frame_count += 1
        
        # Frame skipping (performance optimization)
        if self.frame_count % self.frame_skip != 0:
            return
            
        start_time = time.time()
        
        try:
            # Image preprocessing
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
            processed_img, transform_info = self._preprocess_image(cv_image)

            # Store original frame for debug visualization
            self._current_frame = processed_img.copy()

            # Ball detection
            detections = self._detect_balls(processed_img)
            
            # Publish results
            self._publish_results(detections, transform_info, cv_image.shape)
            
            # Performance tracking
            self._update_performance(time.time() - start_time, len(detections))
            
        except Exception as e:
            self.get_logger().error(f"❌ Image processing failed: {e}")
```

**Processing Pipeline:**

```
ROS Image → OpenCV Conversion → Preprocessing → AI Inference → Post-processing → ROS Publishing
```

**Frame Skipping Effects:**

- `frame_skip=2`: 30fps → 15fps (50% CPU usage reduction)
- `frame_skip=3`: 30fps → 10fps (67% CPU usage reduction)

**`_preprocess_image(self, image)`: Image Preprocessing**

```python
    def _preprocess_image(self, image: np.ndarray) -> Tuple[np.ndarray, Dict]:
        """Image preprocessing and return transformation info"""
        h, w = image.shape[:2]
        target_w, target_h = self.input_size
        
        # Resize maintaining aspect ratio
        scale = min(target_w / w, target_h / h)
        new_w, new_h = int(w * scale), int(h * scale)
        
        resized = cv2.resize(image, (new_w, new_h))
        
        # Center padding
        pad_w = (target_w - new_w) // 2
        pad_h = (target_h - new_h) // 2
        
        padded = cv2.copyMakeBorder(
            resized, pad_h, target_h - new_h - pad_h, 
            pad_w, target_w - new_w - pad_w,
            cv2.BORDER_CONSTANT, value=(114, 114, 114)
        )
        
        transform_info = {
            'scale': scale,
            'pad_w': pad_w,
            'pad_h': pad_h,
            'original_size': (w, h)
        }
        
        return padded, transform_info
```

**Why Preprocessing is Needed:**

- YOLO requirements: Square input needed
- Aspect ratio preservation: Prevent image distortion
- Standardization: Support various resolutions

**Transformation Process Visualization:**

```
Original (1280x720) → Resize (320x180) → Padding (320x320)
   [   Image   ]       [   Image   ]      [   Padding   ]
                                          [    Image    ]
                                          [   Padding   ]
```

**`compressed_image_callback(self, msg)`: Compressed Image Processing**

```python
def compressed_image_callback(self, msg: CompressedImage) -> None:
        """Compressed image processing callback"""
        # ... Frame skipping ...
        
        try:
            # Decompress image
            np_arr = np.frombuffer(msg.data, np.uint8)
            cv_image = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
            
            if cv_image is None:
                self.get_logger().error("❌ Failed to decode compressed image")
                return
            
            # Process image using existing pipeline
            processed_img, transform_info = self._preprocess_image(cv_image)
            # ... 
```

**Reasons for Compressed Image Support:**

- Bandwidth saving: Network transmission optimization
- Compatibility: Support various camera types


#### AI Model Inference Functions

**`_detect_balls(self, image)`: Execute Ball Detection**

```python
    def _detect_balls(self, image: np.ndarray) -> List[Dict]:
        """Execute ball detection"""
        try:
            if self.is_openvino:
                return self._openvino_inference(image)
            else:
                return self._pytorch_inference(image)
        except Exception as e:
            self.get_logger().error(f"❌ Detection failed: {e}")
            return []
```

**Dual Backup System:**

- Primary: OpenVINO (Intel optimization)
- Secondary: PyTorch (general compatibility)

**`_openvino_inference(self, image)`: OpenVINO Inference**

```python
    def _openvino_inference(self, image: np.ndarray) -> List[Dict]:
        """OpenVINO inference"""
        # Input format conversion: HWC → CHW, BGR → RGB, normalize
        input_tensor = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        input_tensor = input_tensor.transpose(2, 0, 1).astype(np.float32) / 255.0
        input_tensor = np.expand_dims(input_tensor, 0)
        
        # Execute inference
        infer_request = self.compiled_model.create_infer_request()
        infer_request.infer([input_tensor])
        output = infer_request.get_output_tensor(0).data
        
        # Post-processing
        return self._postprocess_detections(output, image.shape)
```

**OpenVINO Optimization Effects:**

- Speed: 2-3x faster than PyTorch
- Memory: Efficient memory usage
- Hardware: Intel GPU/CPU dedicated optimization

**Input Transformation Process:**

```python
# Original: (320, 320, 3) BGR uint8
# ↓ Color conversion
# (320, 320, 3) RGB uint8
# ↓ Axis transformation and normalization
# (3, 320, 320) RGB float32 [0-1]
# ↓ Add batch dimension
# (1, 3, 320, 320) RGB float32 [0-1]
```

**`_pytorch_inference(self, image)`: PyTorch Inference (Backup)**

```python
    def _pytorch_inference(self, image: np.ndarray) -> List[Dict]:
        """PyTorch YOLO inference (fallback)"""
        results = self.yolo_model.predict(
            image,
            classes=[self.BALL_CLASS_ID],
            conf=self.DEFAULT_CONF_THRESHOLD,
            iou=self.DEFAULT_IOU_THRESHOLD,
            verbose=False,
            save=False,
            device='cpu'
        )
        
        detections = []
        for result in results:
            if result.boxes is not None:
                for box in result.boxes:
                    x1, y1, x2, y2 = box.xyxy[0].cpu().numpy()
                    conf = float(box.conf[^0].cpu().numpy())
                    
                    detections.append({
                        'bbox': (int(x1), int(y1), int(x2), int(y2)),
                        'confidence': conf,
                        'center': (int((x1 + x2) / 2), int((y1 + y2) / 2))
                    })
        
        # Sort by confidence
        return sorted(detections, key=lambda x: x['confidence'], reverse=True)
```

**PyTorch Mode Features:**

- Simplicity: Use high-level API
- Stability: More error handling
- Compatibility: Support various hardware

**`_postprocess_detections(self, output, img_shape)`: Detection Result Post-processing**

```python
    def _postprocess_detections(self, output: np.ndarray, img_shape: Tuple) -> List[Dict]:
        """OpenVINO output post-processing"""
        detections = []
        
        # YOLOv8 output format: (1, 84, 8400)
        predictions = output[^0].T  # (8400, 84)
        
        # Confidence filtering
        ball_scores = predictions[:, 4 + self.BALL_CLASS_ID]
        valid_mask = ball_scores > self.DEFAULT_CONF_THRESHOLD
        
        if not np.any(valid_mask):
            return detections
        
        valid_preds = predictions[valid_mask]
        valid_scores = ball_scores[valid_mask]
        
        # Bounding box conversion (center coordinates → corner coordinates)
        boxes = valid_preds[:, :4]
        x_centers, y_centers = boxes[:, 0], boxes[:, 1]
        widths, heights = boxes[:, 2], boxes[:, 3]
        
        x1s = x_centers - widths / 2
        y1s = y_centers - heights / 2
        x2s = x_centers + widths / 2
        y2s = y_centers + heights / 2
        
        # Apply NMS
        indices = cv2.dnn.NMSBoxes(
            boxes.tolist(), valid_scores.tolist(),
            self.DEFAULT_CONF_THRESHOLD, self.DEFAULT_IOU_THRESHOLD
        )
        
        if len(indices) > 0:
            for i in indices.flatten():
                x1, y1, x2, y2 = x1s[i], y1s[i], x2s[i], y2s[i]
                conf = valid_scores[i]
                
                # Minimum size filter
                if (x2 - x1) > 8 and (y2 - y1) > 8:
                    detections.append({
                        'bbox': (int(x1), int(y1), int(x2), int(y2)),
                        'confidence': float(conf),
                        'center': (int((x1 + x2) / 2), int((y1 + y2) / 2))
                    })
        
        # Limit to MAX_DETECTIONS
        return sorted(detections, key=lambda x: x['confidence'], reverse=True)[:self.MAX_DETECTIONS]
```

**YOLOv8 Output Structure:**

```
Output tensor: (1, 84, 8400)
├── 1: Batch size
├── 84: [x, y, w, h] + 80 class scores
└── 8400: Number of prediction boxes (various grid sizes)

Class score positions:
- 0-3: Bounding box coordinates (x, y, w, h)
- 4-83: 80 COCO class scores
- Index 36 (4+32): Sports ball class
```

**NMS (Non-Maximum Suppression):**

- Purpose: Remove duplicate detections
- Method: Remove boxes with lower confidence among those with IoU > threshold
- Effect: Leave only one box per ball


#### Result Publishing Functions

**`_publish_results(self, detections, transform_info, original_shape)`: Integrated Result Publishing**

```python
    def _publish_results(self, detections: List[Dict], transform_info: Dict, original_shape: Tuple) -> None:
        """Publish detection results"""
        try:
            # Publish CircleSetStamped message (main output)
            self._publish_circle_set(detections, transform_info, original_shape)
            
            if detections:
                # Publish first ball position for backward compatibility
                self._publish_ball_position(detections[^0], transform_info, original_shape)
                self._publish_status(f"DETECTED:conf={detections[^0]['confidence']:.3f}")
                self.ball_lost_count = 0
            else:
                self._handle_no_detection()
            
            # Debug image (optional)
            if self.debug_pub and self.debug_pub.get_subscription_count() > 0:
                self._publish_debug_image(detections, transform_info)
                
        except Exception as e:
            self.get_logger().error(f"❌ Result publishing failed: {e}")
```

**Publishing Priority:**

1. Essential: CircleSetStamped (main output)
2. Compatibility: Point message (for existing systems)
3. Status: System status string
4. Optional: Debug image (only when subscribers exist)

**`_publish_circle_set(self, detections, transform_info, original_shape)`: Circle Information Publishing**

```python
    def _publish_circle_set(self, detections: List[Dict], transform_info: Dict, original_shape: Tuple) -> None:
        """Publish CircleSetStamped message compatible with original op3_ball_detector"""
        circle_msg = CircleSetStamped()
        circle_msg.header.stamp = self.get_clock().now().to_msg()
        circle_msg.header.frame_id = "camera_frame"
        
        circles = []
        for detection in detections:
            center_x, center_y = detection['center']
            bbox = detection['bbox']
            
            # Coordinate inverse transformation: remove padding → restore scale
            orig_x = int((center_x - transform_info['pad_w']) / transform_info['scale'])
            orig_y = int((center_y - transform_info['pad_h']) / transform_info['scale'])
            
            # Calculate radius from bounding box
            bbox_width = bbox[^2] - bbox[^0]
            bbox_height = bbox[^3] - bbox[^1]
            radius = int(max(bbox_width, bbox_height) / 2 / transform_info['scale'])
            
            # Boundary clipping
            orig_w, orig_h = transform_info['original_size']
            orig_x = np.clip(orig_x, 0, orig_w - 1)
            orig_y = np.clip(orig_y, 0, orig_h - 1)
            
            # NORMALIZE COORDINATES TO (-1, +1) RANGE
            # top(-1), bottom(+1) for y-axis
            # left(-1), right(+1) for x-axis
            normalized_x = orig_x / orig_w * 2 - 1  # Convert to (-1, +1)
            normalized_y = orig_y / orig_h * 2 - 1  # Convert to (-1, +1)
            
            # Create Point message (x, y are normalized coordinates, z is radius)
            point = Point()
            point.x = float(normalized_x)  # Normalized x (-1 ~ +1)
            point.y = float(normalized_y)  # Normalized y (-1 ~ +1)
            point.z = float(radius)        # radius in pixels
            circles.append(point)
        
        circle_msg.circles = circles
        self.circle_pub.publish(circle_msg)
```

**Coordinate Transformation Process:**

```
1. AI output coordinates (based on 320x320)
   ↓
2. Remove padding: x' = x - pad_w, y' = y - pad_h
   ↓
3. Restore scale: x'' = x' / scale, y'' = y' / scale
   ↓
4. Original resolution coordinates (based on original size)
   ↓
5. Normalize: nx = x'' / width * 2 - 1, ny = y'' / height * 2 - 1
   ↓
6. Normalized coordinates (-1 ~ +1 range)
```

**Advantages of Normalization:**

- Resolution independent: Same coordinate system for any camera
- Robot control standardization: Direct connection to head movement angles
- Mathematical convenience: Simplified trigonometric calculations

**`_publish_ball_position(self, detection, transform_info, original_shape)`: Ball Position Publishing**

```python
    def _publish_ball_position(self, detection: Dict, transform_info: Dict, original_shape: Tuple) -> None:
        """Publish ball position information"""
        center_x, center_y = detection['center']
        
        # Coordinate inverse transformation: remove padding → restore scale
        orig_x = int((center_x - transform_info['pad_w']) / transform_info['scale'])
        orig_y = int((center_y - transform_info['pad_h']) / transform_info['scale'])
        
        # Boundary clipping
        orig_w, orig_h = transform_info['original_size']
        orig_x = np.clip(orig_x, 0, orig_w - 1)
        orig_y = np.clip(orig_y, 0, orig_h - 1)
        
        # NORMALIZE COORDINATES TO (-1, +1) RANGE
        normalized_x = orig_x / orig_w * 2 - 1  # Convert to (-1, +1)
        normalized_y = orig_y / orig_h * 2 - 1  # Convert to (-1, +1)
        
        # Publish
        point = Point()
        point.x = float(normalized_x)  # Normalized x (-1 ~ +1)
        point.y = float(normalized_y)  # Normalized y (-1 ~ +1)
        point.z = detection['confidence']
        self.ball_pub.publish(point)
```

**Point Message Structure:**

- `x`: Normalized x coordinate (-1 ~ +1)
- `y`: Normalized y coordinate (-1 ~ +1)
- `z`: Detection confidence (0 ~ 1)

**`_publish_debug_image(self, detections, transform_info)`: Debug Image Publishing**

```python
    def _publish_debug_image(self, detections: List[Dict], transform_info: Dict) -> None:
        """Publish debug image with detection visualizations"""
        try:
            # Use original frame as base for debug image
            if hasattr(self, '_current_frame') and self._current_frame is not None:
                # Resize debug image to match detection input size for consistency
                debug_img = cv2.resize(self._current_frame, self.input_size)
            else:
                # Fallback: create empty image with detection input size
                debug_img = np.zeros((*self.input_size[::-1], 3), dtype=np.uint8)
            
            img_height, img_width = debug_img.shape[:2]
            
            # Calculate appropriate text scale based on image size (smaller for 320x320)
            text_scale = 0.4  # Fixed smaller scale for 320x320 resolution
            text_thickness = 1
            
            # Draw detection results directly on resized debug image (no coordinate transformation needed)
            for i, detection in enumerate(detections):
                # Use detection coordinates directly since debug image is same size as detection input
                center_x, center_y = detection['center']
                bbox = detection['bbox']
                x1, y1, x2, y2 = bbox
                
                # Ensure coordinates are within image bounds
                x1 = max(0, min(x1, img_width - 1))
                y1 = max(0, min(y1, img_height - 1))
                x2 = max(0, min(x2, img_width - 1))
                y2 = max(0, min(y2, img_height - 1))
                center_x = max(0, min(center_x, img_width - 1))
                center_y = max(0, min(center_y, img_height - 1))
                
                # Color coding by detection order
                color = (0, 255, 0) if i == 0 else (0, 255, 255)  # Green for best, yellow for others
                
                # Draw bounding box
                cv2.rectangle(debug_img, (x1, y1), (x2, y2), color, 2)
                
                # Draw center point
                cv2.circle(debug_img, (center_x, center_y), 4, color, -1)
                
                # Draw confidence text
                conf_text = f"Ball {i+1}: {detection['confidence']:.3f}"
                text_y = y1 - 10 if y1 > 20 else y2 + 20
                cv2.putText(debug_img, conf_text, (x1, text_y), 
                           cv2.FONT_HERSHEY_SIMPLEX, text_scale, color, text_thickness)
            
            # Add performance info
            fps_text = f"FPS: {self.current_fps:.1f} | Device: {self.device_info}"
            cv2.putText(debug_img, fps_text, (5, 20), 
                       cv2.FONT_HERSHEY_SIMPLEX, text_scale, (255, 255, 255), text_thickness)
            
            # Convert and publish
            debug_msg = self.bridge.cv2_to_imgmsg(debug_img, "bgr8")
            debug_msg.header.stamp = self.get_clock().now().to_msg()
            debug_msg.header.frame_id = "camera_frame"
            self.debug_pub.publish(debug_msg)
            
        except Exception as e:
            self.get_logger().error(f"❌ Debug image publishing failed: {e}")
```

**Debug Image Elements:**

- Bounding boxes: Detected ball areas (rectangles)
- Center points: Ball center positions (circles)
- Confidence: Detection confidence (text)
- Performance info: FPS and device used (text)
- Color coding: First ball (green), others (yellow)


#### Performance Monitoring Functions

**`_update_performance(self, process_time, ball_count)`: Performance Update**

```python
    def _update_performance(self, process_time: float, ball_count: int) -> None:
        """Update performance statistics"""
        self.process_times.append(process_time)
        self.fps_counter += 1
        
        # Periodic logging (every 15 frames)
        if self.fps_counter % 15 == 0:
            self._log_performance(ball_count)
```

**Performance Tracking Items:**

- Processing time: Time taken to process each frame
- FPS: Frames processed per second
- Detection count: Number of balls detected per frame

**`_log_performance(self, ball_count)`: Performance Logging**

```python
    def _log_performance(self, ball_count: int) -> None:
        """Log performance information"""
        elapsed = time.time() - self.fps_timer
        self.current_fps = 15 / elapsed
        
        recent_times = self.process_times[-15:]
        avg_ms = np.mean(recent_times) * 1000
        max_ms = np.max(recent_times) * 1000
        
        self.get_logger().info(
            f"📊 {self.device_info} | FPS: {self.current_fps:.1f} | "
            f"Process time: {avg_ms:.0f}ms (max: {max_ms:.0f}ms) | Balls: {ball_count}"
        )
        
        # Reset timer
        self.fps_timer = time.time()
        
        # Memory management
        if len(self.process_times) > 30:
            self.process_times = self.process_times[-15:]
```

**Log Example:**

```
📊 OpenVINO GPU | FPS: 15.1 | Process time: 62ms (max: 64ms) | Balls: 3
📊 PyTorch CPU | FPS: 12.3 | Process time: 81ms (max: 125ms) | Balls: 0
```

**Performance Indicator Interpretation:**

- FPS > 20: Real-time processing possible
- Process time < 50ms: Good performance
- Max time: Worst-case latency


#### Utility Functions

**`_try_openvino_setup(self)`: Attempt OpenVINO Setup**

```python
    def _try_openvino_setup(self) -> bool:
        """Attempt OpenVINO model setup"""
        try:
            # Set model file paths
            model_dir = Path(f"{self.yolo_model_name}_openvino_model")
            xml_path = model_dir / f"{self.yolo_model_name}.xml"
            
            # Create model if needed
            if not xml_path.exists():
                self.get_logger().info(f"⚙️  Creating OpenVINO model... ({self.yolo_model_name})")
                self._create_openvino_model()
                
                # Re-check after creation
                if not xml_path.exists():
                    self.get_logger().warn(f"❌ OpenVINO model creation failed: {xml_path}")
                    return False
            
            # Initialize OpenVINO core
            self.ov_core = ov.Core()
            
            # Select device and compile model
            device = self._select_best_device()
            self.ov_model = self.ov_core.read_model(str(xml_path))
            self.compiled_model = self.ov_core.compile_model(self.ov_model, device)
            
            self.device_info = f"OpenVINO {device}"
            self.is_openvino = True
            
            # Warmup
            self._warmup_model()
            
            self.get_logger().info(f"🚀 OpenVINO model loaded | Device: {device}")
            return True
            
        except Exception as e:
            self.get_logger().warn(f"⚠️  OpenVINO setup failed: {e}")
            return False
```

**`_create_openvino_model(self)`: Create OpenVINO Model**

```python
    def _create_openvino_model(self) -> None:
        """Create OpenVINO optimized model"""
        try:
            # Load PyTorch model
            yolo_model = YOLO(f"{self.yolo_model_name}.pt")
            
            # Export to OpenVINO format
            export_path = yolo_model.export(
                format="openvino",
                half=(self.precision == "FP16"),
                imgsz=self.input_size[^0],
                dynamic=False,
                simplify=True
            )
            
            self.get_logger().info(f"✅ OpenVINO model created: {export_path}")
            
        except Exception as e:
            self.get_logger().error(f"❌ OpenVINO model creation failed: {e}")
            raise
```

**Model Conversion Options:**

- FP16: 50% memory usage reduction, slight accuracy loss
- FP32: High accuracy, more memory usage
- Dynamic=False: Faster inference with fixed size
- Simplify=True: Remove unnecessary operations

**`_select_best_device(self)`: Select Optimal Device**

```python
    def _select_best_device(self) -> str:
        """Select optimal inference device"""
        try:
            available_devices = self.ov_core.available_devices
            
            # Prefer Intel GPU
            if 'GPU' in available_devices:
                return 'GPU'
            elif 'CPU' in available_devices:
                return 'CPU'
            else:
                return 'AUTO'
        except:
            return 'CPU'  # Safe fallback
```

**Device Priority:**

1. GPU: Intel integrated graphics (fastest)
2. CPU: Intel CPU (medium performance)
3. AUTO: Automatic selection (safe)

**`_warmup_model(self)`: Model Warmup**

```python
    def _warmup_model(self) -> None:
        """Model warmup (remove initial latency)"""
        dummy_input = np.zeros((1, 3, *self.input_size), dtype=np.float32)
        
        try:
            for _ in range(2):
                infer_request = self.compiled_model.create_infer_request()
                infer_request.infer([dummy_input])
            self.get_logger().info("🔥 Model warmup complete")
        except Exception as e:
            self.get_logger().warn(f"Warmup failed: {e}")
```

**Need for Warmup:**

- Initial latency: First inference is slow due to cache loading
- Memory allocation: Pre-allocate GPU memory
- Optimization: Complete runtime optimization


#### Error Handling and State Management

**`_handle_no_detection(self)`: Handle Detection Failure**

```python
    def _handle_no_detection(self) -> None:
        """Handle no ball detection"""
        self.ball_lost_count += 1
        if self.ball_lost_count > 10:  # No detection for 10 consecutive frames
            self._publish_status("NO_BALL")
```

**Detection Failure Logic:**

- Counter increment: Track consecutive failures
- Threshold application: 10 frames = about 0.5 seconds (30fps basis)
- Status publishing: Notify other nodes of situation

**`_publish_status(self, status)`: Status Publishing**

```python
    def _publish_status(self, status: str) -> None:
        """Publish status message"""
        msg = String()
        msg.data = status
        self.status_pub.publish(msg)
```

**Status Message Types:**

- `"DETECTED:conf=0.856"`: Detection success + confidence
- `"NO_BALL"`: Detection failure (long-term)
- `"ERROR:..."`: System error


#### Main Execution Function

**`main(args=None)`: Program Entry Point**

```python
def main(args=None):
    """Main execution function"""
    rclpy.init(args=args)
    
    try:
        detector = OP3AdvancedDetector()
        detector.get_logger().info("🎯 Ball Detector running... (Ctrl+C to stop)")
        rclpy.spin(detector)
        
    except KeyboardInterrupt:
        print("\n👋 User terminated")
    except Exception as e:
        print(f"❌ System error: {e}")
    finally:
        try:
            rclpy.shutdown()
        except:
            pass
```

**Execution Flow:**

1. ROS initialization: `rclpy.init()`
2. Node creation: `OP3AdvancedDetector()`
3. Main loop: `rclpy.spin()` - callback processing
4. Cleanup: `rclpy.shutdown()`

## Conclusion

In this tutorial, we solved the vulnerabilities of the HSV + Hough method with AI object detection. The YOLOv8m + OpenVINO combination enabled robust ball detection even with environmental changes and achieved real-time performance of ≥15FPS even in CPU-only environments. The code structure is easily extensible to various objects (e.g., goals, opposing players). For example, by retraining the YOLOv8 model with goal data or training additional classes, the same node can be extended to detect multiple objects.

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/advanced_tutorials_rev2.md %}
</section>