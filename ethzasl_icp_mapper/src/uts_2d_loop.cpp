#include "ros/ros.h"
#include "ros/console.h"

#include "pointmatcher/PointMatcher.h"
#include "pointmatcher/Timer.h"
#include "pointmatcher_ros/point_cloud.h"
#include "pointmatcher_ros/transform.h"
#include "nabo/nabo.h"
#include "eigen_conversions/eigen_msg.h"
#include "pointmatcher_ros/get_params_from_server.h"

#include <tf/transform_broadcaster.h>

#include <fstream>

using namespace std;
using namespace PointMatcherSupport;

class loop
{
    typedef PointMatcher<float> PM;
    typedef PM::DataPoints DP;

public:
    loop(ros::NodeHandle &n);
    ~loop();
    ros::NodeHandle& n;

    string loadMapName;
    string loadScanName;
    string icpYamlName;
    string inputFilterName;

    PM::ICPSequence icp;
    PM::DataPointsFilters inputFilters;

    unique_ptr<PM::Transformation> transformation;

    ros::Publisher mapCloudPub;
    ros::Publisher scan1CloudPub;
    ros::Publisher scan2CloudPub;

};

loop::~loop()
{}

loop::loop(ros::NodeHandle& n):
    n(n),
    loadMapName(getParam<string>("loadMapName", ".")),
    loadScanName(getParam<string>("loadScanName", ".")),
    icpYamlName(getParam<string>("icpYamlName", ".")),
    transformation(PM::get().REG(Transformation).create("RigidTransformation")),
    inputFilterName(getParam<string>("inputFilterName", "."))
{
    mapCloudPub = n.advertise<sensor_msgs::PointCloud2>("mapCloud", 2, true);
    scan1CloudPub = n.advertise<sensor_msgs::PointCloud2>("scanCloud_1", 2, true);
    scan2CloudPub = n.advertise<sensor_msgs::PointCloud2>("scanCloud_2", 2, true);

    DP mapCloud;
    DP scanCloud;

    mapCloud = DP::load(loadMapName);
    scanCloud = DP::load(loadScanName);

    ifstream ifs(icpYamlName);
    icp.loadFromYaml(ifs);

    ifstream iffs(inputFilterName);
    inputFilters = PM::DataPointsFilters(iffs);
    inputFilters.apply(mapCloud);
    inputFilters.apply(scanCloud);

    cout<<mapCloud.features.cols()<<endl;
    cout<<scanCloud.features.cols()<<endl;

    PM::TransformationParameters Ticp;
    PM::TransformationParameters Tinit = PM::TransformationParameters::Identity(4, 4);
    icp.setMap(mapCloud);

    // Check dimension
    if (scanCloud.features.rows() != icp.getPrefilteredInternalMap().features.rows())
    {
        ROS_ERROR_STREAM("Dimensionality missmatch: incoming cloud is " << scanCloud.features.rows()-1 << " while map is " << icp.getPrefilteredInternalMap().features.rows()-1);
        return;
    }

    try
    {
        Ticp = icp(scanCloud, Tinit);
    }
    catch (PM::ConvergenceError error)
    {
        ROS_ERROR_STREAM("ICP failed to converge: " << error.what());
        return;
    }

    const double estimatedOverlap = icp.errorMinimizer->getOverlap();
    cout<<"Overlap:  "<<estimatedOverlap<<endl;

    cout<<"Transform: \n"<<Ticp(0,0)<<"         "<<Ticp(0,1)<<"         "
        <<Ticp(0,3)<<"         "<<Ticp(1,0)<<"         "<<Ticp(1,1)<<"         "<<Ticp(1,3)
       <<"          "<<0<<"         "<<0<<"         "<<1<<endl;

    transformation->correctParameters(Ticp);

    DP scanCloud_2 = transformation->compute(scanCloud, Ticp);

    for(int i=0; i<10; i++)
    {
        ros::Duration(0.1).sleep();
        mapCloudPub.publish(PointMatcher_ros::pointMatcherCloudToRosMsg<float>(mapCloud, "global", ros::Time(0)));
        scan1CloudPub.publish(PointMatcher_ros::pointMatcherCloudToRosMsg<float>(scanCloud, "global", ros::Time(0)));
        scan2CloudPub.publish(PointMatcher_ros::pointMatcherCloudToRosMsg<float>(scanCloud_2, "global", ros::Time(0)));
    }

}

int main(int argc, char **argv)
{

    ros::init(argc, argv, "uts_2d_loop");
    ros::NodeHandle n;

    loop loop_(n);

    // ugly code

    return 0;
}
