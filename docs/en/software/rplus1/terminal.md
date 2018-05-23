---
layout: archive
lang: en
ref: rplus1_terminal
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus1/terminal/
sidebar:
  title: R+ Terminal
  nav: "rplusterminal"
---

# [Introduction](#introduction)

RoboPlus Terminal is a tool to help users to manipulate the controller by themselves through text-baed User-Interface. The terminal program communicates with the controller in the basis of ASCII code, and it prints various information transmitted by the controller for users.

![](/assets/images/sw/rplus1/terminal/roboplus_terminal_001.png)

# [Serial Port Setting](#serial-port-setting)

The communication port must be set to connect to the controller using RoboPlus Terminal.
 
If RoboPlus Terminal is started for the first time, the connection information is exactly restored.  If the name of serial port is changed or the serial port is used in other program, it may not be connected to the controller.
 
If `Setup` > `Connect` are executed while the communication port is not connected, the port selection window  can be seen as below.  Select serial port and communication speed connected to the controller and click "OK". 

**NOTE** : The basic connection speed of the controller is `57,600bps`.
{: .notice}
 
![](/assets/images/sw/rplus1/terminal/roboplus_terminal_002.png)
 
The serial communication setting of RoboPlus is as below.
- Parity bit : no parity
- Stop bit : 1bit
- Data bit : 8bit
- Hardware Control: none

# [Processing Input](#processing-input)

RoboPlus Terminal receives keyboard inputs and transmits the signals to PC and the connected controller through serial communication. The data pursuant to each key is as follows.

- Special Keys

|ASCII|Key|
|:---:|:---:|
|0x08|Backspace|
|0x0d, 0x0a|Enter|
|0x1b|ESC|
|0x1b, 0x5b, 0x41|Cursor up|
|0x1b, 0x5b, 0x42|Cursor down|
|0x1b, 0x5b, 0x43|Cursor right|
|0x1b, 0x5b, 0x44|Cursor left|
|0x1b, 0x5b, 0x48|Home|
|0x1b, 0x5b, 0x4b|End|

- Other alphabet keys besides above transmit relevant ASCII code. (Korean and Uni-Code are not supported.)
 
## [Clearing Screen](#clearing-screen)

Screen clearing function is supported in RoboPlus Terminal.  Execute "Clear Screen" command in the menu to erase the complete screen.

![](/assets/images/sw/rplus1/terminal/roboplus_terminal_003.png)

# [Processing Controller Output](#processing-controller-output)

RoboPlus Terminal receives signals from connected controller and prints the contents on the screen.
 
![](/assets/images/sw/rplus1/terminal/roboplus_terminal_004.png)
 
## [Controlling Cursor](#controlling-cursor)

- The size of terminal screen is 80x36.(Width x Length)
- The cursor control string is as below, and it is the same as ANSI cursor control method.  If letters are transmitted as the following type, RoboPlus Terminal moves the cursor to the designated location. (The code of "ESC" key is 27.)

  ESC[Y;XH or ESC[Y;Xf  
  e.g.) 27[10:20f => moves to X=20, Y=10 (The screen coordinates index is started from 1.)

- Generally -used control strings are as below.

|ASCII|Key|
|:---:|:---:|
|0x08|Backspace: Moves the cursor 1 space back|
|0x0a|/LF: Moves the cursor to the first position of the next line|
|0x0d|/CR: Moves the cursor to the first position of the same line|
|0x20|Space: Moves the cursor to the next letter|
|0x21 ~ 0x7e|Prints ASCII letters ( from ! to  ~)|

# [Transmitting/Receiving Data](#transmittingreceiving-data)

RoboPlus Terminal can transmit/receive large data to/from the connected controller.  There is no data transmission protocol.

![](/assets/images/sw/rplus1/terminal/roboplus_terminal_005.png)

## [Transmitting Data](#transmitting-data)

RoboPlus Terminal can transmit the contents of files to the connected controller as binary format.  
If the extension is hex, it is changed into binary and transmitted based on Intel HEX format.  Other extensions are just transmitted without changing.  
The file transmission procedure is as below.
- Prepare the connected controller to receive the data.
- Select "Transmit file" in the menu.
- Select files for transmission.
- If the recently transmitted file is just used, "Page Down" key can be used as the shortcut.
- The transmission status can be checked on the bottom part of RoboPlus Terminal.

  ![](/assets/images/sw/rplus1/terminal/roboplus_terminal_006.png)
 
### [ByteSum](#bytesum)

The loss possibility of transmitted data can be checked using ByteSum.  
ByteSum means the last 1 byte of the sum when all transmitted byte-unit data are added.  
For example, if FD 23 4D 2D is transmitted, the sum of each data is 01 9A.  From the sum, 9A (the lowest byte) is ByteSum.
 
![](/assets/images/sw/rplus1/terminal/roboplus_terminal_007.png)
 
In the menu, if Bytesum is marked, Bytesum packet is added to the last part of the file packet and when it is transmitted.  
The loss possibility of data can be checked by comparing the bytesum received from RoboPlus Terminal and calculated bytesum in the data-received controller.
 
## [Receiving Data](#데이터-수신)

RoboPlus Terminal can receive data from the connected controller and save them as files. The file reception procedure is as below.
- Select "Receive File" in the menu.
- Select the file name to save.
- If the recently saved file is just used, "Page Up" key can be used as the shortcut.
- Data transmission is started in the controller.
- The reception status can be checked on the bottom part of RoboPlus Terminal.

  ![](/assets/images/sw/rplus1/terminal/roboplus_terminal_008.png)

- When the data reception is completed, press "End" key to quit the data reception.

# [Setting Option](#setting-option)

The options of RoboPlus Terminal can be set.
 
## [Setting Colors](#색상-설정하기)

The background and text colors of RoboPlus Terminal can be set.

![](/assets/images/sw/rplus1/terminal/roboplus_terminal_009.png)
