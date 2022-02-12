cmake_minimum_required(VERSION 3.1)
project(SDL_Vulkan)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# add_subdirectory(3rd_party)
include(${CMAKE_CURRENT_SOURCE_DIR}/3rd_party/CMakeLists.txt)

set(headers
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_extern.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_function.h
)

set(src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_extern.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_function.cpp
)

find_package(Vulkan REQUIRED)

include_directories(
    ${SDL2_includes}
    ${VULKAN_INCLUDE_DIR}
    ${rapidjson_includes}
)

if(${VULKAN_FOUND})
    message("-- Vulkan Found")
    message("   *Include " ${VULKAN_INCLUDE_DIR})
    message("   *Libraries " ${VULKAN_LIBRARY})
else()
    message(FATAL_ERROR "-- Vulkan NOT Found")
endif()


add_executable(${PROJECT_NAME} ${src} ${headers})
target_link_libraries(${PROJECT_NAME}  ${SDL2_static_libs} ${VULKAN_LIBRARY})
target_include_directories(${PROJECT_NAME} PUBLIC ${SDL2_includes} ${VULKAN_INCLUDE_DIR})