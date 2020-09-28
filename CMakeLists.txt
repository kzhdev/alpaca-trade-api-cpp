cmake_minimum_required(VERSION 3.14)
project(alpaca-trade-api-cpp
        VERSION 1.0.0
        DESCRIPTION "Alpaca Trade API C++ Client"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

#if(APPLE)
#    set(OPENSSL_ROOT_DIR /usr/local/Cellar/openssl@1.1/1.1.1g/)
#endif()

include(cmake/dependencies.cmake)

set(SOURCES
        alpaca/account.cpp
        alpaca/account.h
        alpaca/alpaca.h
        alpaca/asset.cpp
        alpaca/asset.h
        alpaca/bars.cpp
        alpaca/bars.h
        alpaca/calendar.cpp
        alpaca/calendar.h
        alpaca/client.cpp
        alpaca/client.h
        alpaca/clock.cpp
        alpaca/clock.h
        alpaca/config.cpp
        alpaca/config.h
        alpaca/json.h
        alpaca/order.cpp
        alpaca/order.h
        alpaca/portfolio.cpp
        alpaca/portfolio.h
        alpaca/position.cpp
        alpaca/position.h
        alpaca/quote.cpp
        alpaca/quote.h
        alpaca/status.cpp
        alpaca/status.h
        alpaca/streaming.cpp
        alpaca/streaming.h
        alpaca/trade.cpp
        alpaca/trade.h
        alpaca/watchlist.cpp
        alpaca/watchlist.h
        )

add_library(alpaca-trade-api-cpp ${SOURCES})
add_dependencies(alpaca-trade-api-cpp uwebsockets)
target_compile_definitions(alpaca-trade-api-cpp PUBLIC CPPHTTPLIB_OPENSSL_SUPPORT)
if (CMAKE_BUILD_TYPE MATCHES Debug)
    target_compile_definitions(alpaca-trade-api-cpp PUBLIC DEBUG)
endif()
target_include_directories(alpaca-trade-api-cpp PUBLIC "./")
target_link_libraries(alpaca-trade-api-cpp PUBLIC glog uv zlib uwebsockets ssl crypto)


set(TEST_SOURCES
#        alpaca/account_test.cpp
#        alpaca/asset_test.cpp
#        alpaca/bars_test.cpp
#        alpaca/calendar_test.cpp
#        alpaca/client_test.cpp
        alpaca/*_test.cpp
        )

add_test(alpaca_test ${TEST_SOURCES})

#message(STATUS "OpenSSL Version: ${OPENSSL_VERSION} ${OPENSSL_INCLUDE_DIR} ${OPENSSL_LIBRARIES}")

#set(SOURCES
#        src/http_stream.cpp)

#add_library(slick_net ${SOURCES})

#target_include_directories(slick_net PUBLIC
#        include
#        "${PROJECT_BINARY_DIR}/include"
#        "../slick_core/include")

#target_link_libraries(slick_net PUBLIC Boost::boost ssl crypto)

#add_subdirectory(tests)