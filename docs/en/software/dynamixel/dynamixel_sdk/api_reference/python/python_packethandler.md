---
layout: archive
lang: en
ref: python_packethandler
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_packethandler/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 4"></div>
<div style="counter-reset: h3 1"></div>

<!--[dummy Header 1]>
  <h1 id="api-reference"><a href="#api-reference">API Reference</a></h1>
  <h2 id="python"><a href="#python">Python</a></h2>
<![end dummy Header 1]-->

### [Python PacketHandler](#python-packethandler)

- Description

Base functions for packet construction.

- Members

  None


- Methods

| Methods                                               | Description                                          |
|:------------------------------------------------------|:-----------------------------------------------------|
| **[packetHandler](#packethandler)**                   | Initializes members of packet data pointer struct    |
| **[getTxRxResult](#gettxrxresult)**                   | Gets communication result                            |
| **[getRxPacketError](#gettxrxresult)**                | Gets hardware error                                  |
| **[txPacket](#txpacket)**                             | Transmits the packet                                 |
| **[rxPacket](#rxpacket)**                             | Receives the packet                                  |
| **[txRxPacket](#txrxpacket)**                         | Transmits and receives the packet                    |
| **[ping](#ping)**                                     | ping a Dynamixel                                     |
| **[broadcastPing](#broadcastping)**                   | ping all connected Dynamixels                        |
| **[action](#action)**                                 | Commands ‘Run’ the Regwritten                        |
| **[regWrite](#regwrite)**                             | Writes the packets and wait for the ‘Action’ command |
| **[reboot](#reboot)**                                 | Reboots Dynamixel                                    |
| **[factoryReset](#factoryreset)**                     | Resets all Dynamixel settings                        |
| **[readTx](#readtx)**                                 | Transmits N byte read instruction packet             |
| **[readRx](#readrx)**                                 | Receives N byte read status packet                   |
| **[readTxRx](#readtxrx)**                             | Transmits and receives N byte packet                 |
| **[read1ByteTx](#read1bytetx)**                       | Transmits 1 byte read instruction packet             |
| **[read1ByteRx](#read1byterx)**                       | Receives 1 byte read status packet                   |
| **[read1ByteTxRx](#read1bytetxrx)**                   | Transmits and receives 1 byte packet                 |
| **[read2ByteTx](#read2bytetx)**                       | Transmits 2 byte read instruction packet             |
| **[read2ByteRx](#read2byterx)**                       | Receives 2 byte read status packet                   |
| **[read2ByteTxRx](#read2bytetxrx)**                   | Transmits and receives 2 byte packet                 |
| **[read4ByteTx](#read4bytetx)**                       | Transmits 4 byte read instruction packet             |
| **[read4ByteRx](#read4byterx)**                       | Receives 4 byte read status packet                   |
| **[read4ByteTxRx](#read4bytetxrx)**                   | Transmits and receives 4 byte packet                 |
| **[writeTxOnly](#writetxonly)**                       | Transmits N byte write instruction packet            |
| **[writeTxRx](#writetxrx)**                           | Transmits and receives N byte packet                 |
| **[write1ByteTxOnly](#write1bytetxonly)**             | Transmits 1 byte write instruction packet            |
| **[write1ByteTxRx](#write1bytetxrx)**                 | Transmits and receives 1 byte packet                 |
| **[write2ByteTxOnly](#write2bytetxonly)**             | Transmits 2 byte write instruction packet            |
| **[write2ByteTxRx](#write2bytetxrx)**                 | Transmits and receives 2 byte packet                 |
| **[write4ByteTxOnly](#write4bytetxonly)**             | Transmits 4 byte write instruction packet            |
| **[write4ByteTxRx](#write4bytetxrx)**                 | Transmits and receives 4 byte packet                 |
| **[regWriteTxOnly](#regwritetxonly)**                 | Transmits register write instruction packet          |
| **[regWriteTxRx](#regwritetxrx)**                     | Transmits and receives register write packet         |
| **[syncReadTx](#syncreadtx)**                         | Transmits N byte sync read Instruction packet        |
| **[syncWriteTxOnly](#syncwritetxonly)**               | Transmits N byte sync write Instruction packet       |
| **[bulkReadTx](#bulkreadtx)**                         | Transmits N byte bulk read Instruction packet        |
| **[bulkWriteTxOnly](#bulkwritetxonly)**               | Transmits N byte bulk write Instruction packet       |


- Enumerator

  None

#### Method References


##### packetHandler
- Syntax
``` python
packetHandler()
```
- Parameters

   None

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes `packetData` struct and initialzes struct members.  


##### getTxRxResult
- Syntax
``` python
getTxRxResult(result)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| result     | Communication result |

- Detailed Description

   This function gets communication result as string type.


##### getRxPacketError
- Syntax
``` python
getRxPacketError(error)
```
- Parameters

| Parameters | Description          |
|:-----------|:---------------------|
| error      | Hardware error       |

- Detailed Description

   This function gets hardware error sent by Dynamixel.

##### txPacket
- Syntax
``` python
 txPacket(port, txpacket)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| txpacket         | packet byte for sending                   |

- Detailed Description

   The function transmits the packet. The function clears the port by `clearPort` function at first, and stores data in the txpacket storage of `port`. The communication result and the hardware error are available when the function is terminated.


##### rxPacket
- Syntax
``` python
void rxPacket(port)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |

- Detailed Description

   The function repeatedly tries to receive packets from `port` rx buffer until whole packets that it waits to get have arrived, or the packet wait time limit is over, while it filters garbage signals and verify correctness of received signal. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket
- Syntax
``` python
txRxPacket(port, txpacket)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| txpacket         | packet byte for sending                   |

- Detailed Description

   The function stores data for being written into the array for packet transmission and gets data read from rx buffer of #`port_num` port by `txPacket` and `rxPacket` functions. When `txPacket` function succeeds to communicate, it will continue to `rxPacket` and finishes the process if the packet succeeds to be received. In particular, the group handler functions for write, such as SyncWrite, and BulkWrite, don’t use `rxPacket` so the function finishes its operation immediately after the 'txPacket2'. Before the `rxPacket`, it sets packet timeout if the instruction of received packet is for read. The communication result and the hardware error are available when the function is terminated.


##### ping
- Syntax
``` python
ping(port, dxl_id)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function uses `pingGetModelNum` without requesting Dynamixel to send its the model number. The communication result and the hardware error are available when the function is terminated.


##### broadcastPing
- Syntax
``` python
broadcastPing(port, dxl_id)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function finds all connected dynamixels and store their id in the list. The function is unavailable in protocol 1.0.


##### action
- Syntax
``` python
action(port, dxl_id)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function pulls the trigger of sending txpacket previously set by `regWriteTxOnly` or `regWriteTxRx` function, using `txRxPacket` function. The communication result and the hardware error are available when the function is terminated.


##### reboot
- Syntax
``` python
void reboot(port, dxl_id)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function constructs the transmission packet with reboot instruction, and starts `txRxPacket`. The function may perform its role when the Dynamixel stops working caused by hardware error. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### factoryReset
- Syntax
``` python
factoryReset(port, dxl_id, option)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| option           | Reset option                              |

- Detailed Description

   The function constructs the transmission packet for reset Dynamixel, and starts `txRxPacket`. The resets targeted Dynamixel's settings to the factory default settings. The `option` indicates the range of which items on the control table should be reset: `0xFF` for resetting all values, `0x01` for resetting all values except ID, `0x02` for resetting all values except ID and Baudrate. The communication result and the hardware error are available when the function is terminated. In protocol 1.0, `option` is selectable with only full-reset mode `0x00`.

##### readTx
- Syntax
``` python
readTx(port, dxl_id, address, length)

```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   The function constructs the transmission packet with read instruction, and starts `txPacket`. Then the function calls `setPacketTimeout` function when packet transmission succeeds. The function can't control more than one Dynamixel at once. The communication result and the hardware error are available when the function is terminated.


##### readRx
- Syntax
``` python
readRx(port, dxl_id, length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| length           | Packet length                             |


- Detailed Description

   The function calls `rxPacket2` function and gets the packet from read data storage if the communication succeeds. The communication result and the hardware error are available when the function is terminated.


##### readTxRx
- Syntax
``` python
readTxRx(port, dxl_id, address, length)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |


- Detailed Description

   The function calls `readTx` function and `readRx` function. `readRx` function will be called when `readTx` succeeds. The communication result and the hardware error are available when the function is terminated.


##### read1ByteTx
- Syntax
``` python
read1ByteTx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   The function calls `readTx` function to send 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read1ByteRx
- Syntax
``` python
read1ByteRx(port, dxl_id)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function calls `readRx` function to receive response packet of 1 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### read1ByteTxRx
- Syntax
``` python
read1ByteTxRx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |

- Detailed Description

   The function calls `readTxRx` function to read 1 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.

##### read2ByteTx
- Syntax
``` python
read2ByteTx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   The function calls `readTx` function to send 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteRx
- Syntax
``` python
read2ByteRx(port, dxl_id)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |


- Detailed Description

   The function calls `readRx` function to receive response packet of 2 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### read2ByteTxRx
- Syntax
``` python
read2ByteTxRx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   The function calls `readTxRx` function to read 2 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### read4ByteTx
- Syntax
``` python
read4ByteTx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   The function calls `readTx` function to send 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### read4ByteRx
- Syntax
``` python
read4ByteRx(port, dxl_id)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |

- Detailed Description

   The function calls `readRx` function to receive response packet of 4 Byte read intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### read4ByteTxRx
- Syntax
``` python
read4ByteTxRx(port, dxl_id, address)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |


- Detailed Description

   The function calls `readTxRx` function to read 4 Byte data from Dynamixel. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### writeTxOnly
- Syntax
``` python
writeTxOnly(port, dxl_id, address, length, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |
| data             | data for sending                          |


- Detailed Description

   The function constructs the transmission packet with write instruction, and starts `txPacket`. The communication result and the hardware error are available when the function is terminated.

##### writeTxRx
- Syntax
``` python
writeTxRx(port, dxl_id, address, length, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |
| data             | data for sending                          |


- Detailed Description

   The function constructs the transmission packet with write instruction, and starts `txRxPacket`. The communication result and the hardware error are available when the function is terminated.


##### write1ByteTxOnly
- Syntax
``` python
write1ByteTxOnly(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxOnly` function to send 1 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.

##### write1ByteTxRx
- Syntax
``` python
write1ByteTxRx(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxRx` function to send 1 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.

##### write2ByteTxOnly
- Syntax
``` python
write2ByteTxOnly(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxOnly` function to send 2 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated.


##### write2ByteTxRx
- Syntax
``` python
write2ByteTxRx(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxRx` function to send 2 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated.


##### write4ByteTxOnly
- Syntax
``` python
write4ByteTxOnly(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxOnly` function to send 4 Byte write intended packet transmission. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### write4ByteTxRx
- Syntax
``` python
write4ByteTxRx(port, dxl_id, address, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| data             | data for sending                          |


- Detailed Description

   The function calls `writeTxRx` function to send 4 Byte write intended packet transmission (and reception). The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### regWriteTxOnly
- Syntax
``` python
regWriteTxOnly(port, dxl_id, address, length, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |
| data             | data for sending                          |


- Detailed Description

   The function intends simultaneous control of more than one Dynamixel. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### regWriteTxRx

- Syntax
``` python
regWriteTxRx(port, dxl_id, address, length, data)
```
- Parameters

| Parameters       | Description                               |
|:-----------------|:------------------------------------------|
| port             | PortHandler instance                      |
| dxl_id           | Dynamixel ID                              |
| address          | Address on the control table of Dynamixel |
| length           | Packet length                             |
| data             | data for sending                          |


- Detailed Description

   The function intends simultaneous multiple Dynamixel control. The function writes the data without requesting an action of Dynamixel. The Dynamixel works when the trigger `action` function is executed. The function needs previous setting of the data to write on the Dynamixel. The communication result and the hardware error are available when the function is terminated.


##### syncReadTx
- Syntax
``` python
syndReadTx(port, start_address, data_length, param, param_length)
```
- Parameters

| Parameters    | Description                               |
|:--------------|:------------------------------------------|
| port          | PortHandler instance                      |
| start_address | Address on the control table of Dynamixel |
| data_length   | Data length                               |
| param         | Parameter for write                       |
| param_length  | Parameter length                          |

- Detailed Description

   The function intends simultanoues multiple Dynamixel control by reading same length of data from the same address on the Dynamixel control table. The function constructs the transmission packet with sync read instruction, and starts 'txPacket2'. Then the function calls `setPacketTimeout` function when `txPacket` succeeds. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.


##### syncWriteTxOnly
- Syntax
``` python
syncWriteTxOnly(port, start_address, data_length, param, param_length)
```
- Parameters

| Parameters    | Description                               |
|:--------------|:------------------------------------------|
| port          | PortHandler instance                      |
| start_address | Address on the control table of Dynamixel |
| data_length   | Data length                               |
| param         | Parameter for write                       |
| param_length  | Parameter length                          |


- Detailed Description

   The function intends simultaneous multiple Dynamixel control by writing same length of data to the same address on the Dynamixel control table. The function constructs the transmission packet with sync write instruction, and starts `txRxPacket`. The communication result and the hardware error are available when the function is terminated.


##### bulkReadTx
- Syntax
``` python
bulkReadTx(port, param, param_length)
```
- Parameters

| Parameters   |     Description      |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

   The function intends simultaneous multiple Dynamixel control by writing different length of data to the different address on the Dynamixel control table. The function constructs the transmission packet with bulk read instruction, and starts `txPacket`. Then the function calls `setPacketTimeout` function when `txPacket` succeeds. The communication result and the hardware error are available when the function is terminated.

##### bulkWriteTxOnly
- Syntax
``` python
bulkWriteTxOnly(port, param, param_length)
```
- Parameters

| Parameters   |     Description      |
|:-------------|:---------------------|
| port         | PortHandler instance |
| param        | Parameters           |
| param_length | Parameter length     |

- Detailed Description

   The function intends simultaneous multiple Dynamixel control by writing different length of data from the different address on the Dynamixel control table. The function constructs the transmission packet with bulk write instruction, and starts `TxRxPacket`. The communication result and the hardware error are available when the function is terminated. The function is unavailable in protocol 1.0.
