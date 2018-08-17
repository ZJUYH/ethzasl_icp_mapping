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
#include <tf/tf.h>

using namespace std;
using namespace PointMatcherSupport;

class alignment
{
    typedef PointMatcher<float> PM;
    typedef PM::DataPoints DP;

public:
    alignment(ros::NodeHandle &n);
    ~alignment();
    ros::NodeHandle& n;

    string mapFilterName;
    string laserFilterName;

    string poseFileName;
    string scanDirName;
    string saveVTKname;
    string savePLYname;

    unique_ptr<PM::Transformation> transformation;
    PM::TransformationParameters Trobot;

    DP mapCloud;

    PM::DataPointsFilters mapFilter;
    PM::DataPointsFilters laserFilter;

    void process(int index);

    vector<vector<double>> initPoses;

    ros::Publisher mapPublisher;

};

alignment::~alignment()
{}

alignment::alignment(ros::NodeHandle& n):
    n(n),
    mapFilterName(getParam<string>("mapFilterName", ".")),
    laserFilterName(getParam<string>("laserFilterName", ".")),
    poseFileName(getParam<string>("poseFileName", ".")),
    scanDirName(getParam<string>("scanDirName", ".")),
    saveVTKname(getParam<string>("saveVTKname", ".")),
    savePLYname(getParam<string>("savePLYname", ".")),
    transformation(PM::get().REG(Transformation).create("RigidTransformation"))
{
    mapPublisher = n.advertise<sensor_msgs::PointCloud2>("map_cloud", 2, true);

    ifstream mapFilterss(mapFilterName);
    mapFilter = PM::DataPointsFilters(mapFilterss);

    ifstream laserFilterss(laserFilterName);
    laserFilter = PM::DataPointsFilters(laserFilterss);

    // read initial transformation
    int x, y;
    double temp;
    vector<double> test;
    ifstream in(poseFileName);
    if (!in) {
        cout << "Cannot open file.\n";
    }
    for (y = 0; y < 9999999; y++) {
        test.clear();
    for (x = 0; x < 16; x++) {
      in >> temp;
      test.push_back(temp);
    }
      initPoses.push_back(test);
    }
    in.close();


    int index = 0;
    for(; index < 913; index++)
    {
        this->process(index);
    }

    mapCloud.save(saveVTKname);
    mapCloud.save(savePLYname);
}

void alignment::process(int index)
{
    cout<<index<<endl;
    string scanName = scanDirName + to_string(index) + ".vtk";
    DP scanCloud = DP::load(scanName);

    laserFilter.apply(scanCloud);

    Trobot = PM::TransformationParameters::Identity(4, 4);

    Trobot = PM::TransformationParameters::Identity(4, 4);
    Trobot(0,0)=initPoses[index][0];Trobot(0,1)=initPoses[index][1];Trobot(0,2)=initPoses[index][2];Trobot(0,3)=initPoses[index][3];
    Trobot(1,0)=initPoses[index][4];Trobot(1,1)=initPoses[index][5];Trobot(1,2)=initPoses[index][6];Trobot(1,3)=initPoses[index][7];
    Trobot(2,0)=initPoses[index][8];Trobot(2,1)=initPoses[index][9];Trobot(2,2)=initPoses[index][10];Trobot(2,3)=initPoses[index][11];
    Trobot(3,0)=initPoses[index][12];Trobot(3,1)=initPoses[index][13];Trobot(3,2)=initPoses[index][14];Trobot(3,3)=initPoses[index][15];

    transformation->correctParameters(Trobot);

    DP scanCloud_ = transformation->compute(scanCloud, Trobot);

    if(index == 0)
        mapCloud = scanCloud_;
    else
    {
        mapCloud.concatenate(scanCloud_);
    }

    mapPublisher.publish(PointMatcher_ros::pointMatcherCloudToRosMsg<float>(mapCloud, "global", ros::Time(0)));
}

int main(int argc, char **argv)
{

    ros::init(argc, argv, "uts_2d_alignment");
    ros::NodeHandle n;

    alignment alignment_(n);

    // ugly code

    return 0;
}
