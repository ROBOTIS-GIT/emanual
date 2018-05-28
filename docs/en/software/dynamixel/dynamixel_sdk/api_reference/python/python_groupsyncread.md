---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_python_groupsyncread
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_groupsyncread/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 3"></div>
<div style="counter-reset: h3 3"></div>

# [API Reference](#api-reference)

## [Python](#python)

### [Python GroupSyncRead](#python-groupsyncread)

- Description

  Base functions for simultaneous dynamixel control on reading to same length data on same control table address. The function is unavailable in protocol 1.0.

- Members

  None


- Methods

| Methods                                                   | Description                                                |
|:----------------------------------------------------------|:-----------------------------------------------------------|
| **[GroupSyncRead](#groupsyncread)**                       | Initializes members of packet data pointer struct          |
| **[addParam](#addparam)**                                 | Adds parameter storage for read                            |
| **[removeParam](#removeparam)**                           | Removes parameter on the storage                           |
| **[clearParam](#clearparam)**                             | Clears parameter storage                                   |
| **[txPacket](#txpacket)**                                 | Transmits packet to the number of Dynamixels               |
| **[rxPacket](#rxpacket)**                                 | receives packet from the number of Dynamixels              |
| **[txRxPacket](#txrxpacket)**                             | Transmits and receives packet on the number of Dynamixels  |
| **[isAvailable](#isavailable)**                           | Checks whether there is available data in the data storage |
| **[getData](#getdata)**                                   | Gets data from received packet                             |


- Enumerator

  None

#### Method References

##### GroupSyncRead
- Syntax
``` python
GroupSyncRead(port, ph, start_address, data_length)
```
- Parameters

| Parameters       | Description                                 |
|:-----------------|:--------------------------------------------|
| port             | PortHandler instance                        |
| ph               | PacketHandler instance                      |
| start_address    | Control table address to start reading data |
| data_length      | Total data length                           |


- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### addParam
- Syntax
``` python
addParam(dxl_id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| dxl_id     | Dynamixel ID |

- Detailed Description

   This function pushes id to the Dynamixel ID list, and initializes parameter storage It returns false when the class uses Protocol 1.0, or it returns true.


##### removeParam
- Syntax
``` python
removeParam(dxl_id)
```
- Parameters

| Parameters | Description  |
|:-----------|:-------------|
| dxl_id     | Dynamixel ID |

- Detailed Description

   This function removes id and its data for write in the Dynamixel ID list. It returns false when the class uses Protocol 1.0 or target ID does not exists in the ID list, or returns true.


##### clearParam
- Syntax
``` python
clearParam()
```
- Parameters

None

- Detailed Description

   This function clears Dynamixel ID list. It returns false when the class uses Protocol 1.0, or returns true.


##### txPacket
- Syntax
``` python
txPacket()
```
- Parameters

None

- Detailed Description

   This function transmits the packet by using `syncReadTx` function. The communication result and the hardware error are available when the function is terminated.


##### rxPacket
- Syntax
``` python
rxPacket()
```
- Parameters

None

- Detailed Description

   This function receives the packet by using `readRx` function. The communication result and the hardware error are available when the function is terminated.


##### txRxPacket
- Syntax
``` python
txRxPacket()
```
- Parameters

None

- Detailed Description

   This function transmits and receives the packet by using `txPacket` function and `rxPacket` function. The communication result and the hardware error are available when the function is terminated.

 ##### isAvailable
 - Syntax
 ``` python
 isAvailable(dxl_id, address, data_length)
 ```
 - Parameters

| Parameters  | Description                               |
|:------------|:------------------------------------------|
| dxl_id      | Dynamixel ID                              |
| address     | Address on the control table of Dynamixel |
| data_length | data length                               |


 - Detailed Description

    This function checks whether there is available data in the data storage. It returns false when used Protocol is 1.0 version or there is no data from target address, or returns true.

##### getData
- Syntax
``` python
getData(dxl_id, address, data_length)
```
- Parameters

| Parameters  | Description                               |
|:------------|:------------------------------------------|
| dxl_id      | Dynamixel ID                              |
| address     | Address on the control table of Dynamixel |
| data_length | data length                               |


- Detailed Description

   This function gets specific data from received packet. It returns false when the class uses Protocol 1.0 or there is no data from target address, or returns true.
