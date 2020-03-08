cmake_minimum_required(VERSION 3.16)
project(C4702_bug)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_INSTALL_PREFIX bin)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

#set(MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

include(cmake/projecthelper.cmake)
SETUP_COMPILER_SETTINGS()

cmake_policy(SET CMP0074 NEW)

set(ADDITIONAL_LIBS crypt32.lib ws2_32.lib Iphlpapi.lib)

add_subdirectory(src/lib)

find_package(OpenSSL)
set(OpenSSL_LIBRARIES ${LIB_EAY_RELEASE} ${SSL_EAY_RELEASE})

set(Boost_USE_STATIC_LIBS   ON)
set(Boost_USE_MULTITHREADED ON)
find_package(Boost COMPONENTS system thread random)

add_subdirectory(src/user)
