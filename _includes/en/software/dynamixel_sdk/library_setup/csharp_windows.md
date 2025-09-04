{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-csharp-windows">Library Setup &lt;CSharp Windows&gt;</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

For C# source code is only provided for Windows.

# [Compiler and Builder](#compiler-and-builder)

* [Download Visual Studio Community for Windows Desktop](https://www.visualstudio.com/en-us/products/visual-studio-express-vs.aspx)

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/csharp/vs.png)

# [Function References](#function-references)

* The function reference file is located in `[DynamixelSDK folder]/c#/dynamixel_functions_csharp/[winXX]/dynamixel.cs`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/csharp/windows/library_file/1.png)

# [Building and Running the Sample Code](#building-and-running-the-sample-code)

The DYNAMIXEL SDK sample code for C# uses the library files (.dll for Windows) compiled from the C# language source.

Each released DYNAMIXEL SDK has the latest library files in:

`[DynamixelSDK folder]/c/build/[winXX]/output/dxl_xYY_c.dll`

built by their own source code.

* Open `read_write.sln` from `[DynamixelSDK folder]/C#/protocol2.0/read_write/win64/`

* Double click `ReadWrite.cs`

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/csharp/windows/sample_code/1.png)

* Adjust the values surrounded with red circle to proper value as shown in the comment. Then click `Start` in the Visual Studio toolbox above.

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/csharp/windows/sample_code/2.png)

* Console window will show the results

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/csharp/windows/sample_code/4.png)
