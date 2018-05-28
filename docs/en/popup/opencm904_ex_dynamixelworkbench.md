---
layout: popup
---

# [DynamixelWorkbench](#dynamixelworkbench)

## [APIs](#apis)

### Dynamixel Item
This file has control table of Dynamixel Series (AX, RX, EX, MX, XL, XM, XH, PRO).

### Dynamixel tool Class
This class loads control table and some information in file of Dynamixel item.

### Dynamixel Driver Class
This class includes functions(register, sync and bulk communication) for controlling Dynamixel using [Dynamixel SDK](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/).

### Dynamixel Workbench Class
This class helps control Dynamixel with simple functions. It includes many [examples](#workbench-examples) for Dynamixel users.

```c++
class DynamixelWorkbench
{
 ...

 public:
  DynamixelWorkbench();
  ~DynamixelWorkbench();

  bool begin(const char* device_name = "/dev/ttyUSB0", uint32_t baud_rate = 57600);

  bool scan(uint8_t *get_id, uint8_t *get_id_num = 0, uint8_t range = 200);
  bool ping(uint8_t id, uint16_t *get_model_number = 0);

  bool reboot(uint8_t id);
  bool reset(uint8_t id);

  bool setID(uint8_t id, uint8_t new_id);
  bool setBaud(uint8_t id, uint32_t new_baud);
  bool setPacketHandler(float protocol_version);

  char* getModelName(uint8_t id);

  bool ledOn(uint8_t id);
  bool ledOff(uint8_t id);

  bool jointMode(uint8_t id, uint16_t vel = 0, uint16_t acc = 0);
  bool wheelMode(uint8_t id, uint16_t vel = 0, uint16_t acc = 0);
  bool currentMode(uint8_t id, uint8_t cur = 50);

  bool goalPosition(uint8_t id, uint16_t goal);
  bool goalSpeed(uint8_t id, int32_t goal);

  bool itemWrite(uint8_t id, const char* item_name, int32_t value);  // write value to item
  bool syncWrite(const char *item_name, int32_t* value);             // sync write
  bool bulkWrite(void);                                              // bulk write

  int32_t  itemRead(uint8_t id, const char* item_name);  // read value from item
  int32_t* syncRead(const char* item_name);              // sync read
  int32_t  bulkRead(uint8_t id, const char* item_name);  // bulk read

  void addSyncWrite(const char* item_name);
  void addSyncRead(const char* item_name);

  void initBulkWrite();
  void initBulkRead();

  bool addBulkWriteParam(uint8_t id, const char *item_name, int32_t data);
  bool addBulkReadParam(uint8_t id, const char *item_name);
  bool setBulkRead();

  int32_t convertRadian2Value(uint8_t id, float radian);
  float convertValue2Radian(uint8_t id, int32_t value);

  int32_t convertVelocity2Value(uint8_t id, float velocity);
  float convertValue2Velocity(uint8_t id, int32_t value);

  int16_t convertTorque2Value(uint8_t id, float torque);
  float convertValue2Torque(uint8_t id, int16_t value);

  ...
};
```

### [Workbench Examples](#workbench-examples)

#### [Find Dynamixel](#find-dynamixel)

When you get a Dynamixel first, you need to know what ID and Baud rate is.
This example find out ID and Baud rate of connected Dynamixels.

**begin** function set PortHandler and PacketHandler. **scan** function ping all Dynamixels.
After get Dynamixels, you can check ID and Baudrate of its.

```c++
/*******************************************************************************
* Copyright 2016 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* Authors: Taehun Lim (Darby) */

#include <DynamixelWorkbench.h>

#define DXL_BUS_SERIAL1 "1"            //Dynamixel on Serial1(USART1)  <-OpenCM9.04
#define DXL_BUS_SERIAL2 "2"            //Dynamixel on Serial2(USART2)  <-LN101,BT210
#define DXL_BUS_SERIAL3 "3"            //Dynamixel on Serial3(USART3)  <-OpenCM 485EXP
#define DXL_BUS_SERIAL4 "/dev/ttyUSB0" //Dynamixel on Serial3(USART3)  <-OpenCR

#define BAUDRATE_NUM 3

DynamixelWorkbench dxl_wb;

void setup()
{
  Serial.begin(57600);
  while(!Serial); // Open a Serial Monitor

  uint8_t scanned_id[16] = {0, };
  uint8_t dxl_cnt = 0;
  uint32_t baud[BAUDRATE_NUM] = {9600, 57600, 1000000};
  uint8_t index = 0;
  uint8_t range = 100;

  while (index < BAUDRATE_NUM)
  {
    Serial.println(String(baud[index]) + " bps");

    dxl_wb.begin(DXL_BUS_SERIAL3, baud[index]);
    dxl_wb.scan(&scanned_id[0], &dxl_cnt, range);

    for (int i = 0; i < dxl_cnt; i++)
    {
      Serial.println("   id : " + String(scanned_id[i]) + "   Model Name : " + String(dxl_wb.getModelName(scanned_id[i])));
    }

    index++;    
  }
  Serial.println("End");
}

void loop()
{

}
```

### [Position](#position)

This example shows position control using Dynamixel. You need to set parameters of BAUDRATE and ID.  
**begin** function set an portHandler and packetHandler. **ping** function get an item of connected Dynamixel.  
**jointMode** function make joint(position) mode.  
If Dynamixel is set correctly, **goalPosition** function make it move to position.

```c++
/*******************************************************************************
* Copyright 2016 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* Authors: Taehun Lim (Darby) */

#include <DynamixelWorkbench.h>

#define DXL_BUS_SERIAL1 "1"            //Dynamixel on Serial1(USART1)  <-OpenCM9.04
#define DXL_BUS_SERIAL2 "2"            //Dynamixel on Serial2(USART2)  <-LN101,BT210
#define DXL_BUS_SERIAL3 "3"            //Dynamixel on Serial3(USART3)  <-OpenCM 485EXP
#define DXL_BUS_SERIAL4 "/dev/ttyUSB0" //Dynamixel on Serial3(USART3)  <-OpenCR

#define BAUDRATE  57600
#define DXL_ID    1

DynamixelWorkbench dxl_wb;

void setup()
{
  Serial.begin(57600);
  while(!Serial); // Open a Serial Monitor

  dxl_wb.begin(DXL_BUS_SERIAL3, BAUDRATE);
  dxl_wb.ping(DXL_ID);

  dxl_wb.jointMode(DXL_ID);
}

void loop()
{
  dxl_wb.goalPosition(DXL_ID, 0);

  delay(2000);

  dxl_wb.goalPosition(DXL_ID, 2000);

  delay(2000);
}
```

### [Speed](#speed)

This example shows velocity control using Dynamixel. You need to set parameters of BAUDRATE and ID.  
**begin** function set an portHandler and packetHandler. **ping** function get an item of connected Dynamixel.  
**wheelMode** function make wheel(velocity) mode.  
If Dynamixel is set correctly, **goalSpeed** function make it turn to position.

```c++
/*******************************************************************************
* Copyright 2016 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* Authors: Taehun Lim (Darby) */

#include <DynamixelWorkbench.h>

#define DXL_BUS_SERIAL1 "1"            //Dynamixel on Serial1(USART1)  <-OpenCM9.04
#define DXL_BUS_SERIAL2 "2"            //Dynamixel on Serial2(USART2)  <-LN101,BT210
#define DXL_BUS_SERIAL3 "3"            //Dynamixel on Serial3(USART3)  <-OpenCM 485EXP
#define DXL_BUS_SERIAL4 "/dev/ttyUSB0" //Dynamixel on Serial3(USART3)  <-OpenCR

#define BAUDRATE  57600
#define DXL_ID    1

DynamixelWorkbench dxl_wb;

void setup()
{
  Serial.begin(57600);
  while(!Serial); // Open a Serial Monitor

  dxl_wb.begin(DXL_BUS_SERIAL3, BAUDRATE);
  dxl_wb.ping(DXL_ID);

  dxl_wb.wheelMode(DXL_ID);
}

void loop()
{
  dxl_wb.goalSpeed(DXL_ID, 300);

  delay(3000);

  dxl_wb.goalSpeed(DXL_ID, -300);

  delay(3000);
}
```
