---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_python_groupbulkread
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_groupbulkread/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 3"></div>
<div style="counter-reset: h3 5"></div>

# [API Reference](#api-reference)

## [Python](#python)

### [Python GroupBulkRead](#python-groupbulkread)

- Description

  Base functions for simultaneous dynamixel control on reading to different length data on different control table address.

- Members

  None

- Methods

| Methods                                                   | Description                                                |
|:----------------------------------------------------------|:-----------------------------------------------------------|
| **[GroupBulkRead](#groupbulkread)**                       | Initializes members of packet data pointer struct          |
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

##### GroupBulkRead
- Syntax
``` python
GroupBulkRead(port, ph)
```
- Parameters

| Parameters       | Description            |
|:-----------------|:-----------------------|
| port             | PortHandler instance   |
| ph               | PacketHandler instance |


- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### addParam
- Syntax
``` python
addParam(dxl_id, start_address, data_length)
```
- Parameters

| Parameters    | Description   |
|:--------------|:--------------|
| dxl_id            | Dynamixel ID  |
| start_address | Start address |
| data_length   | Data length   |


- Detailed Description

   This function pushes `dxl_id` to the Dynamixel ID list, and initializes the parameter storage by `setting start_address` and `data_length`.


##### removeParam
- Syntax
``` python
removeParam(dxl_id)
```
- Parameters

| Parameters  | Description                               |
|:------------|:------------------------------------------|
| dxl_id      | Dynamixel ID                              |

- Detailed Description

   This function removes target list of `dxl_id` from Dynamixel ID list. It returns false when the class uses Protocol 1.0 .


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

   This function transmits the packet by using `bulkReadTx` The communication result and the hardware error are available when the function is terminated.


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

   This function checks whether there is available data in the data storage. It returns false when there is no data from target address, or returns true.

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

   This function gets specific data from received packet. It returns false when there is no data from target address, or returns true.
