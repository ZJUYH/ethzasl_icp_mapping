#include "ros/ros.h"
#include "ros/console.h"

#include "pointmatcher/PointMatcher.h"
#include "pointmatcher/Timer.h"
#include "pointmatcher_ros/point_cloud.h"
#include "pointmatcher_ros/get_params_from_server.h"
#include "pointmatcher_ros/transform.h"
#include "nabo/nabo.h"
#include "eigen_conversions/eigen_msg.h"

#include "tf/transform_broadcaster.h"
#include "tf_conversions/tf_eigen.h"
#include "tf/transform_listener.h"

#include <fstream>

using namespace std;
using namespace PointMatcherSupport;

class Odometry
{
    typedef PointMatcher<float> PM;
    typedef PM::DataPoints DP;
    typedef PM::Matches Matches;

public:
    Odometry(ros::NodeHandle &n);
    ~Odometry();
    ros::NodeHandle& n;

    ros::Subscriber scanSubscriber;
    ros::Publisher odometryPublisher;

    tf::TransformListener tfListener;
    tf::TransformBroadcaster tfBroadcaster;

    bool firstFrame = true;

    PM::DataPointsFilters inputFilters;

    PM::ICPSequence icp;
    string inputFiltersConfig;
    string icpConfig;
    unique_ptr<PM::Transformation> transformation;

    PM::TransformationParameters Tinit = PM::TransformationParameters::Identity(3, 3);
    PM::TransformationParameters TrobotToGlobal = PM::TransformationParameters::Identity(3, 3);

    void getICP(const sensor_msgs::LaserScan& scanMsgIn);

};

Odometry::Odometry(ros::NodeHandle& n):
    n(n),
    transformation(PM::get().REG(Transformation).create("RigidTransformation")),
    inputFiltersConfig(getParam<string>("inputFiltersConfig", ".")),
    icpConfig(getParam<string>("icpConfig", ".")),
    tfListener(ros::Duration(30))
{
    //initial of icp
    ifstream ifs(icpConfig);
    icp.loadFromYaml(ifs);

    //initial of pointfilters
    ifstream ifss(inputFiltersConfig);
    inputFilters = PM::DataPointsFilters(ifss);

    odometryPublisher = n.advertise<nav_msgs::Odometry>("icp_odom", 50, true);
    scanSubscriber = n.subscribe("/down_laser/scan", 10, &Odometry::getICP, this);
}

Odometry::~Odometry()
{}

void Odometry::getICP(const sensor_msgs::LaserScan& scanMsgIn)
{
    cout<<"-----------------------------------"<<endl;

    DP scancloud = PointMatcher_ros::rosMsgToPointMatcherCloud<float>(scanMsgIn, &tfListener, "/base_laser", false, true, false);


    inputFilters.apply(scancloud);

    // the first frame, just set the reference map
    if(firstFrame)
    {
        icp.setMap(scancloud);
        firstFrame = false;
        return;
    }

    // time record
    double t0 = ros::Time::now().toSec();

    // Apply ICP
    PM::TransformationParameters Ticp;
    Ticp = icp(scancloud, Tinit);

    // bug "Ignore..." fixed, quat!
    Eigen::Matrix3f BaseToMapRotation = Ticp.block(0,0,3,3);
    Eigen::AngleAxisf BaseToMapAxisAngle(BaseToMapRotation);    // RotationMatrix to AxisAngle
    Ticp.block(0,0,3,3) = BaseToMapAxisAngle.toRotationMatrix();

    // Accumulation
    TrobotToGlobal = TrobotToGlobal*Ticp;

    //reset the map and init
    Tinit = Ticp;
    icp.clearMap();
    icp.setMap(scancloud);

    cout<<"Ticp: \n"<<Ticp<<endl;

    //time
    double t1 = ros::Time::now().toSec();
    cout<<"Time cost:  "<<t1-t0<<endl;

    //publish all
    tfBroadcaster.sendTransform(PointMatcher_ros::eigenMatrixToStampedTransform<float>(TrobotToGlobal, "map", "/base_laser", ros::Time::now()));
    odometryPublisher.publish(PointMatcher_ros::eigenMatrixToOdomMsg<float>(Ticp, "/base_laser", ros::Time::now()));


}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "uts_2d_matching");

    ros::NodeHandle n;

    Odometry odometry(n);

    ros::spin();

    return 0;
}
