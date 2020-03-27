---
layout: popup
---

# Standard 机器人实例

|                                    机器人                                     |   示例文件    |
|:-----------------------------------------------------------------------------:|:--------------|
|1. 顺序指令车<br />![Ex_01][img_adv_ex_01]|[下载][adv_ex_1-1] 基础阶段<br />[下载][adv_ex_1-2] 应用阶段<br />[下载][adv_ex_1-3] 实战阶段<br />[下载][adv_ex_1-4] 观看视频<br />`DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式<br />`算法`<br />用控制器按键控制机器人的移动方向.<br />`动作方式`<br />先按顺序输入前进(U)、左转(L)、右转(R)、后退(D)指令，按下执行(START)按键则根据输入顺序移动.|
|2. 甲虫机器人<br />![Ex_02][img_adv_ex_02]|[下载][adv_ex_2-1] 基础阶段<br />[下载][adv_ex_2-2] 应用阶段<br />[下载][adv_ex_2-3] 实战阶段<br />[下载][adv_ex_2-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式<br />`算法`<br />根据对黑线的红外线检测值确定机器人的移动方向.<br />`动作方式`<br />在黑色边界线内部移动，当遇到对方时执行将对方推开的动作.|
|3. 履带机器人<br />![Ex_03][img_adv_ex_03]|[下载][adv_ex_3-1] 基础阶段<br />[下载][adv_ex_3-2] 应用阶段<br />[下载][adv_ex_3-3] 实战阶段<br />[下载][adv_ex_3-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式<br />`算法`<br />根据红外线传感器的检测时间判断障碍物，并确定机器人的移动方向.<br />`动作方式`<br />当遇到较矮的障碍物时直接趟过去，当遇到较高的障碍物时根据红外线传感器的检测结果调整方向，机器人被翻过来也可以正常行驶.|
|4. 寻线跑车<br />![Ex_04][img_adv_ex_04]|[下载][adv_ex_4-1] 基础阶段<br />[下载][adv_ex_4-2] 应用阶段<br />[下载][adv_ex_4-3] 实战阶段<br />[下载][adv_ex_4-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式<br />`算法`<br />当遇到交叉的黑线时，按指定方向确定机器人的移动方向.<br />`动作方式`<br />根据红外线传感器组检测到的黑线部分，决定机器人前进、左转或右转，并在执行任务的同时按指定路径行驶.|
|5. 电子琴<br />![Ex_05][img_adv_ex_05]|[下载][adv_ex_5-1] 基础阶段<br />[下载][adv_ex_5-2] 应用阶段<br />[下载][adv_ex_5-3] 实战阶段<br />[下载][adv_ex_5-4] 观看视频<br />`算法`<br />根据红外线传感器组检测到的位置播放不同音阶.<br />`动作方式`<br />可以根据红外线传感器组和控制器按键输出3阶八度音，还能演奏乐曲、录音和反复播放.|
|6. 二轮摩托车<br />![Ex_06][img_adv_ex_06]|[下载][adv_ex_6-1] 基础阶段<br />[下载][adv_ex_6-2] 应用阶段<br />[下载][adv_ex_6-3] 实战阶段<br />[下载][adv_ex_6-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1]: 车轮模式, AX-12W ID[2]: 关节模式<br />`算法`<br />机器人沿着黑线前进，并在检测到障碍物时执行避开的动作.<br />`动作方式`<br />利用两侧的红外线传感器和转向装置沿着黑线移动，当检测到障碍物时避开障碍物并继续行驶.|
|7. 自动壁障车<br />![Ex_07][img_adv_ex_07]|[下载][adv_ex_7-1] 基础阶段<br />[下载][adv_ex_7-2] 应用阶段<br />[下载][adv_ex_7-3] 实战阶段<br />[下载][adv_ex_7-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式<br />`算法`<br />利用机器人右侧的红外线传感器，与墙壁保持着一定距离在迷宫内移动.<br />`动作方式`<br />机器人利用左侧、右侧和前方的红外线传感器决定向左或右移动，并在迷宫中完成各种任务，最终顺利从迷宫中走出来.|


# Expansion 机器人实例

|                                    机器人                                     |   示例文件    |
|:-----------------------------------------------------------------------------:|:--------------|
|8. 画图机器人<br />![Ex_08][img_adv_ex_08]|[下载][adv_ex_8-1] 基础阶段<br />[下载][adv_ex_8-2] 应用阶段<br />[下载][adv_ex_8-3] 实战阶段<br />[下载][adv_ex_8-4] 观看视频<br />`DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1]: 车轮模式, AX-12A ID[3, 4]: 车轮模式<br />`算法`<br />根据被按下的控制器按键控制机器人.<br />`动作方式`<br />给机器人装上一个能画画的笔，并将机器人放在纸上。按下控制器按键后画出‘A’或‘R’.|
|9. 寻线搬运车<br />![Ex_09][img_adv_ex_09]|[下载][adv_ex_9-1] 基础阶段<br />[下载][adv_ex_9-2] 应用阶段<br />[下载][adv_ex_9-3] 实战阶段<br />[下载][adv_ex_9-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式, AX-12A ID[3 ~ 5]: 关节模式<br />`算法`<br />根据之前下载的程序使机器人按指定路径移动并完成任务.<br />`动作方式`<br />这个机器人可以将2种障碍物移动到指定位置，它从START位置出发，按指定路径移动到FINISH位置的动作.|
|10. 探测搬运车<br />![Ex_10][img_adv_ex_10]|[下载][adv_ex_10-1] 基础阶段<br />[下载][adv_ex_10-2] 应用阶段<br />[下载][adv_ex_10-3] 实战阶段<br />[下载][adv_ex_10-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式, AX-12A ID[3, 4]: 关节模式<br />`算法`<br />使机器人在移动过程中检测障碍物并将其移动到指定位置.<br />`动作方式`<br />这是能够检测箱子上的物体并将其移动的机器人，它通过使用红外线传感器执行将物体移动到指定位置的动作.|
|11. 蜣螂机器人<br />![Ex_11][img_adv_ex_11]|[下载][adv_ex_11-1] 基础阶段<br />[下载][adv_ex_11-2] 应用阶段<br />[下载][adv_ex_11-3] 实战阶段<br />[下载][adv_ex_11-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式, AX-12A ID[3 ~ 5]: 关节模式<br />`算法`<br />根据收到的遥控器按键信号控制夹子和机器人的运动<br />`动作方式`<br />使用遥控器控制机器人可以前进、左转、右转、后退、原地左转、原地右转，还可以控制夹子执行打开、关闭、举起和放下的动作.|
|12. 机械手臂<br />![Ex_12][img_adv_ex_12]|[下载][adv_ex_12-1] 基础阶段<br />[下载][adv_ex_12-2] 应用阶段<br />[下载][adv_ex_12-3] 实战阶段<br />[下载][adv_ex_12-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12A ID[3 ~ 6]: 关节模式<br />`算法`<br />机器人根据红外线传感器检测杯子，根据杯子大小分别将杯子移动至指定位置.<br />`动作方式`<br />这个机器人可以将两个小杯和两个大杯移动到指定位置。可以与杯子大小顺序无关地摆放到正确位置.|
|13. 双足机器人<br />![Ex_13][img_adv_ex_13]|[下载][adv_ex_13-1] 基础阶段<br />[下载][adv_ex_13-2] 应用阶段<br />[下载][adv_ex_13-3] 实战阶段<br />[下载][adv_ex_13-4] 用于演示的Motion文件<br />[下载][adv_ex_13-5] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12A ID[3 ~ 6]: 关节模式<br />`算法`<br />机器人用红外线传感器检测障碍物的位置并避开.<br />`动作方式`<br />执行以下动作：当在左侧检测到障碍物时向右移动、在右侧检测到时向左移动、在前方检测到时根据其距离决定后退或左转.|
|14. 天牛机器人<br />![Ex_14][img_adv_ex_14]|[下载][adv_ex_14-1] 基础阶段<br />[下载][adv_ex_14-2] 应用阶段<br />[下载][adv_ex_14-3] 实战阶段<br />[下载][adv_ex_14-4] 用于演示的Motion文件<br />[下载][adv_ex_14-5] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12A ID[3 ~ 5]: 关节模式<br />`算法`<br />机器人用红外线传感器检测障碍物的位置并避开.<br />`动作方式`<br />执行以下动作：当在左侧检测到障碍物时向右移动、在右侧检测到时向左移动、当在上方检测到手时快速移动.|
|15. 企鹅机器人<br />![Ex_15][img_adv_ex_15]|[下载][adv_ex_15-1] 基础阶段<br />[下载][adv_ex_15-2] 应用阶段<br />[下载][adv_ex_15-3] 实战阶段<br />[下载][adv_ex_15-4] 用于演示的Motion文件<br />[下载][adv_ex_15-5] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 关节模式, AX-12A ID[3 ~ 6]: 关节模式<br />`算法`<br />机器人将输入的动作指令记住后按顺序执行.<br />`动作方式`<br />将任意输入的举左手、举右手、敬礼和鼓掌动作按顺序记住，并可以重复执行这些动作.|
|16. 射球机器人<br />![Ex_16][img_adv_ex_16]|[下载][adv_ex_16-1] 基础阶段<br />[下载][adv_ex_16-2] 应用阶段<br />[下载][adv_ex_16-3] 实战阶段<br />[下载][adv_ex_16-4] 观看视频<br /> `DYNAMIXEL 舵机工作模式`<br />AX-12W ID[1, 2]: 车轮模式, AX-12A ID[3 ~ 6]: 关节模式<br />`算法`<br />根据收到的遥控器按键信号控制夹子和机器人的运动.<br />`动作方式`<br />使用遥控器令机器人前进、左转、右转、后退、原地左转、原地右转，还可以控制夹子执行打开、关闭、举起、放下以及发射的动作.|

[img_adv_ex_01]: /assets/images/edu/bioloid/stem_sequenceracer.jpg
[img_adv_ex_02]: /assets/images/edu/bioloid/stem_bugfighter.jpg
[img_adv_ex_03]: /assets/images/edu/bioloid/stem_tumbler.jpg
[img_adv_ex_04]: /assets/images/edu/bioloid/stem_linefollower.jpg
[img_adv_ex_05]: /assets/images/edu/bioloid/stem_digitalpiano.jpg
[img_adv_ex_06]: /assets/images/edu/bioloid/stem_motorcycle.jpg
[img_adv_ex_07]: /assets/images/edu/bioloid/stem_avoider.jpg
[img_adv_ex_08]: /assets/images/edu/bioloid/stem_scribbler.jpg
[img_adv_ex_09]: /assets/images/edu/bioloid/stem_transporter.jpg
[img_adv_ex_10]: /assets/images/edu/bioloid/stem_probecar.jpg
[img_adv_ex_11]: /assets/images/edu/bioloid/stem_beetlegripper.jpg
[img_adv_ex_12]: /assets/images/edu/bioloid/stem_robotarm.jpg
[img_adv_ex_13]: /assets/images/edu/bioloid/stem_walkingdroid.jpg
[img_adv_ex_14]: /assets/images/edu/bioloid/stem_hexapod.jpg
[img_adv_ex_15]: /assets/images/edu/bioloid/stem_greetingpenguin.jpg
[img_adv_ex_16]: /assets/images/edu/bioloid/stem_cannonshooter.jpg

[adv_ex_1-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/1.bio_stem_sequenceracer1_cn_20130121.tsk
[adv_ex_1-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/1.bio_stem_sequenceracer2_cn_20130121.tsk
[adv_ex_1-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/1.bio_stem_sequenceracer3_cn_20130121.tsk
[adv_ex_1-4]: https://www.dropbox.com/s/oyfw0kb58iz9kri/BIO_STEM_SequenceRacer.wmv?dl=0
[adv_ex_2-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/2.bio_stem_bugfighter1_cn_20130121.tsk
[adv_ex_2-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/2.bio_stem_bugfighter2_cn_20130121.tsk
[adv_ex_2-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/2.bio_stem_bugfighter3_cn_20130121.tsk
[adv_ex_2-4]: https://www.dropbox.com/s/yzdrrbtcc2aeh29/BIO_STEM_BugFighter.wmv?dl=0
[adv_ex_3-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/3.bio_stem_tumbler1_cn_20130121.tsk
[adv_ex_3-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/3.bio_stem_tumbler2_cn_20130121.tsk
[adv_ex_3-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/3.bio_stem_tumbler3_cn_20130121.tsk
[adv_ex_3-4]: https://www.dropbox.com/s/5z7ksfr5q1zh6cz/BIO_STEM_Tumbler.wmv?dl=0
[adv_ex_4-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/4.bio_stem_linefollower1_cn_20130121.tsk
[adv_ex_4-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/4.bio_stem_linefollower2_cn_20130121.tsk
[adv_ex_4-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/4.bio_stem_linefollower3_cn_20130121.tsk
[adv_ex_4-4]: https://www.dropbox.com/s/2uepyqreod2pijq/BIO_STEM_LineFollower.wmv?dl=0
[adv_ex_5-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/5.bio_stem_digitalpiano1_cn_20130121.tsk
[adv_ex_5-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/5.bio_stem_digitalpiano2_cn_20130121.tsk
[adv_ex_5-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/5.bio_stem_digitalpiano3_cn_20130121.tsk
[adv_ex_5-4]: https://www.dropbox.com/s/kb5bdbo5g4d7q94/BIO_STEM_DigitalPiano.wmv?dl=0
[adv_ex_6-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/6.bio_stem_motorcycle1_cn_20130121.tsk
[adv_ex_6-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/6.bio_stem_motorcycle2_cn_20130121.tsk
[adv_ex_6-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/6.bio_stem_motorcycle3_cn_20130121.tsk
[adv_ex_6-4]: https://www.dropbox.com/s/82qihref1vnd1dm/BIO_STEM_MotorCycle.wmv?dl=0
[adv_ex_7-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/7.bio_stem_avoider1_cn_20130121.tsk
[adv_ex_7-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/7.bio_stem_avoider2_cn_20130121.tsk
[adv_ex_7-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/7.bio_stem_avoider3_cn_20130121.tsk
[adv_ex_7-4]: https://www.dropbox.com/s/f0lysly1n7hwwob/BIO_STEM_Avoider.wmv?dl=0
[adv_ex_8-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/8.bio_stem_scribbler1_cn_20130219.tsk
[adv_ex_8-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/8.bio_stem_scribbler2_cn_20130219.tsk
[adv_ex_8-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/8.bio_stem_scribbler3_cn_20130219.tsk
[adv_ex_8-4]: https://www.dropbox.com/s/5zsfnjfate8qvek/BIOLOID_STEM_8.Scribbler.wmv?dl=0
[adv_ex_9-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/9.bio_stem_transporter1_cn_20130219.tsk
[adv_ex_9-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/9.bio_stem_transporter2_cn_20130219.tsk
[adv_ex_9-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/9.bio_stem_transporter3_cn_20130219.tsk
[adv_ex_9-4]: https://www.dropbox.com/s/mxzsnhkqcdx7y7i/BIOLOID_STEM_9.Transporter.wmv?dl=0
[adv_ex_10-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/10.bio_stem_probecar1_cn_20130219.tsk
[adv_ex_10-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/10.bio_stem_probecar2_cn_20130219.tsk
[adv_ex_10-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/10.bio_stem_probecar3_cn_20130219.tsk
[adv_ex_10-4]: https://www.dropbox.com/s/8qze3dox68ps2dg/BIOLOID_STEM_10.ProbeCar.wmv?dl=0
[adv_ex_11-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/11.bio_stem_beetlegripper1_cn_20130122.tsk
[adv_ex_11-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/11.bio_stem_beetlegripper2_cn_20130122.tsk
[adv_ex_11-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/11.bio_stem_beetlegripper3_cn_20130122.tsk
[adv_ex_11-4]: https://www.dropbox.com/s/wid2tkdt66cvzhw/BIOLOID_STEM_11.BeetleGripper.wmv?dl=0
[adv_ex_12-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/12.bio_stem_robotarm1_cn_20130122.tsk
[adv_ex_12-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/12.bio_stem_robotarm2_cn_20130122.tsk
[adv_ex_12-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/12.bio_stem_robotarm3_cn_20130122.tsk
[adv_ex_12-4]: https://www.dropbox.com/s/51px3ueunn2qnzw/BIOLOID_STEM_12.RobotArm.wmv?dl=0
[adv_ex_13-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/13.bio_stem_walking_droid1_cn_20130122.tsk
[adv_ex_13-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/13.bio_stem_walking_droid2_cn_20130122.tsk
[adv_ex_13-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/13.bio_stem_walking_droid3_cn_20130122.tsk
[adv_ex_13-4]: http://support.robotis.com/cn/baggage_files/bioloid/stem/13.bio_stem_walking_droid_cn_20130122.mtn
[adv_ex_13-5]: https://www.dropbox.com/s/eviwej7oac04zxx/BIOLOID_STEM_13.WalkingDroid.wmv?dl=0
[adv_ex_14-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/14.bio_stem_hexapod1_cn_20130122.tsk
[adv_ex_14-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/14.bio_stem_hexapod2_cn_20130122.tsk
[adv_ex_14-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/14.bio_stem_hexapod3_cn_20130122.tsk
[adv_ex_14-4]: http://support.robotis.com/cn/baggage_files/bioloid/stem/14.bio_stem_hexapod_cn_20130122.mtn
[adv_ex_14-5]: https://www.dropbox.com/s/ijs1gdqaywmzao6/BIOLOID_STEM_14.Hexapod.wmv?dl=0
[adv_ex_15-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin1_cn_20130122.tsk
[adv_ex_15-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin2_cn_20130122.tsk
[adv_ex_15-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin3_cn_20130122.tsk
[adv_ex_15-4]: http://support.robotis.com/cn/baggage_files/bioloid/stem/15.bio_stem_greetingpenguin_cn_20130122.mtn
[adv_ex_15-5]: https://www.dropbox.com/s/r0krjfoalzb6fi2/BIOLOID_STEM_15.GreetingPenguin.wmv?dl=0
[adv_ex_16-1]: http://support.robotis.com/cn/baggage_files/bioloid/stem/16.bio_stem_cannonshooter1_cn_20130122.tsk
[adv_ex_16-2]: http://support.robotis.com/cn/baggage_files/bioloid/stem/16.bio_stem_cannonshooter2_cn_20130122.tsk
[adv_ex_16-3]: http://support.robotis.com/cn/baggage_files/bioloid/stem/16.bio_stem_cannonshooter3_cn_20130122.tsk
[adv_ex_16-4]: https://www.dropbox.com/s/ki6c9vb3acyjmni/BIOLOID_STEM_16.CannonShooter.wmv?dl=0
