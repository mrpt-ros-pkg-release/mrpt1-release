#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.

# Uncomment this to turn on verbose mode.
export DH_VERBOSE=1
# TODO: remove the LDFLAGS override.  It's here to avoid esoteric problems
# of this sort:
#  https://code.ros.org/trac/ros/ticket/2977
#  https://code.ros.org/trac/ros/ticket/3842
export LDFLAGS=
export PKG_CONFIG_PATH=@(InstallationPrefix)/lib/pkgconfig
# Explicitly enable -DNDEBUG, see:
# 	https://github.com/ros-infrastructure/bloom/issues/327
export DEB_CXXFLAGS_MAINT_APPEND=-DNDEBUG

%:
	dh $@@ -v --buildsystem=cmake

override_dh_auto_configure:
	# In case we're installing to a non-standard location, look for a setup.sh
	# in the install tree that was dropped by catkin, and source it.  It will
	# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
	if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
	dh_auto_configure -- -DCMAKE_INSTALL_PREFIX="@(InstallationPrefix)" \
	-DBUILD_APP_2d-slam-demo=OFF \
	-DBUILD_APP_DifOdometry-Camera=OFF \
	-DBUILD_APP_DifOdometry-Datasets=OFF \
	-DBUILD_APP_GridmapNavSimul=OFF \
	-DBUILD_APP_RawLogViewer=ON \
	-DBUILD_APP_ReactiveNav3D-Demo=OFF \
	-DBUILD_APP_ReactiveNavigationDemo=OFF \
	-DBUILD_APP_SceneViewer3D=ON \
	-DBUILD_APP_camera-calib=ON \
	-DBUILD_APP_carmen2rawlog=OFF \
	-DBUILD_APP_carmen2simplemap=OFF \
	-DBUILD_APP_features-matching=OFF \
	-DBUILD_APP_gps2rawlog=ON \
	-DBUILD_APP_graph-slam=ON \
	-DBUILD_APP_graphslam-engine=OFF \
	-DBUILD_APP_grid-matching=OFF \
	-DBUILD_APP_hmt-slam=OFF \
	-DBUILD_APP_hmt-slam-gui=OFF \
	-DBUILD_APP_hmtMapViewer=OFF \
	-DBUILD_APP_holonomic-navigator-demo=OFF \
	-DBUILD_APP_icp-slam=ON \
	-DBUILD_APP_icp-slam-live=ON \
	-DBUILD_APP_image2gridmap=ON \
	-DBUILD_APP_kf-slam=OFF \
	-DBUILD_APP_kinect-3d-slam=OFF \
	-DBUILD_APP_kinect-3d-view=OFF \
	-DBUILD_APP_kinect-stereo-calib=OFF \
	-DBUILD_APP_map-partition=OFF \
	-DBUILD_APP_mrpt-perfdata2html=OFF \
	-DBUILD_APP_mrpt-performance=OFF \
	-DBUILD_APP_navlog-viewer=ON \
	-DBUILD_APP_observations2map=ON \
	-DBUILD_APP_pf-localization=OFF \
	-DBUILD_APP_ptg-configurator=ON \
	-DBUILD_APP_rawlog-edit=ON \
	-DBUILD_APP_rawlog-grabber=ON \
	-DBUILD_APP_rbpf-slam=ON \
	-DBUILD_APP_ro-localization=OFF \
	-DBUILD_APP_robotic-arm-kinematics=OFF \
	-DBUILD_APP_simul-beacons=OFF \
	-DBUILD_APP_simul-gridmap=OFF \
	-DBUILD_APP_simul-landmarks=OFF \
	-DBUILD_APP_track-video-features=OFF \
	-DBUILD_APP_velodyne-view=ON


override_dh_auto_build:
	# In case we're installing to a non-standard location, look for a setup.sh
	# in the install tree that was dropped by catkin, and source it.  It will
	# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
	if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
	dh_auto_build

override_dh_auto_test:
	# In case we're installing to a non-standard location, look for a setup.sh
	# in the install tree that was dropped by catkin, and source it.  It will
	# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
	echo -- Running tests. Even if one of them fails the build is not canceled.
	if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
	dh_auto_test || true

override_dh_shlibdeps:
	# In case we're installing to a non-standard location, look for a setup.sh
	# in the install tree that was dropped by catkin, and source it.  It will
	# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
	if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
	dh_shlibdeps -l$(CURDIR)/debian/@(Package)/@(InstallationPrefix)/lib/

override_dh_auto_install:
	# In case we're installing to a non-standard location, look for a setup.sh
	# in the install tree that was dropped by catkin, and source it.  It will
	# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
	if [ -f "@(InstallationPrefix)/setup.sh" ]; then . "@(InstallationPrefix)/setup.sh"; fi && \
	dh_auto_install
