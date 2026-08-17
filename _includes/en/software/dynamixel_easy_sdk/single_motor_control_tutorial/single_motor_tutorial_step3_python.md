{::options parse_block_html="true" /}

**NOTE**: It assumes that you have already installed and built the SDK.
{:.notice--warning}

# [Make py file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step3.py
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
    connector = Connector("/dev/ttyACM0", 57600)
    
    leader_motor = connector.createMotor(1)
    follower_motor = connector.createMotor(2)

    min_position = leader_motor.getMinPositionLimit() + 100
    max_position = leader_motor.getMaxPositionLimit() - 100

    leader_motor.disableTorque()
    follower_motor.disableTorque()
    
    follower_motor.setOperatingMode(OperatingMode.POSITION)
    follower_motor.enableTorque()

    while True:
        present_position = leader_motor.getPresentPosition()
        print(f"Leader Position: {present_position}     ", end='\r')

        under_limit = present_position < min_position
        over_limit = present_position > max_position

        if under_limit or over_limit:
            target_position = min_position if under_limit else max_position
            
            leader_motor.enableTorque()
            leader_motor.setGoalPosition(target_position)

            while True:
                present_position = leader_motor.getPresentPosition()
                follower_motor.setGoalPosition(target_position)

                if (under_limit and present_position >= min_position) or \
                   (over_limit and present_position <= max_position):
                    break
            
            leader_motor.disableTorque()
        else:
            follower_motor.setGoalPosition(present_position)

if __name__ == "__main__":
    main()
```

## [Import Library](#import-library)
- Import `dynamixel_easy_sdk`.
```python
  from dynamixel_easy_sdk import *
```

## [Create Connector and Motor Object](#create-connector-and-motor-object)
- Create a `Connector` object with port name and baud rate to manage the communication.
```python
  def main():
      connector = Connector("/dev/ttyACM0", 57600)
```
- Create a `Motor` object for each Dynamixel servo you want to control with its ID, using the `createMotor` method of the `Connector` class.
- Create motor objects while carefully distinguishing between the leader and follower IDs.
```python
      leader_motor = connector.createMotor(1)
      follower_motor = connector.createMotor(2)
```

## [Set Position Limits](#set-position-limits)
- Get the position limits of the leader motor using the `getMinPositionLimit` and `getMaxPositionLimit` methods.
```python
      min_position = leader_motor.getMinPositionLimit() + 100
      max_position = leader_motor.getMaxPositionLimit() - 100
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Use the methods provided by the `Motor` class to control the Dynamixel servo.
- Set the operating mode of follower motor to position control mode.
```python
      leader_motor.disableTorque()
      follower_motor.disableTorque()
      follower_motor.setOperatingMode(OperatingMode.POSITION)
      follower_motor.enableTorque()
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motor using the `getPresentPosition` method.
```python
      while True:
          present_position = leader_motor.getPresentPosition()
          print(f"Leader Position: {present_position}     ", end='\r')
```
- If the leader motor's position exceeds the defined range, move it back within the range.
- Follower motor always tracks the leader motor's position.
```python
          under_limit = present_position < min_position
          over_limit = present_position > max_position

          if under_limit or over_limit:
              target_position = min_position if under_limit else max_position
              
              leader_motor.enableTorque()
              leader_motor.setGoalPosition(target_position)

              while True:
                  present_position = leader_motor.getPresentPosition()
                  follower_motor.setGoalPosition(target_position)

                  if (under_limit and present_position >= min_position) or \
                     (over_limit and present_position <= max_position):
                      break
              
              leader_motor.disableTorque()
          else:
              follower_motor.setGoalPosition(present_position)
```

# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
- The exception message automatically provides a description of the error.
```python
  try:
      leader_motor.getPresentPosition()
  except DxlRuntimeError as e:
      # e.g.) [TxRxResult] Failed to get status packet from device
      print(e)
```
- If you need to handle specific errors programmatically, you can check the `dxl_error` property.
```python
  try:
      leader_motor.getPresentPosition()
  except DxlRuntimeError as e:
      if e.dxl_error == DxlError.SDK_COMM_RX_FAIL:
          # Handle specific communication error retry logic
          pass
      print(e)
```
