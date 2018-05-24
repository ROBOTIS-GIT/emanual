---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_python_groupsyncwrite
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/python/python_groupsyncwrite/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 3"></div>
<div style="counter-reset: h3 2"></div>

# [API Reference](#api-reference)

## [Python](#python)

### [Python GroupSyncWrite](#python-groupsyncwrite)

- Description

  Base functions for simultaneous dynamixel control on writing to same length data on same control table address.

- Members

  None


- Methods

| Methods                                                      | Description                                       |
|:-------------------------------------------------------------|:--------------------------------------------------|
| **[GroupSyncWrite](#groupsyncwrite)**                        | Initializes members of packet data pointer struct |
| **[addParam](#addparam)**                                    | Adds parameter storage for read                   |
| **[removeParam](#removeparam)**                              | Removes parameter on the storage                  |
| **[changeParam](#changeparam)**                              | Changes parameter on the storage                  |
| **[clearParam](#clearparam)**                                | Clears parameter storage                          |
| **[txPacket](#txpacket)**                                    | Transmits packet to the number of Dynamixels      |



- Enumerator

  None

#### Method References

##### GroupSyncWrite
- Syntax
``` python
GroupSyncWrite(port, ph, start_address, data_length)
```
- Parameters

| Parameters       | Description                                 |
|:-----------------|:--------------------------------------------|
| port_num         | PortHandler instance                        |
| ph               | PacketHandler instance                      |
| start_address    | Control table address to start writing data |
| data_length      | Total data length                           |

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.


##### addParam
- Syntax
``` python
addParam(dxl_id, data)
```
- Parameters

| Parameters   | Description                |
|:-------------|:---------------------------|
| dxl_id       | Dynamixel ID               |
| data         | Data for write             |

- Detailed Description

   This function pushes `dxl_id` to the Dynamixel ID list, and initializes parameter storage by adding `input_length` bytes `data`. The function deals with 1, 2 or 4 byte data only. The function returns false when the length of input data exceeds parameter or wrong length, or returns true.


##### removeParam
- Syntax
``` python
removeParam(dxl_id)
```
- Parameters

| Parameters   | Description                |
|:-------------|:---------------------------|
| dxl_id       | Dynamixel ID               |

- Detailed Description

   This function removes `dxl_id` and its data for write in the Dynamixel ID list. The function returns false when no data is in the parameter storage, or returns true.


##### changeParam
- Syntax
``` python
changeParam(dxl_id, data)
```
- Parameters

| Parameters   | Description                |
|:-------------|:---------------------------|
| dxl_id       | Dynamixel ID               |
| data         | Data for write             |

- Detailed Description

   This function pushes new `data_length` bytes `data` into parameter storage of same `dxl_id`. The function returns false when the target ID doesn’t exists in the ID list, or returns true.


##### clearParam
- Syntax
``` python
clearParam()
```
- Parameters

   None

- Detailed Description

   This function clears Dynamixel ID list.


##### txPacket
- Syntax
``` python
txPacket()
```
- Parameters

None

- Detailed Description

   This function transmits the packet by using `syncWriteTxOnly` function. The communication result and the hardware error are available when the function is terminated.
