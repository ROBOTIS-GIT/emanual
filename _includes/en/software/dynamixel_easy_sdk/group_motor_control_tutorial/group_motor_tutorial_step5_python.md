{::options parse_block_html="true" /}

# [Make Python file](#make-py-file)
- Create a new Python source file Open it with your editor.
```bash
$ touch tutorial_step5.py
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

    ids = [1, 2]

    # Turn off torque
    connector.createWriter(ids, "Torque_Enable", 0).write()
    
    # Set Operating Mode (Position Control)
    connector.createWriter(ids, "Operating_Mode", OperatingMode.POSITION).write()
    
    # Turn on torque
    connector.createWriter(ids, "Torque_Enable", 1).write()

    target_position = 500
    connector.createWriter(ids, "Goal_Position", target_position).write()

if __name__ == "__main__":
    main()
```

## [Import Library](#import-library)
- Import `dynamixel_easy_sdk`.
```python
  from dynamixel_easy_sdk import *
```

## [Create Connector](#create-connector)
- Create a `Connector` object with port name and baud rate to manage the communication.
```python
  def main():
      connector = Connector("/dev/ttyACM0", 57600)
```

## [Set Operating Mode to Position Control Mode](#set-operating-mode-to-position-control-mode)
- Prepare a list of motor IDs to control simultaneously.
```python
      ids = [1, 2]
```
- Use `createWriter()` with the ID list to configure multiple motors at once.
- You can chain `write()` immediately for concise code.
```python
      # Turn off torque
      connector.createWriter(ids, "Torque_Enable", 0).write()
      
      # Set Operating Mode (Position Control)
      connector.createWriter(ids, "Operating_Mode", OperatingMode.POSITION).write()
      
      # Turn on torque
      connector.createWriter(ids, "Torque_Enable", 1).write()
```

## [Move Motor to Goal Position](#move-motor-to-goal-position)
- Send the goal position to all motors in the list.
```python
      target_position = 500
      connector.createWriter(ids, "Goal_Position", target_position).write()
```
- This method decides the communication packet type automatically between Sync and Bulk.

# [Error Handling](#error-handling)
- When an error occurs, `DxlRuntimeError` is raised.
- You can catch this error using a try-except block.
```python
  try:
      connector.createWriter(ids, "Goal_Position", target_position).write()
  except DxlRuntimeError as e:
      print(e)
```
