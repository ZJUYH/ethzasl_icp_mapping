:books:

### Instructions of 2D mapping using libpointmatcher

This `readme.md` introduce my work in UTS, August 2018. Any questions contact [YH](zjuyinhuan@gmail.com) from Zhejiang University.

#### 1. Prepare

First install basic libs, follow the instructions in [libpointmatcher](https://github.com/ethz-asl/libpointmatcher).

Then download or clone [ethz_icp_mapping](https://github.com/ZJUYH/ethzasl_icp_mapping) in my GitHub.

Compile the downloaded code, and get your 2D rosbag. 

Actaully not all the code is needed. I only add some files in [2D_scans](https://github.com/ZJUYH/ethzasl_icp_mapping/tree/master/ethzasl_icp_mapper/launch/2D_scans) and fix something in [libpointmatcher_ros](https://github.com/ZJUYH/ethzasl_icp_mapping/tree/master/libpointmatcher_ros). If you are interested in orther .cpp or .launch, make your own demo.

#### 2. Get relative poses

* Run [uts_2d_mapping.launch](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/uts_2d_mapping.launch) use `roslaunch ethzasl_icp_mapper uts_2d_mapping.launch`.

* Run `rosbag play --clock -r 0.1 your.bag`, which slow down your rosbag for mapping.

* Then generate relative poses and raw scans.

* The global poses are saved in `savePoseFileName` and scans in `saveScanDirName`, and `saveFreq` is the frequency of your saving ( 1/20 e.g.)

* The saved poses are `2+9 column/per row`. The `9` values are the extention of 3*3 transformation matrix by row. The `2` are relations from this pose to the previous (no use in global).

* From global to relative: just use [globalToRelative](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/globalToRelative.m). Save the matlab matrix by yourself.

* Tips: the variants in launch files are easy to understand.

#### 3. Artificial loop closing

#### 4. Liang's optimization

#### 5. Mapping by alignment
