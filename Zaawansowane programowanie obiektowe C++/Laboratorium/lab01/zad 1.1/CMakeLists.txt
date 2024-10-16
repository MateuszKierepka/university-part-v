cmake_minimum_required(VERSION 3.29)
project(zad_1_1)

set(CMAKE_CXX_STANDARD 20)

add_executable(zad_1_1 main.cpp
        Person.cpp
        Person.h
        Teacher.cpp
        Teacher.h
        Student.cpp
        Student.h
)
