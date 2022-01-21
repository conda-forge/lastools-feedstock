
mkdir build
cd build

cmake -G "NMake Makefiles" -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D CMAKE_BUILD_TYPE=Release ^
    -D BUILD_SHARED_LIBS=ON ^
    -D CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
    ..
if errorlevel 1 exit 1

nmake 
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

:: For some reason, the DLL doesn't actually get installed. Do this here
copy LASlib\lib\LASlib.dll %LIBRARY_BIN%
if errorlevel 1 exit 1
copy LASlib\lib\LASlib.lib %LIBRARY_LIB%
if errorlevel 1 exit 1
