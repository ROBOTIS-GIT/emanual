Objective for this tutorial is to print 1 and 2 on the output screen as below.

![Screen-Output-1][img_011]

### Write Task Code

1. Execute RoboPlus Task Program.

    As seen in the picture below, go to `Start > All Programs > ROBOTIS > RoboPlus > Software > RoboPlus Task` to execute RoboPlus Task.

    ![Screen-Output-2][img_012]

   - RoboPlus Task Initial Screen

    ![Screen-Output-3][img_013]

2. Select a Controller.

    Double click an empty line or press `Enter`, In the `Select Control` window, select the controller to use, then press the `OK` button.

    ![Screen-Output-4][img_014]

3. Generating `Start Program`.

    Select `Start Program` from the `Select Instruction Type` window, `Start Program` will be automatically generated in RoboPlus Task.

    ![Screen-Output-5][img_015]

4. Input `Endless Loop` command

    To print the numbers on the screen endlessly, use the `Endless Loop` command(Create a command line).
    Double click or press `Enter` on an empty line between `{` and `}` of Start Program to invoke the `Select Instruction Type` window. Select `Loop > Endless Loop(while(1))` from the list.

    ![Screen-Output-6][img_016]

5. Input `Load` command

    Use `Load` command to input a `Print` command, which is needed to print numbers on the screen.
    Insert `Execute > Load (Assignment value)` into an empty line between `{` and `}` of `Endless Loop`.

    ![Screen-Output-7][img_017]

6. Load `1` into `Print`

    Choose the left parameter ( ? ) among the `Load` parameters(Explanation on the parameter).
    The left parameter receives input from the right parameter.
    Double click the left parameter ( ? ), or press `Enter` key after clicking it once to invoke the `Select Parameter Window`.
    Select `Controller > Print` then press `OK`.

    ![Screen-Output-8][img_018]

    Select `Constant Numbers > Number > 1` for the right parameter ( ? ) in the same way.

    ![Screen-Output-9][img_019]

    When both parameters of the `Load` command have been set, it should look like below.

    ![Screen-Output-10][img_020]

7. Load `2` into `Print with Line`

    Select `}` under `Print` command (at the end of the endless loop section), and add new lines by pressing the `Space` key. Repeat Steps 5 and 6 to input the `Load` command and to input  `Controller > Print with Line` and `2`. The final task code is shown below.

    ![Screen-Output-11][img_021]

8. Save Task Code

    Press Ctrl + S or the Save icon.

    ![Screen-Output-12][img_022]

### Download Task Code

Download the task code created above.([How to Download Task Code])

### Execute Task Code

1. Open the Program Output Monitor

    To see the output of the program, **you must open the Program Output Monitor BEFORE executing the program**.
    There are three ways to open the Program Output Monitor.

    - Click on the View Print of Program in the Download Program window

      ![Screen-Output-13][img_023]

    - Click on the `View Print of Program` button in TOOLS.
    - Press `F5` or click on View Print of Program (V)  menu under Program (P).

2. Executing the Program

    When you turn on the controller, the LED will blink, showing it is in standby mode.
    Press the MODE button to move it to PLAY, then press START to execute the downloaded task code.
    You should see "1" and "2" being printed on the Program Output Monitor.

    ![Screen-Output-1][img_011]

[How to Download Task Code]: /docs/en/faq/download_task_code/
[img_011]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_01.png
[img_012]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_02.png
[img_013]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_03.png
[img_014]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_04.png
[img_015]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_05.png
[img_016]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_06.png
[img_017]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_07.png
[img_018]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_08.png
[img_019]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_09.png
[img_020]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_10.png
[img_021]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_11.png
[img_022]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_12.png
[img_023]: /assets/images/edu/bioloid/bioloid_entry_tutorial_printscr_13.png
