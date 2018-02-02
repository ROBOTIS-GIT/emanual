### 1. Overview
This chapter explain ball detecting package for ROBOTIS OP3's vision demonstration.  
The package utilizes OpenCV library in order to search for a ball with a specific color.


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery of ROBOTIS_OP3#24_installation_robotis_ros_packages.md)    

#### 2.2 Run
- Standalone   
Execute the program with a `.launch` file in order to load ROS parameters of ball_detector.  
   ```
   $ roslaunch ball_detector ball_detector.launch
   ```

- Launch with usb_cam package  
Execute the program with a `.launch` file in order to load ROS parameters.  
   ```
   $ roslaunch ball_detector ball_detector_from_usb_cam.launch
   ```
  > Reference : [`usb_cam`](http://wiki.ros.org/usb_cam)  
  > Reference : The following software must be pre-installed to use `usb_cam` package.  
  > `$ sudo apt-get install v4l-utils`

### 3. ROS API
#### 3.1 Subscribed Topics
`~/enable`([std_msgs/Bool]{: .popup})  
&emsp;&emsp; OP3 will start searching for a ball with a `True` message, and stop with a `False` message.  

`~/image_in`([sensor_msgs/Image]{: .popup})  
&emsp;&emsp; The message in this topic contains camera input image for ball searching.  

`~/cameraInfo_in`([sensor_msgs/CameraInfo]{: .popup})  
&emsp;&emsp; The message in this topic contains camera information of the corresponding input image.  

#### 3.2 Published Topics
`~/image_out`([sensor_mgsg/Image]{: .popup})  
&emsp;&emsp; The message in this topic contains an output image after the ball searching process.  

`~/camera_info`([sensor_msgs/CameraInfo]{: .popup})  
&emsp;&emsp; The message in this topic contains camera information of the output image.  

`~/circle_set`([ball_detector/circleSetStamped]{: .popup})  
&emsp;&emsp; Detected ball information
  - `header`([std_msgs/Header]{: .popup}) : Header information
  - `circles`([geometry_msgs/Point]{: .popup}) : Detecetd balls
    - `x` X coordinate of the center of ball in the image coordinate system
    - `y` Y coordinate of the center of ball in the image coordinate system
    - `z` Radius of the detected ball


### 4. Parameters
`/yaml_path`(string, default : "")  
&emsp;&emsp; The path of the yaml file that saves parameters.

`/gaussian_blur_size`(int, default : )  
&emsp;&emsp;   

`/gaussian_blur_sigma`(double, default : )  
&emsp;&emsp;   

`/canny_edge_th`(double, default : )  
&emsp;&emsp;   

`/hough_accum_resolution`(double, default : )  
&emsp;&emsp;   

`/min_circle_dist`(double, default : )  
&emsp;&emsp;   

`/hough_accum_th`(double, default : )  
&emsp;&emsp;   

`/min_radius`, `/max_radius`(int, default : )  
&emsp;&emsp; Minimum and maximum radius of the ball to detect

`/filter_h_min`, `/filter_h_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of H filter in HSV color representation  
> Reference : [HSV color](https://en.wikipedia.org/wiki/HSL_and_HSV)

`/filter_s_min`, `/filter_s_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of S filter in HSV color representation  

`/filter_v_min`, `/filter_v_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of V filter in HSV color representation  

`/use_second_filter`(bool, default : )  
&emsp;&emsp; Enable second color filter  

`/filter_debug`(bool, default : )  
&emsp;&emsp; Enable output image for debugging  

### 5. How to change the parameters
#### 5.1 using the `.yaml`


#### 5.2 using the `dynamic_reconfigure`




<br>[&lt;&lt; Back]

[std_msgs/Bool]:/docs/en/popup/std_msgs_bool_msg/
[sensor_msgs/Image]:/docs/en/popup/sensor_msgs_Image/
[sensor_msgs/CameraInfo]:/docs/en/popup/sensor_msgs_CameraInfo_msg/
[ball_detector/circleSetStamped]:/docs/en/popup/ball_detector_CircleSetStamped_msg/
[std_msgs/Header]:/docs/en/popup/std_msgs_Header/
[geometry_msgs/Point]:/docs/en/popup/geometry_msgs_Point_msg/
[&lt;&lt; Back]:[ROBOTIS-OP3-Demo.md]
