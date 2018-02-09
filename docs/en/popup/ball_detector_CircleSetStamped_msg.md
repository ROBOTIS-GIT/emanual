---
layout: popup
---

- File : `ball_detector/circleSetStamped`
     ```
  # This represents the set of detected circles

  #timestamp and frame id of the image frame
  std_msgs/Header header

  #set of detected circles:
  #      (circles[i].x, circles[i].y) is the center point in image coordinates
  #      circles[i].z is the circle radius
  geometry_msgs/Point[] circles

      ```
