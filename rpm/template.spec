Name:           ros-kinetic-mrpt1
Version:        1.5.7
Release:        4%{?dist}
Summary:        ROS mrpt1 package

Group:          Development/Libraries
License:        BSD
URL:            https://www.mrpt.org/
Source0:        %{name}-%{version}.tar.gz

Requires:       assimp-devel
Requires:       boost-devel
Requires:       eigen3-devel
Requires:       ffmpeg-devel
Requires:       freeglut-devel
Requires:       libjpeg-turbo-devel
Requires:       libpcap-devel
Requires:       libudev-devel
Requires:       libusbx-devel
Requires:       numpy
Requires:       opencv-devel
Requires:       python-devel
Requires:       ros-kinetic-catkin
Requires:       ros-kinetic-octomap
Requires:       suitesparse-devel
Requires:       wxGTK-devel
Requires:       zlib-devel
BuildRequires:  assimp-devel
BuildRequires:  boost-devel
BuildRequires:  cmake
BuildRequires:  eigen3-devel
BuildRequires:  ffmpeg-devel
BuildRequires:  freeglut-devel
BuildRequires:  libjpeg-turbo-devel
BuildRequires:  libpcap-devel
BuildRequires:  libudev-devel
BuildRequires:  libusbx-devel
BuildRequires:  numpy
BuildRequires:  opencv-devel
BuildRequires:  python-devel
BuildRequires:  ros-kinetic-octomap
BuildRequires:  suitesparse-devel
BuildRequires:  wxGTK-devel
BuildRequires:  zlib-devel

%description
Mobile Robot Programming Toolkit (MRPT) version 1.5.x

%prep
%setup -q

%build
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it.  It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "/opt/ros/kinetic/setup.sh" ]; then . "/opt/ros/kinetic/setup.sh"; fi
mkdir -p obj-%{_target_platform} && cd obj-%{_target_platform}
%cmake .. \
        -UINCLUDE_INSTALL_DIR \
        -ULIB_INSTALL_DIR \
        -USYSCONF_INSTALL_DIR \
        -USHARE_INSTALL_PREFIX \
        -ULIB_SUFFIX \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        -DCMAKE_INSTALL_PREFIX="/opt/ros/kinetic" \
        -DCMAKE_PREFIX_PATH="/opt/ros/kinetic" \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_BUILD_BINARY_PACKAGE="1" \

make %{?_smp_mflags}

%install
# In case we're installing to a non-standard location, look for a setup.sh
# in the install tree that was dropped by catkin, and source it.  It will
# set things like CMAKE_PREFIX_PATH, PKG_CONFIG_PATH, and PYTHONPATH.
if [ -f "/opt/ros/kinetic/setup.sh" ]; then . "/opt/ros/kinetic/setup.sh"; fi
cd obj-%{_target_platform}
make %{?_smp_mflags} install DESTDIR=%{buildroot}

%files
/opt/ros/kinetic

%changelog
* Tue Jun 12 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.7-4
- Autogenerated by Bloom

* Mon Jun 11 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.7-3
- Autogenerated by Bloom

* Fri Jun 08 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.7-2
- Autogenerated by Bloom

* Thu Jun 07 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.7-1
- Autogenerated by Bloom

* Tue May 08 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.7-0
- Autogenerated by Bloom

* Wed May 02 2018 Jose-Luis Blanco-Claraco <joseluisblancoc@gmail.com> - 1.5.6-0
- Autogenerated by Bloom

