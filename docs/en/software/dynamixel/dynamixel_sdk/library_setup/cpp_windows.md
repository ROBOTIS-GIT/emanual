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

{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-cpp-windows">Library Setup <C++ WINDOWS></h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

This section provides instructions on building the SDK.

# [Install requirements](#install-requirements)
- In this section, we used visual studio as the IDE for building the SDK.

  [Download Visual Studio Community for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/visualstudio.png)

# [Build the SDK](#build-the-SDK)
**NOTE**: This instruction assumes a 64-bit Windows system. If you are using 32-bit Windows, simply follow the same steps using the 32-bit version instead.
{: .notice}
- Open the project solution file (`dxl_x64_cpp.sln`) located in the `[DynamixelSDK folder]/c++/build/win64` directory.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/visualstudio1.png)

- If below dialog appears, select `OK`. This will adjust the toolset settings depending on your version of Visual Studio and Windows.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/upgradetoolset.png)


- In the Solution Explorer on the right side, right-click the dxl_x64_cpp solution and select Build.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildprocess.png)

<br>

- **The SDK build is complete.**
- **If the build was successful, the compiled library file will be saved at :** `[DynamixelSDK folder]/c++/build/[win64]/output/dxl_x64_cpp.dll`
  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildoutput.png)

<details>
<summary>
![](/assets/images/icon_unfold.png) **Check Build Properties**
</summary>

- You can check or change the build properties through right-clicking on the project in the Solution Explorer and selecting Properties.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties1.png)

- Build properties is shown as below

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties2.png)
  - Output Directory: `$(SolutionDir)output\`
  - Intermediate Directory: `$(Configuration)\`
  - Platform Toolset: `Visual Studio 20XX (v000)`
  - Configuration Type: `Dynamic Library (.dll)`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/cpp/windows/library_file/buildproperties3.png)
  - Additional Include Directories: `..\..\..\include\dynamixel_sdk`
</details>

{% capture notice_01 %}
**WARNING**:
If the library file needs to be built in a lower or higher version of Visual Studio, change the `Platform Toolset` into the needed value. (ex: To use the DynamixelSDK c ver. library file in the MATLAB 2010 or LabVIEW 2010, the `Platform Toolset` should be changed to `Visual Studio 2009` lower.)
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>
