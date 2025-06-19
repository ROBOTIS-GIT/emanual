### Overview
This document provides an overview of the complete ROS 2-based imitation learning pipeline built on the OMY platform and the Hugging Face Hub and includes a user-friendly web GUI designed to streamline interaction and improve accessibility.  

**1. Data Collection**

Human operators use a leader device to demonstrate motions, collecting image and joint position data. The web-based GUI plays a key role in streamlining this process by providing real-time visualization and control. The collected data can be uploaded to and downloaded from the Hugging Face Hub.  

**2. Data Visualization**

Collected data is visualized to inspect motion trajectories and images, helping identify potential errors before training.  

**3. Model Training**

The verified dataset is then used to train an action policy model. Training can be performed on local GPUs. The resulting model can be uploaded to and downloaded from the Hugging Face Hub.  

**4. Model Inference**

Once trained, the models are deployed on the OMY product to execute real-time inference for tasks such as picking, placing, and obstacle avoidance.  

### End-to-End Imitation Learning Workflow

- The diagram below shows the full imitation learning workflow using the OMY product and Hugging Face.  

<img src="/assets/images/platform/omy/end_to_end_imitation_learning_workflow.png" width="700"/>

**Dataset Schema**

The dataset follows the standard [🤗 Hugging Face datasets format](https://huggingface.co/docs/datasets/index) and contains imitation learning demonstrations collected from the AI Worker via ROS 2 teleoperation using the [lerobot](https://github.com/huggingface/lerobot) framework.  

| Field              | Type            | Description          |
|--------------------|-----------------|----------------------|
| `action`           | `List[float32]` | Leader state vector  |
| `observation.state`| `List[float32]` | Follower state vector |
| `observation.images.cam_head`        | `Image`   | RGB image from the head-mounted camera |
| `timestamp`                          | `float32` | Time (in seconds) when the step was recorded |
| `frame_index`                        | `int64`   | Index of the frame within an episode |
| `episode_index`                      | `int64`   | Index of the episode |
| `index`                              | `int64`   | Global index across the dataset |
| `task_index`                         | `int64`   | Task identifier |

