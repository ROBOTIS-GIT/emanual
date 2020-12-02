
{% capture notice_03 %}
**NOTE**:

- The `turtlebot3_panorama` demo uses `pano_ros` for taking snapshots and stitching them together to create panoramic image.
- Panorama demo requires to install `raspicam_node` package. Instructions for installing this package can be found at [Gihub Link](https://github.com/UbiquityRobotics/raspicam_node)
- Panorama demo requires to install OpenCV and cvbridge packages. Instructions for installing OpenCV can be found at [OpenCV Tutorial Link](http://docs.opencv.org/2.4/doc/tutorials/introduction/linux_install/linux_install.html)
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

1. **[TurtleBot]** Launch the `turtlebot3_rpicamera` file
```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

2. **[Remote PC]** Launch `panorama`.
```bash
$ roslaunch turtlebot3_panorama panorama.launch
```

3. **[Remote PC]** To start the panorama demo, enter the following command.
```bash
$ rosservice call turtlebot3_panorama/take_pano 0 360.0 30.0 0.3
```
  Parameters that can be sent to the rosservice to get a panoramic image are:
  - Mode for taking the pictures.
      - 0 : snap&rotate (i.e. rotate, stop, snapshot, rotate, stop, snapshot, ...)
      - 1 : continuous (i.e. keep rotating while taking snapshots)
      - 2 : stop taking pictures and create panoramic image
  - Total angle of panoramic image, in degrees
  - Angle interval (in degrees) when creating the panoramic image in snap&rotate mode, time interval (in seconds) otherwise
  - Rotating velocity (in radians/s)

4. **[Remote PC]** To view the result image, enter the following command.
```bash
$ rqt_image_view image:=/turtlebot3_panorama/panorama
```
  ![](/assets/images/platform/turtlebot3/application/panorama_view.png)
