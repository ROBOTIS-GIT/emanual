---
layout: popup
---

# [EEPROM](#eeprom)

It is the EEPROM library test of OpenCM9.04 board.

# Test

OpenCM9.04 does not have EEPROM memory, so it emulates a part of flash memory built in STM32F103 into EEPROM. The method of emulation was provided by ST as an example.  
The area used as EEPROM is 0x0801F800 ~ 0x08020000 (2KBytes) as shown below. Two sectors are used.

![](/assets/images/parts/controller/opencm904/memory_map.png)

32 bits are used to store one data, the lower 16 bits are the data to be stored, and the upper 16 bits indicate the address of the corresponding data. When storing data, it is always stored in the new location. When you use one page while saving the data, only the latest values ​​from the saved page are copied to the new page and the existing page is deleted.
As a result, the number of flash memory erasures is reduced, thereby increasing the write-through life.

![](/assets/images/parts/controller/opencm904/ex_eeprom_02.png)

![](/assets/images/parts/controller/opencm904/ex_eeprom_03.png)

To use the EEPROM library, a header must be added, and the maximum size of the current EEPROM is 512bytes. Since the EEPROM library has ported what is supported in Arduino, the basic usage method is the same as that used in other existing Arduino boards. For more information on how to use it, please refer to the Arduino site.

[https://www.arduino.cc/en/Reference/EEPROM](https://www.arduino.cc/en/Reference/EEPROM)

```c++
#include <EEPROM.h>
```

```c++
#include <EEPROM.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  uint32_t tTime;
  static int i = 0;


  if( (millis()-tTime) > 100 )
  {
    Serial.print(EEPROM.read(0));
    Serial.print("\t");
    Serial.print(EEPROM.read(1));
    Serial.print("\t");
    Serial.print(EEPROM.read(2));
    Serial.println("\t");

    tTime = millis();
  }

  if (Serial.available())
  {
    uint8_t inByte = Serial.read();

    if( inByte == '1' )
    {
      EEPROM.write(0, i+1);
      EEPROM.write(1, i+2);
      EEPROM.write(2, i+3);
      i++;
    }
  }
}
```
