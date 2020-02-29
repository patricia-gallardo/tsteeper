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

Linux
~~~~
$ sudo pip3 install conan --upgrade
$ python --version
Python 2.7.17
$ export CONAN_USER_HOME=/Code/
$ conan remote add bincrafters "https://api.bintray.com/conan/bincrafters/public-conan"
$ conan install . -s build_type=Debug -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++11 -g=cmake --build=missing
~~~~
