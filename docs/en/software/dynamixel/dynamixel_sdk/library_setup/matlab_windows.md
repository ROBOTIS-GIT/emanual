---
layout: archive
lang: en
ref: matlab_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/matlab_windows/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 13"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [Matlab Windows](#matlab-windows)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/matlab.png)

* [Download MATLAB for Windows](http://www.mathworks.com/index.html?s_tid=gn_loc_drop)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/library_file/a1.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/library_file/a2.png)

### [Function Reference](#function-reference)
{% capture notice_01 %}
**WARNING**:
When some error that are related with `.dll file version is higher than the MATLAB's version` is appeared, the `.dll` file should be rebuilt in lower version Visual Studio.
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>


* The function reference file is located in `[DynamixelSDK folder]/matlab/m_basic_function/`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/library_file/2.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/library_file/3.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/library_file/1.png)


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

DYNAMIXEL SDK example code for MATLAB uses the library files(.dll for Windows) built in C language.

Each released DYNAMIXEL SDK have latest library files in `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll` which were built by its own source code.

#### Import libraries

* Click `Set Path`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/1.png)

* Click `Add with Subfolders...`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/2.png)

* Select `[DynamixelSDK folder]/c/include`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/3.png)

* Click `Add Folder...`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/4.png)

* Select `[DynamixelSDK folder]/c/build/win32/output`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/5.png)


#### Import function reference

* Click `Add with Subfolders...`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/6.png)

* Select `[DynamixelSDK folder]/matlab`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/7.png)

* Click `Save` and then `Close`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/8.png)


#### Run example

* Click `Browse for folder`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/9.png)

* Select `[DynamixelSDK folder]/matlab`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/10.png)

* Double click `read_write.m`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/11.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment. Then click `Run` in the Eclipse toolbox above.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/13.png)

* Console window will show the results

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/matlab/windows/sample_code/14.png)
