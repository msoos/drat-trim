cmake_minimum_required(VERSION 3.3 FATAL_ERROR)

if(POLICY CMP0048)
    #policy for VERSION in cmake 3.0
    cmake_policy(SET CMP0048 OLD)
endif()

IF(DEFINED CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
ELSE()
  SET(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
ENDIF()

PROJECT(drat-trim)

find_package(ZLIB)
IF (ZLIB_FOUND)
    MESSAGE(STATUS "OK, Found ZLIB!")
    include_directories(${ZLIB_INCLUDE_DIR})
    link_directories(${ZLIB_LIB_DIR})
    add_definitions( -DUSE_ZLIB )
endif()

#default flags
add_compile_options("$<$<CONFIG:RELWITHDEBINFO>:-O3>")
add_compile_options("$<$<CONFIG:RELWITHDEBINFO>:-mtune=native>")

add_compile_options("$<$<CONFIG:RELEASE>:-O3>")
add_compile_options("$<$<CONFIG:RELEASE>:-g0>")
add_compile_options("$<$<CONFIG:RELEASE>:-DNDEBUG>")
add_compile_options("$<$<CONFIG:RELEASE>:-mtune=native>")

add_compile_options("$<$<CONFIG:DEBUG>:-O0>")

add_compile_options( -std=c++11 -g -pedantic)
add_compile_options( -Wall )

add_executable(drat-trim
    drat-trim.cpp
)

IF (ZLIB_FOUND)
    target_link_libraries(drat-trim ${ZLIB_LIBRARY})
ENDIF()
