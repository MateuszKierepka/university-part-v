cmake_minimum_required(VERSION 3.29)
project(lab06)

set(CMAKE_CXX_STANDARD 20)

add_executable(lab06 main.cpp
        Person.h
        Print.h)

set(BOOST_ROOT "..\\boost_1_86_0")
find_package(Boost 1.86.0)
if(NOT Boost_FOUND)
    message(FATAL_ERROR "Could not find boost!")
endif()
message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
message(STATUS "Boost_VERSION: ${Boost_VERSION}")
include_directories(${Boost_INCLUDE_DIR})
