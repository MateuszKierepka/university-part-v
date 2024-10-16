cmake_minimum_required(VERSION 3.29)
project(zad_2_2)

set(CMAKE_CXX_STANDARD 20)

add_executable(zad_2_2 main.cpp
        Employee.cpp
        Employee.h
        Developer.cpp
        Developer.h
        TeamLeader.cpp
        TeamLeader.h)
