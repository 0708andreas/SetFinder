# Install script for directory: /home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "licenses" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/licenses/opencv4" TYPE FILE RENAME "flatbuffers-LICENSE.txt" FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/3rdparty/flatbuffers/LICENSE.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/cvconfig.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/opencv4/opencv2" TYPE FILE FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/opencv2/opencv_modules.hpp")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake"
         "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4/OpenCVModules.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/CMakeFiles/Export/51ea738ee2ea68756d9122094dacc2a4/OpenCVModules-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/opencv4" TYPE FILE FILES
    "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/unix-install/OpenCVConfig-version.cmake"
    "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/unix-install/OpenCVConfig.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "scripts" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE FILES "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/CMakeFiles/install/setup_vars_opencv4.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "dev" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/opencv4" TYPE FILE FILES
    "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/scripts/valgrind.supp"
    "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/scripts/valgrind_3rdparty.supp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/3rdparty/zlib/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/3rdparty/openjpeg/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/3rdparty/protobuf/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/include/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/calib3d/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/core/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/dnn/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/features2d/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/flann/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/gapi/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/highgui/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/imgcodecs/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/imgproc/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/java/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/js/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/ml/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/objc/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/objdetect/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/photo/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/python/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/stitching/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/ts/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/video/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/videoio/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/.firstpass/world/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/core/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/flann/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/imgproc/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/photo/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/python_tests/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/dnn/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/features2d/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/calib3d/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/objdetect/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/video/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/java_bindings_generator/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/js_bindings_generator/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/objc_bindings_generator/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/python_bindings_generator/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/modules/js/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/doc/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/data/cmake_install.cmake")
  include("/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/samples/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/andreas/MEGA/projects/set_check/SetFinderWeb/OpenCV.js/opencv-4.10.0/platforms/js/build_wasm/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
