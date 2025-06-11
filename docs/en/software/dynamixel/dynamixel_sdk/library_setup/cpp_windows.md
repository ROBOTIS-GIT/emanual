---
layout: archive
lang: en
ref: cpp_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_windows/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 4 !important;}</style>
<div style="counter-reset: h2 3"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [CPP Windows](#cpp-windows)

### [Compiler and Builder](#compiler-and-builder)

* [Download Visual Studio Community for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/vs.png)

### [Building the Library](#building-the-library)

* Run the project solution file (.sln) located in the `[DynamixelSDK folder]/c++/build/win32` directory (or the `[DynamixelSDK folder]/c++/build/win64` directory)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/1.png)

* In the Solution Explorer, right click on the project and select Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/2.png)

* Under General Configuration Properties, confirm that the paths and file extensions are set to the following:

  * Output Directory: `$(SolutionDir)output\`
  * Intermediate Directory: `$(Configuration)\`
  * Platform Toolset: `Visual Studio 20XX (v000)`
  * Configuration Type: `Dynamic Library (.dll)`

{% capture notice_01 %}
**WARNING**:
If the library file needs to be built in a lower or higher version of Visual Studio, change the `Platform Toolset` into the needed value. (ex: To use the DynamixelSDK c ver. library file in the MATLAB 2010 or LabVIEW 2010, the `Platform Toolset` should be changed to `Visual Studio 2009` lower.)
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/3.png)

* Confirm that the Additional Include Directories path under the General C/C++ Configuration Properties tree is as follows:

  `..\..\..\include\dynamixel_sdk`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/4.png)

* Right click on the project and select Build to build the library.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/5.png)

* The compiled library file will be saved in `[DynamixelSDK folder]/c++/build/[winXX]/output/dxl_xYY_cpp.dll`


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK example code for CPP uses the library files (.dll for Windows) built from the CPP source.

By following the instructions above, The compiled .dll files are output to `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll` after being built from the included source code.

* Run the .sln file located in the `[DynamixelSDK folder]/cpp/example/protocol2.0/read_write/win32` folder if you have a 32-bit platform OR the `[DynamixelSDK folder]/cpp/example/protocol2.0/read_write/win64` folder if you have a 64-bit platform.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/1.png)

* Right click on the project and select Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/2.png)

* In the resulting Property Pages window, under Configuration Properties --> General, check that the directories and file extensions are set as follows:

  * Output Directory: `$(SolutionDir)$(Configuration)\`
  * Intermediate Directory: `$(Configuration)\`
  * Target Extension: `.exe`
  * Configuration Type: `Application (.exe)`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/3.png)

* Add the path to the Debugging-Environment tab as shown below.

  - [win32] `PATH=%PATH%;..\..\..\..\..\build\win32\output;`
  - [win64] `PATH=%PATH%;..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/4.png)

* Add the path path in VC++-Library Directories tab as shown below.

  - [win32] `..\..\..\..\..\build\win32\output;`
  - [win64] `..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/5.png)

* Add the path in C/C++-Common-Additional include directory tab as shown below.

  `..\..\..\..\..\include\dynamixel_sdk`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/6.png)

* Add the file name in Linker-Input-Additional dependency tab as shown below.

  - [win32] `dxl_x86_cpp.lib;`
  - [win64] `dxl_x64_cpp.lib;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/7.png)

* Click the Debugger button to run the program

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/8.png)
