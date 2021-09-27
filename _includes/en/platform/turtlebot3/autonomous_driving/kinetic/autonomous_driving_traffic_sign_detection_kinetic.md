<!-- ## [Traffic Sign Detection](#traffic-sign-detection) -->

TurtleBot3 can detect traffic signs using a node with `SIFT algorithm`, and perform programmed tasks while it drives on a built track. Follow the provided instructions to use Traffic sign detection.

**NOTE**: More edges in the traffic sign increase recognition results from SIFT.
{: .notice}

1. Take pictures of traffic signs by using TurtleBot3's camera and `rqt_image_view` node.
2. Edit the pictures using a photo editor that can be used in Linux OS.
3. Put TurtleBot3 on the lane. Traffic signes should be placed where TurtleBot3 can see them easily.

   **NOTE**: Do not have TurtleBot3 run on the lane yet.
   {: .notice}

4. Execute rqt_image_view on `Remote PC`.
```bash
$ rqt_image_view
```

4. Select `/camera/image_compensated` topic in the select box. A screen will show the view from TurtleBot3.
5. Capture the picture from `Remote PC`，and edit it with a photo editor.
6. Place the edited picture to turtlebot3_autorace package you've placed **/turtlebot3_autorace/turtlebot3_autorace_detect/file/detect_sign/** and rename it as you want. (Although, you should change the file name written in the source **detect_sign.py** file, if you want to change the default file names.)

7. Open terminal and use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_detect turtlebot3_autorace_detect_sign.launch
```

8. Open terminal and use the command on `Remote PC`.
```bash
$ rqt_image_view
```

9. Select `/detect/image_traffic_sign/compressed` topic in the select box. A screen will show the result of traffic sign detection.
