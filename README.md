# tsteeper

Using Qt and Chromium comes with a wide range of licences that all have to be taken into account. Not exactly sure what that means for tSteeper yet.

# Using conan install

* Conan needs Python 3
* Chromium needs Python greater than equal to 2.7.5 and less than 3
* Chromium generates very long filenames/paths - put Conan at the root of the filesystem
    [https://docs.conan.io/en/latest/mastering/custom_cache.html]
* git config --system core.longpaths true (probably not needed)

GitBash Windows
~~~~
$ pip3 install conan --upgrade
$ python --version
Python 2.7.17
$ export CONAN_USER_HOME=c:/Code/
$ conan remote add bincrafters "https://api.bintray.com/conan/bincrafters/public-conan"
$ conan install .. -s arch=x86_64 -s build_type=Debug -s compiler="Visual Studio" -s compiler.version=16 -s compiler.runtime=MDd -g=cmake --build=missing
~~~~

Developer Command Prompt for VS 2019
~~~~
SET CONAN_USER_HOME=c:\Code
~~~~

Linux
~~~~
$ sudo pip3 install conan --upgrade
$ python --version
Python 2.7.17
$ export CONAN_USER_HOME=/Code/
$ conan remote add bincrafters "https://api.bintray.com/conan/bincrafters/public-conan"
$ conan install . -s build_type=Debug -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++11 -g=cmake --build=missing
~~~~

Linux a problem with freetype and font config?

       "qt:with_freetype": True,
       "qt:with_fontconfig": True,

[18002/18008] STAMP obj/extensions/browser/api/api.stamp
[18003/18008] STAMP obj/extensions/browser/browser_context_keyed_service_factories.stamp
[18004/18008] AR obj/extensions/browser/api/libapi_registration.a
[18005/18008] STAMP obj/extensions/browser/browser.stamp
[18006/18008] STAMP obj/extensions/browser/core_api_provider.stamp
[18007/18008] STAMP obj/qtwebengine_sources.stamp
[18008/18008] STAMP QtWebEngineCore.stamp
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
cd api/ && ( test -e Makefile.core_api || /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtbase/bin/qmake -o Makefile.core_api /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/core_api.pro ) && make -f Makefile.core_api 
make[4]: Entering directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core/api'
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtwebenginecoreglobal.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineclientcertificatestore.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginecookiestore.cpp
generating .moc/moc_predefs.h
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginehttprequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginemessagepumpscheduler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginequotarequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineregisterprotocolhandlerrequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestinfo.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestjob.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlscheme.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlschemehandler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtbug-60565.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtbug-61521.cpp
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginecookiestore.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginemessagepumpscheduler_p.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginequotarequest.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineregisterprotocolhandlerrequest.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestinterceptor.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestjob.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlscheme.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlschemehandler.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginefindtextresult.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginenotification.h
compiling .moc/moc_qwebenginecookiestore.cpp
compiling .moc/moc_qwebenginemessagepumpscheduler_p.cpp
compiling .moc/moc_qwebenginequotarequest.cpp
compiling .moc/moc_qwebengineregisterprotocolhandlerrequest.cpp
compiling .moc/moc_qwebengineurlrequestinterceptor.cpp
compiling .moc/moc_qwebengineurlrequestjob.cpp
compiling .moc/moc_qwebengineurlscheme.cpp
compiling .moc/moc_qwebengineurlschemehandler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginefindtextresult.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginenotification.cpp
rm -f debug/libqtwebenginecoreapi.a
ar cqs debug/libqtwebenginecoreapi.a .obj/qtwebenginecoreglobal.o .obj/qwebengineclientcertificatestore.o .obj/qwebenginecookiestore.o .obj/qwebenginefindtextresult.o .obj/qwebenginehttprequest.o .obj/qwebenginemessagepumpscheduler.o .obj/qwebenginenotification.o .obj/qwebenginequotarequest.o .obj/qwebengineregisterprotocolhandlerrequest.o .obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o .obj/qwebengineurlscheme.o .obj/qwebengineurlschemehandler.o .obj/qtbug-60565.o .obj/qtbug-61521.o .obj/moc_qwebenginecookiestore.o .obj/moc_qwebenginemessagepumpscheduler_p.o .obj/moc_qwebenginequotarequest.o .obj/moc_qwebengineregisterprotocolhandlerrequest.o .obj/moc_qwebengineurlrequestinterceptor.o .obj/moc_qwebengineurlrequestjob.o .obj/moc_qwebengineurlscheme.o .obj/moc_qwebengineurlschemehandler.o
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core/api'
( test -e Makefile.core_module || /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtbase/bin/qmake -o Makefile.core_module /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/core_module.pro ) && make -f Makefile.core_module 
make[4]: Entering directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
creating linker version script QtWebEngineCore.version
rm -f libQt5WebEngineCore.so.5.14.1 libQt5WebEngineCore.so libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.14
linking ../../lib/libQt5WebEngineCore.so.5.14.1
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o): In function `FcGetPixelSize':
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1095: undefined reference to `FT_Get_BDF_Property'
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o): In function `FcFreeTypeQueryFaceInternal':
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1875: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1882: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1905: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:2008: undefined reference to `FT_Get_BDF_Property'
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o):/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:2029: more undefined references to `FT_Get_BDF_Property' follow
collect2: error: ld returned 1 exit status
Makefile.core_module:78: recipe for target '../../lib/libQt5WebEngineCore.so.5.14.1' failed
make[4]: *** [../../lib/libQt5WebEngineCore.so.5.14.1] Error 1
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
Makefile:124: recipe for target 'sub-core_module-pro-make_first' failed
make[3]: *** [sub-core_module-pro-make_first] Error 2
make[3]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
Makefile:77: recipe for target 'sub-core-make_first' failed
make[2]: *** [sub-core-make_first] Error 2
make[2]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src'
Makefile:48: recipe for target 'sub-src-make_first' failed
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine'
Makefile:375: recipe for target 'module-qtwebengine-make_first' failed
make: *** [module-qtwebengine-make_first] Error 2
qt/5.14.1@bincrafters/stable: 
libpq/11.5: WARN: Library 'pq' was either already found in a previous 'conanfile.cpp_info.libdirs' folder or appears several times with a different file extension
libmysqlclient/8.0.17: WARN: Library 'mysqlclient' was either already found in a previous 'conanfile.cpp_info.libdirs' folder or appears several times with a different file extension
qt/5.14.1@bincrafters/stable: ERROR: Package '883c1c5583f9e3308c15a5bd131558bc244abfce' build failed
qt/5.14.1@bincrafters/stable: WARN: Build folder /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce
ERROR: qt/5.14.1@bincrafters/stable: Error in build() method, line 662
	self.run(make, run_environment=True)
	ConanException: Error 2 while executing make
CMake Error at cmake-build-debug/conan.cmake:402 (message):
  Conan install failed='1'
Call Stack (most recent call first):
  cmake-build-debug/conan.cmake:497 (conan_cmake_install)
  src/CMakeLists.txt:18 (conan_cmake_run)


-- Configuring incomplete, errors occurred!
See also "/Code/tsteeper/cmake-build-debug/CMakeFiles/CMakeOutput.log".

[Failed to reload]

       "qt:with_freetype": False,
       "qt:with_fontconfig": False,
       
       
       ERROR: Feature 'fontconfig' was enabled, but the pre-condition '!config.msvc && features.system-freetype && libs.fontconfig' failed.
...
ERROR: qt/5.14.1@bincrafters/stable: Error in build() method, line 652
	self.run("%s/qt5/configure %s" % (self.source_folder, " ".join(args)), run_environment=True)
	ConanException: Error 3 while executing /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/configure -shared -confirm-license -silent -nomake examples -nomake tests -prefix /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/ace118797262c123e561f3cb1f8e3295ab5095b2 -opensource -debug -skip qtscript -skip qtmultimedia -skip qtxmlpatterns -skip qtdoc -skip qtsensors -skip qtconnectivity -skip qtwayland -skip qt3d -skip qtserialbus -skip qtserialport -skip qtx11extras -skip qtmacextras -skip qtwinextras -skip qtandroidextras -skip qtwebview -skip qtpurchasing -skip qtcharts -skip qtdatavis3d -skip qtvirtualkeyboard -skip qtgamepad -skip qtscxml -skip qtspeech -skip qtnetworkauth -skip qtremoteobjects -skip qtwebglplugin -skip qtlottie -skip qtquicktimeline -skip qtquick3d --zlib=system -opengl desktop -openssl-linked --glib=yes --pcre=system --fontconfig=yes --icu=yes --sql-mysql=yes --sql-psql=yes --sql-odbc=yes --zstd=yes -system-doubleconversion -no-freetype -system-harfbuzz -system-libjpeg -system-libpng -system-sqlite "ZLIB_LIBS=-lz" "OPENSSL_LIBS=-lssl -lcrypto -ldl -lpthread -lz" "PCRE2_LIBS=-lpcre2-posix -lpcre2-8 -lpcre2-16 -lpcre2-32 -lz -lbz2" "GLIB_LIBS=-lgio-2.0 -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lglib-2.0 -lpthread -lresolv -ldl -lz -lffi -lpcreposix -lpcre -lbz2 -lelf -lmount -lblkid -lselinux -lsepol -lpcre2-posix -lpcre2-8 -lpcre2-16 -lpcre2-32" "DOUBLECONVERSION_LIBS=-ldouble-conversion" "FREETYPE_INCDIR=/Code/.conan/data/freetype/2.10.1/_/_/package/6c09002916e9018aece7378e86cb2e02b7fdc66b/include/freetype2" "FREETYPE_LIBS=-lfreetyped -lm -lpng16d -lz -lbz2" "FONTCONFIG_LIBS=-lfontconfig -lm -lpthread -lfreetyped -lpng16d -lz -lbz2 -lexpat -luuid" "ICU_LIBS=-licui18n -licuio -licutest -licutu -licuuc -licudata -ldl" "HARFBUZZ_LIBS=-lharfbuzz -lm -lfreetyped -lpng16d -lz -lbz2 -lgio-2.0 -lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lglib-2.0 -lpthread -lresolv -ldl -lffi -lpcreposix -lpcre -lelf -lmount -lblkid -lselinux -lsepol -lpcre2-posix -lpcre2-8 -lpcre2-16 -lpcre2-32" "LIBJPEG_LIBS=-ljpeg" "LIBPNG_LIBS=-lpng16d -lm -lz" "SQLITE_LIBS=-lsqlite3 -ldl" "MYSQL_LIBS=-lmysqlclient -lssl -lcrypto -ldl -lpthread -lz" "PSQL_LIBS=-lpgcommon -lpq -lpthread -lz" "ODBC_LIBS=-lodbc -lodbccr -lodbcinst -lltdl -ldl -liconv" "ZSTD_LIBS=-lzstd -lpthread" "XKBCOMMON_LIBS=-lxkbcommon -lxkbcommon-x11 -lxcb -lxcb-xkb -lX11 -ldl -lXau -lXdmcp" -I /Code/.conan/data/double-conversion/3.1.5/_/_/package/1a651c5b4129ad794b88522bece2281a7453aee4/include -L /Code/.conan/data/double-conversion/3.1.5/_/_/package/1a651c5b4129ad794b88522bece2281a7453aee4/lib -I /Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/include -L /Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib -I /Code/.conan/data/icu/64.2/_/_/package/f5b5be523805d92f53b3d8d040ec76f1a0386a08/include -D U_STATIC_IMPLEMENTATION -L /Code/.conan/data/icu/64.2/_/_/package/f5b5be523805d92f53b3d8d040ec76f1a0386a08/lib -I /Code/.conan/data/harfbuzz/2.6.2/bincrafters/stable/package/97a6411ff28fcca001af8c208df3ef5a14aa0910/include -I /Code/.conan/data/harfbuzz/2.6.2/bincrafters/stable/package/97a6411ff28fcca001af8c208df3ef5a14aa0910/include/harfbuzz -L /Code/.conan/data/harfbuzz/2.6.2/bincrafters/stable/package/97a6411ff28fcca001af8c208df3ef5a14aa0910/lib -I /Code/.conan/data/libjpeg/9c/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/libjpeg/9c/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/sqlite3/3.29.0/_/_/package/4a48d8574c520491e819e9112fab58cc9cf0574e/include -L /Code/.conan/data/sqlite3/3.29.0/_/_/package/4a48d8574c520491e819e9112fab58cc9cf0574e/lib -I /Code/.conan/data/libmysqlclient/8.0.17/_/_/package/f6018aa27850f7918b5e15655592671d230ac15d/include -L /Code/.conan/data/libmysqlclient/8.0.17/_/_/package/f6018aa27850f7918b5e15655592671d230ac15d/lib -I /Code/.conan/data/libpq/11.5/_/_/package/8b0ca901612071f2cc6a12b03e08d4b96fdfd3b7/include -L /Code/.conan/data/libpq/11.5/_/_/package/8b0ca901612071f2cc6a12b03e08d4b96fdfd3b7/lib -I /Code/.conan/data/odbc/2.3.7/_/_/package/a8a7a3ea9a0498a661f81d9ed2973eb0d37264f8/include -L /Code/.conan/data/odbc/2.3.7/_/_/package/a8a7a3ea9a0498a661f81d9ed2973eb0d37264f8/lib -I /Code/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/include -L /Code/.conan/data/xcb-util-wm/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/lib -I /Code/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/af0a902f921a2f1845bdc3e8476616c65c2e4c0a/include -L /Code/.conan/data/xcb-util-image/0.4.0/bincrafters/stable/package/af0a902f921a2f1845bdc3e8476616c65c2e4c0a/lib -I /Code/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/include -L /Code/.conan/data/xcb-util-keysyms/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/lib -I /Code/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/include -L /Code/.conan/data/xcb-util-renderutil/0.3.9/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/lib -I /Code/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/8ccf758ca90d7f7c79a6bc81e0319c8a36ef2522/include -L /Code/.conan/data/libxcursor/1.2.0/bincrafters/stable/package/8ccf758ca90d7f7c79a6bc81e0319c8a36ef2522/lib -I /Code/.conan/data/xkbcommon/0.8.4/bincrafters/stable/package/e6dac64745862714aee15ed40276e568633d1387/include -L /Code/.conan/data/xkbcommon/0.8.4/bincrafters/stable/package/e6dac64745862714aee15ed40276e568633d1387/lib -I /Code/.conan/data/zstd/1.4.3/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/zstd/1.4.3/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libxcomposite/0.4.5/bincrafters/stable/package/047543b094545fe6d8de8bb8e39c47bbe44fb55e/include -L /Code/.conan/data/libxcomposite/0.4.5/bincrafters/stable/package/047543b094545fe6d8de8bb8e39c47bbe44fb55e/lib -I /Code/.conan/data/libxtst/1.2.3/bincrafters/stable/package/c90baa09f9e06fb806dccc014eacfd7950e95ba4/include -L /Code/.conan/data/libxtst/1.2.3/bincrafters/stable/package/c90baa09f9e06fb806dccc014eacfd7950e95ba4/lib -I /Code/.conan/data/libxscrnsaver/1.2.3/bincrafters/stable/package/ceb9e0925c203ec2ea78db60f03f99f5ae4491a1/include -L /Code/.conan/data/libxscrnsaver/1.2.3/bincrafters/stable/package/ceb9e0925c203ec2ea78db60f03f99f5ae4491a1/lib -I /Code/.conan/data/opus/1.3.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -I /Code/.conan/data/opus/1.3.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include/opus -L /Code/.conan/data/opus/1.3.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/mesa/19.3.1/bincrafters/stable/package/bb1f35eb6f24ebd6e3161487e3d2689150b1e443/include -L /Code/.conan/data/mesa/19.3.1/bincrafters/stable/package/bb1f35eb6f24ebd6e3161487e3d2689150b1e443/lib -I /Code/.conan/data/openssl/1.1.1d/_/_/package/61378f3db01d0a2424aa7ca62df88dcbfa0c279e/include -L /Code/.conan/data/openssl/1.1.1d/_/_/package/61378f3db01d0a2424aa7ca62df88dcbfa0c279e/lib -I /Code/.conan/data/glib/2.58.3/bincrafters/stable/package/931a1aee2c793d2a3f1ef032bedee69385d4713b/include -I /Code/.conan/data/glib/2.58.3/bincrafters/stable/package/931a1aee2c793d2a3f1ef032bedee69385d4713b/include/glib-2.0 -I /Code/.conan/data/glib/2.58.3/bincrafters/stable/package/931a1aee2c793d2a3f1ef032bedee69385d4713b/lib/glib-2.0/include -L /Code/.conan/data/glib/2.58.3/bincrafters/stable/package/931a1aee2c793d2a3f1ef032bedee69385d4713b/lib -I /Code/.conan/data/freetype/2.10.1/_/_/package/6c09002916e9018aece7378e86cb2e02b7fdc66b/include -I /Code/.conan/data/freetype/2.10.1/_/_/package/6c09002916e9018aece7378e86cb2e02b7fdc66b/include/freetype2 -L /Code/.conan/data/freetype/2.10.1/_/_/package/6c09002916e9018aece7378e86cb2e02b7fdc66b/lib -I /Code/.conan/data/expat/2.2.9/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -D XML_STATIC -L /Code/.conan/data/expat/2.2.9/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libuuid/1.0.3/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -I /Code/.conan/data/libuuid/1.0.3/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include/uuid -L /Code/.conan/data/libuuid/1.0.3/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libiconv/1.15/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/libiconv/1.15/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/include -L /Code/.conan/data/xcb-util/0.4.0/bincrafters/stable/package/6fa336962a500cc24cc699efe30650391b1b7a78/lib -I /Code/.conan/data/libdrm/2.4.100/bincrafters/stable/package/cfcb801c5f4d7346cda0cdb208932a75e4e0de32/include -I /Code/.conan/data/libdrm/2.4.100/bincrafters/stable/package/cfcb801c5f4d7346cda0cdb208932a75e4e0de32/include/libdrm -I /Code/.conan/data/libdrm/2.4.100/bincrafters/stable/package/cfcb801c5f4d7346cda0cdb208932a75e4e0de32/include/libkms -L /Code/.conan/data/libdrm/2.4.100/bincrafters/stable/package/cfcb801c5f4d7346cda0cdb208932a75e4e0de32/lib -I /Code/.conan/data/libxi/1.7.10/bincrafters/stable/package/89ebaeaec1f5067cafa19272f72abe5f01a32dbc/include -L /Code/.conan/data/libxi/1.7.10/bincrafters/stable/package/89ebaeaec1f5067cafa19272f72abe5f01a32dbc/lib -I /Code/.conan/data/libxrandr/1.5.2/bincrafters/stable/package/2c385854094025c882ecbec88e21c56fdce539c3/include -L /Code/.conan/data/libxrandr/1.5.2/bincrafters/stable/package/2c385854094025c882ecbec88e21c56fdce539c3/lib -I /Code/.conan/data/libunwind/1.3.1/_/_/package/9dbc2dd7b85e082b10eb7aa53a24d25ccda1fda5/include -L /Code/.conan/data/libunwind/1.3.1/_/_/package/9dbc2dd7b85e082b10eb7aa53a24d25ccda1fda5/lib -I /Code/.conan/data/libxdamage/1.1.5/bincrafters/stable/package/047543b094545fe6d8de8bb8e39c47bbe44fb55e/include -L /Code/.conan/data/libxdamage/1.1.5/bincrafters/stable/package/047543b094545fe6d8de8bb8e39c47bbe44fb55e/lib -I /Code/.conan/data/libxshmfence/1.3/bincrafters/stable/package/354bc88b99b0782646090aeedb7a504cbafacfcb/include -L /Code/.conan/data/libxshmfence/1.3/bincrafters/stable/package/354bc88b99b0782646090aeedb7a504cbafacfcb/lib -I /Code/.conan/data/libxxf86vm/1.1.4/bincrafters/stable/package/ceb9e0925c203ec2ea78db60f03f99f5ae4491a1/include -L /Code/.conan/data/libxxf86vm/1.1.4/bincrafters/stable/package/ceb9e0925c203ec2ea78db60f03f99f5ae4491a1/lib -I /Code/.conan/data/libffi/3.2.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -D FFI_BUILDING -L /Code/.conan/data/libffi/3.2.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/pcre/8.41/_/_/package/407a43dc523ae94eacad9e16d31e08b9287fc68c/include -D PCRE_STATIC=1 -L /Code/.conan/data/pcre/8.41/_/_/package/407a43dc523ae94eacad9e16d31e08b9287fc68c/lib -I /Code/.conan/data/libelf/0.8.13/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/libelf/0.8.13/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libmount/2.33.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -I /Code/.conan/data/libmount/2.33.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include/libmount -L /Code/.conan/data/libmount/2.33.1/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libselinux/2.9/bincrafters/stable/package/f93fac919f18a65e3af6101bd7aead09b19cb350/include -L /Code/.conan/data/libselinux/2.9/bincrafters/stable/package/f93fac919f18a65e3af6101bd7aead09b19cb350/lib -I /Code/.conan/data/libpng/1.6.37/_/_/package/61378f3db01d0a2424aa7ca62df88dcbfa0c279e/include -L /Code/.conan/data/libpng/1.6.37/_/_/package/61378f3db01d0a2424aa7ca62df88dcbfa0c279e/lib -I /Code/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/include -L /Code/.conan/data/libxfixes/5.0.3/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/lib -I /Code/.conan/data/libxrender/0.9.10/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/include -L /Code/.conan/data/libxrender/0.9.10/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/lib -I /Code/.conan/data/libpciaccess/0.16/bincrafters/stable/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/libpciaccess/0.16/bincrafters/stable/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/libxext/1.3.4/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/include -L /Code/.conan/data/libxext/1.3.4/bincrafters/stable/package/abf3054872c8c7870a298d5d1cd7bfbffabc8994/lib -I /Code/.conan/data/xz_utils/5.2.4/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -D LZMA_API_STATIC -L /Code/.conan/data/xz_utils/5.2.4/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/pcre2/10.33/_/_/package/85ba733221e7cb57bddf8de63d556b5c0cb95180/include -D PCRE2_STATIC -L /Code/.conan/data/pcre2/10.33/_/_/package/85ba733221e7cb57bddf8de63d556b5c0cb95180/lib -I /Code/.conan/data/libx11/1.6.8/bincrafters/stable/package/642d8efffa5358be19927d62c0fa32924fde01a4/include -L /Code/.conan/data/libx11/1.6.8/bincrafters/stable/package/642d8efffa5358be19927d62c0fa32924fde01a4/lib -I /Code/.conan/data/zlib/1.2.11/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/include -L /Code/.conan/data/zlib/1.2.11/_/_/package/db2ca884c9793e0b0fb54ec3f846326d1addacc8/lib -I /Code/.conan/data/bzip2/1.0.8/_/_/package/0e2fc6376534b5b3953a4974cf0901b008b17f2f/include -L /Code/.conan/data/bzip2/1.0.8/_/_/package/0e2fc6376534b5b3953a4974cf0901b008b17f2f/lib -I /Code/.conan/data/libxcb/1.13.1/bincrafters/stable/package/89d1a197dbdd4144a3bfafaca3d3ad7d4baa5482/include -L /Code/.conan/data/libxcb/1.13.1/bincrafters/stable/package/89d1a197dbdd4144a3bfafaca3d3ad7d4baa5482/lib -I /Code/.conan/data/xtrans/1.4.0/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include -L /Code/.conan/data/xcb-proto/1.13/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib -I /Code/.conan/data/libxau/1.0.9/bincrafters/stable/package/c2c0a6ef35e28393dd37fa859227f234450f6440/include -L /Code/.conan/data/libxau/1.0.9/bincrafters/stable/package/c2c0a6ef35e28393dd37fa859227f234450f6440/lib -L /Code/.conan/data/libpthread-stubs/0.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib -I /Code/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/c7b4a3c21e285afaeea121f19f167123bc623c87/include -L /Code/.conan/data/libxdmcp/1.1.3/bincrafters/stable/package/c7b4a3c21e285afaeea121f19f167123bc623c87/lib -I /Code/.conan/data/xorgproto/2019.1/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include -I /Code/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include -L /Code/.conan/data/xproto/7.0.31/bincrafters/stable/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib -mysql_config /Code/.conan/data/libmysqlclient/8.0.17/_/_/package/f6018aa27850f7918b5e15655592671d230ac15d/bin/mysql_config -psql_config /Code/.conan/data/libpq/11.5/_/_/package/8b0ca901612071f2cc6a12b03e08d4b96fdfd3b7/bin/pg_config -system-xcb -platform linux-g++ QMAKE_CC="/usr/bin/cc" QMAKE_LINK_C="/usr/bin/cc" QMAKE_LINK_C_SHLIB="/usr/bin/cc" QMAKE_CXX="/usr/bin/c++" QMAKE_LINK="/usr/bin/c++" QMAKE_LINK_SHLIB="/usr/bin/c++" -qt-webengine-ffmpeg -system-webengine-opus
CMake Error at cmake-build-debug/conan.cmake:402 (message):
  Conan install failed='1'
Call Stack (most recent call first):
  cmake-build-debug/conan.cmake:497 (conan_cmake_install)
  src/CMakeLists.txt:18 (conan_cmake_run)


-- Configuring incomplete, errors occurred!
See also "/Code/tsteeper/cmake-build-debug/CMakeFiles/CMakeOutput.log".

[Finished]


       "qt:with_freetype": False,
       "qt:with_fontconfig": True, 

qt/5.14.1@bincrafters/stable: Downloaded recipe revision 0
ERROR: qt/5.14.1@bincrafters/stable: Invalid configuration: with_fontconfig cannot be enabled if with_freetype is disabled.
CMake Error at cmake-build-debug/conan.cmake:402 (message):
  Conan install failed='6'
Call Stack (most recent call first):
  cmake-build-debug/conan.cmake:497 (conan_cmake_install)
  src/CMakeLists.txt:18 (conan_cmake_run)
  
  
       "qt:with_freetype": True,
       "qt:with_fontconfig": False,
       
       [18003/18008] STAMP obj/extensions/browser/browser_context_keyed_service_factories.stamp
[18004/18008] AR obj/extensions/browser/api/libapi_registration.a
[18005/18008] STAMP obj/extensions/browser/browser.stamp
[18006/18008] STAMP obj/extensions/browser/core_api_provider.stamp
[18007/18008] STAMP obj/qtwebengine_sources.stamp
[18008/18008] STAMP QtWebEngineCore.stamp
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
cd api/ && ( test -e Makefile.core_api || /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtbase/bin/qmake -o Makefile.core_api /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/core_api.pro ) && make -f Makefile.core_api 
make[4]: Entering directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core/api'
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtwebenginecoreglobal.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineclientcertificatestore.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginecookiestore.cpp
generating .moc/moc_predefs.h
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginehttprequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginemessagepumpscheduler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineregisterprotocolhandlerrequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginequotarequest.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestinfo.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestjob.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlscheme.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlschemehandler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtbug-60565.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qtbug-61521.cpp
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginecookiestore.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginemessagepumpscheduler_p.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginequotarequest.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineregisterprotocolhandlerrequest.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestinterceptor.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlrequestjob.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlscheme.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebengineurlschemehandler.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginefindtextresult.h
moc /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginenotification.h
compiling .moc/moc_qwebenginecookiestore.cpp
compiling .moc/moc_qwebenginemessagepumpscheduler_p.cpp
compiling .moc/moc_qwebenginequotarequest.cpp
compiling .moc/moc_qwebengineregisterprotocolhandlerrequest.cpp
compiling .moc/moc_qwebengineurlrequestinterceptor.cpp
compiling .moc/moc_qwebengineurlrequestjob.cpp
compiling .moc/moc_qwebengineurlscheme.cpp
compiling .moc/moc_qwebengineurlschemehandler.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginefindtextresult.cpp
compiling /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/api/qwebenginenotification.cpp
rm -f debug/libqtwebenginecoreapi.a
ar cqs debug/libqtwebenginecoreapi.a .obj/qtwebenginecoreglobal.o .obj/qwebengineclientcertificatestore.o .obj/qwebenginecookiestore.o .obj/qwebenginefindtextresult.o .obj/qwebenginehttprequest.o .obj/qwebenginemessagepumpscheduler.o .obj/qwebenginenotification.o .obj/qwebenginequotarequest.o .obj/qwebengineregisterprotocolhandlerrequest.o .obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o .obj/qwebengineurlscheme.o .obj/qwebengineurlschemehandler.o .obj/qtbug-60565.o .obj/qtbug-61521.o .obj/moc_qwebenginecookiestore.o .obj/moc_qwebenginemessagepumpscheduler_p.o .obj/moc_qwebenginequotarequest.o .obj/moc_qwebengineregisterprotocolhandlerrequest.o .obj/moc_qwebengineurlrequestinterceptor.o .obj/moc_qwebengineurlrequestjob.o .obj/moc_qwebengineurlscheme.o .obj/moc_qwebengineurlschemehandler.o
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core/api'
( test -e Makefile.core_module || /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtbase/bin/qmake -o Makefile.core_module /Code/.conan/data/qt/5.14.1/bincrafters/stable/source/qt5/qtwebengine/src/core/core_module.pro ) && make -f Makefile.core_module 
make[4]: Entering directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
creating linker version script QtWebEngineCore.version
rm -f libQt5WebEngineCore.so.5.14.1 libQt5WebEngineCore.so libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.14
linking ../../lib/libQt5WebEngineCore.so.5.14.1
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o): In function `FcGetPixelSize':
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1095: undefined reference to `FT_Get_BDF_Property'
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o): In function `FcFreeTypeQueryFaceInternal':
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1875: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1882: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:1905: undefined reference to `FT_Get_BDF_Property'
/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:2008: undefined reference to `FT_Get_BDF_Property'
/Code/.conan/data/fontconfig/2.13.91/conan/stable/package/504145b7b2c37cf516a66fb8183525c6c3e70608/lib/libfontconfig.a(fcfreetype.o):/home/conan/.conan/data/fontconfig/2.13.91/conan/stable/build/504145b7b2c37cf516a66fb8183525c6c3e70608/src/../source_subfolder/src/fcfreetype.c:2029: more undefined references to `FT_Get_BDF_Property' follow
collect2: error: ld returned 1 exit status
Makefile.core_module:78: recipe for target '../../lib/libQt5WebEngineCore.so.5.14.1' failed
make[4]: *** [../../lib/libQt5WebEngineCore.so.5.14.1] Error 1
make[4]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
Makefile:124: recipe for target 'sub-core_module-pro-make_first' failed
make[3]: *** [sub-core_module-pro-make_first] Error 2
make[3]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src/core'
Makefile:77: recipe for target 'sub-core-make_first' failed
make[2]: *** [sub-core-make_first] Error 2
make[2]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine/src'
Makefile:48: recipe for target 'sub-src-make_first' failed
make[1]: *** [sub-src-make_first] Error 2
make[1]: Leaving directory '/Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce/qtwebengine'
Makefile:375: recipe for target 'module-qtwebengine-make_first' failed
make: *** [module-qtwebengine-make_first] Error 2
qt/5.14.1@bincrafters/stable: 
libpq/11.5: WARN: Library 'pq' was either already found in a previous 'conanfile.cpp_info.libdirs' folder or appears several times with a different file extension
libmysqlclient/8.0.17: WARN: Library 'mysqlclient' was either already found in a previous 'conanfile.cpp_info.libdirs' folder or appears several times with a different file extension
qt/5.14.1@bincrafters/stable: ERROR: Package '883c1c5583f9e3308c15a5bd131558bc244abfce' build failed
qt/5.14.1@bincrafters/stable: WARN: Build folder /Code/.conan/data/qt/5.14.1/bincrafters/stable/build/883c1c5583f9e3308c15a5bd131558bc244abfce
ERROR: qt/5.14.1@bincrafters/stable: Error in build() method, line 662
	self.run(make, run_environment=True)
	ConanException: Error 2 while executing make
CMake Error at cmake-build-debug/conan.cmake:402 (message):
  Conan install failed='1'
Call Stack (most recent call first):
  cmake-build-debug/conan.cmake:497 (conan_cmake_install)
  src/CMakeLists.txt:18 (conan_cmake_run)


-- Configuring incomplete, errors occurred!
See also "/Code/tsteeper/cmake-build-debug/CMakeFiles/CMakeOutput.log".

[Failed to reload]


---------------------------------------------------

Windows (problems with the bison paths?)

[3383/27578] STAMP obj/third_party/blink/renderer/bindings/global_constructors_idls.stamp
[3384/27578] CC obj/third_party/boringssl/boringssl/cmac.obj
[3385/27578] STAMP obj/third_party/blink/renderer/core/make_core_generated_input_mode_names.stamp
[3386/27578] CC obj/third_party/boringssl/boringssl/check.obj
[3387/27578] ACTION //third_party/blink/renderer/core:make_core_generated_input_type_names(//build/toolchain/win:x64)
[3388/27578] ACTION //third_party/blink/renderer/core:make_core_generated_css_tokenizer_codepoints(//build/toolchain/win:x64)
[3389/27578] CC obj/third_party/boringssl/boringssl/p_dsa_asn1.obj
[3390/27578] CC obj/third_party/boringssl/boringssl/cpu-aarch64-linux.obj
[3391/27578] CC obj/third_party/boringssl/boringssl/evp_asn1.obj
[3392/27578] ACTION //third_party/blink/renderer/core:make_core_generated_bison(//build/toolchain/win:x64)
FAILED: gen/third_party/blink/renderer/core/xpath_grammar.cc gen/third_party/blink/renderer/core/xpath_grammar.h
C:\Python27\python.exe ../../../../../../c78c405cf/1/qt5/qtwebengine/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py ../../../../../../c78c405cf/1/qt5/qtwebengine/src/3rdparty/chrom
ium/third_party/blink/renderer/core/xml/xpath_grammar.y gen/third_party/blink/renderer/core bison.exe
bison: cannot open `c:\Code\.conan\data\bison_installer\3.3.2\bincrafters\stable\package\89223f1fa44ade7212e9a594be393c58ebc5f958\share\bison/bison.m4': No such file or directory
bison: cannot open `c:\Code\.conan\data\bison_installer\3.3.2\bincrafters\stable\package\89223f1fa44ade7212e9a594be393c58ebc5f958\share\bison/c-skel.m4': No such file or directory
bison: m4 failed
Traceback (most recent call last):
  File "../../../../../../c78c405cf/1/qt5/qtwebengine/src/3rdparty/chromium/third_party/blink/renderer/build/scripts/rule_bison.py", line 85, in <module>
    assert returnCode == 0
AssertionError
[3393/27578] CC obj/third_party/boringssl/boringssl/unicode.obj
[3394/27578] ACTION //third_party/blink/renderer/core:make_core_generated_event_target_names(//build/toolchain/win:x64)
[3395/27578] CC obj/third_party/boringssl/boringssl/ecdsa_asn1.obj
[3396/27578] CC obj/third_party/boringssl/boringssl/evp_ctx.obj
[3397/27578] ACTION //third_party/blink/renderer/core:make_core_generated_html_tokenizer_names(//build/toolchain/win:x64)
[3398/27578] ACTION //third_party/blink/renderer/core:make_core_generated_cssom_types(//build/toolchain/win:x64)
[3399/27578] CC obj/third_party/boringssl/boringssl/cbb.obj
[3400/27578] ACTION //third_party/blink/renderer/core:make_core_generated_css_property_names(//build/toolchain/win:x64)
[3401/27578] ACTION //third_party/blink/renderer/core:make_core_generated_css_value_keywords(//build/toolchain/win:x64)
ninja: build stopped: subcommand failed.
jom: C:\.conan\6b152ea1e\1\qtwebengine\src\core\Makefile.gn_run.Debug [run_ninja] Error 1
jom: C:\.conan\6b152ea1e\1\qtwebengine\src\core\Makefile.gn_run [debug] Error 2
jom: C:\.conan\6b152ea1e\1\qtwebengine\src\core\Makefile [sub-gn_run-pro-make_first] Error 2
jom: C:\.conan\6b152ea1e\1\qtwebengine\src\Makefile [sub-core-make_first] Error 2
jom: C:\.conan\6b152ea1e\1\qtwebengine\Makefile [sub-src-make_first] Error 2
jom: C:\.conan\6b152ea1e\1\Makefile [module-qtwebengine-make_first] Error 2
qt/5.14.1@bincrafters/stable:
qt/5.14.1@bincrafters/stable: ERROR: Package 'e9d91e7338982db881d524efd56e6f4ce00b0246' build failed
qt/5.14.1@bincrafters/stable: WARN: Build folder c:\.conan\6b152ea1e\1
ERROR: qt/5.14.1@bincrafters/stable: Error in build() method, line 662
        self.run(make, run_environment=True)
        ConanException: Error 2 while executing jom
