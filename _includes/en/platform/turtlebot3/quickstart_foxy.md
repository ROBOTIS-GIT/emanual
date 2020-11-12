
# Quick Start Guide

TURTLEBOT3 + ROS1 NOETIC QUICK START GUIDE COURSE에 오신것을 환영합니다!

이 코스를 완주하면 여러분들은 ROS1 Noetic을 이용해 GAZEBO Simulation 에서 turtlebot3 를 네비게이션을 구동할 수 있게 되실 겁니다.

<iframe width="560" height="315" src="https://www.youtube.com/embed/eKnzd3ykDGA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> Quick Start Video for Noetic

**참고**: 영상을 보면서 발생하는 에러 및 궁금한 점은 [FAQ & Troubleshooting]() 항목으로 이동해 주세요.  
또한 더 자세한 내용은 아래 Reference 링크들을 참고해주세요.
{: .notice}

**Table of Video Contents**

- [0:00 ~ 0:29] OS / ROS / GAZEBO version 소개 및 e-manual 소개
- [0:29 ~ 1:33] 의존성 패키지 설치 및 빌드 (turtlebot3 패키지 포함)
- [1:33 ~ 2:08] GAZEBO 실행 및 키보드 teleoperation 구동
- [2:08 ~ 3:17] SLAM 실행 & map 저장
- [3:17 ~ 4:18] Navigation 실행

**Reference**

- [H/W, S/W Setup]()
- [Simulation]()
- [SLAM]()
- [Navigation]()

{::options parse_block_html="true" /}

## Q & A

<details>
<summary id="summary_for_foreins" style="outline: inherit;"> 
### Terminal 창 실행 방법
</summary>
터미널 창은 Ubuntu 화면 왼쪽 상단 모서리에 있는 Ubuntu 검색 아이콘으로 찾을 수 있습니다. 또는, Ctrl-Alt-T 를 눌러 터미널 단축키로 실행시킬 수 있습니다.
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;"> 
### 터미널 자동완성 명령어 안내
</summary>
터미널 창에서 Tab 키를 누르면 명령어를 보다 빠르게 입력할 수 있습니다.
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;"> 
### 터미널 복사, 붙여넣기 명령어 안내
</summary>

  - e-Manual에 나와있는 명령어를 아래 단축키를 통해 터미널에 쉽게 입력할 수 있습니다.
- 복사하기 : Shift + Ctrl + C.
- 붙여넣기 : Shift + Ctrl + V.
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;"> 
### ROS Noetic이 아닌 다른 버전을 사용하고 싶습니다.
</summary>
공식적으로 추천하는 버전은 세 버전 Kinetic / Melodic / Noetic 입니다. ROS 1의 다른 버전은 아래 링크를 확인해 주세요.
로보티즈에선 각 버전별로의 ROS 한줄설치를 제공하고 있습니다
제공하는 버전은 https://github.com/ROBOTIS-GIT/robotis_tools 링크를 확인해주세요.

- ROS Kinetic 한줄설치

  ```bash
  $ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
  ```

- ROS Melodic 한줄설치

  ```bash
  $ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic.sh && chmod 755 ./install_ros_melodic.sh && bash ./install_ros_melodic.sh
  ```

- ROS Noetic 한줄설치

  ```bash
  $ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh && chmod 755 ./install_ros_noetic.sh && bash ./install_ros_noetic.sh
  ```

그 밖의 ROS 설치에 대한 자세한 정보는 아래 링크를 참고해주세요.
https://wiki.ros.org/ROS/Installation

</details>

<!-- 

### ROS 1 버전에 따른 Gazebo 설치 버전 안내.

    사용하는 ROS 1의 버전에 따라 설치해야하는 Gazebo 버전이 다릅니다.

ROS Kinetic : Gazebo 7
ROS Melodic : Gazebo 9
ROS Noetic : Gazebo 11

사용하고사하는 ROS 1의 버전에 맞춰 맞는 Gazebo버전을 설치해주세요.

6. Gazebo Simulation 이 아닌 실제 TurtleBot3 로 구동하고싶습니다.
   실기로 구동을 하시려면, SBC인 Raspberry Pi 3와 OpenCR, TurtleBot3 하드웨어 조립을 해주셔야 합니다.
   SBC 세팅은 6.2 SBC Set up 링크로 들어가 확인해 주세요. 이미지는 ROBOTIS에서 배포하는 raspbian 이미지 사용을 권장드립니다.
   OpenCR 세팅은 6.3 OpenCR Setup 항목을 참고해주세요. 기본적으로 Terminal 창에서 shell script로 업로드하시는걸 권장 드립니다.
   세팅을 완료하시면 7. Bring up 단계부터 진행해주세요.

7. .bashrc 파일 단축키 설정안내
   로보티즈에서 제공한 한줄설치로 설치하면 기본적으로 단축키가 세팅되어있습니다.
   터미널 창을 열어서(Ctrl-Alt-T) nano ~/.bashrc 로 명령어를 입력하면 .bashrc 파일을 수정할 수 있습니다.
   .bashrc 파일에 alias 설정을 통해 명령어를 간단하게 설정해준 후, source ~/.bashrc 명령어를 입력해 수정된 내용을 적용해 줍니다.  
   아래 예시는 주로 사용되는 단축 명령어입니다.

alias eb='nano ~/.bashrc'
alias sb='source ~/.bashrc'
alias cw='cd ~/$name_catkin_workspace'
alias cs='cd ~/$name_catkin_workspace/src'
alias cm='cd ~/$name_catkin_workspace && catkin_make'
source /opt/ros/$name_ros_version/setup.bash
source ~/\$name_catkin_workspace/devel/setup.bash

8.  GAZEBO Simulation을 TB3 burger 가 아닌 waffle로 하고싶습니다.
    TURTLEBOT3_MODEL을 burger 가 아닌 waffle 로 export 해주세요.
    \${TB3_MODEL} 은 burger, waffle, waffle_pi 중 원하시는 모델로 지정해 터미널 창에서 아래 명령어로 입력해주시면 됩니다.

$ export TURTLEBOT3_MODL=${TB3_MODEL}

자세한 내용은 Export TURTLEBOT3_MODEL 링크를 확인해 주세요

9. 처음 TurtleBot3패키지를 빌드할 때 다운받을 수 없다고 에러가 뜹니다.
   \$source /opt/ros/noetic/setup.bash 명령어를 터미널창에 입력해주세요.
   또한 위 명령어를 .bashrc 파일에 추가해 주세요. 추가해주지 않는 이상 매번 새로 터미널창을 실행할 때 마다 ros 명령어들을 사용하기 위해 입력해주어야 합니다.

10. 저장한 지도를 못찾겠어요
    -f 옵션은 맵 파일이 저장된 폴더 및 파일 이름을 나타냅니다. ~/map을 옵션으로 사용하면 map.pgm파일과 map.yaml 파일이 사용자의 홈 폴더 ~ / (\$ HOME 디렉토리 : / home / <username>)의 map 폴더에 저장됩니다.

더 자세한 내용은 9.4 Save Map 링크를 참고해 주세요

 -->
