
### Hardware Setup

**1. Connect the Camera**

* Plug the camera into a **USB 2.0 port**.

**Warning:**
The RealSense camera mounted on the OMY uses a USB 2.0 cable and must be connected directly to the user PC.
Due to variations in USB configurations across different PCs, the camera image may not appear immediately.
In such cases, connecting the camera through a USB hub has been observed to resolve the issue in some environments.
{: .notice--warning}

* Ensure the USB cable is properly connected and not loose.


### Software Installation [USER PC]


**1. Start the Docker Containers**

Launch the containers using your preferred method or registered aliases:

```bash
open_manipulator docker start
physical_ai_server docker start
```

**2. Run AI Server via Alias**

Inside the `open_manipulator` container, run the AI Server using the registered alias:

```bash
ros2 launch realsense2_camera rs_camera.launch.py
```

Make sure the camera is properly connected and recognized inside the container.

### Troubleshooting

| Problem               | Solution                                                      |
| --------------------- | ------------------------------------------------------------- |
| Camera not recognized | Check USB cable, use `lsusb`, reboot                          |
| No image stream       | Check topics, verify node is running                          |
| Permission denied     | Add user to `video` group:<br> `sudo usermod -aG video $USER` |

