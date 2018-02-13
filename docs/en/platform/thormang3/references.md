---
layout: archive
lang: en
ref: thormang3_references
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/references/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

<div style="counter-reset: h1 6"></div>

# [References](#references)

## [Router Setting](#router-setting)

1. Router Reset  
  To reset the router, press the front button for 10 seconds.  
  Front button is “MODE CHANGE” button.
  - Orange LED : Router Mode
  - Green LED : Repeater Mode
  - Red LED : AP Mode

    ![](/assets/images/platform/thormang3/thormang3_077.jpg)

2. Connect to Router  
  - Default Wi-Fi Name:
    - 2.4G : dlink-806a-z
    - 5G  : dlink-806a 5G-z
  - Administrator Account Setting:
    - Name : admin
    - Password : admin

3. Change Language
  - Connect to Router via Wi-Fi or Wired.
  - Open the browser and connect to ‘192.168.1.1’. Insert Administrator Account Info.
  - Click “상세 설정”(Details).
  - Click Menu “도구”(Tools) > “관리자 설정”(Administrator).
  - Select Language “영어(English)” and click “APPLY” button.
  - Select “예” and click “APPLY” button.
  The language has been changed.

    ![](/assets/images/platform/thormang3/thormang3_078.jpg)

4. Disable the IPTV Availability.  
  In order to use Port 4, IPTV Availability should be disabled.To use Port 4 must disable IPTV Availability.   
  - “Advanced” > “IPTV/IGMP”
  - “IPTV Availability” > Select “Disable” > Click “APPLY” button
  - Reboot the router.

    ![](/assets/images/platform/thormang3/thormang3_079.jpg)

## [LIDAR IP Setting](#lidar-ip-setting)

- Model : UTM-30LX-EW

- Download IP address changing tool  
  [https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/]

- Reset the IP Setting  
  Pressing the button in the sensor’s body will reset the IP setting.

  1. Remove the rubber cap that covers the IP reset button.

      ![](/assets/images/platform/thormang3/thormang3_080.jpg)

  2. Press the switch inside the hole for more than 3 seconds, using a thin stick.

      ![](/assets/images/platform/thormang3/thormang3_081.jpg)

Restart the sensor when the LED blinks, the IP setting will be completed.  
The following table shows the network settings after the reset.

|Item|Description|
|:---:|:---:|
|IP|192.168.0.10|
|Subnet|255.255.255.0|
|Gateway address|192.168.0.1|
|TCP/IP Port|10940|

- Change the IP Setting
  1. Below is the screen shot of IP changer’s screen shot.

      ![](/assets/images/platform/thormang3/thormang3_082.jpg)

  2. Change the IP address and push “Update” button. (The “Update” button can be pushed only when the sensor is connected.)

      ![](/assets/images/platform/thormang3/thormang3_083.jpg)

## [System Block Diagram](#system-block-diagram)

![](/assets/images/platform/thormang3/thormang3_046.png)

## [Technical Specifications](#technical-specifications)

1. PC
  - [nuc5i5RYK]
  - [Technical Product Specification]

    ![](/assets/images/platform/thormang3/thormang3_084.png)

2. Actuators
  - [H54-200-S500-R] x10
  - [H54-100-S500-R] x11
  - [H42-20-S300-R] x8

    ![](/assets/images/platform/thormang3/thormang3_085.jpg)

3. Sensors
  - 6-axis force-torque sensor([ATi Mini58-SI-2800-120])

      ![](/assets/images/platform/thormang3/thormang3_086.jpg)

    - IMU sensor([MicroSrain 3DM-GX4-25])

      ![](/assets/images/platform/thormang3/thormang3_087.jpg)

    - LIDAR([Hokuyo UTM-30LX-EW])

      ![](/assets/images/platform/thormang3/thormang3_088.jpg)
   
    - HD Camera([Logitech C920 HD])

      ![](/assets/images/platform/thormang3/thormang3_089.jpg)

    - Depth camera([Intel RealSense R200])
    
      ![](/assets/images/platform/thormang3/thormang3_090.jpg)

4. Batteries
  - LiPo 22.2V, 22000mAh x 1EA([http://www.maxamps.com/proddetail.php?prod=Lipo-22000-222-Pack])  
    xt60 plug

      ![](/assets/images/platform/thormang3/thormang3_091.jpg)

    - LiPo 18.5V, 11000mAh x 1EA([http://www.maxamps.com/proddetail.php?prod=Lipo-11000-185-Pack])  
      no plug-12awg

      ![](/assets/images/platform/thormang3/thormang3_092.jpg)

- Chargers(hitec smart charger h4, hitec e power box 30a)  
  [http://hitecrcd.com/products/chargers/dcdc-chargers/h4-dcdc-four-port-multi-charger/product]
  [http://hitecrcd.com/products/chargers/epowerbox-30-amp-power-supply/product]
 
      ![](/assets/images/platform/thormang3/thormang3_093.jpg)

## [ID Map](#id-map)

![](/assets/images/platform/thormang3/thormang3_094.jpg)

## [Physical Properties](#physical-properties)

### [Link Measurements](#link-measurements)

![](/assets/images/platform/thormang3/thormang3_095.jpg)

![](/assets/images/platform/thormang3/thormang3_096.jpg)

|body|x|y|z|
|:---:|:---:|:---:|:---:|
|Ground-origin|-|-|807.5|
|origin-27|0|0|170.5|

|head|x|y|z|
|:---:|:---:|:---:|:---:|
|27-28|0|0|229|
|28-29|0|-45|39|
|29-cam|68.2|45|56|
|29-lidar|0|45|106.75|
|29-decam|68.9|45|17|

|L_Arm|x|y|z|R_Arm|x|y|z|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|27-2|0|152|160|27-1|0|-152|160|
|2-4|57|60|-39|1-3|57|-60|-39|
|4-6|-57|33|-0|3-5|-57|-33|0|
|6-8|30|187|57|5-7|30|-187|57|
|8-10|171|30|-57|7-9|171|-30|-57|
|10-12|39|0|45|9-11|39|0|45|
|12-14|45|-45|-45|11-13|45|45|-45|
|14-30|87.7|-58.3|0|13-31|87.7|-31.7|0|
|30-30_2|0|-26.6|0|31-31_2|0|-26.6|0|

|L_Leg|x|y|z|R_Leg|x|y|z|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|base-16|0|93|-18|base-15|0|-93|-18|
|16-18|57|0|-75|15-17|57|0|-75|
|18-20|-57|33|0|17-19|-57|33|0|
|20-22|0|60|-300|19-21|0|-60|-300|
|22-24|0|-60|-300|21-23|0|60|-300|
|24-26|57|-33|0|23-25|57|33|0|
|26-26_2|-57|0|-87|25-25_2|-57|0|-87|

### [Mass & Inertia](#mass-inertia)

#### Whole robot

- Mass = 41.6 kg

![](/assets/images/platform/thormang3/thormang3_096.jpg)

#### Body

![](/assets/images/platform/thormang3/thormang3_097.jpg)

#### Head

![](/assets/images/platform/thormang3/thormang3_098.jpg)

#### Right Arm

![](/assets/images/platform/thormang3/thormang3_099.jpg)

![](/assets/images/platform/thormang3/thormang3_100.jpg)

![](/assets/images/platform/thormang3/thormang3_101.jpg)

#### Left Arm

![](/assets/images/platform/thormang3/thormang3_102.jpg)

![](/assets/images/platform/thormang3/thormang3_103.jpg)

![](/assets/images/platform/thormang3/thormang3_104.jpg)

#### Right Leg

![](/assets/images/platform/thormang3/thormang3_105.jpg)

![](/assets/images/platform/thormang3/thormang3_106.jpg)

![](/assets/images/platform/thormang3/thormang3_107.jpg)

#### Left Leg

![](/assets/images/platform/thormang3/thormang3_108.jpg)

![](/assets/images/platform/thormang3/thormang3_109.jpg)

![](/assets/images/platform/thormang3/thormang3_110.jpg)

### [Joint & Angle Limit](#joint-angle-limit)

![](/assets/images/platform/thormang3/thormang3_111.jpg)

#### Head Joint

![](/assets/images/platform/thormang3/thormang3_112.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|28|head_y(Z)|-90 to 90|
|29|head_p(Y)|-60 to 87|

#### Body Joint

![](/assets/images/platform/thormang3/thormang3_113.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|27|torso_y(Z)|-90 to 90|
|15|r_leg_hip_y(Z)|-90 to 40|
|16|l_leg_hip_y(Z)|-40 to 90|

#### Right_Arm Joint

![](/assets/images/platform/thormang3/thormang3_114.jpg)

![](/assets/images/platform/thormang3/thormang3_115.jpg)

![](/assets/images/platform/thormang3/thormang3_116.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|1|r_arm_sh_p1(Y)|-150 to 150|
|3|r_arm_sh_r(X)|-90 to 90|
|5|r_arm_sh_p2(Y)|-120 to 30|
|7|r_arm_el_y(Z)|-90 to 45|
|9|r_arm_sh_wr_r(X)|-150 to 150|
|11|r_arm_sh_wr_y(Z)|-90 to 90|
|13|r_arm_sh_wr_p(Y)|-90 to 90|

#### Left_Arm Joint

![](/assets/images/platform/thormang3/thormang3_117.jpg)

![](/assets/images/platform/thormang3/thormang3_118.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|2	|l_arm_sh_p1(Y)	|-150 to 150|
|4	|l_arm_sh_r(X)	|-90 to 90|
|6	|l_arm_sh_p2(Y)	|-30 to 120|
|8	|l_arm_el_y(Z)	|-45 to 90|
|10	|l_arm_sh_wr_r(X)	|-150 to 150|
|12	|l_arm_sh_wr_y(Z)	|-90 to 90|
|14|l_arm_sh_wr_p(Y)	|-90 to 90|

#### Right_Leg Joint

![](/assets/images/platform/thormang3/thormang3_119.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|17	|r_leg_hip_r(X)	|-30 to 45|
|19	|r_leg_hip_p(Y)	|-40 to 85|
|21	|r_leg_kn_p(Y)	|-166 to 30|
|23	|r_leg_an_p(Y)	|-85 to 40|
|25	|r_leg_an_r(X)	|-35 to 90|

#### Left_Leg Joint

![](/assets/images/platform/thormang3/thormang3_120.jpg)

|Id|Name|Range(degrees)|
|:---:|:---:|:---:|
|18	|l_leg_hip_r(X)	|-45 to 30|
|20	|l_leg_hip_p(Y)	|-85 to 40|
|22	|l_leg_kn_p(Y)	|-30 to 166|
|24	|l_leg_an_p(Y)	|-40 to 85|
|26	|l_leg_an_r(X)	|-90 to 35|


[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/
[MPC Installation]: /docs/en/platform/thormang3/getting_started/#mpc-installation
[PPC Installation]: /docs/en/platform/thormang3/getting_started/#ppc-installation
[OPC Installation]: /docs/en/platform/thormang3/getting_started/#opc-installation
[ROBOTIS-THORMANG-OPC]: /docs/en/platform/thormang3/thormang3_ros_packages/#opc-packages
[ROSOTIS-THORMANG-Common]: /docs/en/platform/thormang3/thormang3_ros_packages/#common-packages
[Example Setting for OPC]: /docs/en/platform/thormang3/getting_started/#ros-environment-setting
[How to execute Simple Demonstration]: /docs/en/platform/thormang3/thormang3_operation/#simple-demo
[How to execute OPC's GUI program]: /docs/en/platform/thormang3/thormang3_operation/#gui-program
[How to run THORMANG3's program]: /docs/en/platform/thormang3/thormang3_operation/#thormang3-operation
[How to calibrate feet ft sensors]: /docs/en/platform/thormang3/thormang3_operation/#calibrate-ft-sensors
[thormang3_sensor]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-sensors
[thormang3_manager]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3_manager
[thormang3_manipulation_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3_manipulation_module
[thormang3_walking_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3_walking_module
[thormang3_feet_ft_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3_feet_ft_module
[thormang3_demo]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-demo
[thormang3_foot_step_generator]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-foot-setp-generator
[Balance Parameter]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module-msgs
[thormang3_foot_step_generator/data/balance_param.yaml]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-foot-setp-generator
[footstep_planner]: /docs/en/platform/thormang3/thormang3_ros_packages/#humanoid-navigation

[https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/]:https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/

[nuc5i5RYK]:http://www.intel.com/content/www/us/en/nuc/products-overview.html
[Technical Product Specification]:http://www.intel.com/content/www/us/en/support/boards-and-kits/000005545.html
[ATi Mini58-SI-2800-120]:http://www.ati-ia.com/products/ft/ft_models.aspx?id=Mini58
[MicroSrain 3DM-GX4-25]:http://www.microstrain.com/inertial/3dm-gx4-25
[Hokuyo UTM-30LX-EW]:https://www.hokuyo-aut.jp/02sensor/07scanner/download/products/utm-30lx-ew/
[Logitech C920 HD]:http://www.logitech.com/en-us/product/hd-pro-webcam-c920
[Intel RealSense R200]:https://software.intel.com/en-us/realsense/r200camera
[http://www.maxamps.com/proddetail.php?prod=Lipo-22000-222-Pack]:http://www.maxamps.com/proddetail.php?prod=Lipo-22000-222-Pack
[http://www.maxamps.com/proddetail.php?prod=Lipo-11000-185-Pack]:http://www.maxamps.com/proddetail.php?prod=Lipo-11000-185-Pack
[http://hitecrcd.com/products/chargers/dcdc-chargers/h4-dcdc-four-port-multi-charger/product]:http://hitecrcd.com/products/chargers/dcdc-chargers/h4-dcdc-four-port-multi-charger/product    
[http://hitecrcd.com/products/chargers/epowerbox-30-amp-power-supply/product]:http://hitecrcd.com/products/chargers/epowerbox-30-amp-power-supply/product
