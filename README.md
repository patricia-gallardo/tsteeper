# tsteeper

Using Qt and Chromium comes with a wide range of licences that all have to be taken into account. Not exactly sure what that means for tSteeper yet.

# Using conan install (Requires Python 3)

In root dir
Windows (Developer Command Prompt)
conan install . -s arch=x86_64 -s build_type=Debug -s compiler="Visual Studio" -s compiler.version=16 -s compiler.runtime=MDd -g=cmake --build=missing