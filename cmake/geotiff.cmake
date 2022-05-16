#
# GeoTIFF support
#

find_package(GeoTIFF CONFIG REQUIRED 1.3.0)
set_package_properties(GeoTIFF PROPERTIES TYPE REQUIRED)
if (GEOTIFF_FOUND)
    find_package(PROJ4 CONFIG REQUIRED)
    set(GEOTIFF_INCLUDE_DIR ${GeoTIFF_INCLUDE_DIRS} CACHE PATH "")
    set(GEOTIFF_LIBRARY "${GeoTIFF_LIBRARIES};PROJ4::proj" CACHE PATH "")
    include_directories("${GEOTIFF_INCLUDE_DIR}")
    set(PDAL_HAVE_LIBGEOTIFF 1)
    mark_as_advanced(CLEAR TIFF_INCLUDE_DIR)
    mark_as_advanced(CLEAR TIFF_LIBRARY)
    if (WIN32)
        set(TIFF_NAMES libtiff_i)
    endif(WIN32)
else()
    message(FATAL_ERROR "GeoTIFF support is required")
endif()
