#include <vector>
#include <string>

#include <ros/ros.h>
#include <tf/tf.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <visualization_msgs/Marker.h>

#include <fstream>
#include <string>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

std::vector<geometry_msgs::PoseStamped> g_goals;
std::vector<geometry_msgs::Point> g_marker_points;
ros::Publisher g_goal_marker_pub;

void publish_markers(void)
{
        visualization_msgs::Marker line_strip;
        line_strip.header.frame_id = "map";
        line_strip.header.stamp = ros::Time::now();
        line_strip.action = visualization_msgs::Marker::ADD;
        line_strip.type = visualization_msgs::Marker::LINE_STRIP;
        line_strip.scale.x = 0.1;
        line_strip.color.r = static_cast<float>(rand()) / static_cast<float>(RAND_MAX);
        line_strip.color.g = static_cast<float>(rand()) / static_cast<float>(RAND_MAX);
        line_strip.color.b = static_cast<float>(rand()) / static_cast<float>(RAND_MAX);
        line_strip.color.a = 1.0;
        //以导航包中目标点格式,保存的列表
        line_strip.points = g_marker_points;
        //只保存了各个点的xyz,是用来标记,也就是marker
        line_strip.points.push_back(g_marker_points[0]);
        g_goal_marker_pub.publish(line_strip);
}

int main(int argc, char **argv)
{
        ros::init(argc, argv, "goal_queue");

        ROS_INFO("Goal Queue Started.");
        int goal_itr = 0;
        bool ac_online = false;
        ros::NodeHandle n;
        g_goal_marker_pub = n.advertise<visualization_msgs::Marker>("goal_queue_markers", 1);

        // 加载goals
        std::string goal_file_path = argv[1];
        std::ifstream ifs;
        ifs.open(goal_file_path.c_str());
        if (!ifs)
        {
                std::cout << "Cannot open the file: " << goal_file_path << std::endl;
                return 0;
        }

        std::string line;
        while (getline(ifs, line))
        {
                std::istringstream is(line);
                geometry_msgs::PoseStamped goal;
                goal.header.frame_id = "map";

                is >> goal.pose.position.x;
                is >> goal.pose.position.y;
                is >> goal.pose.position.z;
                is >> goal.pose.orientation.x;
                is >> goal.pose.orientation.y;
                is >> goal.pose.orientation.z;
                is >> goal.pose.orientation.w;

                ROS_INFO_STREAM(goal.pose.position.x);
                ROS_INFO_STREAM(goal.pose.position.y);
                ROS_INFO_STREAM(goal.pose.position.z);
                ROS_INFO_STREAM(goal.pose.orientation.x);
                ROS_INFO_STREAM(goal.pose.orientation.y);
                ROS_INFO_STREAM(goal.pose.orientation.z);
                ROS_INFO_STREAM(goal.pose.orientation.w);

                g_goals.push_back(goal);
                g_marker_points.push_back(goal.pose.position);
                //将marker的坐标信息发送出去
                publish_markers();
        }

        ROS_INFO_STREAM("Goal size is " << g_goals.size());

        MoveBaseClient ac("move_base", true);

        if (ac.waitForServer(ros::Duration(100.0)))
        {
                ROS_INFO("Contacted move_base action server");
                ac_online = true;
        }

        else
                ROS_INFO("Unable to contact move_base action server.");

        ros::Rate r(1);

        while (ros::ok() && ac_online)
        {
                if (g_goals.size() > 0)     //如果g_goals里面有目标点的话,就循环进行
                {
                        move_base_msgs::MoveBaseGoal goal;

                        if (goal_itr >= g_goals.size())
                                goal_itr = 0;

                        goal.target_pose = g_goals[goal_itr];
                        goal.target_pose.header.stamp = ros::Time::now();
                        goal.target_pose.header.frame_id = "map";

                        ROS_INFO("Sending Goal nr: %d / %lu", goal_itr + 1, g_goals.size());
                        ac.sendGoal(goal);
                        ac.waitForResult();

                        if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                                ROS_INFO("Goal reached succesfully.");
                        else
                                ROS_INFO("Reaching the goal has failed.");

                        if (goal_itr++ == g_goals.size())
                                goal_itr = 0;

                        ROS_INFO("Moving to goal nr: %d / %lu", goal_itr + 1, g_goals.size());
                }
                ros::spinOnce();
                r.sleep();
        }

        n.shutdown();
        ROS_INFO("Exiting Goal Queue...");

        return 0;
}
