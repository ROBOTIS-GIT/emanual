---
layout: archive
lang: en
ref: task_misc
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus1/task/task_misc/
sidebar:
  title: R+ Task 1.0
  nav: "rplustask1"
---

<div style="counter-reset: h1 3">
</div>

# [Miscellaneous](#miscellaneous)
## [Select Controller](#select-controller)
The commands and parameters that can be used in RoboPlus Task depend on the controller.  Therefore, a controller must be selected before creating a program.

![select controller][select_controller]

- If you change the controller while you are writing a program for another controller, errors may be raised during the "rule check" process.

- To use a program designed for another controller, the incompatible commands and parameters must be changed accordingly.


## [Rule Check](#rule-check)
Rule check is the process to verify that the task code has been written appropriately according to the rules.  RoboPlus Task has a function that checks for grammatical errors and prints the causes and locations of errors.  An example of a grammatical error and its location is shown below.

```
=== Sentence Check(ollo_bug_product_en) ===
Line:13 Please select a device or number.
=== Tottal Error: 1 ===
```

Double-click on the error message to move to the location of the error.

### [Errors](#errors)
The following is a list of grammatical errors
1. [Select the number or device](#error_01)
2. [Block beginning doesn't exist](#error_02)
3. [A block must be designated](#error_03)
4. [Only 1 "Start Program" is permitted](#error_04)
5. ["Start Program" cannot be defined in a block](#error_05)
6. [A function cannot be defined in a block](#error_06)
7. [A command to execute the designated block does not exist](#error_07)
8. [This line should be included in a block](#error_08)
9. [The start and end of the block are not paired](#error_09)
10. ["Start Program" does not exist](#error_10)
11. [A function with the same name already exists](#error_11)
12. ["Restoration" can only be used in a function](#error_12)
13. [A label with same name already exists](#error_13)
14. [A function cannot call itself](#error_14)
15. ["If/If else" has been used improperly](#error_15)
16. [There is no loop to end](#error_16)
17. [A block must consist of at least one command](#error_17)
18. [A jump to another block is not permitted](#error_18)
19. [The called function does not exist](#error_19)
20. [Only 1 callback function may exist](#error_20)
21. [A callback function cannot be defined in a block](#error_21)
22. [This command cannot be used in a callback function](#error_22)
23. [This device cannot be used in a callback function](#error_23)
24. [This command cannot be used with the selected controller](#error_24)
25. [There is a device which cannot be used with the selected controller](#error_25)

### [Solutions](#solutions)

1. <a name="error_01"></a>Select the number or device

    | Cause of Error | Solution |
    | :---: | :---: |
    |The parameter has not been set|Properly set to a unset parameter|
    |![img_01][img_01]|![img_02][img_02]|

2. <a name="error_02"></a>Block beginning doesn't exist

    | Cause of Error | Solution |
    | :---: | :---: |
    |A block does not exist in a command line|Properly set the block|
    |![img_03][img_03]|![img_04][img_04]|

3. <a name="error_03"></a>A block must be designated

    | Cause of Error | Solution |
    | :---: | :---: |
    |A duplicate block without a command line|Properly set the block|
    |![img_05][img_05]|![img_06][img_06]|

4. <a name="error_04"></a>Only 1 "Start Program" is permitted

    | Cause of Error | Solution |
    | :---: | :---: |
    |Two or more “Start Program” exists|Create only one “Start Program”|
    |![img_07][img_07]|![img_08][img_08]|

5. <a name="error_05"></a>"Start Program" cannot be defined in a block

    | Cause of Error | Solution |
    | :---: | :---: |
    |“Start Program” exists in the block|Remove the block from the “Start Program”|
    |![img_09][img_09]|![img_10][img_10]|

6. <a name="error_06"></a>A function cannot be defined in a block

    | Cause of Error | Solution |
    | :---: | :---: |
    |Function is located within a block|Remove the function from the block|
    |![img_11][img_11]|![img_12][img_12]|

7. <a name="error_07"></a>A command to execute the designated block does not exist

    | Cause of Error | Solution |
    | :---: | :---: |
    |Block exists without a command or condition line|Added the omitted command or delete|
    |![img_13][img_13]|![img_14][img_14]|

8. <a name="error_08"></a>This line should be included in a block

    | Cause of Error | Solution |
    | :---: | :---: |
    |A command without a block is located outermost|Move the command to a proper location or delete|
    |![img_15][img_15]|![img_16][img_16]|

9. <a name="error_09"></a>The start and end of the block are not paired

    | Cause of Error | Solution |
    | :---: | :---: |
    |The start and end of the block are not paired|Please set the area properly|
    |![img_17][img_17]|![img_18][img_18]|

10. <a name="error_10"></a>"Start Program" does not exist

    | Cause of Error | Solution |
    | :---: | :---: |
    |“Start Program” does not exist|Create a “Start Program”|
    |![img_19][img_19]|![img_20][img_20]|

11. <a name="error_11"></a>A function with the same name already exists

    | Cause of Error | Solution |
    | :---: | :---: |
    |A label with the same name already exists|Change duplicate function name or delete|
    |![img_21][img_21]|![img_22][img_22]|

12. <a name="error_12"></a>"Restoration" can only be used in a function

    | Cause of Error | Solution |
    | :---: | :---: |
    |The restoration command is used in a location other than a function|Create a restoration command within a function or delete|
    |![img_23][img_23]|![img_24][img_24]|

13. <a name="error_13"></a>A label with same name already exists

    | Cause of Error | Solution |
    | :---: | :---: |
    |Duplicate label name exists|Set to a different name or delete|
    |![img_25][img_25]|![img_26][img_26]|

14. <a name="error_14"></a>A function cannot call itself

    | Cause of Error | Solution |
    | :---: | :---: |
    |The function is called within the function|Replace with a proper command or delete|
    |![img_27][img_27]|![img_28][img_28]|

15. <a name="error_15"></a>"If/If else" has been used improperly

    | Cause of Error | Solution |
    | :---: | :---: |
    |If else/ If has been used without Else|Revised according to usage If, Else If, Either|
    |![img_29][img_29]|![img_30][img_30]|

16. <a name="error_16"></a>There is no loop to end

    | Cause of Error | Solution |
    | :---: | :---: |
    |The "End Repeat" command is used at a location other than a loop|End Repeat command can only be used within the loop, delete if unnecessary|
    |![img_31][img_31]|![img_32][img_32]|

17. <a name="error_17"></a>A block must consist of at least one command

    | Cause of Error | Solution |
    | :---: | :---: |
    |A line does not exist behind a command that is required by a block|Add a line required behind the command or delete|
    |![img_33][img_33]|![img_34][img_34]|

18. <a name="error_18"></a>A jump to another block is not permitted

    | Cause of Error | Solution |
    | :---: | :---: |
    |The label you wish to jump to is unavailable in the function|Jump to a label within a function or delete|
    |![img_35][img_35]|![img_36][img_36]|

19. <a name="error_19"></a>The called function does not exist

    | Cause of Error | Solution |
    | :---: | :---: |
    |The called function does not exist|Create a function or delete|
    |![img_37][img_37]|![img_38][img_38]|

20. <a name="error_20"></a>Only 1 callback function may exist

    | Cause of Error | Solution |
    | :---: | :---: |
    |Two or more callback functions exist|Create only one callback function|
    |![img_39][img_39]|![img_40][img_40]|

21. <a name="error_21"></a>A callback function cannot be defined in a block

    | Cause of Error | Solution |
    | :---: | :---: |
    |Callback located in the block|Remove callback from block|
    |![img_41][img_41]|![img_42][img_42]|

22. <a name="error_22"></a>This command cannot be used in a callback function

    | Cause of Error | Solution |
    | :---: | :---: |
    |Improper command located in callback|The corresponding command has been deleted|
    |![img_43][img_43]|![img_44][img_44]|

23. <a name="error_23"></a>This device cannot be used in a callback function

    | Cause of Error | Solution |
    | :---: | :---: |
    |An unusable parameter located in callback|Delete corresponding parameter|
    |![img_45][img_45]|![img_46][img_46]|

24. <a name="error_24"></a>This command cannot be used with the selected controller

    | Cause of Error | Solution |
    | :---: | :---: |
    |Unsupported command being used in the current controller|Delete corresponding command or set to supported controller|
    |![img_47][img_47]|![img_48][img_48]|

25. <a name="error_25"></a>There is a device which cannot be used with the selected controller

    | Cause of Error | Solution |
    | :---: | :---: |
    |Unusable parameter being used in the controller|Either deleted the corresponding parameter or set to a controller which is supported|
    |![img_49][img_49]|![img_50][img_50]|


## [Error Messages](#error-messages)
The following table provides a list of errors you may see while writing codes and printing the output on the screen with RoboPlus Task.

|Error Code|Description|Output Example|
| :---: | :--- | :--- |
|8100|Trying to communicate with an unconnected Dynamixel ID.<br>If it is connected, please check the cable again.|**{[ERROR:8100:0005:03]}**<br>8100 : Error Code<br>0005 : The Dynamixel ID<br>03 : Confidential Information|
|0009|Too many consecutive function calls. (More than 6 times)|**{[ERROR:0009:0033:06]}**<br>0009 : Error Code<br>0033 :Confidential Information<br>06 : Confidential Information|
|8001|Attempting to read an address of the controller designated as "write only".|**{[ERROR:8001:000C:02]}**<br>8001 : Error Code<br>000C : Confidential Information<br>02 : Confidential Information|
|8002|Attempting to write at an address of the controller designated as "read only".|**{[ERROR:8002:0009:02]}**<br>8002 : Error Code<br>0009 : Confidential Information<br>02 :  Confidential Information|
|None|Motion page to execute does not exist.|**[Invalid Page Read:00FE]**<br>00FE : Motion page number (hexadecimal)|

[select_controller]: /assets/images/sw/rplus1/task/task_select_controller.png
[img_01]: /assets/images/sw/rplus1/task/task_rule_error_001.png
[img_02]: /assets/images/sw/rplus1/task/task_rule_error_002.png
[img_03]: /assets/images/sw/rplus1/task/task_rule_error_003.png
[img_04]: /assets/images/sw/rplus1/task/task_rule_error_004.png
[img_05]: /assets/images/sw/rplus1/task/task_rule_error_005.png
[img_06]: /assets/images/sw/rplus1/task/task_rule_error_006.png
[img_07]: /assets/images/sw/rplus1/task/task_rule_error_007.png
[img_08]: /assets/images/sw/rplus1/task/task_rule_error_008.png
[img_09]: /assets/images/sw/rplus1/task/task_rule_error_009.png
[img_10]: /assets/images/sw/rplus1/task/task_rule_error_010.png
[img_11]: /assets/images/sw/rplus1/task/task_rule_error_011.png
[img_12]: /assets/images/sw/rplus1/task/task_rule_error_012.png
[img_13]: /assets/images/sw/rplus1/task/task_rule_error_013.png
[img_14]: /assets/images/sw/rplus1/task/task_rule_error_014.png
[img_15]: /assets/images/sw/rplus1/task/task_rule_error_015.png
[img_16]: /assets/images/sw/rplus1/task/task_rule_error_016.png
[img_17]: /assets/images/sw/rplus1/task/task_rule_error_017.png
[img_18]: /assets/images/sw/rplus1/task/task_rule_error_018.png
[img_19]: /assets/images/sw/rplus1/task/task_rule_error_019.png
[img_20]: /assets/images/sw/rplus1/task/task_rule_error_020.png
[img_21]: /assets/images/sw/rplus1/task/task_rule_error_021.png
[img_22]: /assets/images/sw/rplus1/task/task_rule_error_022.png
[img_23]: /assets/images/sw/rplus1/task/task_rule_error_023.png
[img_24]: /assets/images/sw/rplus1/task/task_rule_error_024.png
[img_25]: /assets/images/sw/rplus1/task/task_rule_error_025.png
[img_26]: /assets/images/sw/rplus1/task/task_rule_error_026.png
[img_27]: /assets/images/sw/rplus1/task/task_rule_error_027.png
[img_28]: /assets/images/sw/rplus1/task/task_rule_error_028.png
[img_29]: /assets/images/sw/rplus1/task/task_rule_error_029.png
[img_30]: /assets/images/sw/rplus1/task/task_rule_error_030.png
[img_31]: /assets/images/sw/rplus1/task/task_rule_error_031.png
[img_32]: /assets/images/sw/rplus1/task/task_rule_error_032.png
[img_33]: /assets/images/sw/rplus1/task/task_rule_error_033.png
[img_34]: /assets/images/sw/rplus1/task/task_rule_error_034.png
[img_35]: /assets/images/sw/rplus1/task/task_rule_error_035.png
[img_36]: /assets/images/sw/rplus1/task/task_rule_error_036.png
[img_37]: /assets/images/sw/rplus1/task/task_rule_error_037.png
[img_38]: /assets/images/sw/rplus1/task/task_rule_error_038.png
[img_39]: /assets/images/sw/rplus1/task/task_rule_error_039.png
[img_40]: /assets/images/sw/rplus1/task/task_rule_error_040.png
[img_41]: /assets/images/sw/rplus1/task/task_rule_error_041.png
[img_42]: /assets/images/sw/rplus1/task/task_rule_error_042.png
[img_43]: /assets/images/sw/rplus1/task/task_rule_error_043.png
[img_44]: /assets/images/sw/rplus1/task/task_rule_error_044.png
[img_45]: /assets/images/sw/rplus1/task/task_rule_error_045.png
[img_46]: /assets/images/sw/rplus1/task/task_rule_error_046.png
[img_47]: /assets/images/sw/rplus1/task/task_rule_error_047.png
[img_48]: /assets/images/sw/rplus1/task/task_rule_error_048.png
[img_49]: /assets/images/sw/rplus1/task/task_rule_error_049.png
[img_50]: /assets/images/sw/rplus1/task/task_rule_error_050.png
