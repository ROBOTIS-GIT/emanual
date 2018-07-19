---
layout: archive
lang: en
ref: matlab_protocol_combined
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/matlab_protocol_combined/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 19"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
<![end dummy Header 1]-->

## [Matlab Protocol Combined](#matlab-protocol-combined)

- Description

  This example, basically, writes the goal position of Dynamixel and repeats to read its present position, until it stops moving. Read and write function can be used even to handle other multiple items in nearby addresses on the control table lists, such as goal position and velocity.

- Available Dynamixel model

  All models using protocol 1.0 and 2.0


### Sample code


``` m
%
% protocol_combined.c
%
%  Created on: 2016. 6. 7.
%      Author: Ryu Woon Jung (Leon)
%

%
% *********     Protocol Combined Example      *********
%
%
% Available Dynamixel model on this example : All models using Protocol 1.0 and 2.0
% This example is tested with a Dynamixel MX-28, a Dynamixel PRO 54-200 and an USB2DYNAMIXEL
% Be sure that properties of Dynamixel MX and PRO are already set as %% MX - ID : 1 / Baudnum : 1 (Baudrate : 1000000) , PRO - ID : 1 / Baudnum : 3 (Baudrate : 1000000)
%

% Be aware that:
% This example configures two different control tables (especially, if it uses Dynamixel and Dynamixel PRO). It may modify critical Dynamixel parameter on the control table, if Dynamixels have wrong ID.
%

clc;
clear all;

% Load Libraries
if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end

% Control table address for Dynamixel MX
ADDR_MX_TORQUE_ENABLE           = 24;             % Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION           = 30;
ADDR_MX_PRESENT_POSITION        = 36;

% Control table address for Dynamixel PRO
ADDR_PRO_TORQUE_ENABLE          = 562;
ADDR_PRO_GOAL_POSITION          = 596;
ADDR_PRO_PRESENT_POSITION       = 611;

% Protocol version
PROTOCOL_VERSION1               = 1.0;            % See which protocol version is used in the Dynamixel
PROTOCOL_VERSION2               = 2.0;

% Default setting
DXL1_ID                         = 1;              % Dynamixel#1 ID: 1
DXL2_ID                         = 2;              % Dynamixel#2 ID: 2
BAUDRATE                        = 1000000;
DEVICENAME                      = 'COM1';         % Check which port is being used on your controller
                                                  % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0'

TORQUE_ENABLE                   = 1;              % Value for enabling the torque
TORQUE_DISABLE                  = 0;              % Value for disabling the torque
DXL1_MINIMUM_POSITION_VALUE     = 100;            % Dynamixel will rotate between this value
DXL1_MAXIMUM_POSITION_VALUE     = 4000;           % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL2_MINIMUM_POSITION_VALUE     = -150000;
DXL2_MAXIMUM_POSITION_VALUE     = 150000;
DXL1_MOVING_STATUS_THRESHOLD    = 10;             % Dynamixel MX moving status threshold
DXL2_MOVING_STATUS_THRESHOLD    = 20;             % Dynamixel PRO moving status threshold

ESC_CHARACTER                   = 'e';            % Key for escaping loop

COMM_SUCCESS                    = 0;              % Communication Success result value
COMM_TX_FAIL                    = -1001;          % Communication Tx Failed


% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);

% Initialize PacketHandler Structs
packetHandler();

index = 1;
dxl_comm_result = COMM_TX_FAIL;                   % Communication result
dxl1_goal_position = [DXL1_MINIMUM_POSITION_VALUE DXL1_MAXIMUM_POSITION_VALUE];         % Goal position of Dynamixel MX
dxl2_goal_position = [DXL2_MINIMUM_POSITION_VALUE DXL2_MAXIMUM_POSITION_VALUE];         % Goal position of Dynamixel PRO

dxl_error = 0;                                    % Dynamixel error
dxl1_present_position = 0;                        % Present position of Dynamixel MX
dxl2_present_position = 0;                        % Present position of Dynamixel PRO

% Open port
if (openPort(port_num))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end


% Set port baudrate
if (setBaudRate(port_num, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end


% Enable Dynamixel#1 torque
write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
    printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
else
    fprintf('Dynamixel #%d has been successfully connected \n', DXL1_ID);
end

% Enable Dynamixel#2 torque
write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
    printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
else
    fprintf('Dynamixel #%d has been successfully connected \n', DXL2_ID);
end


while 1
    if input('Press any key to continue! (or input e to quit!)\n', 's') == ESC_CHARACTER
        break;
    end

    % Write Dynamixel#1 goal position
    write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position(index));
    if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
    elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
        printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
    end

    % Write Dynamixel#2 goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl2_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
    elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
        printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
    end

    while 1
      % Read Dynamixel#1 present position
    	dxl1_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
      elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
          printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
      end

      % Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
      elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
          printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
      end

      fprintf('[ID:%03d] GoalPos:%03d  PresPos:%03d [ID:%03d] GoalPos:%03d  PresPos:%03d\n', DXL1_ID, dxl1_goal_position(index), dxl1_present_position, DXL2_ID, dxl2_goal_position(index), typecast(uint32(dxl2_present_position), 'int32'));

      if ~((abs(dxl1_goal_position(index) - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position(index) - typecast(uint32(dxl2_present_position), 'int32')) > DXL2_MOVING_STATUS_THRESHOLD));
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
  write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
    printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
end

  % Disable Dynamixel#2 Torque
  write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
    printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
end


% Close port
closePort(port_num);

% Unload Library
unloadlibrary('dxl_x86_c');

close all;
clear all;
```



### Details

``` m
% Load Libraries
if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end
```

This example uses dynamixel library imported by `loadlibrary()`.

``` m
% Control table address for Dynamixel MX
ADDR_MX_TORQUE_ENABLE           = 24;             % Control table address is different in Dynamixel model
ADDR_MX_GOAL_POSITION           = 30;
ADDR_MX_PRESENT_POSITION        = 36;

% Control table address for Dynamixel PRO
ADDR_PRO_TORQUE_ENABLE          = 562;
ADDR_PRO_GOAL_POSITION          = 596;
ADDR_PRO_PRESENT_POSITION       = 611;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` m
% Protocol version
PROTOCOL_VERSION1               = 1.0;            % See which protocol version is used in the Dynamixel
PROTOCOL_VERSION2               = 2.0;
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` m
% Default setting
DXL1_ID                         = 1;              % Dynamixel#1 ID: 1
DXL2_ID                         = 2;              % Dynamixel#2 ID: 2
BAUDRATE                        = 1000000;
DEVICENAME                      = 'COM1';         % Check which port is being used on your controller
                                                  % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0'

TORQUE_ENABLE                   = 1;              % Value for enabling the torque
TORQUE_DISABLE                  = 0;              % Value for disabling the torque
DXL1_MINIMUM_POSITION_VALUE     = 100;            % Dynamixel will rotate between this value
DXL1_MAXIMUM_POSITION_VALUE     = 4000;           % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL2_MINIMUM_POSITION_VALUE     = -150000;
DXL2_MAXIMUM_POSITION_VALUE     = 150000;
DXL1_MOVING_STATUS_THRESHOLD    = 10;             % Dynamixel MX moving status threshold
DXL2_MOVING_STATUS_THRESHOLD    = 20;             % Dynamixel PRO moving status threshold

ESC_CHARACTER                   = 'e';            % Key for escaping loop
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/dynamixel/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped.

``` m
COMM_SUCCESS                    = 0;              % Communication Success result value
COMM_TX_FAIL                    = -1001;          % Communication Tx Failed
```

Each of the variables above show the meaning of the communication result value.

``` m
% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);
```

`portHandler()` function sets port path as `DEVICENAME` and get `port_num`, and prepares an appropriate functions for port control in controller OS automatically. `port_num` would be used in many functions in the body of the code to specify the port for use.

``` m
% Initialize PacketHandler Structs
packetHandler();
```

`packetHandler()` function initializes parameters used for packet construction and packet storing.

``` m
index = 1;
dxl_comm_result = COMM_TX_FAIL;                   % Communication result
dxl1_goal_position = [DXL1_MINIMUM_POSITION_VALUE DXL1_MAXIMUM_POSITION_VALUE];         % Goal position of Dynamixel MX
dxl2_goal_position = [DXL2_MINIMUM_POSITION_VALUE DXL2_MAXIMUM_POSITION_VALUE];         % Goal position of Dynamixel PRO

dxl_error = 0;                                    % Dynamixel error
dxl1_present_position = 0;                        % Present position of Dynamixel MX
dxl2_present_position = 0;                        % Present position of Dynamixel PRO
```

`index` variable points the direction to where the Dynamixel should be rotated.

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl1_goal_position` and `dxl2_goal_position` stores goal points of Dynamixel rotation.

`dxl_error` shows the internal error in Dynamixel.

`dxl1_present_position` and `dxl2_present_position` views where now it points out.

``` m
% Open port
if (openPort(port_num))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end
```

First, controller opens #`port_num` port to do serial communication with the Dynamixel. If it fails to open the port, the example will be terminated.

``` m
% Set port baudrate
if (setBaudRate(port_num, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary('dxl_x86_c');
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end
```

Secondly, the controller sets the communication `BAUDRATE` at #`port_num` port opened previously.


``` m
% Enable Dynamixel#1 torque
write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
    printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
else
    fprintf('Dynamixel #%d has been successfully connected \n', DXL1_ID);
end

% Enable Dynamixel#2 torque
write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
    printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
else
    fprintf('Dynamixel #%d has been successfully connected \n', DXL2_ID);
end
```

As mentioned in the document, above code enables each Dynamixel`s torque to set their status as being ready to move.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
while 1
    if input('Press any key to continue! (or input e to quit!)\n', 's') == ESC_CHARACTER
        break;
    end

    % Write Dynamixel#1 goal position
    write2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position(index));
    if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
    elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
        printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
    end

    % Write Dynamixel#2 goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_GOAL_POSITION, typecast(int32(dxl2_goal_position(index)), 'uint32'));
    if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
        printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
    elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
        printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
    end

    while 1
      % Read Dynamixel#1 present position
    	dxl1_present_position = read2ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_PRESENT_POSITION);
      if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
      elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
          printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
      end

      % Read Dynamixel#2 present position
      dxl2_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_PRESENT_POSITION);
      if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
          printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
      elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
          printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
      end

      fprintf('[ID:%03d] GoalPos:%03d  PresPos:%03d [ID:%03d] GoalPos:%03d  PresPos:%03d\n', DXL1_ID, dxl1_goal_position(index), dxl1_present_position, DXL2_ID, dxl2_goal_position(index), typecast(uint32(dxl2_present_position), 'int32'));

      if ~((abs(dxl1_goal_position(index) - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position(index) - typecast(uint32(dxl2_present_position), 'int32')) > DXL2_MOVING_STATUS_THRESHOLD));
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

During `while` loop, the controller writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`write2ByteTxRx()` function orders to the #`DXL1_ID` Dynamixel in `PROTOCOL_VERSION1` communication protocol through #`port_num` port, writing 2 byte of `dxl1_goal_position[index]` value to `ADDR_MX_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`write4ByteTxRx()` function orders to the #`DXL2_ID` Dynamixel in `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 4 byte of `dxl2_goal_position[index]` value to `ADDR_PRO_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read2ByteTxRx()` function orders to the #`DXL1_ID` Dynamixel in `PROTOCOL_VERSION1` communication protocol through #`port_num` port, requesting 2 bytes of value in `ADDR_MX_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

`read4ByteTxRx()` function orders to the #`DXL2_ID` Dynamixel in `PROTOCOL_VERSION2` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRO_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

Reading its present position will be ended when absolute value of `(dxl1_goal_position[index] - dxl1_present_position)` or `(dxl2_goal_position[index] - dxl2_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

At last, it changes its direction to the counter-wise and waits for extra key input.

``` m
% Disable Dynamixel#1 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION1, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION1) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION1, getLastTxRxResult(port_num, PROTOCOL_VERSION1));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION1) ~= 0
  printRxPacketError(PROTOCOL_VERSION1, getLastRxPacketError(port_num, PROTOCOL_VERSION1));
end

% Disable Dynamixel#2 Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION2, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION2) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION2, getLastTxRxResult(port_num, PROTOCOL_VERSION2));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION2) ~= 0
  printRxPacketError(PROTOCOL_VERSION2, getLastRxPacketError(port_num, PROTOCOL_VERSION2));
end
```

The controller frees the Dynamixels to be idle.

`write1ByteTxRx()` function orders to the #`DXL1_ID` and #`DXL2_ID` Dynamixels in each `PROTOCOL_VERSION1` and `PROTOCOL_VERSION2` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_MX_TORQUE_ENABLE` and `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
% Close port
closePort(port_num);
```

Finally, port becomes disposed.

``` m
% Unload Library
unloadlibrary('dxl_x86_c');
```

Unload the library to make it reaccessible. 
