---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_matlab_multi_port_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/matlab_multi_port_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 18"></div>
<div style="counter-reset: h3 1"></div>

# [Sample Code](#sample-code)

## [MATLAB Protocol 2.0](#matlab-protocol-20)

### [Matlab Multi Port Protocol 2.0](#matlab-multi-port-protocol-20)

- Description

  This example writes goal position to Dynamixels connected to two serial ports, and reads their present position until Dynamixel stops moving.

- Available Dynamixel

  All series using protocol 2.0

- Code


``` m
%
% multi_port.m
%
%  Created on: 2016. 6. 7.
%      Author: Ryu Woon Jung (Leon)
%

%
% *********     MultiPort Example      *********
%
%
% Available Dynamixel model on this example : All models using Protocol 2.0
% This example is designed for using two Dynamixel PRO 54-200, and two USB2DYNAMIXELs.
% To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below variables yourself.
% Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000)
%

clc;
clear all;

% Load Libraries
if ~libisloaded('dxl_x86_c');
  [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end

% Control table address
ADDR_PRO_TORQUE_ENABLE       = 562;         % Control table address is different in Dynamixel model
ADDR_PRO_GOAL_POSITION       = 596;
ADDR_PRO_PRESENT_POSITION    = 611;

% Protocol version
PROTOCOL_VERSION            = 2.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL1_ID                     = 1;            % Dynamixel#1 ID: 1
DXL2_ID                     = 2;            % Dynamixel#2 ID: 2
BAUDRATE                    = 1000000;
DEVICENAME1                 = 'COM1';       % Check which port is being used on your controller
DEVICENAME2                 = 'COM2';       % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

TORQUE_ENABLE               = 1;            % Value for enabling the torque
TORQUE_DISABLE              = 0;            % Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = -150000;      % Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 150000;       % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 10;           % Dynamixel moving status threshold

ESC_CHARACTER               = 'e';          % Key for escaping loop

COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num1 = portHandler(DEVICENAME1);
port_num2 = portHandler(DEVICENAME2);

% Initialize PacketHandler Structs
packetHandler();

index = 1;
dxl_comm_result = COMM_TX_FAIL;             % Communication result
dxl_goal_position = [DXL_MINIMUM_POSITION_VALUE DXL_MAXIMUM_POSITION_VALUE];         % Goal position

dxl_error = 0;                              % Dynamixel error
dxl1_present_position = 0;                  % Present position
dxl2_present_position = 0;

% Open port1
if (openPort(port_num1))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end

% Open port2
if (openPort(port_num2))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end


% Set port1 baudrate
if (setBaudRate(port_num1, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set port2 baudrate
if (setBaudRate(port_num2, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end


% Enable Dynamixel#1 Torque
write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
else
    fprintf('Dynamixel has been successfully connected \n');
end

% Enable Dynamixel#2 Torque
write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
else
    fprintf('Dynamixel has been successfully connected \n');
end


while 1
    if input('Press any key to continue! (or input e to quit!)\n', 's') == ESC_CHARACTER
        break;
    end

    % Write Dynamixel#1 goal position
    write4ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
    elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
        printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
    end

    % Write Dynamixel#2 goal position
    write4ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
    elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
        printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
    end

    while 1
      % Read Dynamixel#1 present position
      dxl1_present_position = read4ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
      elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
          printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
      end

      % Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
      elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
          printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
      end

      fprintf('[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d\n', DXL1_ID, dxl_goal_position(index), typecast(uint32(dxl1_present_position), 'int32'), DXL2_ID, dxl_goal_position(index), typecast(uint32(dxl2_present_position), 'int32'));

      if ~((abs(dxl_goal_position(index) - typecast(uint32(dxl1_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD) || (abs(dxl_goal_position(index) - typecast(uint32(dxl2_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD))
          break;
      end
    end

    % Change goal position
    if index == 1
        index = 2;
    else
        index = 1;
    end
end


% Disable Dynamixel#1 Torque
write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
end

% Disable Dynamixel#2 Torque
write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
end

% Close port1
closePort(port_num1);

% Close port2
closePort(port_num2);

% Unload Library
unloadlibrary('dxl_x86_c');

close all;
clear all;
```

-------------------------------------------------------------------------------------

- Details

``` m
% Load Libraries
if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end
```

This example uses dynamixel library imported by `loadlibrary()`.

``` m
% Control table address
ADDR_PRO_TORQUE_ENABLE       = 562;         % Control table address is different in Dynamixel model
ADDR_PRO_GOAL_POSITION       = 596;
ADDR_PRO_PRESENT_POSITION    = 611;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` m
% Protocol version
PROTOCOL_VERSION            = 2.0;          % See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` m
% Default setting
DXL1_ID                     = 1;            % Dynamixel#1 ID: 1
DXL2_ID                     = 2;            % Dynamixel#2 ID: 2
BAUDRATE                    = 1000000;
DEVICENAME1                 = 'COM1';       % Check which port is being used on your controller
DEVICENAME2                 = 'COM2';       % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

TORQUE_ENABLE               = 1;            % Value for enabling the torque
TORQUE_DISABLE              = 0;            % Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = -150000;      % Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 150000;       % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 10;           % Dynamixel moving status threshold

ESC_CHARACTER               = 'e';          % Key for escaping loop
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

The example uses two Dynamixels `DXL1_ID`, `DXL2_ID` connected with each ports `DEVICENAME1`, `DEVICENAME2`

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

``` m
COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

``` m
% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num1 = portHandler(DEVICENAME1);
port_num2 = portHandler(DEVICENAME2);
```

`portHandler()` function sets port path as `DEVICENAME1` and `DEVICENAME2` and get `port_num1` and `port_num2` each, and prepares an appropriate functions for port control in controller OS automatically. `port_num1` and `port_num2` would be used in many functions in the body of the code to specify the port for use.

``` m
% Initialize PacketHandler Structs
packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` m
index = 1;
dxl_comm_result = COMM_TX_FAIL;             % Communication result
dxl_goal_position = [DXL_MINIMUM_POSITION_VALUE DXL_MAXIMUM_POSITION_VALUE];         % Goal position

dxl_error = 0;                              % Dynamixel error
dxl1_present_position = 0;                  % Present position
dxl2_present_position = 0;
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` view where now each Dynamixel points out.

``` m
% Open port1
if (openPort(port_num1))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end

% Open port2
if (openPort(port_num2))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end
```

First, controller opens #`port_num1` and #`port_num2` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` m
% Set port1 baudrate
if (setBaudRate(port_num1, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set port2 baudrate
if (setBaudRate(port_num2, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num1` and #`port_num2` port opened previously.

``` m
% Enable Dynamixel#1 Torque
write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
else
    fprintf('Dynamixel has been successfully connected \n');
end

% Enable Dynamixel#2 Torque
write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
else
    fprintf('Dynamixel has been successfully connected \n');
end
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
while 1
    if input('Press any key to continue! (or input e to quit!)\n', 's') == ESC_CHARACTER
        break;
    end

    % Write Dynamixel#1 goal position
    write4ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
    elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
        printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
    end

    % Write Dynamixel#2 goal position
    write4ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
    elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
        printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
    end

    while 1
      % Read Dynamixel#1 present position
      dxl1_present_position = read4ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
      elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
          printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
      end

      % Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
      elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
          printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
      end

      fprintf('[ID:%03d] GoalPos:%03d  PresPos:%03d\t[ID:%03d] GoalPos:%03d  PresPos:%03d\n', DXL1_ID, dxl_goal_position(index), typecast(uint32(dxl1_present_position), 'int32'), DXL2_ID, dxl_goal_position(index), typecast(uint32(dxl2_present_position), 'int32'));

      if ~((abs(dxl_goal_position(index) - typecast(uint32(dxl1_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD) || (abs(dxl_goal_position(index) - typecast(uint32(dxl2_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD))
          break;
      end
    end

    % Change goal position
    if index == 1
        index = 2;
    else
        index = 1;
    end
end
```

During `while` loop, the controller writes and reads each Dynamixel position through packet transmission/reception(Tx/Rx).

To continue their rotation, press any key except ESC.

`write4ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 4 byte of `dxl_goal_position[index]` value to `ADDR_PRO_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read4ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, requesting 4 bytes of value in `ADDR_PRO_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading their present position will be ended when absolute value of `(dxl1_goal_position[index] - dxl1_present_position)` or `(dxl2_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes their direction to the counter-wise and waits for extra key input.

``` m
% Disable Dynamixel#1 Torque
write1ByteTxRx(port_num1, PROTOCOL_VERSION, DXL1_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num1, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num1, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num1, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num1, PROTOCOL_VERSION));
end

% Disable Dynamixel#2 Torque
write1ByteTxRx(port_num2, PROTOCOL_VERSION, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num2, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num2, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num2, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num2, PROTOCOL_VERSION));
end
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in `PROTOCOL_VERSION` communication protocol through #`port_num1` and #`port_num2` ports, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
% Close port1
closePort(port_num1);

% Close port2
closePort(port_num2);
```

Finally, ports become disposed.

``` m
% Unload Library
unloadlibrary('dxl_x86_c');
```

Unload the library to make it reaccessible.
