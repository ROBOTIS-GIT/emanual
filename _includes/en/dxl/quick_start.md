
### Prerequisites
{% if page.product_group=='xl330' or page.ref=='xc330-m288' or page.ref=='xc330-m181' %}
- Power supply to DYNAMIXEL ([LB-041](http://en.robotis.com/shop_en/item.php?it_id=903-0220-001) or SMPS compatible with DYNAMIXEL)
  - See [Compatibility Table]
{% else %}
- Power supply to DYNAMIXEL(12V SMPS / Controllers, compatible with DYNAMIXEL or [LB-020 battery](http://en.robotis.com/shop_en/item.php?it_id=903-0277-000))
  - See [Compatibility Table]
{% endif %}
- PC with Windows, Linux or MacOS.
- Connection between PC and DYNAMIXEL ([U2D2], [USB2Dynamixel])
- [Compatible Software with DYNAMIXEL](#compatible-software-with-dynamixel)

{% capture warn_01 %}
**WARNING**: 
- USB2Dynamixel has been discontinued. 
- Some software may not support OS which you use. Be sure to read e-Manual of software you use to check the supported OS for right use of software. 
{% endcapture %}
<div class="notice--warning">{{ warn_01 | markdownify }}</div>

{% capture notice_01 %}
**NOTE**: 
- U2D2 is a small size USB communication converter that enables to control and operate DYNAMIXEL with PC.
- [U2D2 Power Hub](/docs/en/parts/interface/u2d2_power_hub/) which combines with U2D2 supplies a variety external power source with a stable power supply to DYNAMIXEL.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

### [Compatible Software with DYNAMIXEL](#compatible-software-with-dynamixel)

You can use exclusive software for DYNAMIXEL. See the software compatibility on the next table and choose a desired software for your project. 

| Model                | AX Series | DX Series | RX Series | EX Series | MX Series | X-Series              | PRO Series | P Series |
|:---------------------|:----------|:----------|:----------|:----------|:----------|:----------------------|:-----------|:---------|
| R+ Manager 2.0       | X         | X         | X         | X         | O         | O                     | O          | O        |
| DYNAMIXEL Wizard     | O         | X         | X         | O         | O         | X (XL320 can be used) | O          | X        |
| DYNAMIXEL Wizard 2.0 | O         | O         | O         | O         | O         | O                     | O          | O        |
| DYNAMIXEL SDK        | O         | O         | O         | O         | O         | O                     | O          | O        |
| DYNAMIXEL Workbench  | O         | O         | O         | O         | O         | O                     | O          | O        |

  {% capture notice_02 %}
  **NOTE**: You can also use more variety of software. For more information, see the following to check software provided by ROBOTIS.
  - [DYNAMIXEL to software Compatibility Table ](/docs/en/parts/controller/controller_compatibility/#dynamixel)
  - [Controller to software Compatibility Table](/docs/en/parts/controller/controller_compatibility/#software)
  {% endcapture %}
  <div class="notice">{{ notice_02 | markdownify }}</div>

#### [R+ Manager](#r-manager)

[R+ Manager] is used to handle devices used by a robot. Major functions of this program are as follows.

- Manage controller firmware. (Update and Restore)
- Inspect the status of the controller and peripheral devices. (Test)
- Set the required modes. (Settings)

**NOTE**: R+ Manager 2.0 or DYNAMIXEL Wizard 2.0 provides diverse features compared to [R+ Manager].
{: .notice}

#### [R+ Manager 2.0](#r-manager-20)

The R+ Manager 2.0 manages a controller and DYNAMIXEL devices that comprise the robot. By connecting the product, you can update the product to the latest version and test Control Table. The functions that were previously provided in RoboPlus Manager 1.0 and Wizard 1.0 have been combined in RoboPlus Manager 2.0.

{% capture warn_02 %}
**WARNING**: R+ Manager 2.0 is not compatible with DYNAMIXEL using protocol 1.0.  
DYNAMIXEL Wizard 2.0 supports all DYNAMIXEL for Firmware Recovery, Firmware Update, and change data of Control Table of DYNAMIXEL. 
{% endcapture %}
<div class="notice--warning">{{ warn_02 | markdownify }}</div>

#### [DYNAMIXEL Wizard 2.0](#dynamixel-wizard-20)

[DYNAMIXEL Wizard 2.0] is an optimized tool for managing DYNAMIXEL’s from various operating systems.  

The following features are provided with DYNAMIXEL Wizard 2.0.

- DYNAMIXEL Firmware Update
- DYNAMIXEL Diagnosis
- DYNAMIXEL Configuration and Test
- DYNAMIXEL Data Plotting in Real-Time
- Generate & Monitor DYNAMIXEL Packets

#### [DYNAMIXEL SDK](#dynamixel-sdk)

[DYNAMIXEL SDK] is a software development kit that provides DYNAMIXEL control functions using packet communication. The API of DYNAMIXEL SDK is designed for DYNAMIXEL actuators and DYNAMIXEL-based platforms. You need to be familiar with C/C++ programming language for right use of the software. This e-Manual provides comprehensive information on ROBOTIS products and applications.

**Supported Programming Laguanges and Features**:
- C, C++, C#, Python, Java, MATLAB, LabVIEW
- Windows, Mac, Linux. 
- ROS
- Arduino

#### [DYNAMIXEL Workbench](#dynamixel_workbench)

[DYNAMIXEL Workbench], based on DYNAMIXEL SDK, is library which provides simple and easier method to use DYNAMIXEL.

**Supported Programming Laguanges and Features**:
- C++
- Linux, MacOS
- ROS
- Arduino

**NOTE**: DYNAMIXEL Workbench may provide lack of contents or features compared to DYNAMIXEL SDK. In order to use DYNAMIXEL with sufficient contents, use [DYNAMIXEL SDK].  
{: .notice}

[U2D2]: /docs/en/parts/interface/u2d2/
[USB2DYNAMIXEL]: /docs/en/parts/interface/usb2dynamixel/
[R+ Manager]: /docs/en/software/rplus1/manager/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXEL Workbench]: /docs/en/software/dynamixel/dynamixel_workbench/
[Compatibility Table]: /docs/en/parts/controller/controller_compatibility/#compatibility-table/#compatibility-table
