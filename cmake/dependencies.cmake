# add dependencies
include(cmake/cpm.cmake)

CPMAddPackage(
        NAME cpp-httplib
        GITHUB_REPOSITORY yhirose/cpp-httplib
        GIT_TAG v0.5.7
)

CPMAddPackage(
        NAME boringssl
        GITHUB_REPOSITORY google/boringssl
        GIT_TAG master
)

CPMAddPackage(
        NAME rapidjson
        GITHUB_REPOSITORY Tencent/rapidjson
        GIT_TAG v1.1.0
        OPTIONS
            "RAPIDJSON_BUILD_DOC Off"
            "RAPIDJSON_BUILD_EXAMPLES Off"
            "RAPIDJSON_BUILD_TESTS Off"
)

CPMAddPackage(
        NAME zlib
        GITHUB_REPOSITORY madler/zlib
        GIT_TAG v1.2.11
)

CPMAddPackage(
        NAME uwebsockets
        GITHUB_REPOSITORY uNetworking/uWebSockets
        GIT_TAG v0.14.8
)

if (${uwebsockets_ADDED})
    set(uWS_SOURCES
            ${uwebsockets_SOURCE_DIR}/src/Asio.h
            ${uwebsockets_SOURCE_DIR}/src/Backend.h
            ${uwebsockets_SOURCE_DIR}/src/Epoll.cpp
            ${uwebsockets_SOURCE_DIR}/src/Epoll.h
            ${uwebsockets_SOURCE_DIR}/src/Extensions.cpp
            ${uwebsockets_SOURCE_DIR}/src/Extensions.h
            ${uwebsockets_SOURCE_DIR}/src/Group.cpp
            ${uwebsockets_SOURCE_DIR}/src/Group.h
            ${uwebsockets_SOURCE_DIR}/src/HttpSocket.cpp
            ${uwebsockets_SOURCE_DIR}/src/HttpSocket.h
            ${uwebsockets_SOURCE_DIR}/src/Hub.cpp
            ${uwebsockets_SOURCE_DIR}/src/Hub.h
            ${uwebsockets_SOURCE_DIR}/src/Libuv.h
            ${uwebsockets_SOURCE_DIR}/src/Networking.cpp
            ${uwebsockets_SOURCE_DIR}/src/Networking.h
            ${uwebsockets_SOURCE_DIR}/src/Node.cpp
            ${uwebsockets_SOURCE_DIR}/src/Node.h
            ${uwebsockets_SOURCE_DIR}/src/Socket.cpp
            ${uwebsockets_SOURCE_DIR}/src/Socket.h
            ${uwebsockets_SOURCE_DIR}/src/uWS.h
            ${uwebsockets_SOURCE_DIR}/src/WebSocket.cpp
            ${uwebsockets_SOURCE_DIR}/src/WebSocket.h
            ${uwebsockets_SOURCE_DIR}/src/WebSocketProtocol.h
            )
    add_library(uwebsockets ${uWS_SOURCES})
#    add_dependencies(uwebsockets libuv)
endif()

CPMAddPackage(
        NAME libuv
        GITHUB_REPOSITORY libuv/libuv
        GIT_TAG v1.23.2
        OPTIONS
            "BUILD_TESTING Off"
)

#find_package(OpenSSL)
#
#if (${OPENSSL_FOUND})
#    message(STATUS ${OPENSSL_INCLUDE_DIR})
#    include_directories(${OPENSSL_INCLUDE_DIR})
#endif()

CPMAddPackage(
        NAME glog
        GITHUB_REPOSITORY google/glog
        GIT_TAG v0.4.0
        OPTIONS
            "BUILD_TESTING Off"
)

include_directories(${rapidjson_SOURCE_DIR}/include)
include_directories(${uwebsockets_SOURCE_DIR}/src)
include_directories(${cpp-httplib_SOURCE_DIR})
include_directories(${glog_SOURCE_DIR}/src)
include_directories(${glog_BINARY_DIR})
include_directories(${libuv_SOURCE_DIR}/include)
include_directories(${boringssl_SOURCE_DIR}/include)

