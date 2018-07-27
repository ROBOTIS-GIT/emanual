---
layout: archive
lang: en
ref: matlab_ping_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/matlab_ping_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 19"></div>
<div style="counter-reset: h3 5"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="matlab-protocol-20"><a href="#matlab-protocol-20">MATLAB Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [Matlab Ping Protocol 2.0](#matlab-ping-protocol-20)

- Description

  This example tries to ping Dynamixel and shows the model number responded from Dynamixel. The example is commonly used to check for Dynamixel’s connection or to get model number to refer its specification.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` m
%
% ping.m
%
%  Created on: 2016. 6. 7.
%      Author: Ryu Woon Jung (Leon)
%

%
% *********     ping Example      *********
%
%
% Available Dynamixel model on this example : All models using Protocol 2.0
% This example is designed for using a Dynamixel PRO 54-200, and an USB2DYNAMIXEL.
% To use another Dynamixel model, such as X series, see their details in E-Manual(support.robotis.com) and edit below "#define"d variables yourself.
% Be sure that Dynamixel PRO properties are already set as %% ID : 1 / Baudnum : 3 (Baudrate : 1000000 [1M])
%

clc;
clear all;

% Load Libraries
if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end

% Protocol version
PROTOCOL_VERSION                = 2.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL_ID                          = 1;            % Dynamixel ID: 1
BAUDRATE                        = 1000000;
DEVICENAME                      = 'COM1';       % Check which port is being used on your controller
                                                % ex) Windows: "COM1"   Linux: "/dev/ttyUSB0"

COMM_SUCCESS                    = 0;            % Communication Success result value
COMM_TX_FAIL                    = -1001;        % Communication Tx Failed

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);

% Initialize PacketHandler Structs
packetHandler();

dxl_comm_result = COMM_TX_FAIL;                 % Communication result

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


% Try to ping the Dynamixel
% Get Dynamixel model number
dxl_model_number = pingGetModelNum(port_num, PROTOCOL_VERSION, DXL_ID);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
end

fprintf('[ID:%03d] ping Succeeded. Dynamixel model number : %d\n', DXL_ID, dxl_model_number);


% Close port
closePort(port_num);

% Unload Library
unloadlibrary('dxl_x86_c');

close all;
clear all;
```



#### Details

``` m
% Load Libraries
if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end
```

This example uses dynamixel library imported by `loadlibrary()`.

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
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document previously said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

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
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

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
% Try to ping the Dynamixel
% Get Dynamixel model number
dxl_model_number = pingGetModelNum(port_num, PROTOCOL_VERSION, DXL_ID);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
end
```

`pingGetModelNum()` function orders to the #`DXL_ID` Dynamixel through #`port_num` port. Then, it receives the `dxl_model_number`. The function checks Tx/Rx result and receives Hardware error.
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
