#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "linphone-static" for configuration "Release"
set_property(TARGET linphone-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(linphone-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblinphone.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS linphone-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_linphone-static "${_IMPORT_PREFIX}/lib/liblinphone.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
