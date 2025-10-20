---
layout: archive
lang: en
ref: getting_started
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/getting_started/
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
- Build the SDK by following the instructions below
```bash
cd DynamixelSDK/c++/build/linux64
sudo make install
```
- Successful output log:
```bash
mkdir -p ./.objects/
g++ -shared -fPIC -m64 -o ./libdxl_x64_cpp.so ./.objects/group_bulk_read.o ./.objects/group_bulk_write.o ./.objects/group_sync_read.o ./.objects/group_sync_write.o ./.objects/group_fast_bulk_read.o ./.objects/group_fast_sync_read.o ./.objects/group_handler.o ./.objects/packet_handler.o ./.objects/port_handler.o ./.objects/protocol1_packet_handler.o ./.objects/protocol2_packet_handler.o ./.objects/port_handler_linux.o ./.objects/connector.o ./.objects/control_table.o ./.objects/motor.o ./.objects/dynamixel_error.o ./.objects/group_executor.o -lrt
cp "./libdxl_x64_cpp.so" "/usr/local/lib/libdxl_x64_cpp.so"
ln -s "/usr/local/lib/libdxl_x64_cpp.so" "/usr/local/lib/libdxl_x64_cpp.so.2"
ln -s "/usr/local/lib/libdxl_x64_cpp.so" "/usr/local/lib/libdxl_x64_cpp.so.2.0"
ln -s "/usr/local/lib/libdxl_x64_cpp.so" "/usr/local/lib/libdxl_x64_cpp.so.2.0.0"
cp -r ../../include/dynamixel_sdk/* /usr/local/include/dynamixel_sdk
cp -r ../../include/dynamixel_easy_sdk/* /usr/local/include/dynamixel_easy_sdk
cp -r ../../../control_table /usr/local/share/dynamixel_sdk/
ldconfig
```

# [Hardware Setup](#connect-openrb-150-tutorial-kit)
- Connect the OpenRB-150 to the Dynamixel using a TTL cable, and connect it to your computer using a USB-C cable.  
![](/assets/images/sw/dynamixel_easy_sdk/getting_started/hw_setup.jpg)

# [Move Motor to target position](#move-motor-to-targetposition)
- Create a new C++ source file named `move_motor.cpp` and open it in your favorite code editor.
```bash
touch move_motor.cpp
```

- Copy and paste the following code into the `move_motor.cpp` file.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

  int main(){
    dynamixel::Connector connector("/dev/ttyACM0", 57600);
    std::unique_ptr<dynamixel::Motor> motor1 = connector.createMotor(1);
    int target_position = 2000;
    motor1->enableTorque();
    motor1->setGoalPosition(target_position);
}
```
- Build the `move_motor.cpp` file and execute the compiled binary.
```bash
g++ -o move_motor move_motor.cpp -ldxl_x64_cpp
./move_motor
```
![](/assets/images/sw/dynamixel_easy_sdk/getting_started/move_motor.gif)
