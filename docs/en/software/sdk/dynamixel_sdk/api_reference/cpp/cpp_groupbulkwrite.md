---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_cpp_groupbulkwrite
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/api_reference/cpp/cpp_groupbulkwrite
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h3 9"></div>
<div style="counter-reset: h2 2"></div>
<div style="counter-reset: h1 5"></div>

### [CPP GroupBulkWrite](#cpp-groupbulkwrite)

- Description

  Base class for simultaneous dynamixel control on writing.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
|GroupBulkWrite	|Initializes groupBulkWrite instance|
|~GroupBulkWrite	|Clears parameter storage |
|getPortHandler	|Returns PortHandler instance|
|getPacketHandler	|Returns PacketHandler instance|
|**[addParam](#addparam)**	|Adds parameter storage for read |
|**[removeParam](#removeparam)**	|Removes parameter on the storage |
|**[changeParam](#changeparam)**	|Changes parameter on the storage |
|**[clearParam](#clearparam)**	|Clears parameter storage|
|**[txPacket](#txpacket)**	|Transmits packet to the number of Dynamixels|



- Enumerator

  None

#### Method References
----------------------------------------------

##### addParam
- Syntax
``` cpp
bool addParam(UINT8_T id, UINT16_T start_address, UINT16_T data_length, UINT8_T *data)
```
- Parameters

| | |
| ------------- | ------------- |
|id	|Dynamixel ID|
|start_address	|Start address|
|data_length	|Data length|
|data	|Data for write|

- Detailed Description

   This function pushes id to the Dynamixel ID list, and initializes the parameter storage by setting `start_address` and `data_length`. It returns false when the target ID exists already in the ID list, or returns true.


##### removeParam
- Syntax
``` cpp
void removeParam(UINT8_T id)
```
- Parameters

| | |
| ------------- | ------------- |
|id|	Dynamixel ID|

- Detailed Description

   This function removes target id in the Dynamixel ID list.


##### changeParam
- Syntax
``` cpp
 bool changeParam(UINT8_T id, UINT16_T start_address, UINT16_T data_length, UINT8_T *data)
```
- Parameters

| | |
| ------------- | ------------- |
|id	|Dynamixel ID|
|start_address	|Start address|
|data_length	|Data length|
|data	|data for write|

- Detailed Description

   This function pushes new data to the parameter storage of same ID. It returns false when the target ID doesn’t exists in the ID list, or returns true.


##### clearParam
- Syntax
``` cpp
void clearParam()
```
- Parameters

   None

- Detailed Description

   This function clears the Dynamixel ID list.


##### txPacket
- Syntax
``` cpp
int txPacket()
```
- Parameters

   None

- Detailed Description

   This function transmits the packet by using `bulkWriteTxOnly()` function. It returns `COMM_NOT_AVAILABLE` when the class uses Protocol 1.0 or there is no item on the Dynamixel ID list, or returns communication result.
