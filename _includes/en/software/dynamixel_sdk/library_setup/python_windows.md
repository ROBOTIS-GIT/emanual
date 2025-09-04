{::options parse_block_html="true" /}

<div class="main-header">
  <h1 id="library-setup-python-windows">Library Setup &lt;Python Windows&gt;</h1>
</div>
<style>
  .main-header h1::before {
    content: none !important;
  }
</style>

# [Install requirements](#install-requirements)

- [Install Python3 for WINDOWS](https://www.python.org/downloads/)

# [Build and Install the SDK](#build-and-install-the-SDK)

- Open the `{$Dynamixel_SDK}/python` folder.
- Right click on the folder and select `Open in terminal`.
- Build and install Dynamixel_SDK through below command.
```bash
$ pip install .
```

- You can check whether pip recognizes the SDK by running the following command:
```bash
$ pip show dynamixel_sdk
Name: dynamixel-sdk
Version: *.*.*
Summary: ~
Home-page: ~
Author: ~
Author-email: ~
License: ~
Location: ~
Requires:
Required-by:
```
