#!/bin/bash

# prevent conflict between "LASzip" dir and 'laszip' executeable on OSX
# do doing build in a different directory
mkdir build
cd build

cmake ${CMAKE_ARGS} -G Ninja -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release ..
ninja install

