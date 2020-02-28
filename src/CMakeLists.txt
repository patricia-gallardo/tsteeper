cmake_minimum_required(VERSION 3.10)
project(tsteeper)
set(PROJECT "tsteeper")

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

include(${CMAKE_SOURCE_DIR}/conan.cmake)
conan_cmake_run(CONANFILE ../conanfile.py BASIC_SETUP CMAKE_TARGETS BUILD missing)
if (NOT DEFINED ENV{CMAKE_PREFIX_PATH})
    file(COPY ${CMAKE_BINARY_DIR}/qt.conf DESTINATION ${CMAKE_BINARY_DIR}/bin/)
endif()

find_package(Qt5 COMPONENTS WebEngine Widgets Qml Quick REQUIRED)
find_package(Qt5Test REQUIRED)

include_directories(${Qt5Widgets_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS})

add_definitions(${Qt5Widgets_DEFINITIONS} ${QtQml_DEFINITIONS} ${${Qt5Quick_DEFINITIONS}})

qt5_add_resources(QT_RESOURCES resources/resources.qrc)

if(NOT DEFINED HEADERS)
    file(GLOB HEADERS *.h)
endif()

if(NOT DEFINED SOURCES)
    file(GLOB SOURCES *.cpp)
endif()

source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})
add_executable(${PROJECT} ${HEADERS} ${SOURCES} ${QT_RESOURCES})

target_link_libraries(${PROJECT}
        Qt5::WebEngine
        Qt5::Widgets
        Qt5::Qml
        Qt5::Quick)
