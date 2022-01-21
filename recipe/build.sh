#!/bin/bash

# prevent conflict between "LASzip" dir and 'laszip' executeable on OSX
# do doing build in a different directory
mkdir build
cd build

cmake ${CMAKE_ARGS} -G Ninja -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    ..
ninja install

# for some reason the shared lib gets put into a 'LASlib' subdir inder $PREFIX/lib
# move the files up one level and remove the dir
mv $PREFIX/lib/LASlib/* $PREFIX/lib
rmdir $PREFIX/lib/LASlib

