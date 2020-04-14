///////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2018, STEREOLABS.
//
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
///////////////////////////////////////////////////////////////////////////


#include <ros/ros.h>
#include <nav_msgs/Odometry.h>

#include <stdio.h>
#include <string.h>
#include <chrono>



class ListenerTalker
{
public:
    ListenerTalker(){
        m_subObjList = m_nh.subscribe("/zed2/zed_node/odom", 1, &ListenerTalker::odometry_callback, this);
    }

    void odometry_callback(const nav_msgs::Odometry& msg) {
        ROS_INFO_STREAM( "Receiving odometry : ");
        ROS_INFO_STREAM( "x position : " << msg.pose.pose.position.x);
        ROS_INFO_STREAM( "y position : " << msg.pose.pose.position.y);
        ROS_INFO_STREAM( "z position : " << msg.pose.pose.position.z << "\n");
    }


private:
    ros::NodeHandle m_nh;  
    ros::Subscriber m_subObjList;           //subscribe to the object detection topic
};

/*
 * Node main function
 */
int main(int argc, char** argv) {
    ros::init(argc, argv, "zed_target_detection_object_detection");
    ROS_INFO_STREAM("Waiting for odometry ...");
    ListenerTalker ListenerTalkerObject;
    ros::spin();

    return 0;
}
