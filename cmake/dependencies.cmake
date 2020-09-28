# add dependencies
include(cmake/cpm.cmake)

CPMAddPackage(
        NAME cpp-httplib
        GITHUB_REPOSITORY yhirose/cpp-httplib
        GIT_TAG v0.5.7
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
        NAME uwebsockets
        GITHUB_REPOSITORY uNetworking/uWebSockets
        GIT_TAG v0.14.8
)

CPMAddPackage(
        NAME libuv
        GITHUB_REPOSITORY libuv/libuv
        GIT_TAG v1.23.2
        OPTIONS
            "BUILD_TESTING Off"
)

find_package(OpenSSL)

if (${OPENSSL_FOUND})
    message(STATUS ${OPENSSL_INCLUDE_DIR})
    include_directories(${OPENSSL_INCLUDE_DIR})
endif()

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

