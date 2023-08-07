---
layout: archive
lang: en
ref: faq_parts
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/faq_parts/
sidebar:
  title: FAQ PARTS
  nav: "faq_parts"
---

# How can I check which DYNAMIXEL servos are compatible with my controller?
See the [Controller Compatibility Chart](docs/en/parts/controller/controller_compatibility/) for information on DYNAMIXEL controller compatibility.

# How can I use my DYNAMIXEL servos with Arduino?
* The [OpenRB-150] and [OpenCR 1.0](/docs/en/parts/controller/opencr10/) microcontrollers are compatible with the [Arduino IDE](docs/en/software/arduino_ide/) and support the DYNAMIXEL2Arduino library for DYNAMIXEL control.
* Arduino Uno and MKR format boards are also compatible with DYNAMIXEL servos through the use of the [DYNAMIXEL Shield](/docs/en/parts/interface/dynamixel_shield/) and [DYNAMIXEL MKR Shield](/docs/en/parts/interface/mkr_shield/) accessories.

# How do I configure a Zigbee wireless communication module?
Our [Zigbee wireless module set up](https://youtu.be/YgebCObXJZg) video provides a walkthrough of Zigbee setup and configuration.

# Help! I can't control my robot using a wireless remote!

 1. Wired connections to take priority over wireless communications. Disconnect any wired controller connections before testing wireless control.
 2. Wireless communication may not function properly if there is insufficient power supply to your robot, ensure that your batteries are fully charged and that no wires are loose.
 3. Check all cables connecting your wireless adapter to your robot, and ensure that no connections are loose and that no wires have been cut or damaged.
 4. Confirm that your wireless adapter is securely mounted to the robot. An unsecured adapter may move or come loose during operation and disconnect your robot from wireless control.
 5. Confirm that the indicator LED on your controller and wireless adapter are both on to ensure a reliable wireless connection.
 6. If all the steps above don’t work, repeat the inital setup process for your wireless adapter to ensure proper configuration.

# I want to pair my ROBOTIS BT-210 Module with a PC.
Instructions on pairing a BT-210 module with a PC are available on our [legacy forum](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=42&sca=NETWORK)

# How can I change the BT-210 pairing PIN?

1. Download and install the OpenCM IDE from the [ROBOTIS Download Center](http://en.robotis.com/service/downloadpage.php?ca_id=10)
2. Download the "f_SerialUSB_Serial2_Converter" example to your OpenCM controller.
3. Open the [BT-210 eManual page](/docs/en/parts/communication/bt-210/#bt-210-setting)
4. Follow the instructions for **Step 5** in the [AT Command](/docs/en/parts/communication/bt-210/#at-commands) section of the page to change the configured PIN.



[OpenCM9.04]: /docs/en/parts/controller/opencm904/#introduction

[OpenCM485 EXP Board]: /docs/en/parts/controller/opencm485exp/
