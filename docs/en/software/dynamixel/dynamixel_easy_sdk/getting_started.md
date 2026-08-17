---
layout: archive
lang: en
ref: getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/getting_started/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="getting-started">Getting Started DYNAMIXEL Easy SDK with OpenRB-150 tutorial Kit</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>
- In this chapter, you will use the **Dynamixel Easy SDK** with the **OpenRB-150 Tutorial Kit** to make the motor move.

<style>body {counter-reset: h1 0 !important;}</style>

# [Requirements](#requirements)
- OpenRB-150 Tutorial Kit [[US](https://www.robotis.us/openrb-150-starter-kit/)] [[KR](https://www.robotis.com/shop/item.php?it_id=902-0184-000)]  
![](/assets/images/sw/dynamixel_easy_sdk/getting_started/openrb_tutorial_kit.jpg)

# [Download and Build SDK](#download-and-build-sdk)
- Download the latest version of the Dynamixel Easy SDK from the [GitHub repository](https://github.com/ROBOTIS-GIT/DynamixelSDK.git)
```bash
git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
```

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Enter the Python directory and install the SDK using pip
```bash
cd DynamixelSDK/python
pip install .
```
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

- Build the SDK using the unified CMake build system
- **Note**: The `-DIS_ROS_BUILD=OFF` flag forces the SDK to build in standalone mode, ignoring any ROS 2 installation.
```bash
cd DynamixelSDK
mkdir build && cd build
cmake .. -DIS_ROS_BUILD=OFF
make
sudo make install
```
- Successful output log:
```bash
[ 34%] Built target dynamixel_c
[100%] Built target dynamixel_cpp
[100%] Built target ament_cmake_python_copy_dynamixel_sdk
running egg_info
writing dynamixel_sdk.egg-info/PKG-INFO
writing dependency_links to dynamixel_sdk.egg-info/dependency_links.txt
writing top-level names to dynamixel_sdk.egg-info/top_level.txt
reading manifest file 'dynamixel_sdk.egg-info/SOURCES.txt'
writing manifest file 'dynamixel_sdk.egg-info/SOURCES.txt'
[100%] Built target ament_cmake_python_build_dynamixel_sdk_egg
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/include/dynamixel_sdk_c/dynamixel_sdk
-- Installing: /usr/local/include/dynamixel_sdk_c/dynamixel_sdk/port_handler_mac.h
-- Installing: /usr/local/include/dynamixel_sdk_c/dynamixel_sdk/group_bulk_read.h
-- Installing: /usr/local/include/dynamixel_sdk_c/dynamixel_sdk/dynamixel_sdk.h
-- Installing: /usr/local/include/dynamixel_sdk_c/dynamixel_sdk/port_handler.h
...
```

</section>

# [Hardware Setup](#connect-openrb-150-tutorial-kit)
- Connect the OpenRB-150 to the Dynamixel using a TTL cable, and connect it to your computer using a USB-C cable.  
![](/assets/images/sw/dynamixel_easy_sdk/getting_started/hw_setup.jpg)

# [Move Motor to target position](#move-motor-to-targetposition)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

- Open a terminal and enter the Python interactive shell by typing `python` or `python3`.
```bash
python3
```
- Copy and paste the following code into the Python shell.
```python
from dynamixel_easy_sdk import *
connector = Connector("/dev/ttyACM0", 57600)
motor1 = connector.createMotor(1)
motor1.disableTorque()
motor1.setOperatingMode(OperatingMode.POSITION)
motor1.enableTorque()
target_position = 2000
motor1.setGoalPosition(target_position)
```

![](/assets/images/sw/dynamixel_easy_sdk/getting_started/move_motor_python.gif)
</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

- Create a new C++ source file named `move_motor.cpp` and open it in your favorite code editor.
```bash
touch move_motor.cpp
```

- Copy and paste the following code into the `move_motor.cpp` file.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

  int main() {
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
    int target_position = 2000;
    motor1->setOperatingMode(dynamixel::OperatingMode::POSITION);
    motor1->enableTorque();
    motor1->setGoalPosition(target_position);
    return 0;
  }
```
- Build the `move_motor.cpp` file and execute the compiled binary.
```bash
g++ -o move_motor move_motor.cpp -ldxl_cpp
./move_motor
```

![](/assets/images/sw/dynamixel_easy_sdk/getting_started/move_motor.gif)
</section>
