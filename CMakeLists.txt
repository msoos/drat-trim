cmake_minimum_required(VERSION 2.6 FATAL_ERROR)

if(NOT (CMAKE_MAJOR_VERSION LESS 2))
    if(POLICY CMP0048)
        #policy for VERSION in cmake 3.0
        cmake_policy(SET CMP0048 OLD)
    endif()
endif()

IF(DEFINED CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE} CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
ELSE()
  SET(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build, options are: None(CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel.")
ENDIF()

PROJECT(drat-trim)

find_package(ZLIB)
IF (ZLIB_FOUND)
    add_definitions( -DUSE_ZLIB )
endif()

#default flags
SET(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O3 -Wall -pedantic -g -std=c++0x")
SET(CMAKE_CXX_FLAGS_DEBUG "-Wall -O0 -g")
SET(CMAKE_CXX_FLAGS_RELEASE "-Wall -O3 -g0 -fno-exceptions -DNDEBUG -march=native")

add_executable(drat-trim
    drat-trim2.cpp
)

IF (ZLIB_FOUND)
    target_link_libraries(drat-trim ${ZLIB_LIBRARY})
ENDIF()
