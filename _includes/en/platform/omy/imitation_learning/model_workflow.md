

This guide explains the process of **training** and **deploying imitation learning models** for the OMY using your prepared datasets.

### Model Training

After preparing your dataset, you can proceed to train the policy model.

**1. [User PC] Enter the Docker Container**

Open a terminal on the Jetson device and enter the Docker container:
```bash
cd open_manipulator
./docker/container.sh enter
```

**2. Navigate to the LeRobot Directory**

```bash
cd /root/ros2_ws/src/physical_ai_tools/lerobot
```

**3. Train the Policy**

Execute the following command to start training:

```bash
python lerobot/scripts/train.py \
  --dataset.repo_id=${HF_USER}/omy_test \
  --policy.type=act \
  --output_dir=outputs/train/act_omy_test \
  --job_name=act_omy_test \
  --policy.device=cuda \
  --log_freq=100 \
  --save_freq=1000
```
Key Training Parameters:  

| **Parameter**       | **Description**                                                           |
| ------------------- | ------------------------------------------------------------------------- |
| `--dataset.repo_id` | The Hugging Face dataset ID you created in the data collection step       |
| `--policy.type`     | Model architecture to use (e.g., `'act'` for Action Chunking Transformer) |
| `--output_dir`      | Directory path to save model checkpoints and logs                         |
| `--job_name`        | Name of the training run (useful for tracking multiple experiments)       |
| `--policy.device`   | Device to use for training (`'cuda'` for GPU, `'cpu'` for CPU)            |
| `--log_freq`        | How often to log training statistics (number of iterations)               |
| `--save_freq`       | How often to save model checkpoints (number of iterations)                |


**Expected Training Output:**  
During training, you will see output like this,
```
INFO 2025-05-28 12:12:40 ts/train.py:232 step:200 smpl:2K ep:3 epch:0.16 loss:7.490 grdn:154.502 lr:1.0e-05 updt_s:0.047 data_s:0.002
INFO 2025-05-28 12:12:48 ts/train.py:232 step:400 smpl:3K ep:7 epch:0.33 loss:3.128 grdn:85.109 lr:1.0e-05 updt_s:0.041 data_s:0.000
INFO 2025-05-28 12:12:57 ts/train.py:232 step:600 smpl:5K ep:10 epch:0.49 loss:2.615 grdn:74.954 lr:1.0e-05 updt_s:0.041 data_s:0.000
INFO 2025-05-28 12:13:05 ts/train.py:232 step:800 smpl:6K ep:13 epch:0.65 loss:2.331 grdn:68.764 lr:1.0e-05 updt_s:0.042 data_s:0.000
INFO 2025-05-28 12:13:14 ts/train.py:232 step:1K smpl:8K ep:16 epch:0.81 loss:2.075 grdn:64.323 lr:1.0e-05 updt_s:0.042 data_s:0.000
INFO 2025-05-28 12:13:22 ts/train.py:232 step:1K smpl:10K ep:20 epch:0.98 loss:1.903 grdn:61.364 lr:1.0e-05 updt_s:0.042 data_s:0.000
INFO 2025-05-28 12:13:31 ts/train.py:232 step:1K smpl:11K ep:23 epch:1.14 loss:1.716 grdn:57.887 lr:1.0e-05 updt_s:0.042 data_s:0.001
INFO 2025-05-28 12:13:40 ts/train.py:232 step:2K smpl:13K ep:26 epch:1.30 loss:1.558 grdn:54.819 lr:1.0e-05 updt_s:0.041 data_s:0.000
INFO 2025-05-28 12:13:48 ts/train.py:232 step:2K smpl:14K ep:29 epch:1.47 loss:1.454 grdn:53.859 lr:1.0e-05 updt_s:0.042 data_s:0.000
...
```

Training time depends on your hardware and dataset size, but typically ranges from several hours to a full day.

**(Optional) Uploading Checkpoints to Hugging Face**

To upload the latest trained checkpoint to the Hugging Face Hub:

```bash
huggingface-cli upload ${HF_USER}/act_omy_test \
  outputs/train/act_omy_test/checkpoints/last/pretrained_model
```

This makes your model accessible from anywhere and simplifies deployment.

### Model Inference

Once your model is trained, you can deploy it on the OMY for inference.

**1. Open a Terminal and Enter Docker Container**
```bash
cd 
./docker/container.sh enter
```

**2. Launch the ROS 2 Follower Node**
```bash
ros2 launch open_manipulator_bringup omy_follower_ai.launch.py
```

**3. Open a New Terminal and Run Docker Container**
```bash
cd 
./docker/container.sh enter
```

**4. Launch the Camera Node**
```bash
ros2 launch realsense2_camera rs_camera.launch.py
```

**5. Open a New Terminal and Run Docker Container**
```bash
cd 
./docker/container.sh enter
```

**6. Set the Robot Type to 'omy'**
```bash
ros2 service call /set_robot_type physical_ai_interfaces/srv/SetRobotType "
{
  robot_type: 'omy'
}"
```

**7. Send Service Call for Evaluation**  
You can now observe the robot performing motions driven by real-time inference from a trained model!

```bash
ros2 service call /task/command physical_ai_interfaces/srv/SendCommand "
{
  command: 2,
  task_info: {
    task_name: 'pick_and_place',
    task_type: 'inference',
    user_id: '[USER_ID]',
    task_instruction: 'Pick up the object and place it in the box',
    fps: 30
  },
  model_path: '[REPO_ID]'
}"
```
 Key Inference Parameters

| Parameter | Description |
|-----------|-------------|
| `task_name` | The name used to identify the task |
| `task_type` | The mode of execution |
| `user_id` | The Hugging Face dataset repository ID |
| `task_instruction` | The name of the task you are performing |
| `fps` | Frame rate for dataset recording |
| `model_path` | Where to save model checkpoints and logs |

### Visualizing Inference Results

After running inference, you can visualize the results using the same visualization tool used for datasets.

First, navigate to the `LeRobot` Directory:
```bash
cd /root/ros2_ws/src/physical_ai_tools/lerobot
```

Then, launch the visualization server with the following command:

```bash
python lerobot/scripts/visualize_dataset_html.py \
  --host 0.0.0.0 \
  --port 9091 \
  --repo-id ${HF_USER}/eval_omy_test
```

Finally, open [http://127.0.0.1:9091](http://127.0.0.1:9091) in your browser to see how your model performed.

{% capture notice_01 %}
**TIP:**
If you have a another device connected to the same network as the host machine, open `http://omy-{serial number}.local:9091` in your browser to see how your model performed.

For example, `http://omy-SNPR48A0000.local:9091`.
{% endcapture %}
<div class="notice--succuess">{{ notice_01 | markdownify}}</div>

### Troubleshooting

- **Out of memory errors**: Try reducing the batch size with `--train.batch_size=16` or lower
- **Low performance**: Consider collecting more diverse training data or increasing training duration
- **Robot not responding**: Ensure the follower node is running and communication is established
- **Training divergence**: Check your dataset quality and try decreasing the learning rate

