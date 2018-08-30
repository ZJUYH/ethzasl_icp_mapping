:books:

### Instructions of 2D mapping using libpointmatcher

This `readme.md` introduce my work in UTS, August 2018. Any questions contact `zjuyinhuan@gmail.com` from Zhejiang University. Thanks to `libpointmatcher`.

#### 1. Prepare

First install basic libs, follow the instructions in [libpointmatcher](https://github.com/ethz-asl/libpointmatcher).

Then download or clone [ethz_icp_mapping](https://github.com/ZJUYH/ethzasl_icp_mapping) in my GitHub.

Compile the downloaded code, and get your 2D rosbag. 

Actaully not all the code is needed. I only add some files in [2D_scans](https://github.com/ZJUYH/ethzasl_icp_mapping/tree/master/ethzasl_icp_mapper/launch/2D_scans) and fix something in [libpointmatcher_ros](https://github.com/ZJUYH/ethzasl_icp_mapping/tree/master/libpointmatcher_ros). If you are interested in orther .cpp or .launch, make your own demo.

#### 2. Get relative poses

* Run [uts_2d_mapping.launch](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/uts_2d_mapping.launch) using `roslaunch ethzasl_icp_mapper uts_2d_mapping.launch`.

* Run `rosbag play --clock -r 0.1 your.bag`, which slow down your rosbag for mapping.

* Then generate relative poses and raw scans.

* The global poses are saved in `savePoseFileName` and scans in `saveScanDirName`, and `saveFreq` is the frequency of your saving ( 1/20 e.g.). `saveMapName` is where your map saved. Note that when you stop the running program in terminal to exit, please wait a few seconds for saving process. :hourglass:

* The saved poses are `2+9 column/per row` in `global.txt`. The `9` values are the extention of 3*3 transformation matrix by row. The `2` are relations from this pose to the previous (no use in global).

* From `global.txt` to `relative.txt`: just use [globalToRelative.m](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/globalToRelative.m). Save the matlab matrix by yourself.

* Tips: the variants in launch files are easy to understand.

#### 3. Artificial loop closing

* For any optimization in SLAM, you need more relations between poses.

* Run [uts_2d_loop](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/uts_2d_loop.launch) using `roslaunch ethzasl_icp_mapper uts_2d_loop.launch`.

* In this launch file, `loadMapName` is the reference cloud (1 in `2`), and `loadScanName` is the input cloud (2 in `2`). The trasformation of loop (`9`) is listed in your terminal.

* Add the realtions and copy the trans-result in the `relative.txt` by yourself.

* Tips: in ICP, I use Plane-to-Plane and remove the noisy points around the robot for precise registration.

#### 4. Liang's optimization

* Give the `relative.txt` to Liang. He will return the optimized results withour loops, just relative poses. 

#### 5. Mapping by alignment

* Transform the `relative.txt` to new `global.txt`, use `new_global_after_optimized.m`.

* Run [uts_2d_alignment](https://github.com/ZJUYH/ethzasl_icp_mapping/blob/master/ethzasl_icp_mapper/launch/2D_scans/uts_2d_alignment.launch) using `roslaunch ethzasl_icp_mapper uts_2d_alignment.launch`.

* Saved maps (.vtk, .ply format) are in `saveVTKname` and `saveVTKname`. `poseFileName` is the new global poses and `scanDirName` is the raw scans that you saved before.

* I use two filters to filter the new map, listed in yaml file. Find yourself.

