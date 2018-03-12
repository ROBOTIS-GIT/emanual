Objective for this tutorial is to convert .bpg files written in Behavior Control Program into the Task code (.tsk) for RoboPlus Task.

### Open .bpg File

1. Open .bpg file using Open
  Press Menu ≫ File(F) ≫ Open(O), Shortcut(Ctrl + O), or  Open() to select a file.

2. Open .bpg file using Drag & Drop
  Drag .bpg file to RoboPlus Task.

![Convert_tsk_01][img_055]

### Convert Commands

- Start Program (Click here to see more information on the "Start Program." )

  It is the same as existing "Start".
  `}` (Section End) of Start Program is the same as existing "End".

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_02][img_056]|![Convert_tsk_03][img_057]|

- End Program ( Click here to see more information on the "End Program" )

  It is the same as existing Jump to the Label of "End" Command.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_04][img_058]|![Convert_tsk_05][img_059]|

- `{` (Start Block) / } (End Block) ( Click here to see more information on the "Start/End of Block." )

  Lately added concept-  it is not included in existing Behavior Control Program 1.0.

- `//` (Comment or Memo) ( Click here to see more information. )

  It is the same as existing "Comment."  It does not have any influences on motions.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_06][img_060]|![Convert_tsk_07][img_061]|

- Calculate (Basic Calculation and Bit Calculation) ( Click here to see more information on the "Calculate." )

  It is the same as existing "Compute."

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_08][img_062]|![Convert_tsk_09][img_063]|

- Load (Input Values) ( Click here to see more information on the "Load." )

  It is the same as existing  "LOAD".

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_10][img_064]|![Convert_tsk_11][img_065]|

- Label (The Site for Jump) ( Click here to see more information on the "Label." )

  It is the same as existing "Label". However, it is not possible to be called as in Behavior Control Program 1.0; only Jump is possible.

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_12][img_066]|![Convert_tsk_13][img_067]|

- Jump (goto) ( Click here to see more information on the "Jump." )

  It is the same as existing "JUMP."

|RoboPlus Task|Behavior Control Program 1.0|
|:---:|:---:|
|![Convert_tsk_14][img_068]|![Convert_tsk_15][img_069]|

- (if) / (else if) / (else) ( Click here to see more information on the "if / else if / else." )

  It is the same as existing "(IF) / (ELSE IF) / (ELSE)".

|RoboPlus Task|
|:---:|
|![Convert_tsk_16][img_070]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_17][img_071]|

- In case that (CONT IF) comes after existing (AND), it is changed to &&.
- In case that (CONT IF) comes after existing (OR),  it is changed to \|\|.

|RoboPlus Task|
|:---:|
|![Convert_tsk_18][img_072]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_19][img_073]|

- Endless Loop (while(1)) ( Click here to see more information on the "Endless Loop." )

  It is the same as the code repeating the execution of certain blocks unconditionally using Label and JUMP.

|RoboPlus Task|
|:---:|
|![Convert_tsk_20][img_074]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_21][img_075]|


- Loop While (while(Condition)) ( Click here to see more information on the "Loop While." )
  It is the same as the code repeating the execution of certain blocks using Label and JUMP, depending on conditions.

|RoboPlus Task|
|:---:|
|![Convert_tsk_22][img_076]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_23][img_077]|


- Loop For (for) ( Click here to see more information on the "Loop For." )
  It is the same as the code repeating the execution of certain blocks only designated times using variables.

|RoboPlus Task|
|:---:|
|![Convert_tsk_24][img_078]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_25][img_079]|


- Break Loop (break) ( Click here to see more information on the "Break Loop." )

  It is used equally as the code jumping to the next label of repeated sentences.

|RoboPlus Task|
|:---:|
|![Convert_tsk_26][img_080]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_27][img_081]|

- Wait While (Conditional Repeat without Execution Paragraph) ( Click here to see more information on "Wait While." )

  In case the condition is "True", it is used equally as the code jumping to its own label.

|RoboPlus Task|
|:---:|
|![Convert_tsk_28][img_082]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_29][img_083]|


- Callback Function (callback) ( Click here to see more information on "Callback" function. )

  Lately added concept : it is not included in existing Behavior Control Program 1.0.

- Make/Call Function ( Click here to see more information on "Make/Call Function". )

  The function is the same as the sub-routine composed of existing Label and RETURN.
  In RoboPlus Task, the function must be located outside of the block where is owned by Start Program (the block tied with { AND }).

|RoboPlus Task|
|:---:|
|![Convert_tsk_30][img_084]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_31][img_085]|


- Exit Function (return) ( Click here to see more information on "Exit Function." )

  It is the same as the code performing JUMP to the label of existing RETURN.

|RoboPlus Task|
|:---:|
|![Convert_tsk_32][img_086]|

|Behavior Control Program 1.0|
|:---:|
|![Convert_tsk_33][img_087]|

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/aHIJ5pKkC6Q" frameborder="0" allowfullscreen></iframe>

[img_055]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_01.png
[img_056]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_02.png
[img_057]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_03.png
[img_058]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_04.png
[img_059]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_05.png
[img_060]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_06.png
[img_061]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_07.png
[img_062]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_08.png
[img_063]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_09.png
[img_064]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_10.png
[img_065]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_11.png
[img_066]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_12.png
[img_067]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_13.png
[img_068]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_14.png
[img_069]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_15.png
[img_070]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_16.png
[img_071]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_17.png
[img_072]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_18.png
[img_073]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_19.png
[img_074]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_20.png
[img_075]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_21.png
[img_076]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_22.png
[img_077]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_23.png
[img_078]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_24.png
[img_079]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_25.png
[img_080]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_26.png
[img_081]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_27.png
[img_082]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_28.png
[img_083]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_29.png
[img_084]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_30.png
[img_085]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_31.png
[img_086]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_32.png
[img_087]: /assets/images/edu/bioloid/bioloid_entry_tutorial_convert_tsk_33.png
