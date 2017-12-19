---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_matlab_linux
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/matlab_linux/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 14"></div>
<div style="counter-reset: h1 2"></div>

## [Matlab Linux](#matlab-linux)


### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/matlab.png)

------------------------------------------------------------------------------------

* [Download MATLAB for Linux](http://www.mathworks.com/index.html?s_tid=gn_loc_drop)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/library_file/a1.png)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/library_file/a2.png)

### [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/matlab/m_basic_function/`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/library_file/2.png)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/library_file/3.png)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/library_file/1.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

Dynamixel SDK example code for Python uses the library files(.so for Linux) built in C language.

Each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c/build/[linuxXX]/libdxl_xYY_c.so` which should be built by its own source code.

#### Import libraries

* Click `Set Path`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/1.png)

* Click `Add with Subfolders...`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/2.png)

* Select `[DynamixelSDK folder]/c/include`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/3.png)

* Click `Add Folder...`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/4.png)

* Select `[DynamixelSDK folder]/c/build/linux64`

(for x86 platform, select `[DynamixelSDK folder]/c/build/linux32`)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/5.png)


#### Import function reference

* Click `Add with Subfolders...`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/6.png)

* Select `[DynamixelSDK folder]/matlab`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/7.png)

* Click `Save` and then `Close`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/8.png)


#### Run example

* Make the port be able to be used

[Terminal] `$ sudo chmod a+rw /dev/ttyUSB0`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/16.png)

* Click `Browse for folder`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/9.png)

* Select `[DynamixelSDK folder]/matlab`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/10.png)

* Double click `read_write.m`

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/11.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment. Then click `Run` in the Eclipse toolbox above. 

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/12.png)

* Console window will show the results 

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/linux/sample_code/13.png)