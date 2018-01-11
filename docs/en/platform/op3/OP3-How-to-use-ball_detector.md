### 1. Overview   
This chapter explains how to calibrate the `ball_detector_node` to find a ball. The `ball_detector_node` detects a ball by the designated color and Hough Circle Transform.  


### 2. Getting started  
#### 2.1 Run the program  
```
$ roslaunch ball_detector ball_detector_from_usb_cam.launch
```
or
```
$ roslaunch op3_demo demo.launch
```

#### 2.2 How to change the parameters  
1. Dynamic Reconfigure and Image View  
    - run the `rqt`  
        ```
        $ rqt
        ```
    - Open `Dynamic Reconfigure`   
    Select `Plugins -> Configuration -> Dynamic Reconfigure`

   <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/ball_detector_node_01.png?raw=true"/>   

    - Open `Image View`  
    Select `Plugins -> Visualization -> Image View`  

   <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/ball_detector_node_02.png?raw=true"/>  

2. Parameters    
The description for each parameter will pop up when hovering the mouse cursor over each parameter.  
    <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/ball_detector_node_03.png?raw=true"/>   
    - gaussian_blur_size: Size of Gaussian Blur Kernel (odd value)  
    - gaussian_blur_sigma: Std deviation of Gaussian Blur  
    - canny_edge_th: Threshold of the edge detector  
    - hough_accum_resolution: Resolution of the Hough accumulator, in terms of inverse ratio of image resolution  
    - min_circle_dist: Minimum distance between circles  
    - hough_accum_th: Accumulator threshold to decide center detection  
    - min_radius: Minimum circle radius allowed, pixels. (if unknown, put 0 for a detault.)  
    - max_radius: Maximum circle radius allowed, pixels. (if unknown, put 0 for a detault.)  
    - filter_h_min: Minimum threshold of H filter  
    - filter_h_max: Maximum threshold of H filter  
    - filter_s_min: Minimum threshold of S filter  
    - filter_s_max: Maximum threshold of S filter  
    - filter_v_min: Minimum threshold of V filter  
    - filter_v_max: Maximum threshold of V filter  
    - use_second_filter: Use second filter  
    - filter2_h_min: Minimum threshold of H filter  
    - filter2_h_max: Maximum threshold of H filter  
    - filter2_s_min: Minimum threshold of S filter  
    - filter2_s_max: Maximum threshold of S filter  
    - filter2_v_min: Minimum threshold of V filter  
    - filter2_v_max: Maximum threshold of V filter  
    - ellipse_size: Ellipse size  
    - debug_image: Show filtered image to debug  

3. Description  
    1. How the ball_detector_node works  
        ball_detector_node filters the HSV value first, then detect the ball with `HoughCircles`  

    2. How to calibrate  
        - Set H(hue) value (color value) first with full range of S and V. Then set the range of S(saturation) and V(value) to remove the noise.  
        *Hue is measured by degrees within the cylindrically represented color system. Therefore, the value 360 can be represented as 0, and the minimum value can have a bigger number than the maximum value.  (ex : min - 350 / max - 10 [Red area])   

        - If you check the ‘use_second_filter’, you can get an image which is detected with two HSV variations.   

      <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/ball_detector_node_04.png?raw=true"/>  

        - If you check the ’debug_image’ you can check the HSV filtered, binary image.   

      <img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/ball_detector_node_05.png?raw=true"/>  

        - After you set the HSV range, you could calibrate the threshold value to detect the edge better.  

  
[&lt;&lt; Back](OP3 User's Guide)
