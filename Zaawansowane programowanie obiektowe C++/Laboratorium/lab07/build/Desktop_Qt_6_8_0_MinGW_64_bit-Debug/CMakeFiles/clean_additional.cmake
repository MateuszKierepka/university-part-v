# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\lab07_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\lab07_autogen.dir\\ParseCache.txt"
  "lab07_autogen"
  )
endif()
