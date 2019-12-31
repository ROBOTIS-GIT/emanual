---
layout: popup
---

# bulkWrite

## Description

This function writes data to specific memory address range of multiple DYNAMIXEL's.

## Syntax

- bulkWrite(bulkWriteParam)

## Parameters

- **bulkWriteParam** : Structure that contains bulk Write data in below members. Data type : ParamForbulkWriteInst_t
  - id_count : Number of ID to apply bulk Write instruction. Data type : unsigned int8
  - XelInfoForBulkWriteParam_t xel[DXL_MAX_NODE] : Structure that contains DYNAMIXEL ID and data to write on each DYNAMIXEL
    - id : ID of a specific DYNAMIXEL. Data type : unsigned int8
    - addr : Address of the specific memory of DYNAMIXEL. Data type : unsigned int16
    - length : Length of data to write. Data type : unsigned int16
    - data[DXL_MAX_NODE_BUFFER_SIZE] : Data to write on each DYNAMIXEL. Data type : unsigned int8

**NOTE**  
`DXL_MAX_NODE` : 16  
`DXL_MAX_NODE_BUFFER_SIZE` : 12
{: .notice}

## Returns

- True(1) on success.
- False(0) on failure.

## Example

```c++
#include <Dynamixel2Arduino.h>

SoftwareSerial soft_serial(7, 8);   //RX,TX
#define DXL_SERIAL   Serial
#define DEBUG_SERIAL soft_serial    //define proper serial debugging port for the board
const uint8_t RS485_DIR_PIN = 2;    //DYNAMIXEL Shield

ParamForBulkReadInst_t bulk_read_param;
ParamForBulkWriteInst_t bulk_write_param;
RecvInfoFromStatusInst_t read_result;

Dynamixel2Arduino dxl(DXL_SERIAL, RS485_DIR_PIN);

void setup() {
  // put your setup code here, to run once:
  DEBUG_SERIAL.begin(115200);
  dxl.begin(1000000);
  dxl.scan();

  // fill the members of structure for bulkWrite
  bulk_write_param.xel[0].id = 1;
  bulk_write_param.xel[1].id = 3;
  bulk_write_param.xel[0].addr = 116; //Goal Position on X serise
  bulk_write_param.xel[1].addr = 104; //Goal Velocity on X serise
  bulk_write_param.xel[0].length = 4;
  bulk_write_param.xel[1].length = 4;
  bulk_write_param.id_count = 2;

  // fill the members of structure for bulkRead
  bulk_read_param.xel[0].id = 1;
  bulk_read_param.xel[1].id = 3;
  bulk_read_param.xel[0].addr = 132; //Present Position on X serise
  bulk_read_param.xel[1].addr = 128; //Present Velocity on X serise
  bulk_read_param.xel[0].length = 4;
  bulk_read_param.xel[1].length = 4;  
  bulk_read_param.id_count = 2;

  dxl.torqueOff(1);
  dxl.setOperatingMode(1, OP_POSITION);
  dxl.torqueOn(1);

  dxl.torqueOff(3);
  dxl.setOperatingMode(3, OP_VELOCITY);
  dxl.torqueOn(3);
}

void loop() {
  // put your main code here, to run repeatedly:
  static int32_t position = 0, velocity = 0;
  int32_t recv_position = 0, recv_velocity = 0;

  // set value to data buffer for bulkWrite
  position = position >= 4095 ? 0 : position+409;
  memcpy(bulk_write_param.xel[0].data, &position, sizeof(position));
  velocity = velocity >= 200 ? -200 : velocity+10;
  memcpy(bulk_write_param.xel[1].data, &velocity, sizeof(velocity));

  // send command using bulkWrite
  dxl.bulkWrite(bulk_write_param);
  delay(100);

  // Print the read data using bulkRead
  dxl.bulkRead(bulk_read_param, read_result);
  DEBUG_SERIAL.println("======= Bulk Read ========");
  memcpy(&recv_position, read_result.xel[0].data, read_result.xel[0].length);
  memcpy(&recv_velocity, read_result.xel[1].data, read_result.xel[1].length);
  DEBUG_SERIAL.print("ID: ");DEBUG_SERIAL.print(read_result.xel[0].id);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Present Position: ");DEBUG_SERIAL.print(recv_position);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Packet Error: ");DEBUG_SERIAL.print(read_result.xel[0].error);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Param Length: ");DEBUG_SERIAL.print(read_result.xel[0].length);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.println();
  DEBUG_SERIAL.print("ID: ");DEBUG_SERIAL.print(read_result.xel[1].id);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Present Velocity: ");DEBUG_SERIAL.print(recv_velocity);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Packet Error: ");DEBUG_SERIAL.print(read_result.xel[1].error);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.print(", Param Length: ");DEBUG_SERIAL.print(read_result.xel[1].length);DEBUG_SERIAL.print(" ");
  DEBUG_SERIAL.println();
  DEBUG_SERIAL.println();
  delay(100);
}
```
