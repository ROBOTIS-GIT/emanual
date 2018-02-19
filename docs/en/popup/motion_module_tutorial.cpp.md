---
layout: popup
---

```
/*******************************************************************************
 * Copyright (c) 2016, ROBOTIS CO., LTD.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of ROBOTIS nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/

#include <stdio.h>
#include "motion_module_tutorial/motion_module_tutorial.h"

using namespace thormang3;

MotionModuleTutorial::MotionModuleTutorial()
  : control_cycle_msec_(8)
{
  enable_       = false;
  module_name_  = "test_motion_module"; // set unique module name
  control_mode_ = robotis_framework::PositionControl;

  result_["r_sho_pitch"] = new robotis_framework::DynamixelState();
  result_["r_sho_roll"] = new robotis_framework::DynamixelState();
  result_["r_el"] = new robotis_framework::DynamixelState();
}

MotionModuleTutorial::~MotionModuleTutorial()
{
  queue_thread_.join();
}

void MotionModuleTutorial::initialize(const int control_cycle_msec, robotis_framework::Robot *robot)
{
  control_cycle_msec_ = control_cycle_msec;
  queue_thread_ = boost::thread(boost::bind(&MotionModuleTutorial::queueThread, this));
}

void MotionModuleTutorial::queueThread()
{
  ros::NodeHandle ros_node;
  ros::CallbackQueue callback_queue;

  ros_node.setCallbackQueue(&callback_queue);

  /* subscriber */
  sub1_ = ros_node.subscribe("/tutorial_topic", 10, &MotionModuleTutorial::topicCallback, this);

  /* publisher */
  pub1_ = ros_node.advertise<std_msgs::Int16>("/tutorial_publish", 1, true);

  ros::WallDuration duration(control_cycle_msec_ / 1000.0);
  while(ros_node.ok())
    callback_queue.callAvailable(duration);
}

void MotionModuleTutorial::topicCallback(const std_msgs::Int16::ConstPtr &msg)
{
  std_msgs::Int16 msg_int16;
  msg_int16.data = msg->data;
  pub1_.publish(msg_int16);
}

void MotionModuleTutorial::process(std::map<std::string, robotis_framework::Dynamixel *> dxls,
                                   std::map<std::string, double> sensors)
{
  if (enable_ == false)
    return;

  for (std::map<std::string, robotis_framework::DynamixelState *>::iterator state_iter = result_.begin(); state_iter != result_.end();
      state_iter++)
  {
    int32_t p_pos = dxls[state_iter->first]->dxl_state_->present_position_;
    int32_t g_pos = dxls[state_iter->first]->dxl_state_->goal_position_;
  }

  // ...

  result_["r_sho_pitch"]->goal_position_ = 0;
  result_["r_sho_roll"]->goal_position_ = 0;
  result_["r_el"]->goal_position_ = 0;
}

void MotionModuleTutorial::stop()
{
  return;
}

bool MotionModuleTutorial::isRunning()
{
  return false;
}
```
