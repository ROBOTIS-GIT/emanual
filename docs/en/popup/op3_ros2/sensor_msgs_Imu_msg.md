---
layout: popup
---

- File : `sensor_msgs/msg/Imu.msg`
- Raw Message Definition

  ```py
  # This is a message to hold data from an IMU (Inertial Measurement Unit)
  #
  # Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
  #
  # If the covariance of the measurement is known, it should be filled in (if all you know is the
  # variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
  # A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
  # data a covariance will have to be assumed or gotten from some other source
  #
  # If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an
  # orientation estimate), please set element 0 of the associated covariance matrix to -1
  # If you are interpreting this message, please check for a value of -1 in the first element of each
  # covariance matrix, and disregard the associated estimate.

  std_msgs/Header header

  geometry_msgs/Quaternion orientation
  float64[9] orientation_covariance # Row major about x, y, z axes

  geometry_msgs/Vector3 angular_velocity
  float64[9] angular_velocity_covariance # Row major about x, y, z axes

  geometry_msgs/Vector3 linear_acceleration
  float64[9] linear_acceleration_covariance # Row major x, y z
  ```

- Compact Message Definition

  ```py
  std_msgs/msg/Header header
  geometry_msgs/msg/Quaternion orientation
  double[9] orientation_covariance
  geometry_msgs/msg/Vector3 angular_velocity
  double[9] angular_velocity_covariance
  geometry_msgs/msg/Vector3 linear_acceleration
  double[9] linear_acceleration_covariance
  ```
