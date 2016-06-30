#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ortp-static" for configuration "Release"
set_property(TARGET ortp-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ortp-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libortp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ortp-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_ortp-static "${_IMPORT_PREFIX}/lib/libortp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
