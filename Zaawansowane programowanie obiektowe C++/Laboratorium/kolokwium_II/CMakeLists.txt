cmake_minimum_required(VERSION 3.30)
project(kolokwium_II)

set(CMAKE_CXX_STANDARD 20)

add_executable(kolokwium_II main.cpp)

#set(BOOST_ROOT "..\\boost_1_87_0")
#find_package(Boost 1.87.0)
#if(NOT Boost_FOUND)
#    message(FATAL_ERROR "Could not find boost!")
#endif()
#message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
#message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
#message(STATUS "Boost_VERSION: ${Boost_VERSION}")
#include_directories(${Boost_INCLUDE_DIR})