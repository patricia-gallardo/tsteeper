import os
from conans import ConanFile, CMake

class ConanDependencies(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    platform_qt = os.getenv("CMAKE_PREFIX_PATH")
    generators = "cmake", "qt", "virtualrunenv" if not platform_qt else "cmake"
    
    default_options = {
        "qt:qtlocation": True,
        "qt:qtquickcontrols2": True,
        "qt:qttools": True,
        "qt:qtsvg": True,
        "qt:qtwebchannel": True,
        "qt:qtwebengine": True,
        "qt:qtwebview": True,
        "qt:with_fontconfig": True,
        "qt:with_freetype": True,
        "qt:with_glib": False,
        "fontconfig:shared": True,
        "harfbuzz:with_glib": False,
        "libxscrnsaver:shared": True,
    }

    def requirements(self):
        platform_qt = os.getenv("CMAKE_PREFIX_PATH")
        if not platform_qt:
            self.output.info("CMAKE_PREFIX_PATH not set")
            self.output.info("To use the Qt from your system, set the CMAKE_PREFIX_PATH env var")
            self.output.info("Trying to get Qt from Conan")
            self.requires("qt/5.15.0@bincrafters/stable")
        else:
            self.output.info("Getting Qt from the system. CMAKE_PREFIX_PATH = " + platform_qt)
        self.requires("gflags/2.2.2")

    def imports(self):
        # Figure out how to copy licences from Qt
        # qt_path = self.deps_cpp_info["qt"].rootpath
        # self.output.info("Root path : " + qt_path + "/qt5/qtwebengine/src/3rdparty/chromium/tools/licenses.py")
        # qt_path = qt_path.replace('\\', '/')
        # if (os.path.isfile(qt_path)) :
        #     self.output.info("Python script exists")
        # else:
        #     self.output.info("Python script DOES NOT exist")
        # self.output.info("Root path : " + qt_path + "/qt5/qtwebengine/src/3rdparty/chromium/tools/licenses.py")
        # Copy this to licenses : qtwebengine/src/core/debug/gen/components/resources/about_credits.html
        self.copy("*.dll", dst="bin", src="bin")
        self.copy("*.dylib*", dst="bin", src="lib")
        self.copy("license*", dst="licenses", folder=True, ignore_case=True)
