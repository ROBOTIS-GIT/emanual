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

# Which Controller uses protocol 1.0/2.0?
 Please refer to [protocol compatibility table](/docs/en/faq/faq_protocol_compatibility_table) to check information.

# What controller be compatible with Arduino and recommended?
 [OpenRB-150] is recommended for general users.  
 [OpenCM9.04] and [OpenCM485 EXP Board] combination is another recommendation.  

# How do I configure a Zigbee? (pairing, broadcasting mode)
 Watch this video : [FAQ-Wireless module(ZIGBEE) set up](https://youtu.be/YgebCObXJZg)

# I can’t get the remote controller or wireless communication.

 1. If the controller has a PC connector connected onto it, the PC communication becomes priority.
     Please disconnect the PC connector from the controller and try again.
 2. Wireless communication may not function properly if there is insufficient power supply.
 Please check the power supply.
 3. Please check that there aren’t any wires cut or snapped on the IR receiver, Zigbee, or Bluetooth.
     If there is a problem with the cable, please purchase a new one from ROBOTIS Shop.
 4. In case of Bluetooth or Zigbee, please check that the module is properly mounted on the controller.
       -> Mounting the wireless module on RC-100
 5. Please check if the Zigbee or Bluetooth LED is turned on when connected to a controller.
 6. If all the steps above don’t work, please test the communication for IR/Zigbee/Bluetooth.

# I want to Pair the ROBOTIS BT-210 Module with your PC
Please refer to [here](http://en.robotis.com/model/board.php?bo_table=robotis_faq_en&wr_id=42&sca=NETWORK)

# How to change the BT-210 pairing PIN code


Please refer to the pages below if you want to change the PIN code for your BT-210.

1) Download and install the OpenCM IDE at the [DOWNLOAD CENTER](http://en.robotis.com/service/downloadpage.php?ca_id=10).



2) Referring to the [e-Manual](/docs/en/parts/communication/bt-210/#bt-210-setting)
  -> Download the "f_SerialUSB_Serial2_Converter" example

  -> Refer to the [section (5) AT Command](/docs/en/parts/communication/bt-210/#at-commands). Change pin code in the e-Manual



[OpenCM9.04]: /docs/en/parts/controller/opencm904/#introduction

[OpenCM485 EXP Board]: /docs/en/parts/controller/opencm485exp/
