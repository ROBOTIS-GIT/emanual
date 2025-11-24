{::options parse_block_html="true" /}

**NOTE**: It assumes that you have already installed the SDK.
{:.notice--warning}

# [Make py file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step4.py
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

    while (True):
      present_position1 = leader_motor1.getPresentPosition()
      present_position2 = leader_motor2.getPresentPosition()
      present_position3 = leader_motor3.getPresentPosition()
      present_position4 = leader_motor4.getPresentPosition()
      present_position5 = leader_motor5.getPresentPosition()
      present_position_gripper = leader_motor_gripper.getPresentPosition()
      try:
          follower_motor1.setGoalPosition(present_position1)
          follower_motor2.setGoalPosition(present_position2)
          follower_motor3.setGoalPosition(present_position3)
          follower_motor4.setGoalPosition(present_position4)
          follower_motor5.setGoalPosition(present_position5)
          follower_motor_gripper.setGoalPosition(present_position_gripper)
      except DxlRuntimeError as e:
          print(e)
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
- In a loop, read the present position of the leader motors using the `getPresentPosition` method and set the goal position of the follower motors to the same value using the `setGoalPosition` method.
- Handle DxlRuntimeError that occurs when position limit is exceeded.
```python
    while True:
      present_position1 = leader_motor1.getPresentPosition()
      present_position2 = leader_motor2.getPresentPosition()
      present_position3 = leader_motor3.getPresentPosition()
      present_position4 = leader_motor4.getPresentPosition()
      present_position5 = leader_motor5.getPresentPosition()
      present_position_gripper = leader_motor_gripper.getPresentPosition()

      try:
          follower_motor1.setGoalPosition(present_position1)
          follower_motor2.setGoalPosition(present_position2)
          follower_motor3.setGoalPosition(present_position3)
          follower_motor4.setGoalPosition(present_position4)
          follower_motor5.setGoalPosition(present_position5)
          follower_motor_gripper.setGoalPosition(present_position_gripper)
      except DxlRuntimeError as e:
          print(e)
```
