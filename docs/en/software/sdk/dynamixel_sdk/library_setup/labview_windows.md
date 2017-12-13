---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_labview_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/library_setup/labview_windows
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 15"></div>
<div style="counter-reset: h1 2"></div>

## [LabVIEW Windows](#labview-windows)

### [Compiler and Builder](#compiler-and-builder)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/Labview-logo.png)

------------------------------------------------------------------------------------

* [Download LabVIEW for Windows](http://www.ni.com/download-labview/#)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/a1.png)

### [Building the Library](#building-the-library)

Note that if following procedure imports the DynamixelSDK c ver. 32bit library, the built library for LabVIEW only can be used by LabVIEW 32bit. Choose the platform target to either 32bit or 64bit, at first.

Besides, when some error that are related with `.dll file version is higher than the LabVIEW's version` is appeared, the `.dll` file should be rebuilt in lower version Visual Studio. Check how to build in the lower version environment [here](https://github.com/ROBOTIS-GIT/DynamixelSDK/wiki/3.2.1.1-C-Windows) → <kbd>Building the Library</kbd> → `Platform Toolset`. 

* Run LabVIEW, then click <kbd>Tools</kbd> → <kbd>Import</kbd> → <kbd>Shared Library (.dll)...</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b1.png)

* Select <kbd>Create VIs for a shared library</kbd>, then click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b2.png)

* Set paths to where the `.dll` and `.h` of DynamixelSDK c version is located, then click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b3.png)

* Put some definitions used in DynamixelSDK c version into the Textbox, then click <kbd>Next</kbd>.

``` c
_WIN32;_WIN64;_cplusplus;size_t=unsigned __int64;size_t=unsigned in
```

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b4.png)

* Check whether all the functions are successfully listed for the import, then click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b5.png)

* Change `Project Library Name` and `Project Library Path` properly. Then click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b6.png)

* The DynamixelSDK functions for the LabVIEW will be structed as the blocks shows. Click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b7.png)

* Here doesn't have any items that should be edited. Click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b8.png)

* The list shows what kind of files should be built during the import. Click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b9.png)

* Wait for the progress. When it finishes importing, click <kbd>Next</kbd>.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b10.png)

* Click <kbd>Finish</kbd> and see the list of generated libraries.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b11.png)

* Now, make the sources by using the generated LabVIEW libraries.

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/b12.png)

### [Function Reference](#function-reference)

* The function reference file is located in `[DynamixelSDK folder]/labview/dxl_x86_c.lvlib/dxl_x86_c.lvlib`

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/2.png)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/4.png)

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/3.SourcePreparation/Compiler%20and%20Builder/LabVIEW/1.png)
