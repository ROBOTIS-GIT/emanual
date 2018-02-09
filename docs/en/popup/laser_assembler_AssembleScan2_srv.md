---
layout: popup
---

- File : `laser_assembler/AssemblerScan2.srv`
- Raw Message Definition

  ```c
  # The time interval on which we want to aggregate scans
  time begin
  # The end of the interval on which we want to assemble scans or clouds
  time end
  ---
  # The point cloud holding the assembled clouds or scans.
  # This cloud is in the frame specified by the ~fixed_frame node parameter.
  # cloud is empty if no scans are received in the requested interval.
  sensor_msgs/PointCloud2 cloud
  ```

- Compact Message Definition

  ```c
 time begin
 time end
 sensor_msgs/PointCloud2 cloud
  ```
