---
layout: splash
lang: en
ref: main
permalink: /
header:
  overlay_color:
  overlay_image:
  cta_label:
  cta_url:
  caption:
  intro:
    - excerpt: 'ROBOTIS wiki e-Manual'
---

# ROBOTIS e-Manual

- New ROBOTIS Community [Forum] is available. Please checkout the [Forum] if you have any issue with ROBOTIS Products.

{% capture index_notice_01 %}
- 한국어 사용자는 [한글 매뉴얼](http://emanual.robotis.com/docs/kr/)을 참조하세요.  
- 日本語e-manualは現時点で編集されていません。 英語版ページをご参照下さい。  
- 目前, 还没有中文版. 请使用提供的Google翻译器 <img src="/assets/images/icon_google.png">.
  - 中文用户 (DREAM, STEM, MINI等产品) 请参考中文手册.
  - [DREAM Lv2 下载示例文件]{: .popup}
  - [DREAM Lv3 下载示例文件]{: .popup}
  - [DREAM Lv4 下载示例文件]{: .popup}
  - [STEM 下载示例文件]{: .popup}
  - [MINI 下载]{: .popup}

[DREAM Lv2 下载示例文件]: /docs/en/popup/dream1-2_example_cn/
[DREAM Lv3 下载示例文件]: /docs/en/popup/dream1-3_example_cn/
[DREAM Lv4 下载示例文件]: /docs/en/popup/dream1-4_example_cn/
[STEM 下载示例文件]: /docs/en/popup/stem_example_cn/
[MINI 下载]: /docs/en/popup/mini_example_cn/
{% endcapture %}
<div class="notice--success">{{ index_notice_01 | markdownify }}</div>

# Quick References

Please also checkout **[ROBOTIS Download Center]** for useful resources.
{: .notice--success}

## DYNAMIXEL

### Protocol
- [Protocol 1.0](/docs/en/dxl/protocol1/)
- [Protocol 2.0](/docs/en/dxl/protocol2/)

### Control Table

-
<select id="pro_plus_ctrl_table_select" onchange="window.location.href=this.value;">
    <option selected disabled hidden>PRO+ Series</option>
    <option value="/docs/en/dxl/pro_plus/h54p-200-s500-r/#control-table-of-eeprom-area">H54P-200-S500-R</option>
    <option value="/docs/en/dxl/pro_plus/h54p-100-s500-r/#control-table-of-eeprom-area">H54P-100-S500-R</option>
    <option value="/docs/en/dxl/pro_plus/h42p-020-s300-r/#control-table-of-eeprom-area">H42P-020-S300-R</option>
    <option value="/docs/en/dxl/pro_plus/m54p-060-s250-r/#control-table-of-eeprom-area">M54P-060-S250-R</option>
    <option value="/docs/en/dxl/pro_plus/m54p-040-s250-r/#control-table-of-eeprom-area">M54P-050-S250-R</option>
    <option value="/docs/en/dxl/pro_plus/m42p-010-s260-r/#control-table-of-eeprom-area">M42P-010-S260-R</option>
</select>

-
<select id="pro_ctrl_table_select" onchange="window.location.href=this.value;">
    <option selected disabled hidden>PRO Series</option>
    <option value="/docs/en/dxl/pro/h54-200-s500-ra/#control-table-of-eeprom-area">H54-200-S500-R(A)</option>
    <option value="/docs/en/dxl/pro/h54-100-s500-ra/#control-table-of-eeprom-area">H54-100-S500-R(A)</option>
    <option value="/docs/en/dxl/pro/h42-20-s300-ra/#control-table-of-eeprom-area">H42-20-S300-R(A)</option>
    <option value="/docs/en/dxl/pro/m54-60-s250-ra/#control-table-of-eeprom-area">M54-60-S250-R(A)</option>
    <option value="/docs/en/dxl/pro/m54-40-s250-ra/#control-table-of-eeprom-area">M54-40-S250-R(A)</option>
    <option value="/docs/en/dxl/pro/m42-10-s260-ra/#control-table-of-eeprom-area">M42-10-S260-R(A)</option>
    <option value="/docs/en/dxl/pro/h54-200-s500-r/#control-table-of-eeprom-area">H54-200-S500-R</option>
    <option value="/docs/en/dxl/pro/h54-100-s500-r/#control-table-of-eeprom-area">H54-100-S500-R</option>
    <option value="/docs/en/dxl/pro/h42-20-s300-r/#control-table-of-eeprom-area">H42-20-S300-R</option>
    <option value="/docs/en/dxl/pro/m54-60-s250-r/#control-table-of-eeprom-area">M54-60-S250-R</option>
    <option value="/docs/en/dxl/pro/m54-40-s250-r/#control-table-of-eeprom-area">M54-40-S250-R</option>
    <option value="/docs/en/dxl/pro/m42-10-s260-r/#control-table-of-eeprom-area">M42-10-S260-R</option>
    <option value="/docs/en/dxl/pro/l54-50-s500-r/#control-table-of-eeprom-area">L54-50-S500-R</option>
    <option value="/docs/en/dxl/pro/l54-50-s290-r/#control-table-of-eeprom-area">L54-50-S290-R</option>
    <option value="/docs/en/dxl/pro/l54-30-s500-r/#control-table-of-eeprom-area">L54-30-S500-R</option>
    <option value="/docs/en/dxl/pro/l54-30-s400-r/#control-table-of-eeprom-area">L54-30-S400-R</option>
    <option value="/docs/en/dxl/pro/l42-10-s300-r/#control-table-of-eeprom-area">L42-10-S300-R</option>
</select>

-
<select id="x_ctrl_table_select" onchange="window.location.href=this.value;">
    <option selected disabled hidden>X Series</option>
    <option value="http://emanual.robotis.com/docs/en/dxl/x/xl320/#control-table-of-eeprom-area">XL-320</option>
    <option value="/docs/en/dxl/x/xl430-w250/#control-table-of-eeprom-area">XL430-W250</option>
    <option value="/docs/en/dxl/x/2xl430-w250/#control-table-of-eeprom-area">2XL430-W250</option>
    <option value="/docs/en/dxl/x/xc430-w150/#control-table-of-eeprom-area">XC430-W150</option>
    <option value="/docs/en/dxl/x/xc430-w240/#control-table-of-eeprom-area">XC430-W240</option>
    <option value="/docs/en/dxl/x/xm430-w210/#control-table-of-eeprom-area">XM430-W210</option>
    <option value="/docs/en/dxl/x/xm430-w350/#control-table-of-eeprom-area">XM430-W350</option>
    <option value="/docs/en/dxl/x/xm540-w150/#control-table-of-eeprom-area">XM540-W150</option>
    <option value="/docs/en/dxl/x/xm540-w270/#control-table-of-eeprom-area">XM540-W270</option>
    <option value="/docs/en/dxl/x/xh430-w210/#control-table-of-eeprom-area">XH430-W210</option>
    <option value="/docs/en/dxl/x/xh430-w350/#control-table-of-eeprom-area">XH430-W350</option>
    <option value="/docs/en/dxl/x/xh430-v210/#control-table-of-eeprom-area">XH430-V210</option>
    <option value="/docs/en/dxl/x/xh430-v350/#control-table-of-eeprom-area">XH430-V350</option>
    <option value="/docs/en/dxl/x/xh540-w150/#control-table-of-eeprom-area">XH540-W150</option>
    <option value="/docs/en/dxl/x/xh540-w270/#control-table-of-eeprom-area">XH540-W270</option>
    <option value="/docs/en/dxl/x/xh540-v150/#control-table-of-eeprom-area">XH540-V150</option>
    <option value="/docs/en/dxl/x/xh540-v270/#control-table-of-eeprom-area">XH540-V270</option>
</select>

-
<select id="mx_ctrl_table_select" onchange="window.location.href=this.value;">
    <option selected disabled hidden>MX Series</option>
    <option value="/docs/en/dxl/mx/mx-12w/#control-table-of-eeprom-area">MX-12W</option>
    <option value="/docs/en/dxl/mx/mx-28/#control-table-of-eeprom-area">MX-28</option>
    <option value="/docs/en/dxl/mx/mx-64/#control-table-of-eeprom-area">MX-64</option>
    <option value="/docs/en/dxl/mx/mx-106/#control-table-of-eeprom-area">MX-106</option>
    <option value="/docs/en/dxl/mx/mx-28-2/#control-table-of-eeprom-area">MX-28(2.0)</option>
    <option value="/docs/en/dxl/mx/mx-64-2/#control-table-of-eeprom-area">MX-64(2.0)</option>
    <option value="/docs/en/dxl/mx/mx-106-2/#control-table-of-eeprom-area">MX-106(2.0)</option>
</select>

-
<select id="ax_ctrl_table_select" onchange="window.location.href=this.value;">
    <option selected disabled hidden>AX Series</option>
    <option value="/docs/en/dxl/ax/ax-12w/#control-table-of-eeprom-area">AX-12W</option>
    <option value="/docs/en/dxl/ax/ax-12a/#control-table-of-eeprom-area">AX-12+/12A</option>
    <option value="/docs/en/dxl/ax/ax-18a/#control-table-of-eeprom-area">AX-18F/18A</option>
</select>

## SOFTWARE

### DYNAMIXEL SDK
- [SDK Download](https://github.com/ROBOTIS-GIT/DynamixelSDK/releases)
- [Documentation](/docs/en/software/dynamixel/dynamixel_sdk/overview/)

### DYNAMIXEL Workbench
- [Package Download](https://github.com/ROBOTIS-GIT/dynamixel-workbench)
- [Documentation](/docs/en/software/dynamixel/dynamixel_workbench/)

## PLATFORM

### OpenManipulator
- [H/W Setup](/docs/en/platform/openmanipulator/#hardware-setup)
- [S/W Setup](/docs/en/platform/openmanipulator/#software-setup)
- [Bringup](/docs/en/platform/openmanipulator/#software-setup)

### TurtleBot3
<select id="turtlebot3_select" onchange="window.location.href=this.value;">
    <option value="/docs/en/platform/turtlebot3/setup/#setup">Setup</option>
    <option value="/docs/en/platform/turtlebot3/bringup/#bringup">Bring Up</option>
    <option value="/docs/en/platform/turtlebot3/basic_operation/#basic-operation">Basic Operation</option>
    <option value="/docs/en/platform/turtlebot3/slam/#slam">SLAM</option>
    <option value="/docs/en/platform/turtlebot3/navigation/#navigation">NAVIGATION</option>
    <option value="/docs/en/platform/turtlebot3/simulation/#simulation">SIMULATION</option>
    <option value="/docs/en/platform/turtlebot3/manipulation/#manipulation">MANIPULATION</option>
    <option value="/docs/en/platform/turtlebot3/autonomous_driving/#autonomous-driving">AUTONOMOUS DRIVING</option>
    <option value="/docs/en/platform/turtlebot3/machine_learning/#machine-learning">MACHINE LEARNING</option>
    <option value="/docs/en/platform/turtlebot3/learn/#learn">Lectures(Learn)</option>
</select>


## Controllers
- [OpenCR 1.0](/docs/en/parts/controller/opencr10/)
- [OpenCM 9.04](/docs/en/parts/controller/opencm904/) & [OpenCM 485 EXP](/docs/en/parts/controller/opencm485exp/)
- [Compatibility Guide](/docs/en/parts/controller/controller_compatibility/)

[AX-12W]: /docs/en/dxl/ax/ax-12w/#control-table-of-eeprom-area
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/#control-table-of-eeprom-area
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/#control-table-of-eeprom-area
[EX-106]: /docs/en/dxl/ex/ex-106+/#control-table-of-eeprom-area
[DX-113]: /docs/en/dxl/dx/dx-113/#control-table-of-eeprom-area
[DX-116]: /docs/en/dxl/dx/dx-116/#control-table-of-eeprom-area
[DX-117]: /docs/en/dxl/dx/dx-117/#control-table-of-eeprom-area
[RX-10]: /docs/en/dxl/rx/rx-10/#control-table-of-eeprom-area
[RX-24F]: /docs/en/dxl/rx/rx-24f/#control-table-of-eeprom-area
[RX-28]: /docs/en/dxl/rx/rx-28/#control-table-of-eeprom-area
[RX-64]: /docs/en/dxl/rx/rx-64/#control-table-of-eeprom-area
[MX-12W]: /docs/en/dxl/mx/mx-12w/#control-table-of-eeprom-area
[MX-28]: /docs/en/dxl/mx/mx-28/#control-table-of-eeprom-area
[MX-28(2.0)]: /docs/en/dxl/mx/mx-28-2/#control-table-of-eeprom-area
[MX-64]: /docs/en/dxl/mx/mx-64/#control-table-of-eeprom-area
[MX-64(2.0)]: /docs/en/dxl/mx/mx-64-2/#control-table-of-eeprom-area
[MX-106]: /docs/en/dxl/mx/mx-106/#control-table-of-eeprom-area
[MX-106(2.0)]: /docs/en/dxl/mx/mx-106-2/#control-table-of-eeprom-area
[XL320]: /docs/en/dxl/x/xl320/#control-table-of-eeprom-area
[XL430-W250]: /docs/en/dxl/x/xl430-w250/#control-table-of-eeprom-area
[XM430-W210]: /docs/en/dxl/x/xm430-w210/#control-table-of-eeprom-area
[XM430-W350]: /docs/en/dxl/x/xm430-w350/#control-table-of-eeprom-area
[XH430-W210]: /docs/en/dxl/x/xh430-w210/#control-table-of-eeprom-area
[XM540-W150]: /docs/en/dxl/x/xm540-w150/#control-table-of-eeprom-area
[XM540-W270]: /docs/en/dxl/x/xm540-w270/#control-table-of-eeprom-area
[XH430-W350]: /docs/en/dxl/x/xh430-w350/#control-table-of-eeprom-area
[XH430-V210]: /docs/en/dxl/x/xh430-v210/#control-table-of-eeprom-area
[XH430-V350]: /docs/en/dxl/x/xh430-v350/#control-table-of-eeprom-area
[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/#control-table-of-eeprom-area
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/#control-table-of-eeprom-area
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/#control-table-of-eeprom-area
[M54-60-S250-R]: /docs/en/dxl/pro/m54-60-s250-r/#control-table-of-eeprom-area
[M54-40-S250-R]: /docs/en/dxl/pro/m54-40-s250-r/#control-table-of-eeprom-area
[M42-10-S260-R]: /docs/en/dxl/pro/m42-10-s260-r/#control-table-of-eeprom-area
[L54-50-S500-R]: /docs/en/dxl/pro/l54-50-s500-r/#control-table-of-eeprom-area
[L54-50-S290-R]: /docs/en/dxl/pro/l54-50-s290-r/#control-table-of-eeprom-area
[L54-30-S500-R]: /docs/en/dxl/pro/l54-30-s500-r/#control-table-of-eeprom-area
[L54-30-S400-R]: /docs/en/dxl/pro/l54-30-s400-r/#control-table-of-eeprom-area
[L42-10-S300-R]: /docs/en/dxl/pro/l42-10-s300-r/#control-table-of-eeprom-area
[Forum]: http://en.robotis.com/service/forum.php
[ROBOTIS Download Center]: http://en.robotis.com/service/downloadcenter.php
