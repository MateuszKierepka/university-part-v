cmake_minimum_required(VERSION 3.29)
project(kolokwium_I)

set(CMAKE_CXX_STANDARD 20)

add_executable(kolokwium_I main.cpp)

# Ustaw ścieżkę do Boost
set(BOOST_ROOT "C:/boost_1_86_0")
set(BOOST_INCLUDEDIR "${BOOST_ROOT}/include")
set(BOOST_LIBRARYDIR "${BOOST_ROOT}/lib")

# Znajdź Boost
find_package(Boost 1.86.0 REQUIRED)

# Jeśli Boost nie został znaleziony, zakończ z błędem
if(NOT Boost_FOUND)
    message(FATAL_ERROR "Could not find Boost!")
endif()

# Wyświetl szczegóły dotyczące znalezionego Boost
message(STATUS "Boost_INCLUDE_DIRS: ${Boost_INCLUDE_DIRS}")
message(STATUS "Boost_LIBRARIES: ${Boost_LIBRARIES}")
message(STATUS "Boost_VERSION: ${Boost_VERSION}")

# Dodaj ścieżki do katalogów nagłówkowych
include_directories(${Boost_INCLUDE_DIRS})
