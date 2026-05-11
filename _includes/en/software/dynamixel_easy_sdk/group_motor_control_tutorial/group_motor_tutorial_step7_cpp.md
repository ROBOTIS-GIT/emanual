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
#include <iostream>
#include <vector>
#include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"

int main() {
  dynamixel::Connector connector_leader("/dev/ttyACM1", 1000000);
  dynamixel::Connector connector_follower("/dev/ttyACM0", 1000000);
  
  std::vector<uint8_t> leader_ids = {1, 2, 3, 4, 5, 6};
  std::vector<uint8_t> follower_ids = {11, 12, 13, 14, 15, 16};

  // Enable Torque for Follower
  connector_follower.createWriter()->add(follower_ids, "Torque_Enable", 1).write_or_throw();

  auto leader_reader = connector_leader.createReader(leader_ids, "Present_Position", "position");
  auto follower_writer = connector_follower.createWriter(follower_ids, "Goal_Position");

  while(true){
    auto result = leader_reader->read_or_throw();

    follower_writer->write({
        result[1]["position"],
        result[2]["position"],
        result[3]["position"],
        result[4]["position"],
        result[5]["position"],
        result[6]["position"]
    });
  }
}
```

## [Add Header Files](#add-header-files)
- Add `dynamixel_easy_sdk/dynamixel_easy_sdk.hpp` to the top of your CPP file.
- Add `<iostream>` and `<vector>` for standard I/O and container operations.
```cpp
  #include <iostream>
  #include <vector>
  #include "dynamixel_easy_sdk/dynamixel_easy_sdk.hpp"
```

## [Create Connector](#create-connector)
- Create a `Connector` object. In OMX, two separate OpenRB adapters are used for the leader and follower motors.
<div class="notice--warning">
  <strong>NOTE</strong>:
- Port names may vary depending on your system configuration.
</div>

```cpp
  int main(){
    dynamixel::Connector connector_leader("/dev/ttyACM1", 1000000);
    dynamixel::Connector connector_follower("/dev/ttyACM0", 1000000);
```

## [Enable Follower Torque](#enable-follower-torque)
- Prepare a list of follower motor IDs (11 to 16 for OMX).
```cpp
    std::vector<uint8_t> follower_ids = {11, 12, 13, 14, 15, 16};
```
- Enable the torque of the follower motors in batch using `createWriter()->add()`.
```cpp
    connector_follower.createWriter()->add(follower_ids, "Torque_Enable", 1).write_or_throw();
```

## [Leader and Follower Control Loop](#leader-and-follower-control-loop)
- Create `SmartGroupReader` for leader and `SmartGroupWriter` for follower.
- We set the key alias to "position" for easier access.
```cpp
    std::vector<uint8_t> leader_ids = {1, 2, 3, 4, 5, 6};
    auto leader_reader = connector_leader.createReader(leader_ids, "Present_Position", "position");
    auto follower_writer = connector_follower.createWriter(follower_ids, "Goal_Position");
```
- In a loop, read leader positions and write to follower motors using Short Form API.
```cpp
  while(true){
    auto result = leader_reader->read_or_throw();

    follower_writer->write({
        result[1]["position"],
        result[2]["position"],
        result[3]["position"],
        result[4]["position"],
        result[5]["position"],
        result[6]["position"]
    });
  }
```

# [Error Handling](#error-handling)
- `read_or_throw()` throws a `dynamixel::DxlError` exception if the communication fails.
- You can use a `try-catch` block to handle these exceptions gracefully and simplify the control flow.

  **Example**
  ``` cpp
    try {
      auto result = reader->read_or_throw();
      // success
    } catch (const dynamixel::DxlError& e) {
      std::cerr << "Error: " << e.what() << std::endl;
      return 1;
    }
  ```

# [Compile and Run](#compile-and-run)
- You can compile and run the code using the following commands
```bash
$ g++ tutorial_step7.cpp -o tutorial_step7 -ldxl_cpp
$ ./tutorial_step7
```
