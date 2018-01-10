---
layout: archive
lang: en
ref: dynamixel_sdk_api_reference_java_groupbulkwrite
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/api_reference/java/java_groupbulkwrite/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 4"></div>
<div style="counter-reset: h3 4"></div>

# [API Reference](#api-reference)

## [Java](#java)

### [Java GroupBulkWrite](#java-groupbulkwrite)

- Description

  Base functions for simultaneous dynamixel control on writing to different length data on different control table address.

- Members

  None


- Methods

| | |
| ------------- | ------------- |
|**[groupBulkWrite](#groupbulkwrite)**	|Initializes members of packet data pointer struct|
|**[groupBulkWriteAddParam](#groupbulkwriteaddparam)**	|Adds parameter storage for read |
|**[groupBulkWriteRemoveParam](#groupbulkwriteremoveparam)**	|Removes parameter on the storage |
|**[groupBulkWriteChangeParam](#groupbulkwritechangeparam)**	|Changes parameter on the storage |
|**[groupBulkWriteClearParam](#groupbulkwriteclearparam)**	|Clears parameter storage|
|**[groupBulkWriteTxPacket](#groupbulkwritetxpacket)**	|Transmits packet to the number of Dynamixels|

- Enumerator

  None

#### Method References
----------------------------------------------
##### groupBulkWrite
- Syntax
``` java
int groupBulkWrite(int port_num, int protocol_version)
```
- Parameters

| | |
| ------------- | ------------- |
|port_num	|Port number|
|protocol_version	|Protocol version|

- Detailed Description

   This function initializes the parameters for packet construction. The function resizes groupData struct and initialzes struct members.

##### groupBulkWriteAddParam
- Syntax
``` java
Boolean groupBulkWriteAddParam(int group_num, byte id, short start_address, short data_length, int data, short input_length)
```
- Parameters

| | |
| ------------- | ------------- |
|group_num | Group number|
|id	|Dynamixel ID|
|start_address	|Start address|
|data_length	|Data length|
|data	|Data for write|
|input_length	|Input data length|

- Detailed Description

    This function pushes `id` into the Dynamixel ID list, and initializes #`group_num` parameter storage by setting `start_address` and `param_length`. The function deals with 1, 2 or 4 byte data only. The function returns false when the length of input data exceeds parameter or wrong length, or returns true.   


##### groupBulkWriteRemoveParam
- Syntax
``` java
void groupBulkWriteRemoveParam(int group_num, byte id)
```
- Parameters

| | |
| ------------- | ------------- |
|group_num | Group number|
|id|	Dynamixel ID|

- Detailed Description

   This function removes `id` and its data for write in the #`group_num` Dynamixel ID list. The function returns false when no data is in the parameter storage, or returns true.


##### groupBulkWriteChangeParam
- Syntax
``` java
 Boolean groupBulkWriteChangeParam(int group_num, byte id, short start_address, short data_length, int data, short input_length, short data_pos)
```
- Parameters

| | |
| ------------- | ------------- |
|group_num | Group number|
|id	|Dynamixel ID|
|start_address	|Start address|
|data_length	|Data length|
|data	|data for write|
|input_length	|Input data length|
|data_pos	|Data position in the array|

- Detailed Description

   This function pushes new `data_length` bytes data into #`group_num` parameter storage of same id. The function returns false when the target ID doesn’t exists in the ID list, or returns true.

##### groupBulkWriteClearParam
- Syntax
``` java
void groupBulkWriteClearParam(int group_num)
```
- Parameters

| | |
| ------------- | ------------- |
|group_num | Group number|

- Detailed Description

   This function clears #`group_num` Dynamixel ID list.


##### groupBulkWriteTxPacket
- Syntax
``` java
int groupBulkWriteTxPacket(int group_num)
```
- Parameters

| | |
| ------------- | ------------- |
|group_num | Group number|

- Detailed Description

   This function transmits the packet by using `BulkWriteTxOnly` function. The communication result and the hardware error are available when the function is terminated.
