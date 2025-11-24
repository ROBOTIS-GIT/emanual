---
layout: archive
lang: en
ref: api_reference_connector
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_easy_sdk/api_reference_connector/
tabs: "Languages"
tab_title1: Python
tab_title2: C++
sidebar:
  title: DYNAMIXEL Easy SDK
  nav: "dynamixel_easy_sdk"
---

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="connector-reference">Connector Class Reference</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

- Connector class provides methods to manage communication with DYNAMIXEL motors, including reading and writing data, creating motor instances, and handling group executions.
- It includes an PortHandler and PacketHandler for communication and creates Motor instances and GroupExecutor.

<section data-id="{{ page.tab_title1 }}" class="tab_contents">

**Connector Class**

| Method                                                 | Return Type          | Description                                                           |
| -------------------------------------------------------| ---------------------| ----------------------------------------------------------------------|
| Connector(port_name: str, baud_rate: int)              | -                    | Initializes the connector.                                            |
| createMotor(id: int)                                   | Motor                | Creates `Motor` instance for the specified ID.                        |
| createAllMotors(start_id: int = 0, end_id: int = 252)  | List[Motor]          | Creates list of all `Motor` instances within the given ID range.      |
| createGroupExecutor()                                  | GroupExecutor        | Creates `GroupExecutor` instance.                                     |
| read1Byte(motor_id: int, address: int)                 | Int                  | Reads 1byte data from the address of a specific ID.                   |
| read2Bytes(motor_id: int, address: int)                | Int                  | Reads 2byte data from the address of a specific ID.                   |
| read4Bytes(motor_id: int, address: int)                | Int                  | Reads 4byte data from the address of a specific ID.                   |
| write1Byte(motor_id: int, address: int, value: int)    | -                    | Writes 1byte data to the address of a specific ID.                    |
| write2Bytes(motor_id: int, address: int, value: int)   | -                    | Writes 2byte data to the address of a specific ID.                    |
| write4Bytes(motor_id: int, address: int, value: int)   | -                    | Writes 4byte data to the address of a specific ID.                    |
| reboot(motor_id: int)                                  | -                    | Reboots the specified motor.                                          |
| ping(motor_id: int)                                    | Int                  | Pings the specified motor.                                            |
| broadcastPing()                                        | List[int]            | Broadcast pings to all motors.                                        |
| factoryReset(motor_id: int, option: int)               | -                    | Performs factory reset on the specified motor.                        |
| closePort()                                            | -                    | Closes the communication port.                                        |


**Variables**

| Variable          | Type               | Attribute | Description                                   |
| ------------------| -------------------|-----------|-----------------------------------------------|
| _packet_handler   | PacketHandler      | class     | Underlying PacketHandler instance.            |
| _port_handler     | PortHandler        | instance  | Underlying PortHandler instance.              |

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">

**Connector Class**

| Method                                                                                   | Return Type                            | Description                                                           |
| -----------------------------------------------------------------------------------------| ---------------------------------------| ----------------------------------------------------------------------|
| Connector(const std::string & port_name, int baud_rate)                                  | -                                      | Initializes the connector.                                            |
| createMotor(uint8_t id)                                                                  | std::unique_ptr<Motor>                 | Creates `Motor` object for the specified ID.                           |
| createAllMotors(int start_id = 0, int end_id = 252)                                      | std::vector<std::unique_ptr<Motor>>    | Creates vector of all `Motor` objects within the given ID range.       |
| createGroupExecutor()                                                                    | std::unique_ptr<GroupExecutor>         | Creates `GroupExecutor` object.                                        |
| read1ByteData(uint8_t id, uint16_t address)                                              | Result<uint8_t, DxlError>              | Reads 1byte data from the address of a specific ID.                    |
| read2BytesData(uint8_t id, uint16_t address)                                             | Result<uint16_t, DxlError>             | Reads 2byte data from the address of a specific ID.                    |
| read4BytesData(uint8_t id, uint16_t address)                                             | Result<uint32_t, DxlError>             | Reads 4byte data from the address of a specific ID.                    |
| write1ByteData(uint8_t id, uint16_t address, uint8_t value)                              | Result<void, DxlError>                 | Writes 1byte data to the address of a specific ID.                     |
| write2BytesData(uint8_t id, uint16_t address, uint16_t value)                            | Result<void, DxlError>                 | Writes 2byte data to the address of a specific ID.                     |
| write4BytesData(uint8_t id, uint16_t address, uint32_t value)                            | Result<void, DxlError>                 | Writes 4byte data to the address of a specific ID.                     |
| reboot(uint8_t id)                                                                       | Result<void, DxlError>                 | Reboots the specified motor.                                           |
| ping(uint8_t id)                                                                         | Result<void, DxlError>                 | Pings the specified motor.                                             |
| broadcastPing()                                                                          | Result<std::vector<uint8_t>, DxlError> | Broadcasts ping to all motors.                                         |
| factoryReset(uint8_t id, uint8_t option)                                                 | Result<void, DxlError>                 | Performs factory reset on the specified motor.                         |
| closePort()                                                                              | Result<void, DxlError>                 | Closes the communication port.                                        |
| getPortHandler() const                                                                   | PortHandler *                          | Returns the underlying PortHandler instance.                          |
| getPacketHandler() const                                                                 | PacketHandler *                        | Returns the underlying PacketHandler instance.                        |

**Variables**

| Variable          | Type               | Attributes                          | Description                      |
| ------------------| -------------------|-------------------------------------|----------------------------------|
| packet_handler_   | PacketHandler      | Private                             | Underlying PacketHandler object. |
| port_handler_     | PortHandler        | Private                             | Underlying PortHandler object.   |

</section>