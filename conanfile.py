import os
from conans import ConanFile, CMake

class HeapHistoryViewer(ConanFile):

    settings = "os", "compiler", "build_type", "arch"
    platform_qt = os.getenv("CMAKE_PREFIX_PATH")
    generators = "cmake", "qt" if not platform_qt else "cmake"
    default_options = {
       "qt:shared": True,
       "qt:commercial": False,
       "qt:opengl": "desktop", # ['no', 'es2', 'desktop', 'dynamic']
       "qt:openssl": True,
       "qt:with_pcre2": True,
       "qt:with_glib": True,
       "qt:with_doubleconversion": True,
       "qt:with_freetype": True,
       "qt:with_fontconfig": True,
       "qt:with_harfbuzz": True,
       "qt:with_libjpeg": True,
       "qt:with_libpng": True,
       "qt:with_sqlite3": True,
       "qt:with_mysql": True,
       "qt:with_pq": True,
       "qt:with_odbc": True,
       "qt:with_sdl2": True,
       "qt:with_libalsa": True,
       "qt:with_openal": True,
       "qt:GUI": True,
       "qt:widgets": True,
       # "qt:device": "ANY",
       # "qt:cross_compile": "ANY",
       # "qt:config": "ANY",
       "qt:qtsvg": False,
       "qt:qtdeclarative": False,
       "qt:qtactiveqt": False,
       "qt:qtscript": False,
       "qt:qtmultimedia": False,
       "qt:qttools": False,
       "qt:qtxmlpatterns": False,
       "qt:qttranslations": False,
       "qt:qtdoc": False,
       "qt:qtrepotools": False,
       "qt:qtqa": False,
       "qt:qtlocation": False,
       "qt:qtsensors": False,
       "qt:qtconnectivity": False,
       "qt:qtwayland": False,
       "qt:qt3d": False,
       "qt:qtimageformats": False,
       "qt:qtgraphicaleffects": False,
       "qt:qtquickcontrols": False,
       "qt:qtserialbus": False,
       "qt:qtserialport": False,
       "qt:qtx11extras": False,
       "qt:qtmacextras": False,
       "qt:qtwinextras": False,
       "qt:qtandroidextras": False,
       "qt:qtwebsockets": False,
       "qt:qtwebchannel": False,
       "qt:qtwebengine": False,
       "qt:qtcanvas3d": False,
       "qt:qtwebview": False,
       "qt:qtquickcontrols2": False,
       "qt:qtpurchasing": False,
       "qt:qtcharts": False,
       "qt:qtdatavis3d": False,
       "qt:qtvirtualkeyboard": False,
       "qt:qtgamepad": False,
       "qt:qtscxml": False,
       "qt:qtspeech": False,
       "qt:qtnetworkauth": False,
       "qt:qtremoteobjects": False,
       "qt:qtwebglplugin": False
    }

    def requirements(self):
        platform_qt = os.getenv("CMAKE_PREFIX_PATH")
        if not platform_qt:
            self.output.info("CMAKE_PREFIX_PATH not set")
            self.output.info("To use the Qt from your system, set the CMAKE_PREFIX_PATH env var")
            self.output.info("Trying to get Qt from Conan")
            self.output.info("If it fails try: 'conan remote add bincrafters \"https://api.bintray.com/conan/bincrafters/public-conan\"'")
            self.requires("qt/5.12.6@bincrafters/stable")
        else:
            self.output.info("Getting Qt from the system. CMAKE_PREFIX_PATH = " + platform_qt)
        self.requires("gflags/2.2.2")

    def imports(self):
        self.copy("*.dll", dst="bin", src="bin")
        self.copy("*.dylib*", dst="bin", src="lib")
