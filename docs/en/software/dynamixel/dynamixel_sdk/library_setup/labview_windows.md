---
layout: archive
lang: en
ref: labview_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/labview_windows/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 16"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [LabVIEW Windows](#labview-windows)

### [Compiler and Builder](#compiler-and-builder)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/labview_logo.png)

* [Download LabVIEW for Windows](http://www.ni.com/download-labview/)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/a1.png)

### [Building the Library](#building-the-library)

Note that if following procedure imports the DynamixelSDK c ver. 32bit library, the built library for LabVIEW only can be used by LabVIEW 32bit. Choose the platform target to either 32bit or 64bit, at first.

Besides, when some error that are related with `.dll file version is higher than the LabVIEW's version` is appeared, the `.dll` file should be rebuilt in lower version Visual Studio.

* Run LabVIEW, then click <kbd>Tools</kbd> → <kbd>Import</kbd> → <kbd>Shared Library (.dll)...</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b1.png)

* Select <kbd>Create VIs for a shared library</kbd>, then click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b2.png)

* Set paths to where the `.dll` and `.h` of DynamixelSDK c version is located, then click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b3.png)

* Put some definitions used in DynamixelSDK c version into the Textbox, then click <kbd>Next</kbd>.

  ```c
  _WIN32;_WIN64;_cplusplus;size_t=unsigned __int64;size_t=unsigned in
  ```

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b4.png)

* Check whether all the functions are successfully listed for the import, then click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b5.png)

* Change `Project Library Name` and `Project Library Path` properly. Then click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b6.png)

* The DynamixelSDK functions for the LabVIEW will be structed as the blocks shows. Click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b7.png)

* Here doesn't have any items that should be edited. Click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b8.png)

* The list shows what kind of files should be built during the import. Click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b9.png)

* Wait for the progress. When it finishes importing, click <kbd>Next</kbd>.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b10.png)

* Click <kbd>Finish</kbd> and see the list of generated libraries.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b11.png)

* Now, make the sources by using the generated LabVIEW libraries.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/b12.png)

### [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/labview/dxl_x86_c.lvlib/dxl_x86_c.lvlib`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/2.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/4.png)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/library_file/1.png)

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

Dynamixel SDK example code for LabVIEW uses the library files(.dll for Windows) built in C language.

Each released Dynamixel SDK have latest library files in:  
`[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll`

which were built by its own source code.

<!--
#### Run .vi file in labview folder
-->
