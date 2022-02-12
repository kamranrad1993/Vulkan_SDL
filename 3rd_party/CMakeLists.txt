set(3rd_party_libs ${CMAKE_CURRENT_LIST_DIR}/Libs)
set(3rd_party_builds ${CMAKE_CURRENT_LIST_DIR}/Builds)

include(ExternalProject)


set(rapidjson_source ${CMAKE_CURRENT_LIST_DIR}/rapidjson)
set(rapidjson_build ${3rd_party_builds}/rapidjson)
set(rapidjson_install ${3rd_party_libs}/rapidjson)
make_directory(${rapidjson_build})
ExternalProject_Add(
    rapidjson
    GIT_REPOSITORY https://github.com/Tencent/rapidjson.git
    GIT_TAG version1.1.0
    SOURCE_DIR ${rapidjson_source}
    BINARY_DIR ${rapidjson_build}
    INSTALL_DIR ${rapidjson_install}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${rapidjson_install} -DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_THIRDPARTY_GTEST=OFF
)
set(rapidjson_includes ${rapidjson_install}/include)



set(SDL2_source ${CMAKE_CURRENT_LIST_DIR}/SDL2)
set(SDL2_build ${3rd_party_builds}/SDL2)
set(SDL2_install ${3rd_party_libs}/SDL2)
make_directory(${rapidjson_build})
ExternalProject_Add(
    SDL2
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG main
    SOURCE_DIR ${SDL2_source}
    BINARY_DIR <dir> ${SDL2_build}
    INSTALL_DIR ${SDL2_install}
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${SDL2_install}
)
set(SDL2_includes ${SDL2_install}/include)
file(GLOB_RECURSE SDL2_dynamic_libs ${SDL2_install}/*.a)
file(GLOB_RECURSE SDL2_static_libs ${SDL2_install}/*.so)
