---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_matlab_reset_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/sample_code/matlab_reset_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 96"></div>
<div style="counter-reset: h1 3"></div>

## [Matlab Reset Protocol 2.0](#matlab-reset-protocol-20)

- Description

  This example resets settings of Dynamixel to default values. The Factoryreset function has three operation modes:

  * 0xFF : reset all values (ID to 1, baudrate to 57600)

  * 0x01 : reset all values except ID (baudrate to 57600)

  * 0x02 : reset all values except ID and baudrate.

- Available Dynamixel

  All series using protocol 2.0

- Simple code


``` m
%
% factory_reset.m
%
%  Created on: 2016. 6. 7.
%      Author: Ryu Woon Jung (Leon)
%

%
% *********     Factory Reset Example      *********
%
%
% Available Dynamixel model on this example : All models using Protocol 2.0
% This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
% To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below "#define"d variables yourself.
% Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
%

% Be aware that:
% This example resets all properties of Dynamixel to default values, such as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
%

clc;
clear all;

% Load Libraries
if ~libisloaded('dxl_x86_c');
  [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end

% Control table address
ADDR_PRO_BAUDRATE               = 8;            % Control table address is different in Dynamixel model

% Protocol version
PROTOCOL_VERSION                = 2.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL_ID                          = 1;            % Dynamixel ID: 1
BAUDRATE                        = 1000000;
DEVICENAME                      = 'COM1';       % Check which port is being used on your controller
                                                % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

FACTORYRST_DEFAULTBAUDRATE      = 57600;        % Dynamixel baudrate set by factoryreset
NEW_BAUDNUM                     = 3;            % New baudnum to recover Dynamixel baudrate as it was
OPERATION_MODE                  = 1;            % 0xFF : reset all values
                                                % 0x01 : reset all values except ID
                                                % 0x02 : reset all values except ID and baudrate

TORQUE_ENABLE                   = 1;            % Value for enabling the torque
TORQUE_DISABLE                  = 0;            % Value for disabling the torque

COMM_SUCCESS                    = 0;            % Communication Success result value
COMM_TX_FAIL                    = -1001;        % Communication Tx Failed

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);

% Initialize PacketHandler Structs
packetHandler();

dxl_comm_result = COMM_TX_FAIL;                 % Communication result

dxl_error = 0;                                  % Dynamixel error
dxl_baudnum_read = 0;                           % Read baudnum

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


% Read present baudrate of the controller
fprintf('Now the controller baudrate is : %d\n', getBaudRate(port_num));

% Try factoryreset
fprintf('[ID:%03d] Try factoryreset : ', DXL_ID);
factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  fprintf('Aborted\n');
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
  return;
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
end

% Wait for reset
fprintf('Wait for reset...\n');
pause(2);

fprintf('[ID:%03d] factoryReset Success!\n', DXL_ID);

% Set controller baudrate to dxl default baudrate
if (setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  fprintf('Succeed to change the controller baudrate to : %d\n', FACTORYRST_DEFAULTBAUDRATE);
else
  fprintf('Failed to change the controller baudrate\n');
  input('Press any key to terminate...\n');
  return;
end

% Read Dynamixel baudnum
dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Dynamixel baudnum is now : %d\n', DXL_ID, dxl_baudnum_read);
end

% Write new baudnum
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE, NEW_BAUDNUM);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Set Dynamixel baudnum to : %d\n', DXL_ID, NEW_BAUDNUM);
end

  % Set port baudrate to BAUDRATE
if (setBaudRate(port_num, BAUDRATE))
  fprintf('Succeed to change the controller baudrate to : %d\n', BAUDRATE);
else
  fprintf('Failed to change the controller baudrate\n');
  input('Press any key to terminate...\n');
  return;
end

pause(0.2);

% Read Dynamixel baudnum
dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Dynamixel baudnum is now : %d\n', DXL_ID, dxl_baudnum_read);
end


% Close port
closePort(port_num);

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
ADDR_PRO_BAUDRATE               = 8;            % Control table address is different in Dynamixel model
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://support.robotis.com/.

``` m
% Protocol version
PROTOCOL_VERSION                = 2.0;          % See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` m
% Default setting
DXL_ID                          = 1;            % Dynamixel ID: 1
BAUDRATE                        = 1000000;
DEVICENAME                      = 'COM1';       % Check which port is being used on your controller
                                                % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

FACTORYRST_DEFAULTBAUDRATE      = 57600;        % Dynamixel baudrate set by factoryreset
NEW_BAUDNUM                     = 3;            % New baudnum to recover Dynamixel baudrate as it was
OPERATION_MODE                  = 1;            % 0xFF : reset all values
                                                % 0x01 : reset all values except ID
                                                % 0x02 : reset all values except ID and baudrate
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/2.-Hardware-Settings), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Since the factory reset recovers the Dynamixel control table items to the original state, the baudrate of controller serial port should be set to its changed baudrate(`FACTORYRST_DEFAULTBAUDRATE` : 57600 bps) as well. After that, controller sets its baudrate to the value (1000000 bps : `NEW_BAUDNUM` = 1) before factory reset.

In Protocol 2.0, factory reset recovers in three types, depending on reset mode (`OPERATION_MODE`):
0xFF : reset all values (Especially resets ID to 1, baudrate to 57600)
0x01 : reset all values except ID (Especially resets baudrate to 57600)
0x02 : reset all values except ID and baudrate

``` m
TORQUE_ENABLE                   = 1;            % Value for enabling the torque
TORQUE_DISABLE                  = 0;            % Value for disabling the torque
```

Each of the variables above show the meaning of the communication result value.

``` m
COMM_SUCCESS                    = 0;            % Communication Success result value
COMM_TX_FAIL                    = -1001;        % Communication Tx Failed
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
dxl_comm_result = COMM_TX_FAIL;                 % Communication result

dxl_error = 0;                                  % Dynamixel error
dxl_baudnum_read = 0;                           % Read baudnum
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_baudnum_read` keeps Dynamixel baudrate.

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
% Read present baudrate of the controller
fprintf('Now the controller baudrate is : %d\n', getBaudRate(port_num));
```

`getBaudRate()` function shows which baudrate is used in #`port_num` port of the controller.

``` m
% Try factoryreset
fprintf('[ID:%03d] Try factoryreset : ', DXL_ID);
factoryReset(port_num, PROTOCOL_VERSION, DXL_ID, OPERATION_MODE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  fprintf('Aborted\n');
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
  return;
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
end
```

`factoryReset()` function orders to the #`DXL_ID` Dynamixel through `#port_num` port, executing it to be reset as `OPERATION_MODE` format. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
% Wait for reset
fprintf('Wait for reset...\n');
pause(2);
```

Factory reset takes few seconds.

``` m
% Set controller baudrate to dxl default baudrate
if (setBaudRate(port_num, FACTORYRST_DEFAULTBAUDRATE))
  fprintf('Succeed to change the controller baudrate to : %d\n', FACTORYRST_DEFAULTBAUDRATE);
else
  fprintf('Failed to change the controller baudrate\n');
  input('Press any key to terminate...\n');
  return;
end
```

Controller should change its baudrate itself to do the communication with initialized Dynamixel.

``` m
% Read Dynamixel baudnum
dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Dynamixel baudnum is now : %d\n', DXL_ID, dxl_baudnum_read);
end
```

This shows that reconnection between controller and Dynamixel is happened by adjusting the baudrate.

``` m
% Write new baudnum
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE, NEW_BAUDNUM);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Set Dynamixel baudnum to : %d\n', DXL_ID, NEW_BAUDNUM);
end
```

To make the Dynamixel into previous condition, `write1ByteTxRx()` function orders to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_PRO_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either, and then `printTxRxResult()` function and `printRxPacketError()` function show results on the console window if any communication error or Hardware error has been occurred.

``` m
% Set port baudrate to BAUDRATE
if (setBaudRate(port_num, BAUDRATE))
  fprintf('Succeed to change the controller baudrate to : %d\n', BAUDRATE);
else
  fprintf('Failed to change the controller baudrate\n');
  input('Press any key to terminate...\n');
  return;
end

pause(0.2);

% Read Dynamixel baudnum
dxl_baudnum_read = read1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRO_BAUDRATE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
  printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
  printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
  fprintf('[ID:%03d] Dynamixel baudnum is now : %d\n', DXL_ID, dxl_baudnum_read);
end
```

These changes controller baudrate and verify that the Dynamixel has been successfully set into previous state.

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
