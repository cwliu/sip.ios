#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "bzrtp-static" for configuration "Release"
set_property(TARGET bzrtp-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bzrtp-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libbzrtp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS bzrtp-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_bzrtp-static "${_IMPORT_PREFIX}/lib/libbzrtp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
