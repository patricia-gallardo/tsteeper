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

/Code/tsteeper/cmake-build-debug/src/bin/tsteeper
/Code/tsteeper/cmake-build-debug/src/bin/tsteeper: symbol lookup error: /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5WebEngineCore.so.5: undefined symbol: XMissingExtension

Process finished with exit code 127

this symbol should be in libXext.a, in the libxext/1.3.4@bincrafters/stable package

patricia-gallardo@turtle1:/Code/tsteeper$ ldd /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5WebEngineCore.so.5
	linux-vdso.so.1 (0x00007ffcb4f6b000)
	libQt5Quick.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Quick.so.5 (0x00007f3cb7330000)
	libQt5Gui.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Gui.so.5 (0x00007f3cb6706000)
	libQt5WebChannel.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5WebChannel.so.5 (0x00007f3cb64e0000)
	libQt5Qml.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Qml.so.5 (0x00007f3cb5dbb000)
	libQt5Network.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Network.so.5 (0x00007f3cb563a000)
	libQt5Positioning.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Positioning.so.5 (0x00007f3cb53b2000)
	libQt5Core.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5Core.so.5 (0x00007f3cb47a4000)
	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f3cb4585000)
	libGL.so.1 => /usr/lib/x86_64-linux-gnu/libGL.so.1 (0x00007f3cb42f9000)
	libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f3cb40f5000)
	librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007f3cb3eed000)
	libnss3.so => /usr/lib/x86_64-linux-gnu/libnss3.so (0x00007f3cb3ba9000)
	libnssutil3.so => /usr/lib/x86_64-linux-gnu/libnssutil3.so (0x00007f3cb397a000)
	libnspr4.so => /usr/lib/x86_64-linux-gnu/libnspr4.so (0x00007f3cb373d000)
	libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f3cb350b000)
	libfontconfig.so.1 => /usr/lib/x86_64-linux-gnu/libfontconfig.so.1 (0x00007f3cb32c6000)
	libX11.so.6 => /usr/lib/x86_64-linux-gnu/libX11.so.6 (0x00007f3cb2f8e000)
	libdbus-1.so.3 => /lib/x86_64-linux-gnu/libdbus-1.so.3 (0x00007f3cb2d41000)
	libasound.so.2 => /usr/lib/x86_64-linux-gnu/libasound.so.2 (0x00007f3cb2a3a000)
	libxml2.so.2 => /usr/lib/x86_64-linux-gnu/libxml2.so.2 (0x00007f3cb2679000)
	libxslt.so.1 => /usr/lib/x86_64-linux-gnu/libxslt.so.1 (0x00007f3cb243c000)
	liblcms2.so.2 => /usr/lib/x86_64-linux-gnu/liblcms2.so.2 (0x00007f3cb21e4000)
	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f3cb1e5b000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f3cb1abd000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f3cb18a5000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3cb14b4000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f3ccd32e000)
	libQt5QmlModels.so.5 => /Code/.conan/data/qt/5.14.1/bincrafters/stable/package/05f4fcad7d4cf5cfa05d1a80d832c328bfda97cf/lib/libQt5QmlModels.so.5 (0x00007f3cb1200000)
	libglib-2.0.so.0 => /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0 (0x00007f3cb0ee9000)
	libgssapi_krb5.so.2 => /usr/lib/x86_64-linux-gnu/libgssapi_krb5.so.2 (0x00007f3cb0c9e000)
	libGLX.so.0 => /usr/lib/x86_64-linux-gnu/libGLX.so.0 (0x00007f3cb0a6d000)
	libGLdispatch.so.0 => /usr/lib/x86_64-linux-gnu/libGLdispatch.so.0 (0x00007f3cb07b7000)
	libplc4.so => /usr/lib/x86_64-linux-gnu/libplc4.so (0x00007f3cb05b2000)
	libplds4.so => /usr/lib/x86_64-linux-gnu/libplds4.so (0x00007f3cb03ae000)
	libfreetype.so.6 => /usr/lib/x86_64-linux-gnu/libfreetype.so.6 (0x00007f3cb00fa000)
	libxcb.so.1 => /usr/lib/x86_64-linux-gnu/libxcb.so.1 (0x00007f3cafed2000)
	libsystemd.so.0 => /lib/x86_64-linux-gnu/libsystemd.so.0 (0x00007f3cafc4e000)
	libicuuc.so.60 => /usr/lib/x86_64-linux-gnu/libicuuc.so.60 (0x00007f3caf897000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f3caf67a000)
	liblzma.so.5 => /lib/x86_64-linux-gnu/liblzma.so.5 (0x00007f3caf454000)
	libpcre.so.3 => /lib/x86_64-linux-gnu/libpcre.so.3 (0x00007f3caf1e2000)
	libkrb5.so.3 => /usr/lib/x86_64-linux-gnu/libkrb5.so.3 (0x00007f3caef0c000)
	libk5crypto.so.3 => /usr/lib/x86_64-linux-gnu/libk5crypto.so.3 (0x00007f3caecda000)
	libcom_err.so.2 => /lib/x86_64-linux-gnu/libcom_err.so.2 (0x00007f3caead6000)
	libkrb5support.so.0 => /usr/lib/x86_64-linux-gnu/libkrb5support.so.0 (0x00007f3cae8cb000)
	libpng16.so.16 => /usr/lib/x86_64-linux-gnu/libpng16.so.16 (0x00007f3cae699000)
	libXau.so.6 => /usr/lib/x86_64-linux-gnu/libXau.so.6 (0x00007f3cae495000)
	libXdmcp.so.6 => /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 (0x00007f3cae28f000)
	liblz4.so.1 => /usr/lib/x86_64-linux-gnu/liblz4.so.1 (0x00007f3cae073000)
	libgcrypt.so.20 => /lib/x86_64-linux-gnu/libgcrypt.so.20 (0x00007f3cadd57000)
	libicudata.so.60 => /usr/lib/x86_64-linux-gnu/libicudata.so.60 (0x00007f3cac1ae000)
	libkeyutils.so.1 => /lib/x86_64-linux-gnu/libkeyutils.so.1 (0x00007f3cabfaa000)
	libresolv.so.2 => /lib/x86_64-linux-gnu/libresolv.so.2 (0x00007f3cabd8f000)
	libbsd.so.0 => /lib/x86_64-linux-gnu/libbsd.so.0 (0x00007f3cabb7a000)
	libgpg-error.so.0 => /lib/x86_64-linux-gnu/libgpg-error.so.0 (0x00007f3cab965000)
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
