---
layout: archive
lang: jp
ref: dynamixelworkbench
read_time: true
share: true
author_profile: false
permalink: /docs/jp/software/dynamixel/dynamixel_workbench/
sidebar:
  title: DYNAMIXEL Workbench
  nav: "dynamixel_workbench"
---

# [イントロダクション](#introduction)

![](/assets/images/sw/dynamixel/dynamixel_workbench/DYNAMIXEL_WORKBENCH_LOGO.png)

DYNAMIXEL Workbenchの目的は、**任意のDYNAMIXELをよりシンプルに、そして使いやすくすること** です。このライブラリは[DYNAMIXEL SDK]をベースとしており、ROS、Linux、macOS、Arduinoをサポートしています。しかし、このライブラリはどんなセットアップでもDYNAMIXELを操作できるマジックスティックではありません。DYNAMIXEL SDKと比較するといくらかの制限がありますが、DYNAMIXELを愛用してくださる皆さんのために今後もライブラリをアップデートしていきます。  

質問や問題があれば、[github issue](https://github.com/ROBOTIS-GIT/dynamixel-workbench/issues)でチケットを入手してください。  

**注意** : DYNAMIXEL Workbenchは、ROSでDYNAMIXELを制御するために設計されていますが、機能が制限されています。DYNAMIXELの設定やテストには、[DYNAMIXEL Wizard 2.0]または[DYNAMIXEL SDK]をご利用ください。  
{: .notice--warning}

# [サポートしているDYNAMIXEL](#supported-dynamixel)

| DYNAMIXEL シリーズ |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **EX**           | [EX-106+]                      |                                |                                |                                |                 |
| **RX**           | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL430-W250]                   | [2XL430-W250]                  |                                |                 |
| **XC**           | [XC430-W150]                   | [XC430-W240]                   |                                |                                |                 |
| **XM**           | [XM430-W210]                   | [XM430-W350]                   | [XM540-W150]                   | [XM540-W270]                   |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO L**        | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PM**           | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |
| **PH**           | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-200-S500-R]              |                                |                 |

**DYNAMIXEL Workbench** メタパッケージには、**Controllers**、**Operators** そして **Toolbox** の3つパッケージが含まれています。**Controllers** パッケージは、DYNAMIXEL Workbenchライブラリ（Toolbox）を使って、異なる動作モードでDYNAMIXELを使用する方法を紹介します。また、Operatorsでは、コントローラを操作することによっていくつかの簡単な例を紹介します。  

- [ROS WIKI](http://wiki.ros.org/dynamixel_workbench)

# [ダウンロード](#downloads)

## [ROS](#ros)

### PCにROSをインストール

![](/assets/images/platform/turtlebot3/logo_ros.png)

以下のスクリプトを使用すると、ROSのインストール手順を簡略化することができます。ターミナルウィンドウで以下のコマンドを実行します。ターミナルアプリは、画面左上のUbuntu検索アイコンから見つけることができます。もしくは、ショートカットキーである`Ctrl`+`Alt`+`T`を使うことでも見つけられます。ROSをインストールした後は、PCを再起動してください。  

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**注釈**: どのパッケージがインストールされているかを確認するには、このリンクを確認してください。
[install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

手動インストールをご希望の場合は、以下のリンクをクリックしてください。  

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

### ROSパッケージをダウンロード

**主なパッケージ**

``` bash
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
```

**依存パッケージ**

``` bash
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
```

## [OpenCRとOpenCM](#opencr-and-opencm)

### Arduino IDEのダウンロード

- OpenCRとOpenCMにファームウェアをアップロードするための [Arduino IDE](http://emanual.robotis.com/docs/en/software/arduino_ide/) をダウンロードします。  

#### OpenCR Arduino IDE

![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_arduino_setup.png)

OpenCR1.0用の例をArduinoで使用するためには、OpenCR1.0ボードをArduino IDEにポーティングする必要があります。  

- [OpenCR1.0ボードをArduino IDEにポーティングする](/docs/en/parts/controller/opencr10/#porting-to-arduino-idelinux)

#### OpenCM Arduino IDE

![](/assets/images/sw/dynamixel/dynamixel_workbench/opencm_arduino_setup.png)

OpenCM9.04用の例をArduinoで使用するためには、OpenCM9.04ボードをArduino IDEにポーティングする必要があります。  

- [OpenCM9.04ボードをArduino IDEにポーティングする](docs/en/parts/controller/opencm904/#porting-the-opencm904-board-to-the-arduino-ide)

## [Linux and macOS](#linux-and-macos)
**注釈**: `Windows OS`向けにリリースする予定はありません。しかし、Windows環境に関するコントリビューションは喜んでマージします。  
{: .notice--info}

### ダウンロードライブラリ

``` bash
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
```
### DYNAMIXEL SDKライブラリのセットアップ

- [Linux](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_linux/#cpp-linux)  
- [macOS](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_macos/#cpp-macos)  

### DYNAMIXEL Workbenchライブラリのセットアップ

``` bash
$ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples
$ mkdir -p build && cd build
$ cmake ..
$ make
```

# [デバイスのセットアップ](#device-setup)
**警告**: ライブラリを使用する前に、デバイスの設定を **繰り返し** 確認してください。  
**電源入力** と **USBポート** をもう一度確認してください。  
{: .notice--warning}

## [U2D2](#u2d2)

### セットアップ方法

[セットアップ方法](/docs/en/parts/interface/u2d2/)

### ルールファイルのコピー

```
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/dynamixel-workbench/master/99-dynamixel-workbench-cdc.rules
$ sudo cp ./99-dynamixel-workbench-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

### USBポートの確認

```
$ ls /dev/tty*
```

そうすると、`/dev/ttyUSB0`が見つかります。（ポートの番号は設定によって異なる場合があります）


{% capture notice_01 %}
**注釈**:
- rosrunはroscoreなしでは動作できないため、rosrunの前にroscoreを実行してください。その際にrosrunとroscoreは別々のターミナルウィンドウで実行してください。
- この実行ファイルでは、USBレイテンシタイマを **1 ms** に設定しています。この設定を確認したい場合は、ターミナルウィンドウで以下のコマンドを実行してください。  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [OpenCR](#opencr)

### 電源(12V)とTTLまたはRS485の接続

![](/assets/images/parts/controller/opencr10/opencr_pinout.png)

**ヒント**:  
OpenCRをU2D2として使用したい場合は、`usb_to_dxl`ファームウェアをアップロードしてください。(`File` -> `Examples` -> `OpenCR` -> `10.Etc` -> `usb_to_dxl`)
そうすると、`/dev/ttyACM0`ポートを使用することができます。（ポート番号は設定によって異なる場合があります）
{: .notice--success}

## [OpenCM](#opencm)

### 電源(12V)とTTL(4ピン)またはRS485(8ピン)の接続  

**ヒント**: ピンについての詳細な情報については、[リンク](/docs/en/parts/controller/opencm485exp/)を参照してください。
{: .notice--success}

![](/assets/images/parts/controller/opencm904/opencm485exp_01.jpg)

# [チュートリアル](#tutorials)

- [ROS](/docs/en/software/dynamixel/dynamixel_workbench/#ros-tutorials)
    - [Find Dynamixels](/docs/en/software/dynamixel/dynamixel_workbench/#find-dynamixels)
    - [Controllers](/docs/en/software/dynamixel/dynamixel_workbench/#controllers)
    - [Operators](/docs/en/software/dynamixel/dynamixel_workbench/#operators)

    - [OpenCR and OpenCM](/docs/en/software/dynamixel/dynamixel_workbench/#opencr-and-opencm-tutorials)
    - [o_Find_Dynamixel](/docs/en/software/dynamixel/dynamixel_workbench/#o_find_dynamixel)
    - [p_Monitor](/docs/en/software/dynamixel/dynamixel_workbench/#p_monitor)

- [Linux and macOS](/docs/en/software/dynamixel/dynamixel_workbench/#linux-and-macos)
    - [Examples](/docs/en/software/dynamixel/dynamixel_workbench/#examples)
    - [position](/docs/en/software/dynamixel/dynamixel_workbench/#position)
    - [bulk_read_write](/docs/en/software/dynamixel/dynamixel_workbench/#bulk_read_write)

## [ROSチュートリアル](#ros-tutorials)

### [Find Dynamixels](#find-dynamixels)

このノードは全てのIDをそれぞれのBaudrate(9600, 57600, 115200, 1000000, 2000000, 3000000, 4000000)ごとにスキャンし、接続しているDynamixelの数を表示します。

find_dynamixelの実行

```
$ rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0
```

すると、以下のようなテキストが表示されます。

```
[ INFO] [1544589715.841211668]: Succeed to init(9600)
[ INFO] [1544589715.841236741]: Wait for scanning...
[ INFO] [1544589737.539083688]: Find 0 Dynamixels
[ INFO] [1544589737.539526809]: Succeed to init(57600)
[ INFO] [1544589737.539570059]: Wait for scanning...
[ INFO] [1544589755.441019922]: Find 2 Dynamixels
[ INFO] [1544589755.441086482]: id : 1, model name : XM430-W350
[ INFO] [1544589755.441109032]: id : 2, model name : XM430-W350
[ INFO] [1544589755.441504892]: Succeed to init(115200)
[ INFO] [1544589755.441548969]: Wait for scanning...
[ INFO] [1544589773.031677244]: Find 0 Dynamixels
[ INFO] [1544589773.032153380]: Succeed to init(1000000)
[ INFO] [1544589773.032178580]: Wait for scanning...
[ INFO] [1544589790.291943770]: Find 0 Dynamixels
[ INFO] [1544589790.292404604]: Succeed to init(2000000)
[ INFO] [1544589790.292418207]: Wait for scanning...
[ INFO] [1544589807.530702991]: Find 0 Dynamixels
[ INFO] [1544589807.531286252]: Succeed to init(3000000)
[ INFO] [1544589807.531331656]: Wait for scanning...
[ INFO] [1544589824.762803705]: Find 0 Dynamixels
[ INFO] [1544589824.763461821]: Succeed to init(4000000)
[ INFO] [1544589824.763506935]: Wait for scanning...
[ INFO] [1544589841.990120553]: Find 0 Dynamixels
```

**ヒント**: DYNAMIXELが見つからない場合は、USBポート、電源を確認してください。たとえ見つからない場合でも、ROBOTISソフトウェア([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/)もしくは[R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))を使用してファームウェアを確認してください。
{: .notice--success}

### [Controllers](#controllers)

本パッケージは、ROS APIを用いてDYNAMIXELを制御するためのパッケージです。yamlファイルを作成するだけで、DYNAMIXELを読み込むことができます。  

yamlファイルの設定は以下の通りです。`name`は、/joint_statesトピックのジョイント名とDYNAMIXELを識別するために使用します。  
コントローラが初期化されると、ファイルからDYNAMIXELの情報が読み込まれ、`id`を基にしたそれぞれの`Control_Table_Item`と`value`を共に各DYNAMIXELに設定します。

```
[name]:
  ID: [id]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  .
  .
  .
[name]:
  ID: [id]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  [Control_Table_Item]: [value]
  .
  .
  .
```

`joint_2_0.yaml`ファイルを見てみましょう。このファイルは2つのDYNAMIXELの設定を示しています。最初のDYNAMIXELは'pan'という名前でIDは'1'で、2番目のDYNAMIXELは'tilt'という名前でIDは'2'です。両方のDYNAMIXELは、  [Return_Delay_time](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#return-delay-time9)をゼロ(0)に [Operating_Mode](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#operating-mode11)位置制御モード(3)に設定します。

```
pan:
  ID: 1
  Return_Delay_Time: 0
  Operating_Mode: 3
  Profile_Acceleration: 0
  Profile_Velocity: 0
tilt:
  ID: 2
  Return_Delay_Time: 0
  Operating_Mode: 3
  Profile_Acceleration: 0
  Profile_Velocity: 0
```
{% capture notice_02 %}
**警告**:  パッケージを正しく使用するために、以下のものを必ず保管してください。  
-DYNAMIXELの[コントロールテーブル](/docs/en/faq/faq_dynamixel/)のデータである`Torque Enable`は、ユーザーが設定することは想定していませんが、初期化時に有効にしています。  
- コントロールテーブルの項目は、[Camel_Case](https://en.wikipedia.org/wiki/Camel_case)に従って空白無しで設定する必要があります。  
- 本パッケージを使用する前に、DYNAMIXELのIDを必ず設定してください。  
- 2XL430-W250は、本パッケージ(**Controllers**)には対応していません。本パッケージを2XL430-W250で使用すると、2XL430-W250の2つの軸から検出されたIDのうち、Torque Enable(64)の片方が自動的に'1'(トルクオン)に設定されます。  
この場合、もう一方の車軸のEEPROM非アクティブ化され、パッケージはEEPROMフィールドにアクセスできず、パッケージを使う際に接続エラーを引き起こします。  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

`dynamixel_controller.launch`ファイルを見てください。

```
<launch>
  <arg name="usb_port"                default="/dev/ttyUSB0"/>
  <arg name="dxl_baud_rate"           default="57600"/>
  <arg name="namespace"               default="dynamixel_workbench"/>

  <arg name="use_moveit"              default="false"/>
  <arg name="use_joint_state"         default="true"/>
  <arg name="use_cmd_vel"             default="false"/>

  <param name="dynamixel_info"          value="$(find dynamixel_workbench_controllers)/config/basic.yaml"/>

  <node name="$(arg namespace)" pkg="dynamixel_workbench_controllers" type="dynamixel_workbench_controllers"
        required="true" output="screen" args="$(arg usb_port) $(arg dxl_baud_rate)">
    <param name="use_moveit"              value="$(arg use_moveit)"/>
    <param name="use_joint_states_topic"  value="$(arg use_joint_state)"/>
    <param name="use_cmd_vel_topic"       value="$(arg use_cmd_vel)"/>
    <rosparam>
      publish_period: 0.010
      dxl_read_period: 0.010
      dxl_write_period: 0.010
      mobile_robot_config:                <!--this values will be set when 'use_cmd_vel' is true-->
        seperation_between_wheels: 0.160  <!--default value is set by reference of TB3-->
        radius_of_wheel: 0.033            <!--default value is set by reference of TB3-->
    </rosparam>
  </node>
</launch>
```

Launch dynamixel_controller

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch
```

コントローラがDYNAMIXELを読み込むと、以下のテキストが表示されます。

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

初期化をすると、DYNAMIXELはトルクオン状態になります。DYNAMIXELに値を書き込むには、ROS service(`/dynamixel_command`)を利用します。

rqtと`Plugins` -> `Services` -> `Service Caller`を開きます。

![](/assets/images/sw/dynamixel/dynamixel_workbench/controller_service_call.png)

またはコマンドラインを使います。

```
$ rosservice call /dynamixel_workbench/dynamixel_command "command: ''
id: 1
addr_name: 'Goal_Position'
value: 2048"
```

**パラメーターの一覧** :
- `usb_port`  
使用したUSBのポート名です。

- `dxl_baud_rate`  
DYNAMIXELのボーレートです。

- `namespace`  
このパッケージの名前空間です。

- `dynamixel_info`  
YAMLファイルのパスです。

- `publish_period`  
トピックの配信周期です。(msec)

- `dxl_read_period`  
DYNAMIXELの読み取り情報の周期です。(msec)

- `dxl_write_period`  
DYNAMIXELへの値の書き込み周期です。(msec)

- `use_moveit`  
MoveIt!によって計算した関節軌道を使用する場合は、Trueを設定してください。

- `use_joint_states_topic`  
/joint_statesを配信したい場合は、Trueを設定してください。

- `use_cmd_vel_topic`  
/cmd_velを購読したい場合は、Trueを設定してください。

- `seperation_between_wheels`  
このパラメーターは、`use_cmd_vel_topic`がTrueの場合に有効です。

- `radius_of_wheel`  
このパラメーターは、`use_cmd_vel_topic`がTrueの場合に有効です。

**トピック一覧** :
- `/dynamixel_state`([dynamixel_workbench_msgs/DynamixelStateList]{: .popup})  
接続されたDYNAMIXELの状態を提供します。  

- `/joint_states`([sensor_msgs/JointState](http://docs.ros.org/melodic/api/sensor_msgs/html/msg/JointState.html))   
接続されたDYNAMIXELの関節情報を提供します。  

- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
DYNAMIXELを制御するための関節軌道を受信します。

**サービス一覧** :
- `/dynamixel_command`([dynamixel_workbench_msgs/DynamixelCommand]{: .popup})    
DYNAMIXELを制御するためのコマンドを受信します。

### [Operators](#operators)

#### Joint Operators

本パッケージは、ROSメッセージを作成し、コントローラーに配信するためのパッケージです。

yamlファイルの設定は以下の通りです。はじめに、`controllers`から読み込む際に関節名を登録します。次に、モーション名を登録してください。それぞれのモーション名には、開始からのステップと時間が設定されています。ステップの大きさは、ジョイント名と同じにします。

```
joint:
  names: [[name1], [name2]]
motion:
  names: [[motion_name1], [motion_name2]]
  [motion_name1]:
    step: [[position1], [position2]]
    time_from_start: [time]
  [motion_name2]:
    step: [[position1], [position2]]
    time_from_start: [time]
  .
  .
  .
```

それでは、`motion.yaml`ファイルを見てみましょう。このファイルは2つのDYNAMIXELを読み込んでいることを示しています。1つ目のDYNAMIXELには'パン'、そして2つ目のDYNAMIXELには'チルト'という名前がついています。このファイルには、3つのモーションが登録されています。

```
joint:
  names: [pan, tilt]
motion:
  names: [right, zero, left]
  right:
    step: [-3.14, -3.14]  # radian
    time_from_start: 2.0  # sec
  zero:
    step: [0.0, 0.0]
    time_from_start: 3.0
  left:
    step: [3.14, 3.14]
    time_from_start: 6.0
```

Launchコントローラーとjoint_operator  


**警告**: コントローラーは、**joint_2_0.yaml** もしくは **joint_1_0.yaml** を設定してください。
{: .notice--warning}

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch
$ roslaunch dynamixel_workbench_operators joint_operator.launch
```

コントローラーがDYNAMIXELを読み込むと、以下のテキストを見ることができます。

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

operator launchが成功した場合、以下のテキストを見ることができます。

```
[ INFO] [1544598264.311365515]: motion_name : right, step : -3.140000
[ INFO] [1544598264.311399654]: motion_name : right, step : -3.140000
[ INFO] [1544598264.311414820]: time_from_start : 2.000000
[ INFO] [1544598264.311453292]: motion_name : zero, step : 0.000000
[ INFO] [1544598264.311466789]: motion_name : zero, step : 0.000000
[ INFO] [1544598264.311478179]: time_from_start : 3.000000
[ INFO] [1544598264.311498720]: motion_name : left, step : 3.140000
[ INFO] [1544598264.311524562]: motion_name : left, step : 3.140000
[ INFO] [1544598264.311534826]: time_from_start : 6.000000
[ INFO] [1544598264.313085881]: For now, you can use publish joint trajectory msgs by triggering service(/execution)
```

ROSサービスでコマンドを実行するとDYNAMIXELが回転します。

```
$ rosservice call /dynamixel_workbench/execution "{}"
```

**注釈**: モーションを繰り返させたい場合は、引数`is_loop`にTrueを設定してください。  
`$ roslaunch dynamixel_workbench_operators joint_operator.launch is_loop:=true`
{: .notice--info}

**パラメーターの一覧** :
- `namespace`  
このノードの名前空間です。

- `trajectory_info`  
軌道情報ファイルパスです。

**トピック一覧** :
- `/joint_trajectory`([trajectory_msgs/JointTrajectory](http://docs.ros.org/melodic/api/trajectory_msgs/html/msg/JointTrajectory.html))  
DYNAMIXELを制御するために関節軌道を送ります。

**サービス一覧** :
- `/execution`([std_srvs/Trigger](http://docs.ros.org/melodic/api/std_srvs/html/srv/Trigger.html))    
関節軌道の追従を実行するためのコマンドを送信する。

#### Wheel Operators

このパッケージは、ROSメッセージを作成し、コントローラに配信するためのパッケージです。

Launchコントローラーとjoint_operator   

**警告**: コントローラーは、**wheel_2_0.yaml** もしくは **wheel_1_0.yaml** を設定し、`use_cmd_vel` パラメーターにtrueを設定する必要があります。
{: .notice--warning}

```
$ cd ~/catkin_ws && catkin_make
$ roslaunch dynamixel_workbench_operators wheel_operator.launch
$ roslaunch dynamixel_workbench_controllers dynamixel_controllers.launch use_cmd_vel:=true
```

コントローラーがDYNAMIXELを読み込むと、以下のテキストを見ることができます。

```
[ INFO] [1544595828.276238724]: Name : pan, ID : 1, Model Number : 1020
[ INFO] [1544595828.316198852]: Name : tilt, ID : 2, Model Number : 1020
```

operator launchが成功した場合、以下のテキストを見ることができます。

```
[ INFO] [1544600281.020523635]: You can set '-lin_vel_step' and  '-ang_vel_step' arguments (default is 0.01 and 0.1)
[ INFO] [1544600281.021060063]:
  Control Your Mobile Robot!
  ---------------------------
  Moving around:
          w
     a    s    d
          x

  w/x : increase/decrease linear velocity
  a/d : increase/decrease angular velocity

  s : force stop

  CTRL-C to quit
```

**パラメーターの一覧** :
- `namespace`  
このノードの名前空間です。

**トピック一覧** :
- `/cmd_vel`([geometry_msgs/Twist](http://docs.ros.org/melodic/api/geometry_msgs/html/msg/Twist.html))  
DYNAMIXELを制御するための速度司令コマンドを送信します。
 
## [OpenCR and OpenCM Tutorials](#opencr-and-opencm-tutorials)

OpenCRとOpenCMのDYNAMIXEL Workbenchのファームウェアは全く同じです。好きな例を選択して、アップロードすることができます。

**警告**: いくつかの例がありますが、実行する前に`Serial Monitor`を開く必要があります。このコード (`while(!Serial)
`)が有効になっている場合は、`Serial Monitor`
{: .notice--warning}

### [o_Find_Dynamixel](#o_find_dynamixel)

1. `o_Find_Dynamixel`を開きます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_1.png)  

1. ポートを選択します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_2.png)  

1. `Upload`ボタンを押すか、`CTRL+U`を押します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_3.png)  

1. ファームウェアのアップロードが成功したかどうかを表示することができます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_4.png)  

1. `Serial Monitor`ボタンを押します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_5.png)  

1. シリアルモニタがスキャンを開始し、DYNAMIXELを検出します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_6.png)  

### [p_Monitor](#p_monitor)

1. `p_Monitor`を開きます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_arduino_setup.png)  

1. ポートを選びます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_2.png)  

1. `Upload`ボタンを押すか、`CTRL+U`を押します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_3.png)  

1. ファームウェアのアップロードが成功したかどうかを表示することができます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_4.png)  

1. `Serial Monitor`ボタンを押します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_5.png)  

1. シリアルモニタには、DYNAMIXELモニターが表示されます。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_7.png)  

1. `begin 57600`と入力します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_8.png)  

1. `scan 10`と入力します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_9.png)  

1. `torque_on 1`と`torque_on 2`を入力します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_10.png)  

1. `sync_write_handler 1 Goal_Position`と入力します

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_11.png)  

1. `sync_write 1 2 0 2048 2048`と入力すると、DYNAMIXELが回転します。

    ![](/assets/images/sw/dynamixel/dynamixel_workbench/opencr_example_12.png)  

## [LinuxとmacOS チュートリアル](#linux-and-macos-tutorials)

例は、任意のものを選択して表示できます。

### 例題

1. model_scan
1. ping
1. id_change
1. bps_change
1. mode_change
1. reboot
1. reset
1. position
1. velocity
1. current_based_position
1. read_write
1. sync_write
1. sync_read_write
1. bulk_read_write
1. find_dynamixel
1. monitor

**ヒント**: USBポート名はOSによって異なります。例えば、Linuxでは`/dev/ttyUSB0`、`/dev/ttyACM0`となり、macOSでは`/dev/cu.usbmodem1411`となります。
{: .notice--success}

### [position](#position)

1. ターミナルを開き、DYNAMIXEL Workbenchビルドフォルダに移動します。

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. positionを実行します。 (引数 : -port_name -baud_rate -dynamixel_id)

    ```
    $ ./position /dev/ttyUSB0 57600 1
    ```

1. あなたは以下のようなテキストを見ることができ、DYNAMIXELは3回転します。
    ```
    Succeed to init(57600)
    Succeed to ping
    id : 1, model_number : 1020
    Succeed to change joint mode
    Dynamixel is moving...
    ```

### [bulk_read_write](#bulk_read_write)

1. ターミナルを開き、DYNAMIXEL Workbenchビルドフォルダに移動します。

    ```
    $ cd ~/dynamixel-workbench/dynamixel_workbench_toolbox/examples/build
    ```

1. bulk_read_writeを実行します。 (引数 : -port_name -baud_rate -dynamixel_id_1 -dynamixel_id_2)

    ```
    $ ./bulk_read_write /dev/ttyUSB0 57600 1 2
    ```

1. 下記テキストを見ると、DYNAMIXEL(dynamixel_id_1)回転方向を変更し、別のDYNAMIXEL(dynamixel_id_2)がLEDの状態を変更しています。

    ```
    Succeed to init(57600)
    Succeeded to ping
    id : 1, model_number : 1020
    Succeed to change joint mode
    Succeeded to ping
    id : 2, model_number : 1020
    Succeed to change joint mode
    [DynamixelDriver] Succeeded to init groupBulkWrite!
    [DynamixelDriver] Succeeded to init groupBulkRead!
    [DynamixelDriver] Succeeded to add param for bulk read!
    [DynamixelDriver] Succeeded to add param for bulk read!
    [DynamixelDriver] Succeeded to add param for bulk write!
    [DynamixelDriver] Succeeded to add param for bulk write!
    ```

# [APIリファレンス](#api-references)

- [Githubリポジトリ](https://github.com/ROBOTIS-GIT/dynamixel-workbench)

**注釈**: Doxygenの公開予定があります。近日中に更新します。
{: .notice--info}

## [関数一覧](#function-list)

```c++
bool init(const char* device_name = "/dev/ttyUSB0",
        uint32_t baud_rate = 57600,
        const char **log = NULL);

bool begin(const char* device_name = "/dev/ttyUSB0",
        uint32_t baud_rate = 57600,
        const char **log = NULL);

bool setPortHandler(const char *device_name, const char **log = NULL);
bool setBaudrate(uint32_t baud_rate, const char **log = NULL);
bool setPacketHandler(float protocol_version, const char **log = NULL);

float getProtocolVersion(void);
uint32_t getBaudrate(void);

const char * getModelName(uint8_t id, const char **log = NULL);
uint16_t getModelNumber(uint8_t id, const char **log = NULL);
const ControlItem *getControlTable(uint8_t id, const char **log = NULL);
const ControlItem *getItemInfo(uint8_t id, const char *item_name, const char **log = NULL);
uint8_t getTheNumberOfControlItem(uint8_t id, const char **log = NULL);
const ModelInfo* getModelInfo(uint8_t id, const char **log = NULL);

uint8_t getTheNumberOfSyncWriteHandler(void);
uint8_t getTheNumberOfSyncReadHandler(void);
uint8_t getTheNumberOfBulkReadParam(void);

bool scan(uint8_t *get_id,
        uint8_t *get_the_number_of_id,
        uint8_t range = 253,
        const char **log = NULL);

bool scan(uint8_t *get_id,
        uint8_t *get_the_number_of_id,
        uint8_t start_number,
        uint8_t end_number,
        const char **log = NULL);

bool ping(uint8_t id,
        uint16_t *get_model_number,
        const char **log = NULL);

bool ping(uint8_t id,
        const char **log = NULL);

bool clearMultiTurn(uint8_t id, const char **log = NULL);

bool reboot(uint8_t id, const char **log = NULL);
bool reset(uint8_t id, const char **log = NULL);

bool writeRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t* data, const char **log = NULL);
bool writeRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool writeOnlyRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t *data, const char **log = NULL);
bool writeOnlyRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool readRegister(uint8_t id, uint16_t address, uint16_t length, uint32_t *data, const char **log = NULL);
bool readRegister(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL);

void getParam(int32_t data, uint8_t *param);

bool addSyncWriteHandler(uint16_t address, uint16_t length, const char **log = NULL);
bool addSyncWriteHandler(uint8_t id, const char *item_name, const char **log = NULL);

bool syncWrite(uint8_t index, int32_t *data, const char **log = NULL);
bool syncWrite(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, uint8_t data_num_for_each_id, const char **log = NULL);

bool addSyncReadHandler(uint16_t address, uint16_t length, const char **log = NULL);
bool addSyncReadHandler(uint8_t id, const char *item_name, const char **log = NULL);

bool syncRead(uint8_t index, const char **log = NULL);
bool syncRead(uint8_t index, uint8_t *id, uint8_t id_num, const char **log = NULL);

bool getSyncReadData(uint8_t index, int32_t *data, const char **log = NULL);
bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, const char **log = NULL);
bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, uint16_t address, uint16_t length, int32_t *data, const char **log = NULL);

bool initBulkWrite(const char **log = NULL);

bool addBulkWriteParam(uint8_t id, uint16_t address, uint16_t length, int32_t data, const char **log = NULL);
bool addBulkWriteParam(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);

bool bulkWrite(const char **log = NULL);

bool initBulkRead(const char **log = NULL);

bool addBulkReadParam(uint8_t id, uint16_t address, uint16_t length, const char **log = NULL);
bool addBulkReadParam(uint8_t id, const char *item_name, const char **log = NULL);

bool bulkRead(const char **log = NULL);

bool getBulkReadData(int32_t *data, const char **log = NULL);
bool getBulkReadData(uint8_t *id, uint8_t id_num, uint16_t *address, uint16_t *length, int32_t *data, const char **log = NULL);

bool clearBulkReadParam(void);
```  

```c++
bool torque(uint8_t id, bool onoff, const char **log = NULL);
bool torqueOn(uint8_t id, const char **log = NULL);
bool torqueOff(uint8_t id, const char **log = NULL);

bool changeID(uint8_t id, uint8_t new_id, const char **log = NULL);
bool changeBaudrate(uint8_t id, uint32_t new_baudrate, const char **log = NULL);
bool changeProtocolVersion(uint8_t id, uint8_t version, const char **log = NULL);

bool itemWrite(uint8_t id, const char *item_name, int32_t data, const char **log = NULL);
bool itemRead(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL);

bool led(uint8_t id, bool onoff, const char **log = NULL);
bool ledOn(uint8_t id, const char **log = NULL);
bool ledOff(uint8_t id, const char **log = NULL);

bool setNormalDirection(uint8_t id, const char **log = NULL);
bool setReverseDirection(uint8_t id, const char **log = NULL);

bool setVelocityBasedProfile(uint8_t id, const char **log = NULL);
bool setTimeBasedProfile(uint8_t id, const char **log = NULL);

bool setSecondaryID(uint8_t id, uint8_t secondary_id, const char **log = NULL);

bool setCurrentControlMode(uint8_t id, const char **log = NULL);
bool setTorqueControlMode(uint8_t id, const char **log = NULL);
bool setVelocityControlMode(uint8_t id, const char **log = NULL);  
bool setPositionControlMode(uint8_t id, const char **log = NULL);  
bool setExtendedPositionControlMode(uint8_t id, const char **log = NULL);
bool setMultiTurnControlMode(uint8_t id, const char **log = NULL);
bool setCurrentBasedPositionControlMode(uint8_t id, const char **log = NULL);
bool setPWMControlMode(uint8_t id, const char **log = NULL);

bool setOperatingMode(uint8_t id, uint8_t index, const char **log = NULL);

bool jointMode(uint8_t id, int32_t velocity = 0, int32_t acceleration = 0, const char **log = NULL);
bool wheelMode(uint8_t id, int32_t acceleration = 0, const char **log = NULL);
bool currentBasedPositionMode(uint8_t id, int32_t current = 0, const char **log = NULL);

bool goalPosition(uint8_t id, int32_t value, const char **log = NULL);
bool goalPosition(uint8_t id, float radian, const char **log = NULL);

bool goalVelocity(uint8_t id, int32_t value, const char **log = NULL);
bool goalVelocity(uint8_t id, float velocity, const char **log = NULL);

bool getPresentPositionData(uint8_t id, int32_t* data, const char **log = NULL);
bool getRadian(uint8_t id, float* radian, const char **log = NULL);

bool getPresentVelocityData(uint8_t id, int32_t* data, const char **log = NULL);
bool getVelocity(uint8_t id, float* velocity, const char **log = NULL);

int32_t convertRadian2Value(uint8_t id, float radian);
float convertValue2Radian(uint8_t id, int32_t value);

int32_t convertRadian2Value(float radian, int32_t max_position, int32_t min_position, float max_radian, float min_radian);
float convertValue2Radian(int32_t value, int32_t max_position, int32_t min_position, float max_radian, float min_radian);

int32_t convertVelocity2Value(uint8_t id, float velocity);
float convertValue2Velocity(uint8_t id, int32_t value);

int16_t convertCurrent2Value(float current);
float convertValue2Current(int16_t value);

float convertValue2Load(int16_t value);
```  

## [関数リファレンス](#function-reference)

### bool init(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600, const char **log = NULL)  

**説明文**  
portHandlerの初期化を行います。

**引数**  
1. `device_name` : USBポート名を設定します。  
2. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。

### bool begin(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600, const char **log = NULL)  

**説明文**  
portHandlerの初期化を行います。

**引数**  
1. `device_name` : USBポート名を設定します。  
2. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。

### bool setPortHandler(const char *device_name, const char **log = NULL)
**説明文**  
PortHandlerの設定をします。

**引数**  
1. `device_name` : USBポート名を設定します。  

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。  

### bool setBaudrate(uint32_t baud_rate, const char **log = NULL)
**説明文**  
DYNAMIXELのボーレートを設定します。  

**引数**  
1. `baud_rate` : DYNAMIXELのボーレートを設定します。 

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。 


### bool setPacketHandler(float protocol_version, const char **log = NULL)
**説明文**  
PacketHandlerの設定を行います。  

**引数**  
1. `protocol_version` : DYNAMIXELのプロトコルバージョンを設定します。  

**戻り値**  
すべての引数が正常に設定されていれば、trueを返します。そうでない場合はfalseを返します。  

### float getProtocolVersion(void)
**説明文**  
PacketHandlerのプロトコルバージョンを取得します。  

**引数**  

**戻り値**  
PacketHandlerのプロトコルバージョンを返します。  

### uint32_t getBaudrate(void)
**説明文**  
PortHandlerのボーレートを取得します。  

**引数**  
**戻り値**  
PortHandlerのボーレートを返します。

### const char * getModelName(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのモデル名を取得します。  

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  。
型番を返します。  

### uint16_t getModelNumber(uint8_t id, const char **log = NULL)
**Description**  
DYNAMIXELの型番を取得します。  

**Input**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
型番を返します。  

### const ControlItem *getControlTable(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのコントロールテーブル(ID、ボーレート、目標位置、...を含む)を取得します。
 

**引数**
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
コントロールテーブルを返します。

### const ControlItem *getItemInfo(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
DYNAMIXELのコントロールテーブルのアイテム情報を取得します。

**引数**  
1. `id` : DYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名です。

**戻り値**  
項目情報を返します。  

### uint8_t getTheNumberOfControlItem(uint8_t id, const char **log = NULL)
**説明文**  
制御項目の数を取得します。  

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
制御項目の数を返します。  

### const ModelInfo* getModelInfo(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのモデル情報（RPM、最小/最大位置など）を取得します。

**引数**  
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
モデル情報を返します。   

### uint8_t getTheNumberOfSyncWriteHandler(void)
**説明文**  
同期書き込みハンドラの数を取得します。  

**引数**  
**戻り値**  
同期書き込みハンドラの数を返します。   

### uint8_t getTheNumberOfSyncReadHandler(void)
**説明文**  
同期書き込みハンドラの数を取得します。  

**引数**    
**戻り値**   
同期書き込みハンドラの数を返します。    

### uint8_t getTheNumberOfBulkReadParam(void)
**説明文**  
bulk readパラメーターの数を取得します。  

**引数**   
**戻り値**  
bulk readパラメーターの数を返します。  

### bool scan(uint8_t *get_id, uint8_t *get_the_number_of_id, uint8_t range = 253, const char **log = NULL)
**説明文**  
指定範囲のDYNAMIXELへPingを送ります。 Pingが成功した場合、DYNAMIXELの全ての情報が保存されます。

**引数**  
1. `get_id` : 検出したIDを取得します。
1. `get_the_number_of_id` : 検出したIDの数を取得します。
1. `range` : スキャン範囲を設定します。（0から始まります）  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。 

### bool scan(uint8_t *get_id, uint8_t *get_the_number_of_id, uint8_t start_number, uint8_t end_number, const char **log = NULL)
**説明文**  
特定の範囲間でDYNAMIXELをPingします。Pingが成功した場合、DYNAMIXELの全ての情報が保存されます。

**引数**  
1. `get_id` : 検出したIDを取得します。
1. `get_the_number_of_id` : 検出したIDの数を取得します。
1. `start_number` : pingの開始番号を設定します。
1. `end_number` : pingの終了番号を設定します。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。

### bool ping(uint8_t id, uint16_t *get_model_number, const char **log = NULL)
**説明文**  
DYNAMIXELへPingを送ります。Pingが成功すると、DYNAMIXELのすべての情報が保存されます。  

**引数**  
1. `id` : IDを設定します。
1. `get_model_number` : pingされたDYNAMIXELの型番を取得します。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。

### bool ping(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELへPingを送ります。Pingが成功すると、DYNAMIXELのすべての情報が保存されます。  

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
ping命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool clearMultiTurn(uint8_t id, const char **log = NULL)
**説明文**  
マルチターンのクリア命令を送信します。

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
マルチターンのクリアが正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool reboot(uint8_t id, const char **log = NULL)
**説明文**  
再起動命令を送信します。  

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
再起動命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool reset(uint8_t id, const char **log = NULL)
**説明文**  
リセット命令を送信します。  

**引数**  
1. `id` : IDを設定します。  

**戻り値**  
リセット命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool writeRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t* data, const char **log = NULL)
**Description**  
DYNAMIXELにデータを書き込み、書き込み完了信号を待ちます。  

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブル項目のアドレスを設定する。
1. `length` : コントロールテーブル項目の長さを設定する。
1. `data` : データを設定します。  

**戻り値**  
writeTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。

### bool writeRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**Description**  
DYNAMIXELにデータを書き込み、書き込み完了信号を待ちます。  

**引数**  
1. `id` : IDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...)
1. `data` : データを設定します。  

**戻り値**  
writeTxRx命令が正常に動作した場合はtrueを返します。そうでない場合はfalseを返します。  

### bool writeOnlyRegister(uint8_t id, uint16_t address, uint16_t length, uint8_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELにデータを書き込むだけです。他の信号を待ちません。

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを設定します。  

**戻り値**  
writeTxOnly命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool writeOnlyRegister(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
DYNAMIXELにデータを書き込むだけです。他の信号を待ちません。  

**引数**  
1. `id` : IDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...)
1. `data` : データを設定します。  

**戻り値**  
writeTxOnly命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool readRegister(uint8_t id, uint16_t address, uint16_t length, uint32_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELからデータを読み出します。  

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブルの項目名を設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを取得します。  

**戻り値**  
readTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool readRegister(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL)
**説明文**  
DYNAMIXELからデータを読み出します。  

**引数**  
1. `id` : IDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）
1. `data` : データを取得します。  

**戻り値**  
readTxRx命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### void getParam(int32_t data, uint8_t *param)
**説明文**  
32ビットデータを8ビットパラメーターに変換します。

**引数**  
1. `data` : 32ビットのデータを設定します。
1. `param` : 8ビットのパラメーターを取得します。  

**戻り値**  

### bool addSyncWriteHandler(uint16_t address, uint16_t length, const char **log = NULL)
**説明文**   
syncWriteハンドラを追加します。

**引数**  
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返します。そうでない場合にはtrueを返します。  

### bool addSyncWriteHandler(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
syncWriteハンドラを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例；目標位置、目標速度、...）  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool syncWrite(uint8_t index, int32_t *data, const char **log = NULL)
**説明文**  
全てのpingされたDYNAMIXELに同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `data` : データを設定します。  

**戻り値**  
addパラメーターまたはtxtパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  
　
### bool syncWrite(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, uint8_t data_num_for_each_id, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELへの同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `id` : IDを設定します。
1. `id_num` : IDの数を設定します。
1. `data` : データを設定します。
1. `data_num_for_each_id` : 各IDのデータ数を設定します。  

**戻り値**  
addパラメーターまたはtxパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addSyncReadHandler(uint16_t address, uint16_t length, const char **log = NULL)
**説明文**  
syncReadハンドラを追加します。  

**引数**  
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。    

**戻り値**  
syncWriteハンドラの最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool addSyncReadHandler(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
syncReadハンドラを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）  

**戻り値**  
syncWriteハンドラを最大値（デフォルトは5）を超えて追加しようとした場合はfalseを返す、もしくは項目名が見つからなくなります。そうでない場合にはtrueを返します。  

### bool syncRead(uint8_t index, const char **log = NULL)
**説明文**  
全てのpingされたDYNAMIXELからの同期読み出しを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。  

**戻り値**  
addパラメーターまたはtxパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool syncRead(uint8_t index, uint8_t *id, uint8_t id_num, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからの同期読み出しを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `id` : IDを設定します。
1. `id_num` : IDの数を設定します。  

**戻り値**  
addパラメーターまたはtxパケット命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, int32_t *data, const char **log = NULL)
**説明文**    
全てのpingされたDYNAMIXELに同期書き込みを実行します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `data` : データを取得します。  

**Output**  
isAvailable命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, int32_t *data, const char **log = NULL)
**説明文**    
いくつかのDYNAMIXELからsyncRead関数で読み込んだデータを取得します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `id` : IDを設定します。
1. `id_num` : IDの数を設定します。
1. `data` : データを取得します。  

**戻り値**  
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getSyncReadData(uint8_t index, uint8_t *id, uint8_t id_num, uint16_t address, uint16_t length, int32_t *data, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからsyncRead関数で読み込んだデータを取得します。  

**引数**  
1. `index` : syncWriteハンドラのインデックスを設定します。
1. `id` : IDを設定します。
1. `id_num` : IDの数を設定します。
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを取得します。  

**戻り値**  
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool initBulkWrite(const char **log = NULL)
**説明文**  
bulkWriteハンドラを初期化します。  

**引数**    
**戻り値**  
ポートハンドラとパケットハンドラが正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addBulkWriteParam(uint8_t id, uint16_t address, uint16_t length, int32_t data, const char **log = NULL)
**説明文**  
bulkWrite用のパラメーターを追加します。  

**引数**  
1. `id` : IDを設定する。
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを設定します。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool addBulkWriteParam(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
bulkWrite用のパラメーターを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）
1. `data` : データを設定します。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool bulkWrite(const char **log = NULL)
**説明文**  
bulkWriteを実行します。  

**引数**    
**戻り値**  
txパケット命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool initBulkRead(const char **log = NULL)
**説明文**  
bulkReadハンドラを初期化します。  

**引数**    
**戻り値**  
ポートハンドラとパケットハンドラが正常にロードされた場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool addBulkReadParam(uint8_t id, uint16_t address, uint16_t length, const char **log = NULL)
**説明文**  
bulkRead用のパラメーターを追加します。  

**引数**  
1. `id` : IDを設定します。
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを設定します。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。   

### bool addBulkReadParam(uint8_t id, const char *item_name, const char **log = NULL)
**説明文**  
bulkRead用のパラメーターを追加します。  

**引数**  
1. `id` : コントロールテーブルを参照するためのDYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）
1. `data` : データを設定します。  

**戻り値**  
addParam命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。   

### bool bulkRead(const char **log = NULL)
**説明文**  
bulkReadを実行します。  

**引数**    
**戻り値**  
txパケット命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getBulkReadData(int32_t *data, const char **log = NULL)
**説明文**  
pingされた全てのDYNAMIXELからbulkRead関数で読み込んだデータを取得します。  

**引数**  
1. `data` : データを設定します。  

**戻り値**    
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool getBulkReadData(uint8_t *id, uint8_t id_num, uint16_t *address, uint16_t *length, int32_t *data, const char **log = NULL)
**説明文**  
いくつかのDYNAMIXELからbulkRead関数で読み込んだデータを取得します。  

**Input**  
1. `id` : IDを設定します。
1. `id_num` : IDの数を設定します。
1. `address` : コントロールテーブル項目のアドレスを設定します。
1. `length` : コントロールテーブル項目の長さを設定します。
1. `data` : データを取得します。  

**戻り値**   
isAvailable命令が正常に動作した場合はtrueを返します。そうでない場合にはfalseを返します。  

### bool clearBulkReadParam(void)
**説明文**  
bulkRead用の全てのパラメーターをクリアします。  

**引数**    
**戻り値**  
パラメーターのクリア命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torque(uint8_t id, bool onoff, const char **log = NULL)
**説明文**  
DYNAMIXELにトルクを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `onoff` : trueかfalseかを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torqueOn(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのトルクをオンに設定します。

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool torqueOff(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのトルクをオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeID(uint8_t id, uint8_t new_id, const char **log = NULL)
**説明文**  
DYNAMIXELのIDを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `new_id` : DYNAMIXELの新しいIDを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeBaudrate(uint8_t id, uint32_t new_baudrate, const char **log = NULL)
**説明文**  
DYNAMIXELのボーレートを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `new_baudrate` : DYNAMIXELの新しいボーレートを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool changeProtocolVersion(uint8_t id, uint8_t version, const char **log = NULL)
**説明文**  
DYNAMIXELのプロトコルバージョンを変更します。

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `version` : DYNAMIXELのプロトコルバージョンを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool itemWrite(uint8_t id, const char *item_name, int32_t data, const char **log = NULL)
**説明文**  
コントロールテーブルの項目にデータを書き込みます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）  
1. `data` : データを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool itemRead(uint8_t id, const char *item_name, int32_t *data, const char **log = NULL)
**説明文**  
コントロールテーブルの項目へデータを読み込みます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `item_name` : コントロールテーブルの項目名を設定します。（例：目標位置、目標速度、...）  
1. `data` : データを取得します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool led(uint8_t id, bool onoff, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンもしくはオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `onoff` : trueもしくはfalseかを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool ledOn(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンに設定します。

**引数**    
1. `id` : DYNAMIXELのIDを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool ledOff(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELのLEDをオンもしくはオフに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `onoff` : trueもしくはfalseかを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setNormalDirection(uint8_t id, const char **log = NULL)
**Description**  
DYNAMIXELを通常の方向（反時計回り）に回転するように設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setReverseDirection(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを逆回転（時計回り）するように設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setVelocityBasedProfile(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに速度ベースのプロファイルを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setTimeBasedProfile(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELにタイムベースのプロファイルを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setSecondaryID(uint8_t id, uint8_t secondary_id, const char **log = NULL)
**説明文**  
セカンダリIDを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `secondary_id` : DYNAMIXELのセカンダリIDを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setCurrentControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを電流制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setTorqueControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELをトルク制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setVelocityControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを速度制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定する。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを位置制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setExtendedPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELを拡張位置制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setMultiTurnControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELをマルチターン制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setCurrentBasedPositionControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELに電流による位置制御モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setPWMControlMode(uint8_t id, const char **log = NULL)
**説明文**  
DYNAMIXELをPWM制御モードに設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool setOperatingMode(uint8_t id, uint8_t index, const char **log = NULL)
**説明文**  
DYNAMIXELに動作モードを設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `index` : 設定したい動作モードを選択します。

- インデックス一覧
```c++
static const uint8_t CURRENT_CONTROL_MODE                  = 0;
static const uint8_t VELOCITY_CONTROL_MODE                 = 1;
static const uint8_t POSITION_CONTROL_MODE                 = 3;
static const uint8_t EXTENDED_POSITION_CONTROL_MODE        = 4;
static const uint8_t CURRENT_BASED_POSITION_CONTROL_MODE   = 5;
static const uint8_t PWM_CONTROL_MODE                      = 16;
static const uint8_t TORQUE_CONTROL_MODE                   = 100;
static const uint8_t MULTI_TURN_MODE                       = 101;
```

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool jointMode(uint8_t id, int32_t velocity = 0, int32_t acceleration = 0, const char **log = NULL)
**説明文**  
DYNAMIXELにジョイントモードを設定します。任意のDYNAMIXELにジョイントモードを簡単に設定することができます。ジョイントモードが正常に設定されると、トルクがオンになります。
速度と加速度のパラメーターは、プロファイルを作成する際の引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `velocity` : 速度プロファイルを設定します。
1. `acceleration` : 加速度プロファイルを設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool wheelMode(uint8_t id, int32_t acceleration = 0, const char **log = NULL)
**説明文**  
DYNAMIXELに車輪モードを設定します。任意のDYNAMIXELに車輪モードを簡単に設定することができます。車輪モードが正常に設定されると、トルクがオンになります。
加速度のパラメーターは、プロファイルを作成する際の引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `acceleration` : プロファイルの加速度を設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool currentBasedPositionMode(uint8_t id, int32_t current = 0, const char **log = NULL)
**説明文**  
DYNAMIXELに電流による位置制御モードを設定します。DYNAMIXEL-Xシリーズに電流によって制御されるジョイントモードを簡単に設定することができます。モードが正常に設定されると、トルクがオンになります。
プロファイルを作成する際には、電流のパラメーターが引数として使用されます。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `current` : 電流値の制限を設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalPosition(uint8_t id, int32_t value, const char **log = NULL)
**説明文**  
DYNAMIXELに位置を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `value` : 32ビットのraw値を設定します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalPosition(uint8_t id, float radian, const char **log = NULL)
**説明文**  
DYNAMIXELに位置を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `radian` : 位置を設定します。単位はラジアンです。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalVelocity(uint8_t id, int32_t value, const char **log = NULL)
**説明文**  
DYNAMIXELに速度を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `value` : 32ビットのraw値を設定します。

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool goalVelocity(uint8_t id, float velocity, const char **log = NULL)
**説明文**  
DYNAMIXELに速度を設定します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `velocity` : 速度を設定します。単位はm/sです。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getPresentPositionData(uint8_t id, int32_t* data, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `data` : 32ビットのraw値を取得します。  

**戻り**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getRadian(uint8_t id, float* radian, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `radian` : 位置を設定します。単位はラジアンです。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getPresentVelocityData(uint8_t id, int32_t* data, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `data` : 32ビットのraw値を取得します。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### bool getVelocity(uint8_t id, float* velocity, const char **log = NULL)
**説明文**  
DYNAMIXELから現在の位置を取得します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `velocity` : 速度を設定します。単位はm/sです。  

**戻り値**  
writeByteTxRx命令が正常に動作した場合はtureを返します。そうでない場合にはfalseを返します。  

### int32_t convertRadian2Value(uint8_t id, float radian)
**説明文**  
ラジアンを32ビットのraw値に変換します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `radian` : 位置を設定します。単位はラジアンです。  

**戻り値**  
DYNAMIXEL用の32ビットのraw値を返します。  

### float convertValue2Radian(uint8_t id, int32_t value)
**説明文**  
ラジアンを32ビットのraw値に変換します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `value` : 32ビットのraw値を取得します。  

**戻り値**  
位置を返します。単位はラジアンです。  

### int32_t convertRadian2Value(float radian, int32_t max_position, int32_t min_position, float max_radian, float min_radian)
**説明文**  
ラジアンを32ビットのraw値に変換します。  

**引数**    
1. `radian` : 位置を設定します。単位はラジアンです。
1. `max_position` : 最大位置を設定します。単位は32ビットraw値です。
1. `min_position` : 最小位置を設定します。単位は32ビットraw値です。
1. `max_radian` : 最大ラジアンを設定します。
1. `min_radian` : 最小ラジアンを設定します。  

**戻り値**  
ラジアンを32ビットのraw値に変換します。  

### float convertValue2Radian(int32_t value, int32_t max_position, int32_t min_position, float max_radian, float min_radian)
**説明文**  
32ビットのraw値をラジアンに変換します。  

**引数**    
1. `value` : 32ビットのraw値を設定します。
1. `max_position` : 最大位置を設定します。単位は32ビットraw値です。
1. `min_position` : 最小位置を設定します。単位は32ビットraw値です。
1. `max_radian` : 最大ラジアンを設定します。
1. `min_radian` : 最小ラジアンを設定します。  

**戻り値**  
位置を返します。単位はラジアンです。

### int32_t convertVelocity2Value(uint8_t id, float velocity)
**説明文**  
速度を32ビットのraw値に変換します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `velocity` : 速度を設定します。単位はm/sです。  

**戻り値**  
32ビットのraw値を返します。  

### float convertValue2Velocity(uint8_t id, int32_t value)
**説明文**  
32ビットのraw値を速度に変換します。  

**引数**    
1. `id` : DYNAMIXELのIDを設定します。
1. `value` : 32ビットのraw値を設定します。  

**戻り値**  
速度を返します。単位はm/sです。  

### int16_t convertCurrent2Value(float current)
**説明文**  
電流を16ビットのraw値に変換します。  

**引数**    
1. `current` : 電流を設定します。単位はm/Aです。  

**戻り値**  
16ビットのraw値を返します。  

### float convertValue2Current(int16_t value)
**説明文**  
16ビットのraw値を電流に変換します。  

**引数**    
1. `value` : 16ビットのraw値を設定します。  

**戻り値**  
電流を返します。単位はm/Aです。  

### float convertValue2Load(int16_t value)
**説明文**  
16ビットのraw値をロードに変換します。  

**引数**    
1. `value` : 16ビットのraw値を設定します。  

**戻り値**  
負荷を返します。単位は%です。  

[dynamixel_workbench_msgs/DynamixelInfo]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelInfo/
[dynamixel_workbench_msgs/DynamixelCommand]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelCommand/
[dynamixel_workbench_msgs/DynamixelStateList]: /docs/en/popup/dynamixel_workbench_msgs_DynamixelStateList/
[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[How to set Industrial filter into joint trajectory]: /docs/en/popup/how_to_set_smoothing_filter/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[EX-106+]: /docs/en/dxl/ex/ex-106+/   
[RX-10]: /docs/en/dxl/rx/rx-10/
[RX-24F]: /docs/en/dxl/rx/rx-24f/
[RX-28]: /docs/en/dxl/rx/rx-28/
[RX-64]: /docs/en/dxl/rx/rx-64/
[MX-12W]: /docs/en/dxl/mx/mx-12w/
[MX-28]: /docs/en/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64]: /docs/en/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106]: /docs/en/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/en/dxl/mx/mx-106-2/
[XL320]: /docs/en/dxl/x/xl320/
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
[2XL430-W250]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150]: /docs/en/dxl/x/xc430-w150/
[XC430-W240]: /docs/en/dxl/x/xc430-w240/
[XM430-W210]: /docs/en/dxl/x/xm430-w210/
[XM430-W350]: /docs/en/dxl/x/xm430-w350/
[XH430-W210]: /docs/en/dxl/x/xh430-w210/
[XM540-W150]: /docs/en/dxl/x/xm540-w150/
[XM540-W270]: /docs/en/dxl/x/xm540-w270/
[XH430-W350]: /docs/en/dxl/x/xh430-w350/
[XH430-V210]: /docs/en/dxl/x/xh430-v210/
[XH430-V350]: /docs/en/dxl/x/xh430-v350/
[XH540-W150]: /docs/en/dxl/x/xh540-w150/
[XH540-W270]: /docs/en/dxl/x/xh540-w270/
[XH540-V150]: /docs/en/dxl/x/xh540-v150/
[XH540-V270]: /docs/en/dxl/x/xh540-v270/
[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/en/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/en/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/en/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/en/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/en/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/en/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/en/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/en/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/en/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/en/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/en/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/en/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/en/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/en/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/en/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/p/pm42-010-s260-r/
