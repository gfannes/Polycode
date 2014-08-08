rem Build script for Visual Studio 12 (2013)

mkdir Dependencies\Build
pushd Dependencies\Build
cmake -G "Visual Studio 12" ..
msbuild /m /p:Platform=Win32 /p:Configuration=Debug PolycodeDependencies.sln
msbuild /m /p:Platform=Win32 /p:Configuration=Debug glext.vcxproj
msbuild /m /p:Platform=Win32 /p:Configuration=Debug wglext.vcxproj
msbuild /m /p:Platform=Win32 /p:Configuration=Release PolycodeDependencies.sln
msbuild /m /p:Platform=Win32 /p:Configuration=Release glext.vcxproj
msbuild /m /p:Platform=Win32 /p:Configuration=Release wglext.vcxproj
popd

mkdir Build
pushd Build
cmake -G "Visual Studio 12" ..
msbuild /m /p:Platform=Win32 /p:Configuration=Debug Polycode.sln
msbuild /m /p:Platform=Win32 /p:Configuration=Release Polycode.sln
popd
