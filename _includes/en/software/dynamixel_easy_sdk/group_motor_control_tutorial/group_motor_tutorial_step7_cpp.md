{::options parse_block_html="true" /}

# [Make cpp file](#make-cpp-file)
- Create a new C++ source file Open it with your editor.
```bash
$ touch tutorial_step7.cpp
```

# [Check the Port Names](#check-the-port-names)
- Before running the code, check the port name of the connected Dynamixel.
- For General
  - OpenRB-150: `ttyACM0: USB ACM device`
  - U2D2: `FTDI USB Serial Device converter now attached to ttyUSB0`
```bash
$ sudo dmesg | grep tty
```

# [Source Code Description](#source-code-description)

```cpp
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main(){

  dynamixel::Connector connector_leader("/dev/ttyACM1", 1000000);
  dynamixel::Connector connector_follower("/dev/ttyACM0", 1000000);
  std::unique_ptr<dynamixel::GroupExecutor> group_executor_leader = connector_leader.createGroupExecutor();
  std::unique_ptr<dynamixel::GroupExecutor> group_executor_follower = connector_follower.createGroupExecutor();

  std::unique_ptr<dynamixel::Motor> leader_motor1 = connector_leader.createMotor(1);
  std::unique_ptr<dynamixel::Motor> leader_motor2 = connector_leader.createMotor(2);
  std::unique_ptr<dynamixel::Motor> leader_motor3 = connector_leader.createMotor(3);
  std::unique_ptr<dynamixel::Motor> leader_motor4 = connector_leader.createMotor(4);
  std::unique_ptr<dynamixel::Motor> leader_motor5 = connector_leader.createMotor(5);
  std::unique_ptr<dynamixel::Motor> leader_motor_gripper = connector_leader.createMotor(6);

  std::unique_ptr<dynamixel::Motor> follower_motor1 = connector_follower.createMotor(11);
  std::unique_ptr<dynamixel::Motor> follower_motor2 = connector_follower.createMotor(12);
  std::unique_ptr<dynamixel::Motor> follower_motor3 = connector_follower.createMotor(13);
  std::unique_ptr<dynamixel::Motor> follower_motor4 = connector_follower.createMotor(14);
  std::unique_ptr<dynamixel::Motor> follower_motor5 = connector_follower.createMotor(15);
  std::unique_ptr<dynamixel::Motor> follower_motor_gripper = connector_follower.createMotor(16);

  follower_motor1->enableTorque();
  follower_motor2->enableTorque();
  follower_motor3->enableTorque();
  follower_motor4->enableTorque();
  follower_motor5->enableTorque();
  follower_motor_gripper->enableTorque();

  while(true){
    group_executor_leader->addCmd(leader_motor1->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor2->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor3->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor4->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor5->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor_gripper->stageGetPresentPosition());

    auto result = group_executor_leader->executeRead();
    group_executor_leader->clearStagedReadCommands();
    int leader_motor1_position = result.value()[0].value();
    int leader_motor2_position = result.value()[1].value();
    int leader_motor3_position = result.value()[2].value();
    int leader_motor4_position = result.value()[3].value();
    int leader_motor5_position = result.value()[4].value();
    int leader_motor_gripper_position = result.value()[5].value();

    group_executor_follower->addCmd(follower_motor1->stageSetGoalPosition(leader_motor1_position));
    group_executor_follower->addCmd(follower_motor2->stageSetGoalPosition(leader_motor2_position));
    group_executor_follower->addCmd(follower_motor3->stageSetGoalPosition(leader_motor3_position));
    group_executor_follower->addCmd(follower_motor4->stageSetGoalPosition(leader_motor4_position));
    group_executor_follower->addCmd(follower_motor5->stageSetGoalPosition(leader_motor5_position));
    group_executor_follower->addCmd(follower_motor_gripper->stageSetGoalPosition(leader_motor_gripper_position));
    auto result_void = group_executor_follower->executeWrite();
    group_executor_follower->clearStagedWriteCommands();
  }
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file. This class is included in the Dynamixel SDK package.
```cpp
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object.
- In OMX, two separate OpenRB adapters are used for the leader and follower motors, so create two `Connector` objects with different port names.
- On OMX, the default baud rate is 1,000,000.
<div class="notice--warning">
  <strong>NOTE</strong>:
- Port names may vary depending on your system configuration.
</div>

```cpp
  int main(){
    dynamixel::Connector connector_leader("/dev/ttyACM1", 1000000);
    dynamixel::Connector connector_follower("/dev/ttyACM0", 1000000);
```
- Create each `GroupExecutor` objects using the `createGroupExecutor` method of the `Connector` class.
- This object is used to execute multiple commands simultaneously.
```cpp
    std::unique_ptr<dynamixel::GroupExecutor> group_executor_leader = connector_leader.createGroupExecutor();
    std::unique_ptr<dynamixel::GroupExecutor> group_executor_follower = connector_follower.createGroupExecutor();
```
- Create a `Motor` objects for each Dynamixels, using the `createMotor` method of the `Connector` class.
- In OMX, the leader motors have IDs 1 to 6, and the follower motors have IDs 11 to 16.
```cpp
    std::unique_ptr<dynamixel::Motor> leader_motor1 = connector_leader.createMotor(1);
    std::unique_ptr<dynamixel::Motor> leader_motor2 = connector_leader.createMotor(2);
    std::unique_ptr<dynamixel::Motor> leader_motor3 = connector_leader.createMotor(3);
    std::unique_ptr<dynamixel::Motor> leader_motor4 = connector_leader.createMotor(4);
    std::unique_ptr<dynamixel::Motor> leader_motor5 = connector_leader.createMotor(5);
    std::unique_ptr<dynamixel::Motor> leader_motor_gripper = connector_leader.createMotor(6);

    std::unique_ptr<dynamixel::Motor> follower_motor1 = connector_follower.createMotor(11);
    std::unique_ptr<dynamixel::Motor> follower_motor2 = connector_follower.createMotor(12);
    std::unique_ptr<dynamixel::Motor> follower_motor3 = connector_follower.createMotor(13);
    std::unique_ptr<dynamixel::Motor> follower_motor4 = connector_follower.createMotor(14);
    std::unique_ptr<dynamixel::Motor> follower_motor5 = connector_follower.createMotor(15);
    std::unique_ptr<dynamixel::Motor> follower_motor_gripper = connector_follower.createMotor(16);
```

## [Enable Follower Torque](#enable-follower-torque)
- Enable the torque of the follower motors for teleoperation.
```cpp
    follower_motor1->enableTorque();
    follower_motor2->enableTorque();
    follower_motor3->enableTorque();
    follower_motor4->enableTorque();
    follower_motor5->enableTorque();
    follower_motor_gripper->enableTorque();
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motors simultaneously using the `stageGetPresentPosition` method and set the goal position of the follower motors simultaneously to the same value using the `stageSetGoalPosition` method.
```cpp
  while(true){
    group_executor_leader->addCmd(leader_motor1->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor2->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor3->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor4->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor5->stageGetPresentPosition());
    group_executor_leader->addCmd(leader_motor_gripper->stageGetPresentPosition());

    auto result = group_executor_leader->executeRead();
    group_executor_leader->clearStagedReadCommands();
    int leader_motor1_position = result.value()[0].value();
    int leader_motor2_position = result.value()[1].value();
    int leader_motor3_position = result.value()[2].value();
    int leader_motor4_position = result.value()[3].value();
    int leader_motor5_position = result.value()[4].value();
    int leader_motor_gripper_position = result.value()[5].value();

    group_executor_follower->addCmd(follower_motor1->stageSetGoalPosition(leader_motor1_position));
    group_executor_follower->addCmd(follower_motor2->stageSetGoalPosition(leader_motor2_position));
    group_executor_follower->addCmd(follower_motor3->stageSetGoalPosition(leader_motor3_position));
    group_executor_follower->addCmd(follower_motor4->stageSetGoalPosition(leader_motor4_position));
    group_executor_follower->addCmd(follower_motor5->stageSetGoalPosition(leader_motor5_position));
    group_executor_follower->addCmd(follower_motor_gripper->stageSetGoalPosition(leader_motor_gripper_position));
    auto result_void = group_executor_follower->executeWrite();
    group_executor_follower->clearStagedWriteCommands();
  }
}
```

# [Error Handling](#error-handling)
- To ensure your code is robust, every method that sends a command to the motor returns a **Result** object that encapsulates errors.
- This object lets you safely check for any communication or device errors before proceeding.
- executeRead() method returns **Result<std::vector<Result<int32_t, Error>>, Error>** type. So you need to check for errors twice.
- You can check for communication errors and device(dynamixel) errors using the **Result** object.

  **Example**
  ``` cpp
    auto result = group_executor->executeRead(); // type of 'result_void' variable is Result<void, DxlError>
    if (!result_void.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_void.error()) << std::endl;
      return 1;
    }
    std::vector<int> positions;
    for (const auto& result : result.value()) {
      if (!result.isSuccess()) {
        std::cerr << dynamixel::getErrorMessage(result.error()) << std::endl;
        return 1;
      }
      positions.push_back(result.value());
    }
  ```

- stage functions return **Result<void, Error>** type.
- You can either pass this value directly to the addCmd() function, or perform error checking first and then pass the resulting command value.
  **Example**
  ``` cpp
    auto result_cmd = motor1->stageGetPresentPosition(); // type of 'result_cmd' variable is Result<stagedCommand, DxlError>
    if (!result_cmd.isSuccess()) {
      std::cerr << dynamixel::getErrorMessage(result_cmd.error()) << std::endl;
      return 1;
    }
    group_executor->addCmd(result_cmd.value());
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step7.cpp -o tutorial_step7 -l dxl_x64_cpp
$ ./tutorial_step7
```
