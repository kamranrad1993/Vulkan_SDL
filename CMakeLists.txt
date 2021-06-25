cmake_minimum_required(VERSION 3.1)
project(SDL_Vulkan)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# file(GLOB_RECURSE src *.h *.cpp)
add_subdirectory(3rd_party/rapidjson-master)

set(headers
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_extern.h
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_function.h
)

set(src
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_extern.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Vulkan_API/vulkan_function.cpp
)

find_package(SDL2 REQUIRED)
find_package(Vulkan REQUIRED)

include_directories(
    ${SDL2_INCLUDE_DIRS}
    ${VULKAN_INCLUDE_DIR}
    3rd_party/rapidjson-master/include
)

if(${VULKAN_FOUND})
    message("-- Vulkan Found")
    message("   *Include " ${VULKAN_INCLUDE_DIR})
    message("   *Libraries " ${VULKAN_LIBRARY})
else()
    message(FATAL_ERROR "-- Vulkan NOT Found")
endif()

if(${SDL2_FOUND})
    message("-- SDL2 Found")
    message("   *Include " ${SDL2_INCLUDE_DIRS})
    message("   *Libraries " ${SDL2_LIBRARY})
else()
    message(FATAL_ERROR "-- SDL2 Not Found")
endif()

add_executable(${PROJECT_NAME} ${src} ${headers})
target_link_libraries(${PROJECT_NAME}  ${SDL2_LIBRARY} ${VULKAN_LIBRARY})
target_include_directories(${PROJECT_NAME} PUBLIC ${SDL2_INCLUDE_DIRS} ${VULKAN_INCLUDE_DIR})