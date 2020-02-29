# tsteeper

Using Qt and Chromium comes with a wide range of licences that all have to be taken into account. Not exactly sure what that means for tSteeper yet.

# Using conan install

* Upgrade conan: sudo pip install conan --upgrade

* Put conan dir at the root of the filesystem to reduce file name length:
https://docs.conan.io/en/latest/mastering/custom_cache.html

* Linux: conan install . -s build_type=Debug -s compiler=gcc -s compiler.version=7 -s compiler.libcxx=libstdc++11 -g=cmake --build=missing

* Windows: conan install . -s arch=x86_64 -s build_type=Debug -s compiler="Visual Studio" -s compiler.version=16 -s compiler.runtime=MDd -g=cmake --build=missing

* git config --system core.longpaths true
