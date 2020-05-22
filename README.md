# TurtleBrowser

Using Qt and Chromium comes with a wide range of licences that all have to be taken into account. Not exactly sure what that means for TurtleBrowser yet.

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
$ mkdir c:/Code/
$ export CONAN_USER_HOME=c:/Code/
$ cd <path to TurtleBrowser>
$ conan install . -s arch=x86_64 -s build_type=Debug -s compiler="Visual Studio" -s compiler.version=16 -s compiler.runtime=MDd -g=cmake --build=missing
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
$ conan install . -s build_type=Debug -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++11 -g=cmake --build=missing
~~~~

Qt WebView
~~~~
Qt WebView provides a way to display web content in a QML application without necessarily including a full web browser stack by using native APIs where it makes sense.

This is useful on mobile platforms such as Android, iOS, and UWP (Universal Windows Platform); especially on iOS, where policy dictates that all web content is displayed using the operating system's web view.

On Windows, Linux, and macOS, Qt WebView depends on the Qt WebEngine module to render content.
~~~~
[https://doc.qt.io/qt-5/qtwebview-index.html]

Might be needed
~~~~
sudo apt-get install libxcb-xinput0
~~~~

Useful environment vars
~~~~
QT_DEBUG_PLUGINS=1
LD_DEBUG=libs
~~~~

Test conan-qt branch
~~~~
conan export /path/to/conan-qt qt/5.14.2@user/channel
~~~~

Works on Linux: qt/5.14.2@patricia/testing
