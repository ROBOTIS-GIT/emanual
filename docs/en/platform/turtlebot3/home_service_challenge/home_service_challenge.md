---
layout: archive
lang: en
ref: autonomous_driving
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/home_service_challenge/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 25
---
<!-- 
<div style="counter-reset: h1 13"></div>
<div style="counter-reset: h2 8"></div> -->

## [TurtleBot3 Home Service Challenge](#turtlebot3-home-service-challenge)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- For more informationn, see [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/)
- Be sure to read [[ROS 1] Turtlebot3 Manipulation](/docs/en/platform/turtlebot3/manipulation).
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>  

![](/assets/images/platform/turtlebot3/home_service_challenge/temp/hsc_logo.png)   

Join the **Home Service Challenge** to   

### [대회설명](#대회설명)
Home Service Challenge는 ROS에서 운용가능한 모바일·매니퓰레이터 플랫폼을 활용하여 자율주행
및 사물을 이동시키는 코드를 작성하고 미션을 해결하는 종목이다.  
![](/assets/images/platform/turtlebot3/home_service_challenge/hsc_stadium_2.png)  

### [필요물품 (Requirements)](#requirements)
`TurtleBot3 Waffle Pi`  
- It is the basic model to use Home Service Challenge packages for mobile manipulation.
- Provided source codes, Home Service Challenge Packages, are made based on TurtleBot3 Waffle Pi.

`OpenMANIPULATOR-X`
- mobile manipulation을 위해 Home Service Challenge에서 사용하는 manipulator 

`Remote PC`  
- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

`Home Service Challenge 경기장 and objects`  
- 아래에서 경기장 규격 및 규칙에 대해 확인 할 수 있다.  
  ![view of hsc stadium](/assets/images/platform/turtlebot3/home_service_challenge/temp/hsc_stadium.png)   

### [Software Setup](#software-setup)
(Manipulation 파트와 유사)  

**NOTE**: Before you install `turtlebot3_home_service_challenge` packages, please make sure [`turtlebot3`](/docs/en/platform/turtlebot3/pc_setup) and [`open_manipulator`](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages) and packages have been installed previously in RemotePC and setup [Raspberry Pi](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#raspberry-pi-3-setup).
{: .notice--info}
> Reference :[turtlebot3_manipulation](/docs/en/platform/turtlebot3/manipulation)

#### [Remote PC Setup](#remote-pc-setup)  
- Install packages for Home Service Challenge
  **[Remote PC]**
  ```bash
  $ cd ~/catkin_ws/src/
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3_home_service_challenge.git
  $ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
  $ cd ~/catkin_ws && catkin_make
  ```
- If `catkin_make` command is completed without any errors, the preparation for Home Service Challenge is done. Then load a TurtleBot3 Waffle or Waffle Pi with OpenMANIPULATOR on RViz.

  **TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
  {: .notice--success}

  **[RemotePC]**
  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch turtlebot3_manipulation_description turtlebot3_manipulation_view.launch use_gui:=true
  ```

  ![turtlebot3_manipulation_view](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)

- remote 실행을 위한 네트워크 세팅 (ssh key 생성)  
  - key 생성을 위한 script 제작  
    **[RemotePC]**
    ```
    $ nano ~/tb3_ssh_keygen
    ```
    아래 내용을 추가 후 저장
    ```bash
    #!/bin/bash
    argc=$#
    args=("$@")

    if [ 0 -eq $argc ]
    then        
      echo "need to argument that host ip for ssh connection"
      echo "Usage: $0 [ip address] ..."
      exit 1
    fi

    for((index = 0; index < $#; index++ ))
    do
      ssh-keygen -R ${args[$index]}
      ssh-keyscan ${args[$index]} >> ~/.ssh/known_hosts
    done
    ```
  - 실행권한 추가
    ```
    $ chmod +x ~/tb3_ssh_keygen
    ```
  - script 실행(Turtlebot3의 IP 주소가 192.168.1.10인 경우) 

    **NOTE**: `Turtlebot3`와 `Remote PC`를 같은 네트워크에 연결하고 `Turtlebot3`의 IP 주소를 확인 한 후 다음 작업을 수행한다.
    {: .notice--info}  
    ```
    $ ~/tb3_ssh_keygen 192.168.1.10
    ```
    실행 시 `~/.ssh/known_hosts` 파일에 turtlebot3에 연결하기 위한 ssh가 생성된다.


#### [SBC Setup](#sbc-setup)
- machine 태그를 이용한 원격 실행을 위해 `env.bash` 파일 생성(위치 : /home/pi)

  **[Turtlebot3 SBC]**
  ```
  $ nano ~/env.bash
  ```
- 다음 내용을 추가 후 저장  
  **[Turtlebot3 SBC]**
  ```bash
  #!/bin/bash
  
  # check if other turtlebot3_core is already running
  is_running=`ps ax | grep turtlebot3_core`
  IFS=' ' read -ra is_runnings <<< "$is_running"
  process_name=${is_runnings[4]}
  if [ ${process_name} == "python" ]
  then
    echo "other turtlebot3_core is already running."
    exit 1
  fi
  
  #### ROS ####
  source /opt/ros/kinetic/setup.bash
  source ~/catkin_ws/devel/setup.bash
  
  #### ROS Network ####
  ip_address=`hostname -I`
  ip_address_trim=${ip_address%% * }
  ip_address_no_space="$(echo -e "${ip_address_trim}" | tr -d '[:space:]')"
  export ROS_HOSTNAME=${ip_address_no_space}
  
  ##### Set TURTLEBOT3 Model ####
  export TURTLEBOT3_MODEL=waffle_pi
  
  exec "$@"
  ```
- 실행권한 추가  
  ```
  $ chmod +x ~/env.bash
  ```


### [Hardware Setup](#hardware-setup)
(Manipulation 파트와 동일)  
- [CAD files](http://www.robotis.com/service/download.php?no=767) (TurtleBot3 Waffle Pi + OpenMANIPULATOR)

![](/assets/images/platform/turtlebot3/manipulation/hardware_setup.png)

- First, detach lidar sensor and shift it front of TurtleBot3 (Red circle represents position of bolts).
- Second, attach OpenMANIPULATOR on the TurtleBot3 (Yellow circle represents position of bolts).

![](/assets/images/platform/turtlebot3/manipulation/assemble_points.png)

![](/assets/images/platform/turtlebot3/manipulation/assemble.png)

### [OpenCR Setup](#opencr-setup)  
(Manipulation 파트와 동일)  
  
{% capture notice_01 %}
**NOTE**: You can choose one of methods for uploading firmware. But we highly recommend to use **shell script**. If you need to modify TurtleBot3's firmware, you can use the second method.
- Method #1: [**Shell Script**](#shell-script), upload the pre-built binary file using the shell script.
- Method #2: [**Arduino IDE**](#arduino-ide), build the provided source code and upload the generated binary file using the Arduino IDE.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING** : **MAKE SURE THAT ALL DYNAMIXEL IS CONNECTED TO OpenCR**, before proceeding to OpenCR Setup. Otherwise, the raspberry pi board may have **an unexpected issue**. 
{: .notice--warning}


#### [Shell Script](#shell-script)
**[TurtleBot3]**
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
```

When firmware upload is completed, `jump_to_fw` text string will be printed on the terminal.

#### [Arduino IDE](#arduino-ide)
**[Remote PC]**
- Before you following step, please setup Arduino IDE.

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

- OpenCR firmware (or the source) for TurtleBot3 with OpenMANIPULATOR is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.

- Go to `File` → `Examples` → `TurtleBot3` → `turtlebot3_with_open_manipulator` → `turtlebot3_with_open_manipulator_core`.

![](/assets/images/platform/turtlebot3/manipulation/upload_core.png)

- Click `Upload` button to upload the firmware to OpenCR.

![](/assets/images/platform/turtlebot3/manipulation/upload_core_1.png)

**NOTE**: If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR and try to upload the firmware again.
{: .notice--info}

**TIP**: The DYNAMIXEL ids can be changed in [`open_manipulator_driver.h`][manipulator_id] in turtlebot3_with_open_manipulator folder 
{: .notice--success}

- When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.
  

### [Camera Calibration](#camera-calibration)  
#### [Camera Setting](#camera-setting)

1. 원격으로 카메라 실행  

   **NOTE**: `Turtlebot3`와 `Remote PC`를 같은 네트워크에 연결하고 `Turtlebot3`의 IP 주소를 확인 한 후 `TURTLEBOT_IP`부분에 넣는다.
   {: .notice--info} 

   **[Remote PC]**
   ``` bash
   $ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_pi_cam_remote.launch address:=TURTLEBOT_IP
   ```
2. Execute rqt_image_view on `Remote PC`.  
   **[Remote PC]**
   ``` bash
   $ rqt_image_view
   ```

3. Select **/raspicam_node/image/compressed** (or **/raspicam_node/image/**) topic on the check box.

    ![camera view](/assets/images/platform/turtlebot3/home_service_challenge/camera_setting_01.png)

4. Excute rqt_reconfigure on `Remote PC`.
   **[Remote PC]**
   ``` bash
   $ rosrun rqt_reconfigure rqt_reconfigure
   ```

5. Click **raspicam_node**, and modify parameter value in order to see clear images from the camera. 

    ![camera setting](/assets/images/platform/turtlebot3/home_service_challenge/camera_setting_02.png)

6. Open **camera.yaml** file located in `turtlebot3_home_service_challenge_tools/config/camera_calibration` folder.

7. Write modified values to the file.
   
   ```
   ISO: 400
   awb_mode: auto
   brightness: 50
   contrast: 0
   exposureCompensation: 0
   exposure_mode: auto
   hFlip: false
   saturation: 0
   sharpness: 0
   shutterSpeed: 0
   vFlip: false
   videoStabilisation: false
   zoom: 1.0
   ```

#### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

Print a checkerboard on A4 size paper. The checkerboard is used for Intrinsic Camera Calibration.
- checkboard는 다음 링크에서 다운이 가능합니다 : [**ROS Wiki**](http://wiki.ros.org/camera_calibration/Tutorials/StereoCalibration?action=AttachFile&do=view&target=check-108.pdf)
- For detailed information on the camera calibration, see [Camera Calibration manual](http://wiki.ros.org/camera_calibration) from ROS Wiki.

  ![checkerboard](/assets/images/platform/turtlebot3/autonomous_driving/autorace_checkerboard.png)
  > Checkerboard

1. `Remote PC`에서 원격으로 카메라 실행 

   **NOTE**: `Turtlebot3`와 `Remote PC`를 같은 네트워크에 연결하고 `Turtlebot3`의 IP 주소를 확인 한 후 `TURTLEBOT_IP`부분에 넣는다.
   {: .notice--info} 

   **[Remote PC]**
   ``` bash
   $ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_pi_cam_remote.launch enable_raw:=true address:=TURTLEBOT_IP
   ```

2. Run a intrinsic camera calibration on `Remote PC`.  
   **[Remote PC]**
   ``` bash
   $ rosrun camera_calibration cameracalibrator.py --size 8x6 --square 0.024 image:=/raspicam_node/image camera:=/raspicam_node
   ```
   ![calibration display](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_01.png)  

   **NOTE**: 출력한 checkerboard의 검은 사각형의 사이즈가 다른 경우 `0.024`부분을 수정하여 실행한다.
   {: .notice--info}

3. `X`, `Y`, `Size`, `Skew` 아래의 막대를 녹색으로 바꾸기 위해 checkerboard를 상하/좌우/앞뒤로 움직이고 시계/반시계 방향으로 뒤틀어 준다.

4. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.   

    ![calibraion](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_02.png)

5. Click **Commit** to save the intrinsic calibration data to the default folder.(~/.ros/camera_info)  

    ![commit](/assets/images/platform/turtlebot3/home_service_challenge/camera_calibration_04.png)

6. `Turtlebot SBC`의 `~/.ros/camera_info`폴더에 가서 `camerav2_1280x720.yaml`파일을 열어 데이터를 확인하면 아래와 유사한 데이터가 나온다.(카메라마다 값은 다름)
   ```
   image_width: 1280
   image_height: 720
   camera_name: camerav2_1280x720
     camera_matrix:
     rows: 3
     cols: 3
     data: [1280.628466572832, 0, 658.384219880362, 0, 1277.989132765768, 360.8363923435625, 0, 0, 1]
   distortion_model: plumb_bob
   distortion_coefficients:
     rows: 1
     cols: 5
     data: [0.2032697817127332, -0.4147569733010375, -0.001420915782245743, 0.003110652248245379, 0]
   rectification_matrix:
     rows: 3
     cols: 3
     data: [1, 0, 0, 0, 1, 0, 0, 0, 1]
   projection_matrix:
     rows: 3
     cols: 4
     data: [1312.630981445312, 0, 661.4149459665205, 0, 0, 1312.107055664062, 360.0239481801327, 0, 0, 0, 1, 0]
   ```

### [SLAM](#slam)    
- turtlebot3 원격 구동  

   **NOTE**: `Turtlebot3`와 `Remote PC`를 같은 네트워크에 연결하고 `Turtlebot3`의 IP 주소를 확인 한 후 `TURTLEBOT_IP`부분에 넣는다.
   {: .notice--info} 

   [Remote PC]  
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_robot_remote.launch  address:=TURTLEBOT_IP
   ```

- slam node 구동    
   [Remote PC]  
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_tools slam.launch
   ```

- teleop node 구동  
   [Remote PC]  
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_tools mobile_teleop_key.launch
   ```

- 지도 작성   
   ![making_map](/assets/images/platform/turtlebot3/home_service_challenge/slam_02.png)

- 지도 저장  
   [Remote PC]  
   ```bash
   $ ROS_NAMESPACE=tb3_hsc rosrun map_server map_saver -f tb3_hsc
   ```
   ![map](/assets/images/platform/turtlebot3/home_service_challenge/map.png)

### [Home Service Challenge 미션](#home-service-challenge-mission)
#### How to run  
- home service challenge demo 구동  

   **NOTE**: `Turtlebot3`와 `Remote PC`를 같은 네트워크에 연결하고 `Turtlebot3`의 IP 주소를 확인 한 후 `TURTLEBOT_IP`부분에 넣는다.
   {: .notice--info} 

   [Remote PC]
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_remote.launch address:=TURTLEBOT_IP
   ```
   ![demo_01](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_01.png)
   > 포함된 항목  
   - turtlebot3 원격 구동  
   - moveit  
   - navigation  
   - camera sensing   


- home_service_challenge_manager  
   미션 수행을 위한 manager 실행  
   [Remote PC] 
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_manager manager.launch
   ```
      

#### [How to operate](#how-to-operate)
- 제어 명령어    
  - 미션  
    - 준비  
       [Remote PC]  
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String ready_mission
       ```  
    - 시작  
       [Remote PC]  
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String start_mission
       ```  
    - 재시작  

       **NOTE**: `SCENARIO_NAME`부분에 `scenario.yaml`에 있는 scenario 이름 중 하나를 적는다.
       {: .notice--info} 

       [Remote PC]  
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String restart_mission:SCENARIO_NAME
       ```  
    - 정지  
       [Remote PC]  
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String stop_mission
       ```  
      

  - 동작 테스트  
    - navigation  
       [Remote PC]  
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_start
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_0
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_1
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String nav_ar_marker_2
       ...
       ```
    - manipulation  
       [Remote PC]
       ```bash
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_home
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_joint
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String arm_task
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String open_gripper
       $ rostopic pub -1 /tb3_hsc/command std_msgs/String close_gripper
      ```

- 설정  
  - scenario
    - 위치 : `/turtlebot3_home_service_challenge_manager/script/scenario.yaml` 
    - 내용  
      ```yaml
      SCENARIO_NAME :  # start - scenario - finish
        task : TASK_NAME
        args : [0, 1, 2]
        timeout : 10 #sec, 0 : no time out
        next_scenario : find_object
        scenario_on_failure : standby
        retry_times : 0  #times, 0 : no retry
      ``` 
  - 경기장 설정
    - 위치 : `/turtlebot3_home_service_challenge_manager/config/room.yaml`  
    - 내용 
       ```yaml
       room_1 :
         name : toilet
         object :
           marker : ar_marker_0
           position : [0.25, 0, 0.15]
         target :
           marker : ar_marker_4
           position : [0.25, 0, 0.15]
         x : [1.5, 0.6]
         y : [1.5, 0.2]
       ```
  - manager 설정
    - 위치 : `/turtlebot3_home_service_challenge_manager/config/config.yaml`  

#### Mission details  
Home Service Challenge의 내용은 거실에 놓여있는 4개의 물체를 규칙에 정해진 대로 방에 옮겨 놓고 시작위치로 돌아오는 것이다.  
demo에서 제공하는 각각의 물체를 옮기는 방법은 아래와 같다.  
- nav to object  
  목표물을 찾고 navigation 패키지를 이용하여 목표물 접근  
  ![demo_02](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_02.png)  
- approach  
  정밀한 접근을 위해 marker로 인식한 좌표로 바퀴 직접 제어(topic : `/tb3_hsc/cmd_vel`)  
  사용자가 지정한 횟수로 close loop control  
  ![demo_03](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_03.png)  
- pick    
  ![manipulation_diagram](/assets/images/platform/turtlebot3/home_service_challenge/manipulation_diagram.png)  
  moveit을 이용해 manipulator 제어  
  - joint space control  
  - task space control  
  - gripper control  
  ![demo_04](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_04.png)  
- leave and turn to the room   
  바퀴를 직접 제어하여 일정 거리 후진 후 다음 목적지 방향으로 회전(topic : `/tb3_hsc/cmd_vel`)  
- nav to target    
  navigation 패키지를 이용하여 다음 목적지로 이동  
  ![demo_05](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_05.png)
- approach  
- place  
- leave and tur to the start position  
- nav to start position  
  ![demo_06](/assets/images/platform/turtlebot3/home_service_challenge/home_service_challenge_demo_06.png)

### [Simulation](#simulation)
1. simulation(gazebo) 실행  
   [Remote PC] 
   ```
   $ roslaunch turtlebot3_home_service_challenge_simulation competition.launch
   ```
   ![gazebo](/assets/images/platform/turtlebot3/home_service_challenge/simulation_00.png)  

2. simulation용 home service challenge demo 실행  
   [Remote PC] 
   ```
   $ roslaunch turtlebot3_home_service_challenge_tools turtlebot3_home_service_challenge_demo_simulation.launch
   ```
   ![simulation_rviz](/assets/images/platform/turtlebot3/home_service_challenge/simulation_rviz_01.png)  

3. home_service_challenge_manager  
   미션 수행을 위한 manager 실행  
   [Remote PC] 
   ```bash
   $ roslaunch turtlebot3_home_service_challenge_manager manager.launch
   ```
4. 제어 명령어 입력
