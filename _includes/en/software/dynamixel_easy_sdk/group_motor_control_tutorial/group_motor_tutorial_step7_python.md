{::options parse_block_html="true" /}

# [Make py file](#make-cpp-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step7.py
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

```python
from dynamixel_easy_sdk import *

def main():

    connector_leader = Connector("/dev/ttyACM1", 1000000)
    connector_follower = Connector("/dev/ttyACM0", 1000000)
    group_executor_leader = connector_leader.createGroupExecutor()
    group_executor_follower = connector_follower.createGroupExecutor()

    leader_motor1 = connector_leader.createMotor(1)
    leader_motor2 = connector_leader.createMotor(2)
    leader_motor3 = connector_leader.createMotor(3)
    leader_motor4 = connector_leader.createMotor(4)
    leader_motor5 = connector_leader.createMotor(5)
    leader_motor_gripper = connector_leader.createMotor(6)

    follower_motor1 = connector_follower.createMotor(11)
    follower_motor2 = connector_follower.createMotor(12)
    follower_motor3 = connector_follower.createMotor(13)
    follower_motor4 = connector_follower.createMotor(14)
    follower_motor5 = connector_follower.createMotor(15)
    follower_motor_gripper = connector_follower.createMotor(16)

    follower_motor1.enableTorque()
    follower_motor2.enableTorque()
    follower_motor3.enableTorque()
    follower_motor4.enableTorque()
    follower_motor5.enableTorque()
    follower_motor_gripper.enableTorque()

    while True:
      group_executor_leader.addCmd(leader_motor1.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor2.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor3.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor4.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor5.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor_gripper.stageGetPresentPosition())

      leader_motor_positions = group_executor_leader.executeRead()
      group_executor_leader.clearStagedReadCommands()
      leader_motor1_position = leader_motor_positions[0]
      leader_motor2_position = leader_motor_positions[1]
      leader_motor3_position = leader_motor_positions[2]
      leader_motor4_position = leader_motor_positions[3]
      leader_motor5_position = leader_motor_positions[4]
      leader_motor_gripper_position = leader_motor_positions[5]

      group_executor_follower.addCmd(follower_motor1.stageSetGoalPosition(leader_motor1_position))
      group_executor_follower.addCmd(follower_motor2.stageSetGoalPosition(leader_motor2_position))
      group_executor_follower.addCmd(follower_motor3.stageSetGoalPosition(leader_motor3_position))
      group_executor_follower.addCmd(follower_motor4.stageSetGoalPosition(leader_motor4_position))
      group_executor_follower.addCmd(follower_motor5.stageSetGoalPosition(leader_motor5_position))
      group_executor_follower.addCmd(follower_motor_gripper.stageSetGoalPosition(leader_motor_gripper_position))
      group_executor_follower.executeWrite()
      group_executor_follower.clearStagedWriteCommands()

if __name__ == "__main__":
    main()
```

## [Import Library](#import-library)
- Import `dynamixel_easy_sdk`.
```python
  from dynamixel_easy_sdk import *
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object.
- In OMX, two separate OpenRB adapters are used for the leader and follower motors, so create two `Connector` objects with different port names.
- On OMX, the default baud rate is 1,000,000.
<div class="notice--warning">
  <strong>NOTE</strong>:
- Port names may vary depending on your system configuration.
</div>

```python
  def main():
      connector_leader = Connector("/dev/ttyACM1", 1000000)
      connector_follower = Connector("/dev/ttyACM0", 1000000)
```
- Create each `GroupExecutor` objects using the `createGroupExecutor` method of the `Connector` class.
- This object is used to execute multiple commands simultaneously.
```python
    group_executor_leader = connector_leader.createGroupExecutor()
    group_executor_follower = connector_follower.createGroupExecutor()
```
- Create a `Motor` objects for each Dynamixels, using the `createMotor` method of the `Connector` class.
- In OMX, the leader motors have IDs 1 to 6, and the follower motors have IDs 11 to 16.
```python
    leader_motor1 = connector_leader.createMotor(1)
    leader_motor2 = connector_leader.createMotor(2)
    leader_motor3 = connector_leader.createMotor(3)
    leader_motor4 = connector_leader.createMotor(4)
    leader_motor5 = connector_leader.createMotor(5)
    leader_motor_gripper = connector_leader.createMotor(6)

    follower_motor1 = connector_follower.createMotor(11)
    follower_motor2 = connector_follower.createMotor(12)
    follower_motor3 = connector_follower.createMotor(13)
    follower_motor4 = connector_follower.createMotor(14)
    follower_motor5 = connector_follower.createMotor(15)
    follower_motor_gripper = connector_follower.createMotor(16)
```

## [Enable Follower Torque](#enable-follower-torque)
- Enable the torque of the follower motors for teleoperation.
```python
    follower_motor1.enableTorque()
    follower_motor2.enableTorque()
    follower_motor3.enableTorque()
    follower_motor4.enableTorque()
    follower_motor5.enableTorque()
    follower_motor_gripper.enableTorque()
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motors simultaneously using the `stageGetPresentPosition` method and set the goal position of the follower motors simultaneously to the same value using the `stageSetGoalPosition` method.
```python
    while True:
      group_executor_leader.addCmd(leader_motor1.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor2.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor3.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor4.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor5.stageGetPresentPosition())
      group_executor_leader.addCmd(leader_motor_gripper.stageGetPresentPosition())

      leader_motor_positions = group_executor_leader.executeRead()
      group_executor_leader.clearStagedReadCommands()
      leader_motor1_position = leader_motor_positions[0]
      leader_motor2_position = leader_motor_positions[1]
      leader_motor3_position = leader_motor_positions[2]
      leader_motor4_position = leader_motor_positions[3]
      leader_motor5_position = leader_motor_positions[4]
      leader_motor_gripper_position = leader_motor_positions[5]

      group_executor_follower.addCmd(follower_motor1.stageSetGoalPosition(leader_motor1_position))
      group_executor_follower.addCmd(follower_motor2.stageSetGoalPosition(leader_motor2_position))
      group_executor_follower.addCmd(follower_motor3.stageSetGoalPosition(leader_motor3_position))
      group_executor_follower.addCmd(follower_motor4.stageSetGoalPosition(leader_motor4_position))
      group_executor_follower.addCmd(follower_motor5.stageSetGoalPosition(leader_motor5_position))
      group_executor_follower.addCmd(follower_motor_gripper.stageSetGoalPosition(leader_motor_gripper_position))
      group_executor_follower.executeWrite()
      group_executor_follower.clearStagedWriteCommands()
```
