
### Prerequisites

To begin, access the `Robot PC` via SSH.(Refer to the Quick Start Guide for instructions on how to connect via SSH.)  

**1. Launch the ROS 2 teleoperation node**

Open a new terminal in `Robot PC` and enter the Docker container:  

```bash
docker exec -it open_manipulator /bin/bash
```

Launch the ROS 2 teleoperation node:  

```bash
ros2 launch open_manipulator_bringup ai_teleoperation.launch.py
```


**2. Launch Physical AI Server**

{% capture notice_01 %}
**NOTE:**
The _Physical AI Server_ is the backend that connects with the Web UI. It should be running to use the interface for data recording.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify}}</div>

Open a new terminal in `User PC` and start the Docker container.:

```bash
cd physical_ai_tools/docker
.container.sh start
```

Enter the Docker container
```bash
cd physical_ai_tools/docker
.container.sh enter
```

Launch Physical AI Server with the following command:  

```bash
ros2 launch physical_ai_server physical_ai_server_bringup.launch.py
```

Or, use shortcut command:  

```bash
ai_server
```

**3. Open the Web UI**


**Access the Web UI in Your Browser**

Open web browser on `User PC` and go to `http://127.0.0.1`.

Or, from another device connected to the same network, go to `http://{IP address of the User PC}`.


Once connected, you should see the web UI as shown below.  

<img src="/assets/images/platform/omy/web_ui_home_page.png" width="700"/>

### Record your dataset

**1. Select the Robot Type**

On the **Home** page, select the type of robot you are using.  

<img src="/assets/images/platform/omy/web_ui_robot_type_selection.png" width="300"/>

**2. Go to Record page**

{% capture notice_02 %}
**NOTE**: You cannot access **Record** page unless a robot type has been selected on the **Home** page.  
 Please ensure that the robot type is selected before proceeding.  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>

The **Record** page is divided into three main sections:  

- **Image Streaming Area** (Center): Displays real-time camera streams from the robot.  

- **Task Info Panel** (Right side): Enter task name, task instruction, time values, etc.  

- **Control Panel** (Bottom): Start/stop recording and manage data collection.  

The selected robot type is also displayed in the top left corner.  

<img src="/assets/images/platform/omy/web_ui_record_page.png" width="900"/>

**3. Visualize RGB images from the cameras:**

The image stream is displayed automatically upon entering the **Record** page.  
You can remove the current stream and select a different one as needed.  

To change the image topic:  

1. Click the **+** button in the Image Streaming Area.
2. Choose a topic from the popup window.

<img src="/assets/images/platform/omy/web_ui_select_image_topic.png" width="400"/>

**4. Enter Task Information:**

Fill out the task-related fields in the **Task Info Panel**, located on the right side of the **Record** page.

<img src="/assets/images/platform/omy/web_ui_task_info.png" width="400"/>

For detailed information on each field, expand the section below:

| Item                 | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Task Name**        | It is used for the folder name of the dataset.                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Task Instruction** | A sentence that instructs the robot what action to perform, such as "pick and place object".                                                                                                                                                                                                                                                                                                                                                                                      |
| **Push to hub**      | Check this box to push the dataset to the Hugging Face Hub for sharing and training.<br>**Requirements:**<br>1. Hugging Face account<br>2. Permissions to push to the repository                                                                                                                                                                                                                                                                                                   |
| **Private Mode**     | Available only when "Push to hub" is enabled. Keeps the dataset private on Hugging Face.                                                                                                                                                                                                                                                                                                                                                                                           |
| **User ID**          | Your Hugging Face username, used as the dataset folder name.<br>- Not using Hugging Face? Any name is fine.<br>- Using Hugging Face? Click "Load" to select a User ID.<br>- No registered ID? Click "Change" to enter your token manually.<br>- If account exists but "Push to hub" is unchecked, you can:<br>1. Load a registered ID<br>2. Enter a custom ID                                                                                          |
| **FPS**              | Frame rate for recording. Recommended value: 15                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **Tags**             | Keywords for organizing and categorizing datasets on the hub. Useful for filtering/searching.                                                                                                                                                                                                                                                                                                                                                                                      |
| **Warmup Time**      | Time (in seconds) to warm up the robot before recording starts.                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Episode Time**     | Duration (in seconds) to record each episode.                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **Reset Time**       | Duration (in seconds) for resetting between episodes.                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **Num Episodes**     | Total number of episodes to record.                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| **Optimized Save**   | If enabled, uses RAM for faster data encoding. 


### Start Recording:

To begin recording, use the **Control Panel** located at the bottom of the **Record** page:

<img src="/assets/images/platform/omy/web_ui_control_panel.png" width="700"/>

**Step 1: Click the `Start` Button**

Click the `Start` button to begin the recording session. The system will automatically:

   - Warm up the robot for the specified **Warm-up Time**
   - Record each episode for the specified **Episode Time**
   - Wait for the specified **Reset Time** between episodes
   - Repeat the above steps for the specified **Number of Episodes**

**Step 2: Monitor and Control During Recording**


While recording is in progress, the following controls are available:

   - The `Stop` button saves the current episode in progress and stops the recording. If you press the `Start` button again, recording will resume from the next episode.
   - The `Retry` button cancels the current episode and restarts recording for that episode
   - The `Next` button ends the current episode early and moves to the next episode
   - The `Finish` button ends the recording session and saves the current dataset, regardless of the remaining number of episodes


{% capture notice_02 %}
**NOTE:**  
  The current recording stage is displayed in the control panel:
  - 📍 **Ready to start** — Standby mode before recording begins  
  - 🔥 **Warm-up in progress** — Robot is warming up  
  - 🔴 **Recording in progress** — Capturing data  
  - 🏠 **Reset in progress** — Reset time between episodes  
  - 💾 **Saving...** — Encoding and saving the episode
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>

{% capture notice_01 %}
 **TIP:**  
- Before you start, keep the robot in a safe and ready position during warm-up
- Make sure all required fields in the Task Info Panel are filled in
- Keep the robot in a safe and ready position during warm-up
- Monitor progress and status updates through the Web UI
- System resources (CPU, RAM, Storage) are displayed during recording
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify}}</div>

**Step 3. After recording:**
   - The dataset will be saved locally.
   - If "Push to hub" is enabled, the dataset will be uploaded to Hugging Face.
   - You can find the recorded dataset in the location below:

{% capture notice_02 %}
**NOTE**: This path refers to your **host system**, not inside the Docker container.
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>

```
~/ai_worker/docker/huggingface/lerobot
```

### Dataset Visualization

Once data collection is complete, you can preview and inspect your recorded dataset using the following command:  

```bash
cd /root/ros2_ws/src/physical_ai_tools/lerobot
```

```bash
python lerobot/scripts/visualize_dataset_html.py \
  --host 0.0.0.0 \
  --port 9091 \
  --repo-id ${HF_USER}/omy_test
```

You should see an output similar to the following:  

```
Fetching 4 files: 100%|██████████| 4/4 [00:00<00:00, 3457.79it/s]
.gitattributes: 100%|██████████| 2.46k/2.46k [00:00<00:00, 45.9MB/s]
Fetching 126 files: 100%|██████████| 126/126 [00:00<00:00, 266.66it/s]
Resolving data files: 100%|██████████| 30/30 [00:00<00:00, 662258.53it/s]
INFO 2025-05-15 16:18:07 set_html.py:364 Output directory already exists. Loading from it: '/tmp/lerobot_visualize_dataset_uo6ddbb1'
 * Serving Flask app 'visualize_dataset_html'
 * Debug mode: off
INFO 2025-05-15 16:18:07 _internal.py:97 WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:9091
INFO 2025-05-15 16:18:07 _internal.py:97 Press CTRL+C to quit
```

Once the server is running, access [http://127.0.0.1:9091](http://127.0.0.1:9091) in your browser on the `User PC` to preview the dataset.

Or, on another device connected to the same network as the `User PC`, access `http://{IP address of the host machine}:9091` to preview the dataset.

You should see a web interface similar to the one below:  
<img src="/assets/images/platform/omy/data_visualization.png" width="400"/>
