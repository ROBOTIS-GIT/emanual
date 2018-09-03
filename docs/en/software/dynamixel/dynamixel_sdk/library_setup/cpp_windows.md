---
layout: archive
lang: en
ref: cpp_windows
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/library_setup/cpp_windows/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 4"></div>
<div style="counter-reset: h2 3"></div>

<!--[dummy Header 1]>
  <h1 id="library-setup"><a href="#library-setup">Library Setup</a></h1>
<![end dummy Header 1]-->

## [CPP Windows](#cpp-windows)

### [Compiler and Builder](#compiler-and-builder)

* [Download Visual Express for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/vs.png)

### [Building the Library](#building-the-library)

* Run the project solution file (.sln) located in the `[DynamixelSDK folder]/c++/build/win32` directory (or `[DynamixelSDK folder]/c++/build/win64` directory)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/1.png)

* Under Solution Explorer, right click on the project and select Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/2.png)

* Under General Configuration Properties, confirm that the paths and file extensions are set as follows:

  * Output Directory: `$(SolutionDir)output\`
  * Intermediate Directory: `$(Configuration)\`
  * Target Extension: `.dll`
  * Configuration Type: `Dynamic Library (.dll)`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/3.png)

* Confirm that the Additional Include Directories path under the General C/C++ Configuration Properties tree is as follows:

  `..\..\..\include\dynamixel_sdk`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/4.png)

* Right click on the project and select Build to build the library.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/5.png)

* The built library file is located in `[DynamixelSDK folder]/c++/build/[winXX]/output/dxl_xYY_cpp.dll`


### [Building and Running the Sample Code](#building-and-running-the-sample-code)

The Dynamixel SDK example code for CPP uses the library files(.dll for Windows) built in CPP language.

Each released Dynamixel SDK have latest library files in `[DynamixelSDK folder]/c++/build/[winXX]/output/dxl_xYY_cpp.dll` which were built by its own source code.

* Run .sln file in `[DynamixelSDK folder]/c++/example/protocol2.0/read_write/win64` folder(or win32 folder, if controller is 32bit platform)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/1.png)

* Open project properties. To view this, select a project in solution explorer. Then, choose Properties on the Project menu.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/2.png)

* Check if the file extension is set correctly as shown below.

  * Output Directory: `$(SolutionDir)$(Configuration)\`
  * Intermediate Directory: `$(Configuration)\`
  * Target Extension: `.exe`
  * Configuration Type: `Application (.exe)`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/3.png)

* Add path in Debugging-Environment tab as shown below.

  - [win32] `PATH=%PATH%;..\..\..\..\..\build\win32\output;`
  - [win64] `PATH=%PATH%;..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/4.png)

* Add path in VC++-Library Directories tab as shown below.

  - [win32] `..\..\..\..\..\build\win32\output;`
  - [win64] `..\..\..\..\..\build\win64\output;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/5.png)

* Add path in C/C++-Common-Additional include directory tab as shown below.

  `..\..\..\..\..\include\dynamixel_sdk`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/6.png)

* Add file name in Linker-Input-Additional dependency tab as shown below.

  - [win32] `dxl_x86_cpp.lib;`
  - [win64] `dxl_x64_cpp.lib;`

    ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/7.png)

* Click Debugger button to run the program

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/sample_code/8.png)
