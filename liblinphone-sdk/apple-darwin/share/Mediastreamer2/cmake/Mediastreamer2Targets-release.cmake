#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mediastreamer_base-static" for configuration "Release"
set_property(TARGET mediastreamer_base-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mediastreamer_base-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmediastreamer_base.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS mediastreamer_base-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_mediastreamer_base-static "${_IMPORT_PREFIX}/lib/libmediastreamer_base.a" )

# Import target "mediastreamer_voip-static" for configuration "Release"
set_property(TARGET mediastreamer_voip-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(mediastreamer_voip-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmediastreamer_voip.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS mediastreamer_voip-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_mediastreamer_voip-static "${_IMPORT_PREFIX}/lib/libmediastreamer_voip.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
