---
layout: archive
lang: en
ref: matlab_clear_multi_turn_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/matlab_clear_multi_turn_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 19"></div>
<div style="counter-reset: h3 9"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="matlab-protocol-20"><a href="#matlab-protocol-20">MATLAB Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [Matlab Clear Multi Turn Protocol 2.0](#matlab-clear-multi-turn-protocol-20)

- Description

  This example is that when Dynamixel operate `Extended Position Control Mode(Multi-turn)`, clear present position from 0 to 4028. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 2.0

#### Sample code


``` m
%
% clear_multi_turn.m
%
%  Created on: 2018. 11. 23.
%      Author: Ki Jong Gil (Gilbert)

%
% *********     Clear Multi-Turn Example      *********
%
%
% Available Dynamixel model on this example : Dynamixel X-series (firmware v42 or above)
% This example is designed for using a Dynamixel XM430-W350-R, and an U2D2.
% To use another Dynamixel model, such as MX series, see their details in E-Manual(emanual.robotis.com) and edit below "#define"d variables yourself.
% Be sure that Dynamixel properties are already set as %% ID : 1 / Baudnum : 1 (Baudrate : 57600)
%

clc;
clear all;

lib_name = '';

if strcmp(computer, 'PCWIN')
  lib_name = 'dxl_x86_c';
elseif strcmp(computer, 'PCWIN64')
  lib_name = 'dxl_x64_c';
elseif strcmp(computer, 'GLNX86')
  lib_name = 'libdxl_x86_c';
elseif strcmp(computer, 'GLNXA64')
  lib_name = 'libdxl_x64_c';
elseif strcmp(computer, 'MACI64')
  lib_name = 'libdxl_mac_c';
end

% Load Libraries
if ~libisloaded(lib_name)
    [notfound, warnings] = loadlibrary(lib_name, 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end

% Control table address
ADDR_OPERATING_MODE          = 11;           % Control table address is different in Dynamixel model
ADDR_TORQUE_ENABLE           = 64;         
ADDR_GOAL_POSITION           = 116;
ADDR_PRESENT_POSITION        = 132;

% Protocol version
PROTOCOL_VERSION             = 2.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL_ID                       = 1;            % Dynamixel ID: 1
BAUDRATE                     = 57600;
DEVICENAME                   = 'COM1';       % Check which port is being used on your controller
                                             % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'

TORQUE_ENABLE                = 1;            % Value for enabling the torque
TORQUE_DISABLE               = 0;            % Value for disabling the torque
MAX_POSITION_VALUE           = 1048575;      
DXL_MOVING_STATUS_THRESHOLD  = 20;           % Dynamixel moving status threshold
EXT_POSITION_CONTROL_MODE    = 4;            % Value for extended position control mode (operating mode)

ESC_CHARACTER                = 'e';          % Key for escaping loop
SPACE_ASCII_VALUE            = ' ';

COMM_SUCCESS                 = 0;            % Communication Success result value
COMM_TX_FAIL                 = -1001;        % Communication Tx Failed

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
port_num = portHandler(DEVICENAME);

% Initialize PacketHandler Structs
packetHandler();

dxl_comm_result = COMM_TX_FAIL;              % Communication result
       
dxl_error = 0;                              % Dynamixel error
dxl_present_position = 0;                   % Present position

% Open port
if (openPort(port_num))
    fprintf('Succeeded to open the port!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to open the port!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set port baudrate
if (setBaudRate(port_num, BAUDRATE))
    fprintf('Succeeded to change the baudrate!\n');
else
    unloadlibrary(lib_name);
    fprintf('Failed to change the baudrate!\n');
    input('Press any key to terminate...\n');
    return;
end

% Set operating mode to extended position control mode
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Operating mode changed to extended position control mode. \n');
end

% Enable Dynamixel Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Dynamixel has been successfully connected \n');
end

while 1
    if input('\nPress any key to continue! (or input e to quit!)', 's') == ESC_CHARACTER
        break;
    end

    fprintf('  Press SPACE key to clear multi-turn information! (or press e to stop!)');
    
    % Write goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end

    while 1
        ch = -1;
        % Read present position
        dxl_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
        dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
        dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
        if dxl_comm_result ~= COMM_SUCCESS
            fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        elseif dxl_error ~= 0
            fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
        end

        fprintf('\r  [ID:%03d] GoalPos:%03d  PresPos:%03d', DXL_ID, MAX_POSITION_VALUE, dxl_present_position);
        ch = kbhit(0.2);
        if ch == SPACE_ASCII_VALUE
            fprintf('\n  Stop & Clear Multi-Turn Information! \n');
            
            % Write the present position to the goal position to stop moving
            write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION,  typecast(uint32(dxl_present_position), 'int32'));
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            pause(0.5);
            
            % Clear Multi-Turn Information
            clearMultiTurn(port_num, PROTOCOL_VERSION, DXL_ID);
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            % Read present position
            dxl_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            fprintf('  Present Position has been reset. : %03d \n', dxl_present_position);
            break;
            
        elseif ch == ESC_CHARACTER
            fprintf('\n  Stopped!! \n');
            
            % Write the present position to the goal position to stop moving
            write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION,  typecast(uint32(dxl_present_position), 'int32'));
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            break;
        end
                
        if ~(abs(MAX_POSITION_VALUE - typecast(uint32(dxl_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD)
            break;
        end
    end
end    


% Disable Dynamixel Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
end

% Close port
closePort(port_num);

% Unload Library
unloadlibrary(lib_name);

close all;

function ch = kbhit(m) 
% GETKEYWAIT - get a key within a time limit
%   CH = GETKEYWAIT(P) waits for a keypress for a maximum of P seconds. P
%   should be a positive number. CH is a double representing the key
%   pressed key as an ascii number, including backspace (8), space (32),
%   enter (13), etc. If a non-ascii key (Ctrl, Alt, etc.) is pressed, CH
%   will be NaN.
%   If no key is pressed within P seconds, -1 is returned, and if something
%   went wrong during excution 0 is returned. 
%
%  See also INPUT,
%           GETKEY (FileExchange)
% tested for Matlab 6.5 and higher
% version 2.1 (jan 2012)
% author : Jos van der Geest
% email  : jos@jasen.nl
% History
% 1.0 (2005) creation
% 2.0 (apr 2009) - expanded error check on input argument, changed return
% values when a non-ascii was pressed (now NaN), or when something went
% wrong (now 0); added comments ; slight change in coding
% 2.1 (jan 2012) - modified a few properties, included check is figure
%                  still exists (after comment on GETKEY on FEX by Andrew). 
% check input argument
    narginchk(1,1) ;
    if numel(m)~=1 || ~isnumeric(m) || ~isfinite(m) || m <= 0,    
        error('Argument should be a single positive number.') ;
    end
    % set up the timer
    tt = timer ;
    tt.timerfcn = 'uiresume' ;
    tt.startdelay = m ;            
    % Set up the figure
    % May be the position property should be individually tweaked to avoid visibility
    callstr = 'set(gcbf,''Userdata'',double(get(gcbf,''Currentcharacter''))) ; uiresume ' ;
    fh = figure(...
        'name','Press a key', ...
        'keypressfcn',callstr, ...
        'windowstyle','modal',... 
        'numbertitle','off', ...
        'position',[0 0  1 1],...
        'userdata',-1) ; 
    try
        % Wait for something to happen or the timer to run out
        start(tt) ;    
        uiwait ;
        ch = get(fh,'Userdata') ;
        if isempty(ch), % a non-ascii key was pressed, return a NaN
            ch = NaN ;
        end
    catch
        % Something went wrong, return zero.
        ch = 0 ;
    end
    % clean up the timer ...
    stop(tt) ;
    delete(tt) ; 
    % ... and figure
    if ishandle(fh)
        delete(fh) ;
    end
end
```



#### Details

``` m
% Load Libraries

lib_name = '';

if strcmp(computer, 'PCWIN')
  lib_name = 'dxl_x86_c';
elseif strcmp(computer, 'PCWIN64')
  lib_name = 'dxl_x64_c';
elseif strcmp(computer, 'GLNX86')
  lib_name = 'libdxl_x86_c';
elseif strcmp(computer, 'GLNXA64')
  lib_name = 'libdxl_x64_c';
elseif strcmp(computer, 'MACI64')
  lib_name = 'libdxl_mac_c';
end

if ~libisloaded('dxl_x86_c');
    [notfound, warnings] = loadlibrary('dxl_x86_c', 'dynamixel_sdk.h', 'addheader', 'port_handler.h', 'addheader', 'packet_handler.h');
end
```

This example uses dynamixel library imported by `loadlibrary()`.

``` m
% Control table address
ADDR_OPERATING_MODE          = 11;           % Control table address is different in Dynamixel model
ADDR_TORQUE_ENABLE           = 64;         
ADDR_GOAL_POSITION           = 116;
ADDR_PRESENT_POSITION        = 132;
```

Dynamixel series have their own control tables: Addresses and Byte Length in each items. To control one of the items, its address (and length if necessary) is required. Find your requirements in http://emanual.robotis.com/.

``` m
% Protocol version
PROTOCOL_VERSION            = 2.0;          % See which protocol version is used in the Dynamixel
```

Dynamixel uses either or both protocols: Protocol 1.0 and Protocol 2.0. Choose one of the Protocol which is appropriate in the Dynamixel.

``` m
% Default setting
DXL_ID                       = 1;            % Dynamixel ID: 1
BAUDRATE                     = 1000000;
DEVICENAME                   = 'COM1';       % Check which port is being used on your controller
                                             % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'

TORQUE_ENABLE                = 1;            % Value for enabling the torque
TORQUE_DISABLE               = 0;            % Value for disabling the torque
MAX_POSITION_VALUE           = 1048575;      
DXL_MOVING_STATUS_THRESHOLD  = 20;           % Dynamixel moving status threshold
EXT_POSITION_CONTROL_MODE    = 4;            % Value for extended position control mode (operating mode)

ESC_CHARACTER                = 'e';          % Key for escaping loop
SPACE_ASCII_VALUE            = ' ';
```

Here we set some variables to let you freely change them and use them to run the example code.

As the document already said in [previous chapter](/docs/en/software/dynamixel/dynamixel_sdk/device_setup/#dynamixel), customize Dynamixel control table items, such as `DXL_ID` number, communication `BAUDRATE`, and the `DEVICENAME`, on your own terms of needs. In particular, `BAUDRATE` and `DEVICENAME` have systematical dependencies on your controller, so make clear what kind of communication method you will use.

Dynamixel basically needs the `TORQUE_ENABLE` to be rotating or give you its internal information. On the other hand, it doesn't need torque enabled if you get your goal, so finally do `TORQUE_DISABLE` to prepare to the next sequence.

Since the Dynamixel has its own rotation range, it may shows malfunction if your request on your dynamixel is out of range. For example, Dynamixel MX-28 and Dynamixel PRO 54-200 has its rotatable range as 0 ~ 4028 and -250950 ~ 250950, each.

`DXL_MOVING_STATUS_THRESHOLD` acts as a criteria for verifying its rotation stopped. `EXT_POSITION_CONTROL_MODE` acts as a position control Mode.

``` m
COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed
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
dxl_comm_result = COMM_TX_FAIL;              % Communication result
       
dxl_error = 0;                              % Dynamixel error
dxl_present_position = 0;                   % Present position
```

`dxl_comm_result` indicates which error has been occurred during packet communication.

`dxl_error` shows the internal error in Dynamixel.

`dxl_present_position` views where now it points out.

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
% Set operating mode to extended position control mode
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_OPERATING_MODE, EXT_POSITION_CONTROL_MODE);
dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
if dxl_comm_result ~= COMM_SUCCESS
    fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
elseif dxl_error ~= 0
    fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
else
    fprintf('Operating mode changed to extended position control mode. \n');
end
```

The controller sets the operating mode as Extended Position Control Mode(Multi-turn).

``` m
% Enable Dynamixel Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_ENABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
else
    fprintf('Dynamixel has been successfully connected \n');
end
```

As mentioned in the document, above code enables Dynamixel torque to set its status as being ready to move.

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_ENABLE` value to `ADDR_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

``` m
while 1
    if input('\nPress any key to continue! (or input e to quit!)', 's') == ESC_CHARACTER
        break;
    end

    fprintf('  Press SPACE key to clear multi-turn information! (or press e to stop!)');
    
    % Write goal position
    write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION, MAX_POSITION_VALUE);
    dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
    dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
    if dxl_comm_result ~= COMM_SUCCESS
        fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
    elseif dxl_error ~= 0
        fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
    end

    while 1
        ch = -1;
        % Read present position
        dxl_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
        dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
        dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
        if dxl_comm_result ~= COMM_SUCCESS
            fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
        elseif dxl_error ~= 0
            fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
        end

        fprintf('\r  [ID:%03d] GoalPos:%03d  PresPos:%03d', DXL_ID, MAX_POSITION_VALUE, dxl_present_position);
        ch = kbhit(0.2);
        if ch == SPACE_ASCII_VALUE
            fprintf('\n  Stop & Clear Multi-Turn Information! \n');
            
            % Write the present position to the goal position to stop moving
            write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION,  typecast(uint32(dxl_present_position), 'int32'));
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            pause(0.5);
            
            % Clear Multi-Turn Information
            clearMultiTurn(port_num, PROTOCOL_VERSION, DXL_ID);
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            % Read present position
            dxl_present_position = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_PRESENT_POSITION);
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            
            fprintf('  Present Position has been reset. : %03d \n', dxl_present_position);
            break;
            
        elseif ch == ESC_CHARACTER
            fprintf('\n  Stopped!! \n');
            
            % Write the present position to the goal position to stop moving
            write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_GOAL_POSITION,  typecast(uint32(dxl_present_position), 'int32'));
            dxl_comm_result = getLastTxRxResult(port_num, PROTOCOL_VERSION);
            dxl_error = getLastRxPacketError(port_num, PROTOCOL_VERSION);
            if dxl_comm_result ~= COMM_SUCCESS
                fprintf('%s\n', getTxRxResult(PROTOCOL_VERSION, dxl_comm_result));
            elseif dxl_error ~= 0
                fprintf('%s\n', getRxPacketError(PROTOCOL_VERSION, dxl_error));
            end
            break;
        end
                
        if ~(abs(MAX_POSITION_VALUE - typecast(uint32(dxl_present_position), 'int32')) > DXL_MOVING_STATUS_THRESHOLD)
            break;
        end
    end
end    
```

During `while()` loop, the controller wait to any key input for start `while()` and writes and reads the Dynamixel position through packet transmission/reception(Tx/Rx).

To continue its rotation, press any key except ESC.

`write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `MAX_POSITION_VALUE` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

`read4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, requesting 4 bytes of value in `ADDR_PRESENT_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

When the space key input, `write4ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 4 byte of `dxl_present_position` value to `ADDR_GOAL_POSITION` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either. And then `clearMultiTurn()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port.

Reading its present position will be ended when absolute value of `(MAX_POSITION_VALUE - dxl_present_position)` becomes smaller then `DXL_MOVING_STATUS_THRESHOLD`.

``` m
% Disable Dynamixel Torque
write1ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID, ADDR_TORQUE_ENABLE, TORQUE_DISABLE);
if getLastTxRxResult(port_num, PROTOCOL_VERSION) ~= COMM_SUCCESS
    printTxRxResult(PROTOCOL_VERSION, getLastTxRxResult(port_num, PROTOCOL_VERSION));
elseif getLastRxPacketError(port_num, PROTOCOL_VERSION) ~= 0
    printRxPacketError(PROTOCOL_VERSION, getLastRxPacketError(port_num, PROTOCOL_VERSION));
end
```

The controller frees the Dynamixel to be idle.

`write1ByteTxRx()` function sends an instruction to the #`DXL_ID` Dynamixel in `PROTOCOL_VERSION` communication protocol through #`port_num` port, writing 1 byte of `TORQUE_DISABLE` value to `ADDR_TORQUE_ENABLE` address. The function checks Tx/Rx result and receives Hardware error.
`getLastTxRxResult()` function and `getLastRxPacketError()` function get either.

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
