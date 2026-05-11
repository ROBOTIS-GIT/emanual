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
    
    # Initialize Reader and Writer with Short Form
    group_reader = connector_leader.createReader([1, 2, 3, 4, 5, 6], "Present_Position", ["pos1", "pos2", "pos3", "pos4", "pos5", "pos6"])
    group_writer = connector_follower.createWriter([11, 12, 13, 14, 15, 16], "Goal_Position")

    # Enable Torque for Follower using Short Form
    connector_follower.createWriter([11, 12, 13, 14, 15, 16], "Torque_Enable", 1).write()

    while True:
      try:
        group_reader.read()
        
        # Use Short Form Write with list of values
        group_writer.write([
            group_reader.get("pos1"),
            group_reader.get("pos2"),
            group_reader.get("pos3"),
            group_reader.get("pos4"),
            group_reader.get("pos5"),
            group_reader.get("pos6")
        ])
      except DxlError as e:
        print(f"Error: {e}")

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
- Create a `SmartGroupReader` and `SmartGroupWriter` objects using the `createReader` and `createWriter` method of the `Connector` class.
- You can initialize them with a list of IDs, an Item Name, and Keys (for Reader).
```python
      # Initialize Reader and Writer with Short Form
      group_reader = connector_leader.createReader([1, 2, 3, 4, 5, 6], "Present_Position", ["pos1", "pos2", "pos3", "pos4", "pos5", "pos6"])
      group_writer = connector_follower.createWriter([11, 12, 13, 14, 15, 16], "Goal_Position")
```

## [Enable Follower Torque](#enable-follower-torque)
- Enable the torque of the follower motors in batch using `createWriter`.
```python
      # Enable Torque for Follower using Short Form
      connector_follower.createWriter([11, 12, 13, 14, 15, 16], "Torque_Enable", 1).write()
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- In a loop, read the present position of the leader motors simultaneously using the `read` method and set the goal position of the follower motors simultaneously to the same value using the `write` method.
- Use `try-except` block to handle communication errors.
```python
    while True:
      try:
        group_reader.read()
        
        # Use Short Form Write with list of values
        group_writer.write([
            group_reader.get("pos1"),
            group_reader.get("pos2"),
            group_reader.get("pos3"),
            group_reader.get("pos4"),
            group_reader.get("pos5"),
            group_reader.get("pos6")
        ])
      except DxlError as e:
        print(f"Error: {e}")
```