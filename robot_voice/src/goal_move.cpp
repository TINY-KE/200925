    #include <vector>
#include <string>

#include <ros/ros.h>
#include <tf/tf.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <visualization_msgs/Marker.h>
#include <std_msgs/String.h>

#include <mutex>

using  namespace std;
#include <fstream>
#include <string>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

std::vector<geometry_msgs::PoseStamped> g_goals(5);
std::vector<geometry_msgs::Point> g_marker_points;
ros::Publisher g_goal_marker_pub;
ros::Subscriber goal_sub;

int i = 0;
int ch_num = 0;
    bool ac_online = false;
/*
 * 客厅 livingroom = 1
 * 卧室 bedroom = 2
 * 厨房 kitchen = 3
 * 书房 bookroom = 4
 */
int num_check(string name)
{
    cout<<"number_check:"<<endl;
    int num;
//    if(!(   name.compare("客厅") )) num = 1;
//    else if(!(   name.compare("卧室"))) num = 2;
//    else if(!(   name.compare("厨房"))) num = 3;
//    else if(!(   name.compare("书房"))) num = 3;
    if(!(   name.compare("客厅")*name.compare("livingroom") )) num = 1;
    else if(!(   name.compare("卧室")*name.compare("bedroom") )) num = 2;
    else if(!(   name.compare("厨房")*name.compare("kitchen") )) num = 3;
    else if(!(   name.compare("书房")*name.compare("bookroom") )) num = 3;

    else {cout<<"check fail"<<endl;num = 0;}
    return  num;
}
void ch_num_trans(const std_msgs::String::ConstPtr& goal)
{   string ch = goal->data;
    //cout<<"ch_num_trans:"<<i<<":"<<ch<<endl;i++;
    if(ch.empty())
        cout<<"waiting for goal"<<endl;
    else
        ch_num =  num_check(ch);
    cout<<"ch_num_trans结果:"<<ch_num<<endl;


    MoveBaseClient ac("move_base", true);

    if (ac.waitForServer(ros::Duration(100.0)))
    {
        ROS_INFO("Contacted move_base action server");
        ac_online = true;
    }

    else
        ROS_INFO("Unable to contact move_base action server.");

        {
            move_base_msgs::MoveBaseGoal goal;

            goal.target_pose = g_goals[ch_num];
            goal.target_pose.header.stamp = ros::Time::now();
            goal.target_pose.header.frame_id = "map";

            ROS_INFO("Sending Goal: %d ",ch_num );
            ac.sendGoal(goal);
            ac.waitForResult();

            if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
                ROS_INFO("Goal reached succesfully.");
            else
                ROS_INFO("Reaching the goal has failed.");

        }
}
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
// 0. 从txt中,加载goals,并计算en_num
    std::string goal_file_path = argv[1];
    std::ifstream ifs;
    ifs.open(goal_file_path.c_str());
    if (!ifs)
    {
        std::cout << "Cannot open the file: " << goal_file_path << std::endl;
        return 0;
    }

    std::string line;
    int en_num;
    string en_name;
    while (getline(ifs, line))
    {
        std::istringstream is(line);
        geometry_msgs::PoseStamped goal;
        goal.header.frame_id = "map";

        is >> en_name;
        is >> goal.pose.position.x;
        is >> goal.pose.position.y;
        is >> goal.pose.position.z;
        is >> goal.pose.orientation.x;
        is >> goal.pose.orientation.y;
        is >> goal.pose.orientation.z;
        is >> goal.pose.orientation.w;
        cout<<"en_";
        en_num = num_check(en_name);
        //g_goals.push_back(goal);
        g_goals[en_num] = goal;
        //g_marker_points.push_back(goal.pose.position);
        //将marker的坐标信息发送出去
        //publish_markers();
    }
//1.
        ros::init(argc, argv, "goal_queue");

        //ROS_INFO("Goal Queue Started.");
        int goal_itr = 0;

        ros::NodeHandle n;
        //接收语音goal
        goal_sub = n.subscribe("voiceWords", 10, ch_num_trans);
        //g_goal_marker_pub = n.advertise<visualization_msgs::Marker>("goal_queue_markers", 1);



// 2. 确定发送哪个目标点,并发送


        ros::spin();
        n.shutdown();

        ROS_INFO("Exiting Goal Queue...");

        return 0;
}
