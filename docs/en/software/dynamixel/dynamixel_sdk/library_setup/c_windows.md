---
layout: archive
lang: en
ref: dynamixel_sdk_library_setup_c_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/c_windows/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 2"></div>

# [Library Setup](#library-setup)

## [C Windows](#c-windows)

### [Compiler and Builder](#compiler-and-builder)

* [Download Visual Express for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/vs.png)

### [Building the Library](#building-the-library)

* Run the project solution file (.sln) located in the `[DynamixelSDK folder]/c/build/win32` directory OR `[DynamixelSDK folder]/c/build/win64` directory).

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/library_file/1.png)

* Under Solution Explorer, right click on the project and select Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/library_file/2.png)

* Under General Configuration Properties, confirm that the paths and file extensions are set as follows:

  * Output Directory: `$(SolutionDir)output\`
  * Intermediate Directory: `$(Configuration)\`
  * Target Extension: `.dll`
  * Platform Toolset: `Visual Studio 20XX (v000)`
  * Configuration Type: `Dynamic Library (.dll)`.


If the library file should be built in lower or higher version Visual Studio, change the `Platform Toolset` into the needed value. (ex: To use the DynamixelSDK c ver. library file in the MATLAB 2010 or LabVIEW 2010, the `Platform Toolset` should be changed into `Visual Studio 2009` or lower one.)

![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/library_file/3.png)

* Confirm that the Additional Include Directories path under the General C/C++ Configuration Properties tree is as follows:  

  `..\..\..\include`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/library_file/4.png)

* Right click on the project and select Build to build the library.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/library_file/5.png)

* The built library file is located in `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll`.

### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK sample code for C uses the library files(.dll for Windows) built in C language.

By doing above, each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll` which were built by its own source code. 

* Run the .sln file located in the `[DynamixelSDK folder]/c/example/protocol1.0/read_write/win32` folder if you have a 32-bit platform OR the `[DynamixelSDK folder]/c/example/protocol1.0/read_write/win64` folder if you have a 64-bit platform.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/1.png)

* Right click on the project and select Properties. 

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/2.png)

* In the resulting Property Pages window, under Configuration Properties --> General, check that the directories and file extensions are set as follows: 

  * Output Directory: `$(SolutionDir)$(Configuration)\`
  * Intermediate Directory: `$(Configuration)\`
  * Target Extension: `.exe`
  * Configuration Type: `Application (.exe)`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/3.png)

* Under Configuration Properties --> Debugging add the following path to Environment: 
  - win32: `PATH=%PATH%;..\..\..\..\..\build\win32\output;`
  - win64: `PATH=%PATH%;..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/4.png)

* Under Configuration Properties --> VC++ Directories, add the following path to Library Directories:
  - win32: `..\..\..\..\..\build\win32\output;`
  - win64: `..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/5.png)

* Under Configuration Properties --> C/C++ --> General, add the following path to Additional Include Directories: 

  `..\..\..\..\..\include`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/6.png)

* Under Configuration Properties --> Linker --> Input, add the following file to Additional Dependencies: 

  - win32: `dxl_x86_c.lib;`
  - win64: `dxl_x64_c.lib;`
 
    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/7.png)

* Click on the Local Windows Debugger button to run the program.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/c/windows/sample_code/8.png)
