---
layout: archive
lang: en
ref: op3_hardware
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/hardware/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 7
---

<style>body {counter-reset: h1 6 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Hardware](#hardware)

## [Assemble Data](#assemble-data)

### Overview
ROBOTIS provides STP files for all OP3 mechanical components, allowing users to view and modify OP3 frames and assemble their own.

### Description

![](/assets/images/platform/op3/op3_assemble_data.png)

### File
 > Reference : [Download](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Mechanics/Part)

## [Cover Skin Data](#cover-skin-data)

### Overview
 ROBOTIS provides STP files for creating frame covers for the ROBOTIS-OP3. Covers for the head, body, arms and legs are provided so users can download and modify the design to create custom covers using a 3D printer.  


### Description

![](/assets/images/platform/op3/ROBOTIS_OP3-Skin_Ver1.png)

![](/assets/images/platform/op3/ROBOTIS-OP3-Skin_THORMANG3-Style.png)

![](/assets/images/platform/op3/ROBOTIS-OP3-Skin_OP2-style.png)


### File
  > Reference : [Download](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/tree/master/ROBOTIS-OP3/Hardware/Mechanics/Skin)

## [Electronics Data](#electronic_data)

### Main Controller : Intel NUC i3  

### Sub Controller : [OpenCR](/docs/en/parts/controller/opencr10/)  
### Boards
- [OP3 LED AMP Board](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Electronics/Boards/OP3_LED-AMP_Board_170213.pdf)
- [OP3 GPIO Board](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Electronics/Boards/OP3_GPIO_Board_170213.pdf)
- [JST 4P EXT Board](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Electronics/Boards/JST_4P_EXT_5Port_Board_170213.pdf)

### ETC
- USB Camera : [Logitech C920](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Electronics/Logitech%20C920.pdf)
- [Speaker](https://github.com/ROBOTIS-GIT/ROBOTIS-OP-Series-Data/blob/master/ROBOTIS-OP3/Hardware/Electronics/ROBOTIS-OP3_Speaker.pdf)

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/hardware_rev2.md %}
</section>
