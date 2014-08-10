solution "core"
    configurations {"Debug", "Release"}
    project "Polycore"
        kind "StaticLib"
        language "C++"
        files {"../Core/Contents/Source/*.cpp"}
        excludes
        {
            "../Core/Contents/Source/PolyGLES1Texture.cpp",
            "../Core/Contents/Source/PolyGLES1Renderer.cpp",
            "../Core/Contents/Source/PolyiPhoneCore.cpp",
            "../Core/Contents/Source/PolyWinCore.cpp",
        }
        includedirs
        {
            "../Core/include",
            "../Core/Contents/Include",
            "../Dependencies/Build/Debug/freetype/src/freetype/include",
            "../Dependencies/Build/Debug/openal/src/openal/include/AL",
            "../Dependencies/Build/Debug/libpng/src/libpng",
            "../Dependencies/Build/Debug/physfs/src/physfs",
        }
        defines {"GL_GLEXT_PROTOTYPES"}
