---
layout: archive
lang: en
ref: faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/faq/
sidebar:
  title: FAQ
  nav: "faq"
---


# [FAQ](#faq)
- [Product Compatibility Guide](/docs/en/parts/controller/controller_compatibility/)
- [Download Task Code](/docs/en/faq/download_task_code/)
- [Task Rule Check](/docs/en/software/rplus1/task/task_misc/#rule-check)
- [CM 510/530 Fuse Replacement](/docs/en/faq/cm_510_530_fuse/)

# [GENERAL](#general)


1. What is RoboPlus?  
- RoboPlus is a software to create a customized programme for every ROBOTIS product.  

  - [RoboPlus 1.0](http://en.robotis.com/model/board.php?bo_table=print_en&wr_id=48)  

  - [RoboPlus 2.0](http://en.robotis.com/model/board.php?bo_table=print_en&wr_id=47)  

  - [Download](http://en.robotis.com/service/downloadpage.php?ca_id=10)              

2. What is the difference between [RoboPlus Task](http://emanual.robotis.com/docs/en/software/rplus1/task/getting_started/#introduction) and [RoboPlus Motion](http://emanual.robotis.com/docs/en/software/rplus1/motion/#introduction)?  

3. [I want to know the meaning of the error code occurs during "RoboPlus Task" program execution.](http://emanual.robotis.com/docs/en/software/rplus1/task/task_misc/#error-messages)  

4. [What shall I do if the rule check error shows up while I am writing RoboPlus Task code?](http://emanual.robotis.com/docs/en/software/rplus1/task/task_misc/#rule-check)  

5. My robots' joints get loose while I make the motions.  
    Dynamixels have an Auto Shutdown function.  This function prevents Dynamixels from being damaged.[(link)](http://emanual.robotis.com/docs/en/software/rplus1/motion/#dynamixel-auto-shutdown-function)
6. How can I develop a firmware for the controller by myself using C Language?     
    For advanced users, Embedded C is offered to develop its own programming.  

|Embeded c                                                                                             | Download                                                                                               |
|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| [CM-510 / 700](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#introduction)|[Downlaod(SDK file)](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm510/#cm-510-cm-700)|
| [CM-530](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#introduction)     |[Download SDK file](http://emanual.robotis.com/docs/en/software/embedded_sdk/embedded_c_cm530/#cm-530)|

7. I want to develop a software to communicate with RoboPlus Task code.    
    You can use [Zigbee SDK.](http://emanual.robotis.com/docs/en/software/embedded_sdk/zigbee_sdk/)    
8. I want to control Dynamixel with PC development environment such as Visual Studio.    
    Dynamixel SDK is a standard programming library to develop S/W controls Dynamixel. [(link)](http://emanual.robotis.com/docs/en/software/dynamixel/dynamixel_sdk/overview/)
9. I want to communicate with multiple Zigbees simultaneously.
    1:N  Communication [(link)](http://emanual.robotis.com/docs/en/parts/communication/zig-110/#11-communication)  
    -ZIG-100 module can be set to Waiting Mode.  
    N:N Communication [(link)](http://emanual.robotis.com/docs/en/parts/communication/zig-110/#1n-communication)
    -ZIG-100 or ZIG-110A module can be set to Broadcasting mode.
10. I want to check the controller and dynamixel.  
      [Selfcheck]((http://en.robotis.com/model/selfcheck.php)) is offered  
11. Software installation for OS X fails with a security warning.    

####Minimum System Requirements
- OS : Mac OS X 10.5 or higher

- Hardware : Release after October 2007 (64bit)



####Software installation for OS X fails with a security warning.
1. **Open System panel from Launchpad or Dock.**
![](/assets/images/faq/OS_X_fail/osx_system_config.png)  
2. **Click on the Security & Privacy icon.**
![](/assets/images/faq/OS_X_fail/osx_security.png)
3. **Click the lock icon and enter the password.**
![](/assets/images/faq/OS_X_fail/osx_security_mod.png)
![](/assets/images/faq/OS_X_fail/osx_authority.png)
4. **Select "Anywhere" and try installation again.  
![](/assets/images/faq/OS_X_fail/osx_all_app_allowance.png)
