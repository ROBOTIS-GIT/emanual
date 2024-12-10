
### Prerequisites
{% if page.product_group=='xl330' or page.ref=='xc330-m288' or page.ref=='xc330-m181' %}
- DYNAMIXEL Power Supply ([LB-041](http://en.robotis.com/shop_en/item.php?it_id=903-0220-001) or SMPS compatible with DYNAMIXEL)
  - See [Compatibility Table]
{% else %}
- DYNAMIXEL Power Supply (12V SMPS, or compatible 12v battery.)
  - See [Compatibility Table]
{% endif %}
- PC with Windows, Linux or MacOS.
- Serial converter to communicate between your PC and DYNAMIXEL ([U2D2], [OpenRB-150])
- [DYNAMIXEL Control Software](#compatible-software-with-dynamixel)

{% capture warn_01 %}
**WARNING**: 
- Some software may not support all OS options. Be sure to read the eManual page of any software you wish to use to ensure compatibility.
{% endcapture %}
<div class="notice--warning">{{ warn_01 | markdownify }}</div>

{% capture notice_01 %}
**NOTE**: 
- The U2D2 is a small size USB to Serial communication converter that enables control and operation of DYNAMIXEL servos directly from a connected PC.
- The [U2D2 Power Hub](/docs/en/parts/interface/u2d2_power_hub/) simplifies the process of connecting an external power source to your U2D2 to supply power to your DYNAMIXEL.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

### [Compatible Software with DYNAMIXEL](#compatible-software-with-dynamixel)

#### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0] a configuration tool designed to simplify the setup, configuration and management of DYNAMIXEL servos.

The following features are provided by DYNAMIXEL Wizard 2.0:

- DYNAMIXEL Firmware Update
- DYNAMIXEL Error Diagnosis
- DYNAMIXEL Configuration and Testing
- DYNAMIXEL Real-time Data Plotting
- Generate & Monitor DYNAMIXEL Packets

#### [DYNAMIXEL SDK](#dynamixel-sdk)

[DYNAMIXEL SDK] is a software development kit that provides DYNAMIXEL control functions for a variety of popular programming languages. 

**Supported Programming Laguanges and Features**:
- C, C++, C#, Python, Java, MATLAB, LabVIEW
- Windows, Mac, Linux. 
- ROS
- Arduino

[U2D2]: /docs/en/parts/interface/u2d2/
[USB2DYNAMIXEL]: /docs/en/parts/interface/usb2dynamixel/
[R+ Manager]: /docs/en/software/rplus1/manager/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXEL Workbench]: /docs/en/software/dynamixel/dynamixel_workbench/
[Compatibility Table]: /docs/en/parts/controller/controller_compatibility/#compatibility-table/#compatibility-table
