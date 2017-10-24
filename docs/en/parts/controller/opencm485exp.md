---
layout: archive
lang: en
ref: opencm485exp
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencm485exp/
sidebar:
  title: OpenCM 485 EXP
  nav: "opencm485exp"
---


# [Introduction](#introduction)

![](/assets/images/parts/controller/opencm904/opencm485exp_product.jpg)


# [Specifications](#specifications)

|Item|Description|
|:---:|:---:|
|Input voltage|5~30V|
|Power|SMPS, LiPo, DXL PRO 24V|
|Power Switch|1|
|Dynamixel Port|4Pin x 5, 3Pin x 5|
|Button|2|
|LED|5|
|Size|68 mm X 66.5 mm|
|Weight|32g|

# [Layout](#layout)

![](/assets/images/parts/controller/opencm904/opencm485exp_01.jpg)

1. **SMPS DC Connector** : For using SMPS DC Adapter to supply power to OpenCM 485 EXP board.
2. **DXL Pro Power Connector** : Power connector for Dynamixel Pro (24V).
3. **Li-Po battery Connector** : Connector for 11.1V Li-Po battery(LBS-10).
4. **Dynamixel TTL 3 -Pin Bus** : Used to connect 3-Pin Cables(Dynamixel TTL Bus) and for daisy chaining Dynamixels.
5. **User Button** : Function of these buttons can be assigned by the user.
6. **User LED** : LED that can be controlled by the user.
7. **I/O header** : Header pins used to mount OpenCM9.04(2.54mm pitch).
8. **Dynamixel 485 4-Pin Bus** : Used to connect 4-Pin Cables(Dynamixel TTL Bus) and for daisy chaining Dynamixels.
9. **Power Switch** : Switch that powers the board and Dynamixel. Note: Does not disconnect the power received via USB cable.
10. **JP1 Jumper** : Jumper that determines whether the power inputted onto OpenCM 485 EXP will be supplied to OpenCM9.04 board or not.


# [Connecting OpenCM9.04](#connecting-opencm9-04)

1. Prepare OpenCM 485 EXP and OpenCM9.04 boards. Any version of OpenCM9.04 is compatible. Solder the header onto the OpenCM9.04.
    
    ![](/assets/images/parts/controller/opencm904/opencm485exp_02.jpg)
    
2. OpenCM9.04 is mounted onto OpenCM 485 EXP as shown below.

  `Caution` The orientation of the connection must be correct.
  {: .notice--warning}

    ![](/assets/images/parts/controller/opencm904/opencm485exp_03.jpg)
 
3. Connect the USB cable onto OpenCM9.04 board.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_04.jpg)

4. Connect Dynamixel and 12V SMPS adapter onto OpenCM 485 EXP board.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_05.jpg)


# [Power Circuit Connection](#power-circuit-connection)

A power circuit block diagram of the OpenCM 485 EXP and OpenCM9.04, once mounted, is shown below.  
OpenCM 485 EXP supplies 5V from OpenCM9.04 as default. JP1 can be used to determine if VDD power from OpeCM 485 EXP board is supplied to OpenCM9.04.
 
![](/assets/images/parts/controller/opencm904/opencm485exp_06.png)
 
> OpenCM 485 EXP Power Connection
 
OpenCM 485 EXP’s Dynamixel 485 bus operates as a Dynamixel bus using OpenCM9.04’s USART3(Serial3).

`Note` OpenCM9.04’s Dynamixel TTL BUS is connected to USART1(Serial1).
{: .notice}

![](/assets/images/parts/controller/opencm904/opencm485exp_07.gif)
 
> OpenCM9.04 & OpenCM 485 EXP Bus Connections

# [EXP Board Programming](#exp-board-programming)

1. Support.robotis.com -> Software Help -> ROBORIS_OpenCM (MUST use V 1.0.1 or later).
 
    ![](/assets/images/parts/controller/opencm904/opencm485exp_08.png)
 
2. Extract OpenCM IDE and execute ROBOTIS_OpenCM.exe file.

    ![](/assets/images/parts/controller/opencm904/opencm485exp_09.jpg)
            
3. OpenCM 485 EXP’s 485 Bus sends and receives communication packets from OpenCM9.04’s Serial3(USART3).
Dynamixel Class variable MUST be set to 3 once it has been declared.

```cpp
Dynamixel Dxl(3); //Dynamixel on Serial3 (USART3). Needs to be set as 3 to used USART3 on OpenCM 485 EXP.
void setup() {
  Dxl.begin(1);  //1Mbps  
}

void loop() {  
  Dxl.writeWord(6, 30, 0);
  Dxl.writeWord(2, 30, 0);
  delay(1000);              
  Dxl.writeWord(6, 30, 1023);
  Dxl.writeWord(2, 30, 4095);
  delay(1000);
}
```

4. Click on “Download” button indicated below to download the program.
 
    ![](/assets/images/parts/controller/opencm904/opencm485exp_10.jpg)

# [Button & LED](#button-led)

OpenCM 485 EXP board has 2 buttons and 3 LED’s that are connected to OpenCM9.04 I/O pins.  
The OpenCM9.04 I/O pin numbers for the buttons and LED’s are indicated below.

||OpenCM9.04 I/O|
|:---:|:---:|
|Button1|16|
|Button2|17|
|LED1|18|
|LED2|19|
|LED3|20|
 
![](/assets/images/parts/controller/opencm904/opencm485exp_11.jpg)
 

# [Downloads](#downloads)

- `Download PDF` [PCB Schematic](http://support.robotis.com/en/baggage_files/opencm/schematic1___opencm_485exp.pdf)


[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[RoboPlus Motion]: ???/docs/en/software/rplus1/motion/
[RoboPlus Manager]: ???
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Firmware Update]: ???Roboplus
[Top Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[DARWIN-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
