{::options parse_block_html="true" /}

- This section provides a reference for the main classes and methods available in the Dynamixel API.
  - [Connector Class](#connector-class)
  - [Control Table](#control-table)
  - [Motor Class](#motor-class)
    - [Enum Class](#enum-class)
  - [Group Executor](#group-executor)
  - [Dynamixel Error](#dynamixel-error)
    - [Result Class](#result-class)
    - [DxlError Enum](#dxlerror-enum)

# [Connector Class](#connector-class)

**Connector Class**

| Return Type                         | Method                                                                                   | Description                                                           |
| ----------------------------------- | -----------------------------------------------------------------------------------------| ----------------------------------------------------------------------|
| —                                   | Connector(const std::string & port_name, int baud_rate)          | Initializes the connector.                                            |
| std::unique_ptr<Motor>              | createMotor(uint8_t id)                                                                  | Returns a `Motor` instance for the specified ID.                      |
| std::vector<std::unique_ptr<Motor>> | createAllMotors(int start_id = 0, int end_id = 252)                                      | Returns a vector of all `Motor` instances within the given ID range.  |
| std::unique_ptr<GroupExecutor>      | createGroupExecutor()                                                                    | Closes the communication port.                                        |
| PortHandler *                       | getPortHandler() const                                                                   | Returns the underlying PortHandler instance.                          |
| PacketHandler *                     | getPacketHandler() const                                                                 | Returns the underlying PacketHandler instance.                        |
