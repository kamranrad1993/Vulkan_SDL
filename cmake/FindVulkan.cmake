# FindVulkan
# ----------
#
# Try to find Vulkan.
#
# Once done this will define:
#
#   VULKAN_FOUND - Vulkan found
#   VULKAN_INCLUDE_DIRS - Vulkan include directories
#   VULKAN_LIBRARIES - Vulkan libraries

find_path(VULKAN_INCLUDE_DIR
  NAMES
    vulkan/vulkan.h
  PATHS
    /usr/include
    /usr/local/include
    $ENV{VULKAN_SDK}/Include
)

find_library(VULKAN_LIBRARY
  NAMES
    vulkan-1
    vulkan
  PATHS
    $ENV{VULKAN_SDK}/Bin
)

set(VULKAN_LIBRARIES ${VULKAN_LIBRARY})
set(VULKAN_INCLUDE_DIRS ${VULKAN_INCLUDE_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
  Vulkan
  FOUND_VAR VULKAN_FOUND
  REQUIRED_VARS VULKAN_INCLUDE_DIR VULKAN_LIBRARY
)

mark_as_advanced(
  VULKAN_INCLUDE_DIR
  VULKAN_LIBRARY
)
