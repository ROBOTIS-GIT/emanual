---
layout: archive
lang: en
ref: rplus2_task
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/rplus2/task/
sidebar:
  title: R+ Task 2.0
  nav: "rplustask2"
---

# [Introduction](#introduction)

## [RoboPlus Task 2.0](#roboplus-task-20)

![](/assets/images/sw/rplus2/task/roboplus_task2_001.gif)

In computer science, a task generally means a set of relevant activities to complete the work at hand. In RoboPlus terms, a task code is a source code programmed for a robot to complete a task.  
A robot operates according to the task code created by the user, and the RoboPlus Task is a program that helps the user to write task code easily. Task code files have a .tskx extension in the PC (or smartphone).  
(Previous versions use a .tsk extension, which can be converted to .tskx via R+ Task 2.0)
 
- What does the Task file have to do with the Motion file?  
  The Task file is the program code that defines the logic and thought process of how the robot will think and act, and the Motion file is the data which defines the behavior to be taken according to the decision made on the Task file.  
  If the robot that I make will only be using simple movements, then you do not need to use a Motion file when writing a Task file.  
  But if I need the robot to perform accurate movements or a great number of movements such as dancing, then using a Motion file will be more efficient.  
  (If user wants to use a Motion file in the task code, the user must download the Motion file.)

![](/assets/images/sw/rplus2/task/roboplus_task2_002.gif)
 
## [Manual Instructions](#manual-instructions)

1. Editing Tab for Each Stage  
    The workspace is divided into Home Tab, Programming Tab, and Debugging Tab.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_003.jpg)
 
2. Home Tab  
    The following figures are the first screen right after starting the program, which includes basic samples, file related menu, update, and settings menu.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_004.jpg)
 
    ![](/assets/images/sw/rplus2/task/roboplus_task2_005.jpg)
 
3. Programming Tab  
    The following figures display the screen for editing task source code, which provides programming toolbar, source view, outline menu, and download functions.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_006.jpg)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_007.jpg)
 
4. Debugging Tab  
    The following figures indicate the screen to debug the task code, which provides the output monitor and virtual remote control functions.  
    (An auto-connect feature has been added for the user’s convenience.)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_008.jpg)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_009.jpg)

## [Resources for Task](#resources-for-task)

Resources in Task Code vary depending on the device connected with the controller.
 
1. If controller is connected to an external hardware such as a Dynamic Cell, then the Task Code can use it.
2. If controller is connected to a smart app(R+ Smart or R+ IoT), then the Task Code can use it.
3. If user has downloaded motion data into the Controller via R+ Motion, then the Task Code can use it.
 
Resources available in Task Code are comprised as below

![](/assets/images/sw/rplus2/task/roboplus_task2_010.jpg)

## [Task Code Structure](#task-code-structure)

Task code is comprised of 3 elements (code lines, instructions, and parameters).
 
1. Parameter  
  This is the smallest unit that represents variables or hardware characteristics. User can read or write the value.
 
2. Instructions  
  Indicates a single behavior(computation) given to the Controller to execute the program. Each instruction promises a unique behavior, and the number of parameters vary depending on the behavior(computation).
 
3. Code line (Command line)  
  The smallest unit that executes the program, which is a combination of instruction and parameter. Generally, the program is executed in order of the code lines.

![](/assets/images/sw/rplus2/task/roboplus_task2_011.jpg)

# [Basic Features](#basic-features)

## [File Open](#file-open)

1. Move to Home Tab (When you open the program it starts on Home Tab.)
2. Click the `Example` button
3. Select the desired product, steps, and sample name
4. Click `Confirm` button

![](/assets/images/sw/rplus2/task/roboplus_task2_012.jpg)

## [Create New File](#create-new-file)

1. Move to Home Tab (When you open the program it starts on Home Tab.)
2. Click the `New` button

    ![](/assets/images/sw/rplus2/task/roboplus_task2_013.jpg)

3. Choose the controller model and its firmware version (1.0 - old, 2.0 - new)
4. Click `Confirm` button to create new Task file

    ![](/assets/images/sw/rplus2/task/roboplus_task2_014.jpg)

## [Command Edit](#command-edit)

1. Move to Programming Tab (When you create a new file it starts on Programming Tab.)
2. Click the `Instructions` button
3. Click the `Loop` category

    ![](/assets/images/sw/rplus2/task/roboplus_task2_015.jpg)
 
4. Drag the `Endless Loop` instruction.
5. And drop it on the desired line to add the instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_016.jpg)

## [Parameter Edit](#parameter-edit)

1. Click the “Instructions” button
2. Click the “Execute” category
3. Drag the “Load” instruction,
4. And drop it on the desired line to add instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_017.jpg)
 
5. Double-click on the “left-side block” of the added instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_018.jpg)
 
6. Select “Controller Device” in Category1
7. Select “Accessory Device” on Category2
8. Select Port number 1 and select “Geared Motor”
9. Click the Confirm button to finish editing the instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_019.jpg)

10. Double-click on the “right-side block” of the added instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_020.jpg)
 
11. Select “Controller Constant” in Category1
12. Select “Motor Value” on Category2
13. Select “CCW” for Direction and put in “500” for Power
14. Click the Confirm button to finish editing the instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_021.jpg)
 
15. Check the edited instruction block

    ![](/assets/images/sw/rplus2/task/roboplus_task2_022.jpg)

## [Download Task Code](#download-task-code)

1. Click the “Device” button
2. Select the device connected to the robot
3. Click the Confirm button
4. When the window closes, click the “Download” button

    ![](/assets/images/sw/rplus2/task/roboplus_task2_023.jpg)

5. When download completes, the Controller will execute the task (For some of the Controllers, the Controller will close instead of executing the task)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_024.jpg)

## [Print Output](#print-output)

1. Move to Debugging Tab
2. Click the “Device” button
3. Select the device connected to the robot
4. Click the Confirm button
5. When the window closes, click the “Start” button

    ![](/assets/images/sw/rplus2/task/roboplus_task2_025.jpg)

6. When robot is connected, the “Program Output Monitor” and “Virtual Remote Controller” fields will be enabled

    ![](/assets/images/sw/rplus2/task/roboplus_task2_026.jpg)
 
7. In the source code, if “Print Screen with Line(or Print Screen)” has been used,

    ![](/assets/images/sw/rplus2/task/roboplus_task2_027.jpg)
 
8. The value will be printed in the Output Monitor as below

    ![](/assets/images/sw/rplus2/task/roboplus_task2_028.jpg)

# [Programming(Edit)](#programming-edit)

This section explains the basic editing functions used in R+ Task 2.0  

## [Insert/Change Instruction](#insertchange-instruction)

1. Click the “Instructions” tab on the right (or double-click the location you wish to insert the instruction)
2. Drag-and-drop an instruction on the location that you want

    ![](/assets/images/sw/rplus2/task/roboplus_task2_029.jpg)
 
3. If you double-click on an instruction block, you can change it to another instruction

    ![](/assets/images/sw/rplus2/task/roboplus_task2_030.jpg)

## [Select Multiple Lines](#select-multiple-lines)

1. You can select multiple lines by dragging the line numbers on the left

    ![](/assets/images/sw/rplus2/task/roboplus_task2_031.jpg)
 
2. If you drag within the line numbers that were already selected, it will partially cancel the selection of those lines

    ![](/assets/images/sw/rplus2/task/roboplus_task2_032.jpg)
 
3. If you click directly on the source code, it will cancel the selection of the lines

    ![](/assets/images/sw/rplus2/task/roboplus_task2_033.jpg)

## [Insert/Delete Line](#insertdelete-line)

1. Select the location where you wish to insert (or delete) a line with the left mouse button
2. Clicking the right mouse button will display the additional menu

    ![](/assets/images/sw/rplus2/task/roboplus_task2_034.jpg)
 
3. If you click “Insert Line” it will insert a new line above the currently selected line (keyboard shortcut : Insert)
4. If you click “Delete Line” it will delete the currently selected line (keyboard shortcut : Delete)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_035.jpg)

## [Enable/Disable Line](#enabledisable-line)

1. Select the line which you wish to enable/disable with the left mouse button
2. Clicking the right mouse button will display the additional menu

    ![](/assets/images/sw/rplus2/task/roboplus_task2_036.jpg)
 
3. If you click “Enable/Disable” it will change the enabled/disabled status of the selected line
(keyboard shortcut : Ctrl+E)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_037.jpg)
 
4. Disabled code will be shown in gray and will be excluded during compilation

    ![](/assets/images/sw/rplus2/task/roboplus_task2_038.jpg)

## [Copy/Cut/Paste](#copycutpaste)

1. Select the line which you wish to copy (or cut) with the left mouse button
2. Clicking the right mouse button will display the additional menu

    ![](/assets/images/sw/rplus2/task/roboplus_task2_039.jpg)
    
3. If you click “Copy” (or “Cut”) it will copy the line to the clipboard
4. You can also use the “Copy” (or “Cut”) buttons from the toolbar on top (keyboard shortcut : Ctrl+C, Ctrl+X)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_040.jpg)
 
5. Select the line which you wish to Paste to with the left mouse button
6. Clicking the right mouse button will display the additional menu

    ![](/assets/images/sw/rplus2/task/roboplus_task2_041.jpg)
 
7. If you click “Paste” it will paste the content that was copied to the clipboard
8. You can also use the “Paste” button from the toolbar on top (keyboard shortcut : Ctrl+V)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_042.jpg)
 
9. The copied code is inserted as in the figure below

    ![](/assets/images/sw/rplus2/task/roboplus_task2_043.jpg)

## [Undo/Redo](#undoredo)

1. While editing the code, if you click the “Undo” function you can restore the code to the previous state
2. You can also use the “Undo” button from the toolbar on top (keyboard shortcut : Ctrl+Z)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_044.jpg)
 
3. If you click the “Redo” button from the toolbar on top, it will rewrite the restored code again (keyboard shortcut : Ctrl+Z)

    ![](/assets/images/sw/rplus2/task/roboplus_task2_045.jpg)

# [Programming(Instructions)](#programming-instructions)

This section explains the instructions used in R+ Task 2.0

![](/assets/images/sw/rplus2/task/roboplus_task2_046.jpg)

## [Start/End](#startend)

This instruction establishes the overall beginning and end of a program, and the valid block for the instruction.
 
![](/assets/images/sw/rplus2/task/roboplus_task2_047.jpg)
 
### Start Program

- The Start Program instruction is executed regardless of the line number.
- There cannot be more than one Start Program instruction in one program.
- There must be an instruction enclosing block mandatorily.
- When program reaches the end of the Start Program instruction, the program will be end.
- It is the same concept as the main() function in C programming language.
 
- The following figure shows a Start Program instruction that is empty inside.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_048.jpg)
 
 
### End Program

- The user can manually set the location where the program will end.
- If End Program is not set manually, then the program will execute every code in the Start Program instruction and then end naturally.
 
- The following displays a "natural end" of a program after executing every code in the Start Program instruction.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_049.jpg)
 
- The following displays a forced end of a program when meeting an End Program instruction.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_050.jpg)
 
### Begin Block / End Block

- A block is an enclosed set of multiple lines of instructions.
- The beginning and end of a block must always go in pairs.
- If the instruction code is only one line then you can omit the block symbols.
- It is the same concept as brackets ‘{‘, ‘}’ in C programming language
 
- The following figure indicates the block for “Start Program” and “Endless Loop”

  ![](/assets/images/sw/rplus2/task/roboplus_task2_051.jpg)
 
- The following figure indicates the block for “Start Program” and “If”

  ![](/assets/images/sw/rplus2/task/roboplus_task2_052.jpg)
 
- As the following figure indicates, if the instruction code is only one line then you can omit the block symbols.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_053.jpg)
 
### Comment

- If an explain is needed to be added, you can add a comment(memo) in the line.
- By inserting the // symbol, you can double-click it to modify the content that follows.
- While you are modifying a comment, you can click the ESC key to restore to the previous state of the comment.
 
- The following is an example of inserting a comment to make the source code easier to understand.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_054.jpg)

## [Execute](#execute)

This is an instruction for giving a command to the device or performing a mathematical calculation.
Refer to the following figure for details.

![](/assets/images/sw/rplus2/task/roboplus_task2_055.jpg)

### Compute

- This instruction computes two values to give one result. (C = A + B)

  ![](/assets/images/sw/rplus2/task/roboplus_task2_056.gif)
 
- You can choose from Add(+), Subtract(-), Multiply(x), And(&), Or(|).

  ![](/assets/images/sw/rplus2/task/roboplus_task2_057.gif)
 
- The following is an example of using the Compute instruction.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_058.gif)
 
### Load

- This instruction substitutes a value with another one.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_059.gif)
 
- This instruction is used when reading/writing a variable’s value.
- The following is an example of writing a value to the variable “speed”, and then reading this variable’s value to apply it to the Geared Motor.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_060.jpg)
 
- This instruction is used when reading/writing a device’s value.
- The following is an example of setting the speed value of a Geared Motor connected to Port number 1.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_061.jpg)
 
### Lable/Jump

- These instructions are used for branching of the program.
- Label determines the location of the branching.
- Using Jump you can execute a predesignated label first.
- It is the same concept as ‘label / goto’ commands in C programming language
 
- The figures below show how the program branches by using Jump
- The figure on the left shows the program jumping to Mode1 and executing only the code from Mode1.
- The figure on the right shows the program jumping to Mode2 and executing only the code from Mode2.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_062.jpg)
 
- Label and Jump must exist inside the same function block.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_063.jpg)

## [Condition](#condition)

This instruction controls the flow of program based on the True/False result of Conditional Clause.

![](/assets/images/sw/rplus2/task/roboplus_task2_064.jpg)

### Conditional Clause?

- A conditional clause gives the result of a computation as either true or false.
 
- Below are the comparison operators that can be used inside the parenthesis().
  - == : check if left and right values are the same
  - != : check if left and right values are not the same
  - &gt; : check if left value is greater than the right value
  - &gt;= : check if left value is greater or equal to the right value
  - &lt; : check if right value is greater than the left value
  - &lt;= : check if right value is greater or equal to the left value

  ![](/assets/images/sw/rplus2/task/roboplus_task2_065.jpg)

- When many conditions must be satisfied, multiple conditional clauses can be used together as below:

  ![](/assets/images/sw/rplus2/task/roboplus_task2_066.jpg)
  
- When using multiple conditional clauses, the following logical operators can be used :
  - then : does not connect any conditional clause. Only uses one conditional clause.
  - && : two conditional clauses are computed with AND operation
  - || : two conditional clauses are computed with OR operation

    ![](/assets/images/sw/rplus2/task/roboplus_task2_067.jpg)
 
### If

- If the result of the conditional clause is true, then it executes the code inside the block.
- It is the same concept as the ‘If’ statement in C programming language.
 
- The following in as example of using If to check whether a variable’s value is 100.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_068.jpg)

- If the code to be executed is only one line, then you can omit the block symbols as below.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_069.jpg)
 
### Else If

- This is used to check another conditional clause following an If statement.
- An If statement must be used prior to Else If statement
- It is the same concept as the ‘Else If’ statement in C programming language.
 
- The following in as example of using If to check whether a variable’s value is 100, and the using Else If to check whether the variable’s value is 50.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_070.jpg)
 
- If the code to be executed is only one line, then you can omit the block symbols as below.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_071.jpg)
 
### Else

- This statement will execute its code block if none of the If or Else If statements were executed.
- An If statement must be used prior to Else statement
- It is the same concept as the ‘Else’ statement in C programming language.
 
- The following in as example of using If to check whether a variable’s value is 100, and if the result is false then running the Else statement that follows.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_072.jpg)
 
- If the code to be executed is only one line, then you can omit the block symbols as below.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_073.jpg)

## [Loop](#loop)

This is an instruction that is used when the program needs to repeat a specific behavior or computation multiple times.  
By setting the repetition block and repetition condition, loop can be applied in a variety of ways. Refer to the following figure for details.
 
![](/assets/images/sw/rplus2/task/roboplus_task2_074.jpg)
 
### Endless Loop

- This statement will repeatedly execute from the beginning to the end of the code block endlessly
- You can come out of the loop by using the “End Loop” command.
- It is the same concept as ‘while(1)’  in C programming language.
 
- The following is an example of using Endless Loop to print the number 100 on the screen. The printing command is within the Endless Loop block so it is repeatedly executed with no end.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_075.jpg)

- If the code to be executed is only one line, then you can omit the block symbols as below.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_076.jpg)
 
### Loop While

- This statement will repeatedly execute from the beginning to the end of the code block as long as the conditional clause is satisfied.
- Just as in Condition instructions, multiple conditional clauses can be used together.
- You can come out of the loop by using the “End Loop” command.
- It is the same concept as ‘while(conditional clause)’ in C programming language.
 
- The following is an example of using Loop While to print the number 100 on the screen for only 1.024 seconds.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_077.jpg)

- The following is an example of using Loop While and a variable to print the number 100 on the screen just 10 times.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_078.jpg)
 
### Loop For

- This statement will execute from the beginning to the end of the code block a specified number of times.
- Every time the program reaches the end of the block, the value of a specified variable will increase by 1.
- You can come out of the loop by using the “End Loop” command.
- Repeat count formula : Repeat count = End value – Starting Value + 1
- It is the same concept as ‘for’ in C programming language.
 
- The following is an example of using Loop For to print the number 100 on the screen 10 times.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_079.jpg)
 
- The following is an example of taking the variable from Loop For and using it within the execution block. As the repeat count increases from 1 to 10, the value printed on the screen changes to 100, 200,300,400,500,600,700,800,900,1000.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_080.jpg)
 
### Wait While

- This statement will stop execution of the program as long as the conditional clause is satisfied.
- It is the same concept as ‘while(conditional clause)’ with an empty code block in C programming language.
 
- The following is an example of using Wait While and a timer to make the program wait for 1.024 seconds.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_081.jpg)
 
- The following is an example of using Wait While to make the program wait until the motion being performed finishes.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_082.jpg)
 
- The following is an example of using Wait While to make the program wait until the melody being played finishes.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_083.jpg)
 
### Break Loop

- This command is used when you wish to break from a loop.
- This command can only be used within Endless Loop, Loop While, and Loop For statement.
- It is the same concept as ‘break’ in C programming language.
 
- The following is an example of using Break Loop when a wireless data arrives in order to break from the loop. When the program breaks from the loop, whichever code that follows is executed.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_084.jpg)

## [Function(Sub-Routine)](#function-sub-routine)

If a specific code is used repeatedly, or if you wish to classify an area of code as a unit that performs a specific behavior, you can group the lines of code as a Function.
Refer to the following figure for details.
 
![](/assets/images/sw/rplus2/task/roboplus_task2_085.jpg)

### Function/Call

- If a specific code is used repeatedly, or if you wish to classify an area of code as a unit that performs a specific behavior, you can group the lines of code as a Function.
- An adequate use of functions will make the code concise and easy to read.
- A function that has been created can be used with “Call” instruction when needed.
- Functions must be written outside of the main program routine.
- In task, functions cannot configure input or output arguments
- It is the same concept as a ‘function’ in C programming language.
 
- The following is an example of making the action of blinking the LED as a function and using it.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_086.jpg)

- The following is the process of selecting a function to call.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_087.jpg)
 
- Functions cannot call itself within the same function.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_088.jpg)
 
### Return

- This is an instruction used for exiting a function while it is being executed.
- It can only be used inside a regular function and callback function.
- It is the same concept as ‘return’ in C programming language.
 
- The following is an example of a function being executed until the end without using Return.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_089.jpg)
 
- The following is an example of a function being executed but encountering Return in the middle of executing the function, which will make the program exit the function.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_090.jpg)
 
### Callback

- This is a function that is executed independently from the main program routine, executing itself periodically
- Callback functions must be written outside of the main program routine.
- Because it is not allowed to write code within a callback that takes too much time to execute, callback has restrictions in the use of Loops / Variables / Parameter Calls / volume of code.
- The following restrictions must be met when using a callback function.
  - Loops, Labels, Jumps, Calls are not allowed
  - Communication with an external device is limited to a maximum of 2 times
  - The code size of callback function cannot exceed 512 bytes
 
- The following is an example of using the callback function to receive wireless data and save it to the variable “received data”.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_091.jpg)


# [Programming(Parameters)](#programming-parameters)

This section explains parameters used in R+ Task 2.0. It classifies the parameters that can be used by each device. Refer to the explanation and example codes of each item for details.

## [Controllers](#controllers)

### Accessory Device [Geared motor]

- This is used to control the geared motor connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the Controller Functionality Comparison for more detail. Controller Functionality Comparison
- **Direction** : CW (Clock Wise), CCW (Counter Clock Wise)
- **Power** : The value ranges from 0 to 1023, where 0 means stop and 1023 is 100% power capacity.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_093.jpg)
 
- The following example is controlling the geared motor.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_094.jpg)
 
- The following example is using the geared motor to move the robot forward.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_095.jpg)
 
### Accessory Device [Servo motor : drive mode, speed, location]

- This is used to control the servo motor connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the Controller Functionality Comparison for more detail. Controller Functionality Comparison
- **Servo motor drive mode** : When the value is True, you can configure the servo motor’s location to situate it at a specific angle. When the value is False, you can configure the servo motor’s speed to rotate it at a specific speed.
- **Servo motor speed** : Configures the speed of the servo motor.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_093.jpg)
 
- **Servo motor location** : Configures the location of the servo motor.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_096.jpg)
 
- The following is an example of controlling the servo motor’s location.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_097.jpg)
 
- The following is an example of rotating the servo motor to control it as a wheel.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_098.jpg)
 
### Accessory Device : LED Module

- This is used to control the LED module connected to the controller.
- Each Controller model has a different set of devices that can be connected to it. Please refer to the Controller Functionality Comparison for more detail. Controller Functionality Comparison
- User can turn on/off the Right LED or Left LED.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_099.jpg)
 
- The following is an example of controlling the LED module.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_100.jpg)
 
### Accessory Devices : Various sensors

- This is used to control the various sensors connected to the controller.
- Each Controller model has a different set of sensors that can be connected to it. Please refer to the Controller Functionality Comparison for more detail. Controller Functionality Comparison
- **Touch sensor** : used to detect whether there is contact with the touch sensor. (Returns True for contact, False for no contact)
- [Touch Sensor Component Information]
- The following is an example of using the touch sensor.

[Touch Sensor Component Information]: /docs/en/parts/sensor/ts-10/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_101.jpg)
 
- **Infrared sensor** : used to measure the distance with an object (The value ranges from 0 to 1023, where the value increases from 0 as the object gets closer.)
- [Infrared Sensor Component Information]
- The following is an example of using the infrared sensor.

[Infrared Sensor Component Information]: /docs/en/parts/sensor/irss-10/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_102.jpg)
 
- **Distance measurement sensor (DMS)** : used to measure the distance with an object
  (The value ranges from 0 to 1023, where the value increases from 0 as the object gets closer.)
- [Distance Measurement Sensor Component Information]
- The following is an example of using the distance measurement sensor.

[Distance Measurement Sensor Component Information]: /docs/en/parts/sensor/dms-80/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_103.jpg)
 
- **Color sensor** : used to detect the color of an object
- The list of colors that the color sensor detects is as follows

  ![](/assets/images/sw/rplus2/task/roboplus_task2_104.jpg)
 
- [Color Sensor Component Information]
- The following is an example of using the color sensor.

[Color Sensor Component Information]: /docs/en/parts/sensor/cs-10/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_105.jpg)

- **Magnetic sensor** : used to detect whether there is a magnetic property for an objest.(Returns True for magnetic property detected, False for no magnetic property detected)
- [Magnetic Sensor Component Information]
- The following is an example of using the magnetic sensor.

[Magnetic Sensor Component Information]: /docs/en/parts/sensor/mgss-10/
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_106.jpg)

- **Temperature sensor** : used to measure the temperature of an object
- [Temperature Sensor Component Information]
- The following is an example of using the temperature sensor.

[Temperature Sensor Component Information]: /docs/en/parts/sensor/tps-10/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_107.jpg)
 
- **Motion detection (Passive infrared) sensor** : used to detect the motion of an object
- [Motion Detecting Sensor Component Information]
- The following is an example of using the motion detection sensor.

[Motion Detecting Sensor Component Information]: /docs/en/parts/sensor/pir-10/

  ![](/assets/images/sw/rplus2/task/roboplus_task2_108.jpg)
 
- **Temperature & humidity (Thermo-hygro) sensor** : used to measure the temperature and humidity of an object. (temperature range : -20~120°C, humidity range : 0~100%)
- The following is an example of using the temperature and humidity sensor.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_109.jpg)
 
- **Illuminance sensor (CDS)** : used to measure the brightness of the surroundings.
  (The value ranges from 0 to 1023, where the value increases from 0 as the surroundings gets brighter.)
- The following is an example of using the illuminance sensor

  ![](/assets/images/sw/rplus2/task/roboplus_task2_110.jpg)
 
- **User device** : used to read the result value of the user-created sensor
- Building a User Device
- The following is an example of using the user device.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_111.jpg)
 
### Motion Control [Motion index number / Motion status / Joint offset / Turn on Joint LED automatically]

- This section describes specific parameters for executing motions downloaded on controller via R+ Motion.
- Only specific controllers support motion control. (Supported controllers : CM-200, CM-5, CM-510, CM-530, CM-700, OpenCM)
- **Motion index number** : You can execute a motion by calling the corresponding Motion index number. If the Motion is being executed, you can read the current Motion index number.
- The following is an example of using the Motion index number.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_112.jpg)

- **Motion status** : returns True if motion is being executed, returns False if motion is not being executed
- The following is an example of using the Motion status to wait until the motion finishes.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_113.jpg)
 
- **Joint offset** : When a motion is executed, it adds a value between -255~255 to every joint. For instance, if the joint offset is -50 and the location values for the motion data have been set to 300 -> 400 -> 500, the location values will be changed to 250 -> 350 -> 450 and then executed.
- The following is an example of applying an offset values to a specific joint.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_114.jpg)
 
- The following is an example of configuring a specific joint to not be affected by the Motion data values.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_115.jpg)
 
- **Turn on joint LED automatically** : used to turn on/off the dynamic cell’s LED while a Motion is being executed. This feature is only supported in OpenCM 9.04
- The following is an example of using the “turn on joint LED automatically” function when executing a Motion.
- The following is an example of executing a Motion that is saved in the Controller.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_116.jpg)
 
- Pressing different buttons on the Remote Controller will execute their corresponding Motions.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_117.jpg)
 
### Built-in Sensor1 [Result of sound counter / Real-time sound counter]

- This is a function that uses the Controller’s embedded mic to detect and count each time a sound that is louder than a certain level occurs. For instance, it can detect and count clapping sounds to make the robot move in a certain way.
- Each Controller model supports different types of sensors. Please refer to each Controller’s manual for more detail. (CM-100A, CM-150, CM-200, CM-5, CM-510, CM-530, CM-700, OpenCM)
- **Result of sound counter** : This counts the total number of times sound was detected. If you want to reset the counter, you can insert 0 manually.
- The following is an example of using the Result of Sound Counter.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_118.jpg)
 
- **Real-time sound counter** : This counts the number of times sound was detected in real-time. If no sound is detected for 0.8 seconds, the counter is reset to 0.
- The following is an example of using the Real-time Sound Counter.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_119.jpg)
 
### Built-in Sensor 2 [Left infrared sensor / Center infrared sensor / Right infrared sensor]

- This is used to read the value of the infrared sensor embedded in the Controller
- The value of the infrared sensor ranges from 0 to 1023, where the value increases from 0 as the object gets closer.
- Each Controller model supports different types of sensors. Please refer to each Controller’s manual for more detail. (CM-100A, CM-150, CM-200, CM-5, CM-510, CM-530, CM-700, OpenCM)
- **Left infrared sensor** : used to read the value of the infrared sensor located at the bottom left side of the Controller
- **Center infrared sensor** : used to read the value of the infrared sensor located at the front and center of the Controller
- **Right infrared sensor** : used to read the value of the infrared sensor located at the bottom right side of the Controller
 
- The following is an example of using the values of the infrared sensors of the Controller.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_120.jpg)
 
### Built-in Sensor 3 [Start button counter / Controller button]

- This is used to read the value of buttons embedded in the Controller.
- Each Controller model supports different types of sensors. Please refer to each Controller’s manual for more detail. (CM-100A, CM-150, CM-200, CM-5, CM-510, CM-530, CM-700, OpenCM)
- **Start button counter** : This is used to read the number of times the Start button was rapidly pressed when the Controller was first turned on. The value of the Start Button Counter ranges from 0 to 255.
- The following is an example of using the Start button counter.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_121.jpg)

- **Controller button** : This is used to read the status of the Controller’s buttons. Each Controller mode has different buttons you can use.
- The following is an example of using buttons for CM-5, CM-510, CM-530.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_122.jpg)
 
- The following is an example of using buttons for OpenCM9.04.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_123.jpg)
 
### Buzzer [Buzzer index / Buzzer timer]

- This is used to play a musical scale or melody using the Buzzer embedded in the Controller.
- The **Buzzer timer** should be configured first and then the type of Buzzer (or **Buzzer index**) configured afterwards for the Buzzer to work properly.
- The following figure shows the screens to select the type of buzzer.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_124.jpg)
 
- The following is an example of playing a musical scale from the Controller. When playing a musical scale, the Buzzer timer can be set between 0~5 seconds.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_125.jpg)

 - The following is an example of playing a melody from the Controller.
When playing a melody, the Buzzer timer should be set as the melody’s run time.  

  ![](/assets/images/sw/rplus2/task/roboplus_task2_126.jpg)
 
### Remote controller [Received wireless data, Wireless data to send / Wireless ID / RC-100 channel]

- These are the parameters that send and receive data with external devices using the wireless communication module (Bluetooth, infrared, ZigBee) connected to the Controller.
- It is generally used when controlling a robot with theRC-100 or smartphone virtual remote controller, but it can also be used to communicate with a user developed software.
- The range of the data value that can be sent and received is restricted from 0 to 65535. (2 bytes)
- **Received wireless data** : used when the Controller receives data from the outside

  ![](/assets/images/sw/rplus2/task/roboplus_task2_127.jpg)

- **Wireless data to send** : used when the Controller sends data to the outside

  ![](/assets/images/sw/rplus2/task/roboplus_task2_128.jpg)
 
- **New wireless data arrived** : when the Controller receives data from the outside, it returns the value True

  ![](/assets/images/sw/rplus2/task/roboplus_task2_129.jpg)
 
- **My robot’s wireless ID (My ID)** : when using ZigBee, it checks my robot’s ZigBee ID

  ![](/assets/images/sw/rplus2/task/roboplus_task2_130.jpg)
 
- **Pairing robot’s wireless ID (Remocon ID)** : when using ZigBee, it sets the pairing robot’s ZigBee ID

  ![](/assets/images/sw/rplus2/task/roboplus_task2_131.jpg)
 
- **RC-100 channel** : when using an infrared receiver, it sets the channel’s value(if the value is 255, it will operate in Bluetooth/ZigBee mode)

  ![](/assets/images/sw/rplus2/task/roboplus_task2_132.jpg)
 
- The following is an example of processing a wireless data received from the Controller

  ![](/assets/images/sw/rplus2/task/roboplus_task2_133.jpg)
 
- The following is an example of the Controller sending data to the outside

  ![](/assets/images/sw/rplus2/task/roboplus_task2_134.jpg)
 
 
### Timer [Timer / Precision (High-resolution) timer / Powersave timer]

- Timer and Precision timer are used to configure the value of a count-down timer on the Controller.
 
- **Timer** : This is used to set the value of a count-down timer on the Controller. The value of the Timer ranges from 0 to 255, and the unit is 0.128 seconds.
- The following is an example of using Timer to wait approximately 1 second (1.024 seconds).

  ![](/assets/images/sw/rplus2/task/roboplus_task2_135.jpg)
 
- **Precision timer** : This has the same function as Timer but counts the time more precisely. The value of the Timer ranges from 0 to 65535, and the unit is 0.001 second.
- The following is an example of using Precision Timer to wait exactly 1 second (1.000 second).

  ![](/assets/images/sw/rplus2/task/roboplus_task2_136.jpg)
 
- **Powersave timer** : This is used for the Controller’s sleep mode function. The value of the Powersave Timer ranges from 0 to 255, and the unit is 1 minute.
- The following is an example of using Powersave Timer to configure sleep mode for the Controller. If a new wireless data arrives within 5 minutes, it resets the Powersave Timer value.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_137.jpg)
 
 
### Miscellaneous [Random number / Built-in LED / Print screen / Print screen with line]

- Random number : This is used to generate a random number between 0 and a maximum value. You can set a number as the maximum value. The range of the maximum value is from 0 to 255
- The following is an example of using Random Number to execute a random motion. This is done by generating a random number between 0 and 15 to execute a corresponding motion.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_138.jpg)
 
- **Built-in LED** : used to control the build-in LED (Aux LED)
- The following is an example of using a built-in LED. It is turning the built-in LED on and off every 0.512 second interval.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_139.jpg)
 
- **Print screen** : used to check a specific value from the task code on the screen
- **Print screen with line** : used to check a specific value from the task code on the screen, and afterwards change lines
- The following is an example of using Print Screen and Print Screen with Line to print the sensors’ values.
 
  ![](/assets/images/sw/rplus2/task/roboplus_task2_140.jpg)
  
  ![](/assets/images/sw/rplus2/task/roboplus_task2_141.jpg)

## [Dynamixel](#dynamixel)

These are the parameters for reading/writing the values of the Dynamixel control table. Please refer to the Dynamixel's Control Table for more detail. Dynamixel
 
### Dynamixel actuator

- **Turn Torque On/Off** : used to turn the Dynamixel Torque on/off
   Torque is turned on when True, Torque is turned off when False.
 
- The following is an example of turning on the Torque of Dynamixel with ID number 1 when the Controller’s button is pressed.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_142.jpg)

- **LED** : used to turn the Dynamixel LED on/off  
   LED is turned on when True, LED is turned off when False.
 
- **CW margin / CCW margin** : used to read/configure the Dynamixel Margin value  
   The range of the value is from 0 to 255, but it is recommended not to change the default value (1).  
   Please refer to the Dynamixel Control Table for more detail.
 
- **CW slope / CCW slope** : used to read/configure the Dynamixel Slope value  
   There are a total of seven phases which the value can be set to, and the representative values of each phase are set as in the table below.  
   Please refer to the Dynamixel Control Table for more detail.
 
|Level|Real Data Value|Representative Data Value|
|:---:|:---:|:---:|
|1|0 (0x00) ~ 3(0x03)|2 (0x02)|
|2|4(0x04) ~ 7(0x07)|4 (0x04)|
|3|8(0x08)~15(0x0F)|8 (0x08)|
|4|16(0x10)~31(0x1F)|16 (0x10)|
|5|32(0x20)~63(0x3F)|32 (0x20)|
|6|64(0x40)~127(0x7F)|64 (0x40)|
|7|128(0x80)~254(0xFE)|128 (0x80)| 
 
- **P gain / I gain/ D gain** : used to read/configure the Dynamixel PID values  
   P gain refers to Proportional Gain, for which the smaller the value is the larger the clearance gets, and the power level decreases near the target location.  
   I gain refers to Integral Gain, and D gain refers to Derivative Gain.
 
- **Target position** : used to read/configure the Dynamixel target position  
   The “motor position value” control can be used to designate the angle position as shown below.

   ![](/assets/images/sw/rplus2/task/roboplus_task2_143.jpg)
 
- Moving speed : used to read/configure the Dynamixel speed  
   The “motor control value” control can be used to designate the rotation direction and power value as shown below.

   ![](/assets/images/sw/rplus2/task/roboplus_task2_144.jpg)
 
- **Torque limit** : used to read/configure the Dynamixel torque limit
- **Current position** : used to read the Dynamixel current position
- **Current speed** : used to read the Dynamixel current speed
- **Current weight** : used to read the Dynamixel current weight
- **Current voltage** : used to read the Dynamixel current voltage
- **Current temperature** : used to read the Dynamixel current temperature
- **Check movement** : used to read the Dynamixel movement status. Returns True for movement, False for no movement.
 
- **Parameters that can be used for DX/RX/AX series** : Turn torque on/off, LED, CW margin / CCW margin, CW slope / CCW slope, Target position, Moving speed, Torque limit, Current position, Current speed, Current weight, Current voltage, Current temperature, Check movement
 
- **Parameters that can be used for MX series** : Turn torque on/off, LED, P gain / I gain / D gain, Target position, Moving speed, Torque limit, Current position, Current speed, Current weight, Current voltage, Current temperature, Check movement
 
- **Parameters that can be used for XL series** : Turn torque on/off, LED, P gain / I gain / D gain, Target position, Moving speed, Torque limit, Current position, Current speed, Current weight, Current voltage, Current temperature, Check movement
   
### Infrared sensor array

- **Infrared sensor value (numbers 1~7)** : used to read the infrared sensor value from the infrared sensor array  
  The measured value can vary depending on the color or texture of the wall or object, and the sensor is optimized for use within 0 to 5 cm.

- **Infrared detection standard value (numbers 1~7)** : used as the standard values for the infrared sensor array to determine whether the color is white or black.
 
||Black detection|LED|
|:----:|:---:|:---:|
|Sensor value <= set value|BIT 1|ON|
|Sensor value > set value| BIT 0|OFF|
 
- **Buzzer index** : used to configure the type of Buzzer for the infrared sensor array
- **Buzzer timer** : used to configure the duration of the Buzzer sound in the case that the infrared sensor array’s Buzzer is used.  
 The Buzzer timer should be configured first and then the type of Buzzer (or Buzzer index) configured afterwards for the Buzzer to work properly.
 
- **Auto configuration of detection standard value** : used to define the beginning and end of auto-searching the detection standard values of the color black Refer to the example below for more detail.

- **Infrared object detection result** : used to read whether an object has been detection in the infrared sensor array

|Binary value|Decimal value|Black detection|
|:---:|:---:|:---:|
|0000001|1|Black detection for IR sensor #1|
|0000010|2|Black detection for IR sensor #2|
|0000100|4|Black detection for IR sensor #3|
|0001000|8|Black detection for IR sensor #4|
|0010000|16|Black detection for IR sensor #5|
|0100000|32|Black detection for IR sensor #6|
|1000000|64|Black detection for IR sensor #7|  
 
Use can check the value while looking at the screen as shown below.

![](/assets/images/sw/rplus2/task/roboplus_task2_145.jpg)
 
### Custom

- User can access the address of an external device such as a Dynamixel directly to perform read/write tasks.
 
- User can read/write by selecting the specified address in units of Byte, Word, or DWord.Write or read in Byte or DWORD variable to write/read on user accessed address
 
- Please refer to the Dynamixel Control Table for more detail.

## [Common](#common)

These are basic variables and constants that can be used in every device.
 
### Variable

- This is a storage space within the program where you can write and read many data.
- Using a variable can be convenient when a number has to be remembered/recorded or when a common value has to be changed in multiple parts at once.
- The following is an example of using variables.  

  ![](/assets/images/sw/rplus2/task/roboplus_task2_146.jpg)
 
### Number (Decimal number)

- This is used when a number has to be input directly within the program.
- It is mainly used in a conditional clause to compare values.
- The value ranges from -2147483648 to 4294967295.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_147.jpg)
 
### True/False

-  This is used when a True/False value has to be input directly within the program.
- It is mainly used in a conditional clause to compare status.
- The value ranges from 0~1. False is 0, and True is 1.

  ![](/assets/images/sw/rplus2/task/roboplus_task2_148.jpg)
 
### Binary number

- This is used when a number has to be input directly within the program.
- It is mainly used when a bit computation is required, and it is express in binary format.
- The value ranges from 0 to 4294967295. (Hex : 00 00 00 00 ~ FF FF FF FF)

  ![](/assets/images/sw/rplus2/task/roboplus_task2_149.jpg)


# [Useful Tips](#useful-tips)

## [Search Variables/Functions](#search-variablesfunctions)

This is a feature to find the location where a variable or function has been used. It provides the option to change the name of each variable or function.
 
1. Click the "Variable (or Function)" button on the right. (There must be at least one variable or function.)
2. Select the target that you wish to find reference in the "Variables list (or Functions list)"
3. You can check the locations at which the selected variable (or function) has been used in the “Reference Results” field

    ![](/assets/images/sw/rplus2/task/roboplus_task2_150.jpg)
 
4. If you select one of the results in the “Reference Results” field, it will take you to the specific location within the source code.
5. If you click the "Rename" button at the top, you can change the name of the variable (or function) for the whole source code.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_151.jpg)

## [Search Keyword](#search-keyword)

This is a function to search for components used in the program code.
 
1. Click the Search button at the bottom right.
2. Type the search word in the search bar that appears on top.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_152.jpg)
 
3. In the task code, the "search result" will be shown as a list below.
4. If you click on an item in the list, it will move to that line.

    ![](/assets/images/sw/rplus2/task/roboplus_task2_153.jpg)

## [Grammar/Compile Check](#grammarcompile-check)

In order to download the task code to the controller, it must go through a grammar check and compile process. If you try to download to the controller or click the "Error" button, it will run the grammar check and compile process automatically.
 
- **Grammar Check** : This is the process of examining whether the instructions used in the task code are compatible instructions with the controller, and whether there are any errors in the grammar.  
  All errors must be corrected before it can move on to the next step.
- **Compilation** : This is the process of converting the code that has finished grammar check into a machine language that the controller can interpret.  
  The number of variables, callback usage, and memory usage are examined during the compilation process.

![](/assets/images/sw/rplus2/task/roboplus_task2_154.jpg)

## [FAQ](#faq)

1. Supported Products?
  > ROBOTIS DREAM  
  > ROBOTIS STEM  
  > ROBOTIS PREMIUM  
  > ROBOTIS GP  
  > ROBOTIS MINI  
  > Robots created by the user using CM-150, CM-200, CM-510, CM-530, CM-700, OpenCM9.04C
 
2. Can TSK files that were used in the previous Task 1.0 also be used on Task 2.0?
  > Yes. However, if you load a previous TSK file into Task 2.0 and save it again, it will be converted to a TSKX format so it will no longer be compatible with Task 1.0.
 
3. The controller will not shut down after downloading a task. What should I do?
  > In R + Task 2.0, when you download a task the task is executed. (For controllers : CM-150, OpenCM9.04, OpenCM7.0…)
 
4. Can I use Bluetooth module in R+ Task 2.0?
  > Support of Bluetooth module is different for each controller, so please refer to the specifications of each Bluetooth module: BT-110, BT-210, BT-410
 
5. The controller does not connect well. What should I do?
  > Restart the controller by turning it off and then on, and try again. If the problem continues, please update the controller's firmware to the latest version. Controller Firmware Update
 
6. I do not want to see the help animation any more. What should I do?
  > Go to Home Tab -> Settings Menu and uncheck the option "Tutorials" and the help animation will not appear anymore.
