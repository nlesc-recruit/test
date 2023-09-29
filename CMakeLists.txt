cmake_minimum_required(VERSION 3.17 FATAL_ERROR)

project(
  vector_add_example
  DESCRIPTION "Example using C++ Wrappers for the CUDA Driver API"
  VERSION 0.0.1
  HOMEPAGE_URL https://github.com/nlesc-recruit/usage-example-git-submodules
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_BUILD_TYPE Release)

# Use CMAKE_INSTALL_PREFIX when searching for libraries
include(GNUInstallDirs)
list(APPEND CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})

set(CUDA_MIN_VERSION 10.0)
find_package(CUDAToolkit ${CUDA_MIN_VERSION} REQUIRED)

add_subdirectory(external/cudawrappers)

add_executable(vector_add_example vector_add.cpp)

target_link_libraries(vector_add_example PRIVATE cudawrappers::cu
                                                 cudawrappers::nvrtc)

install(TARGETS vector_add_example)
