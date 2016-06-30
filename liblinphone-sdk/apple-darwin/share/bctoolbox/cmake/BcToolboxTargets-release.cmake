#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "bctoolbox-static" for configuration "Release"
set_property(TARGET bctoolbox-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bctoolbox-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "/Volumes/SSD/workspace_mac/linphone-ios/liblinphone-sdk/x86_64-apple-darwin.ios/lib/libbctoolbox.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS bctoolbox-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_bctoolbox-static "/Volumes/SSD/workspace_mac/linphone-ios/liblinphone-sdk/x86_64-apple-darwin.ios/lib/libbctoolbox.a" )

# Import target "bctoolbox-tester-static" for configuration "Release"
set_property(TARGET bctoolbox-tester-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bctoolbox-tester-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "/Volumes/SSD/workspace_mac/linphone-ios/liblinphone-sdk/x86_64-apple-darwin.ios/lib/libbctoolbox-tester.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS bctoolbox-tester-static )
list(APPEND _IMPORT_CHECK_FILES_FOR_bctoolbox-tester-static "/Volumes/SSD/workspace_mac/linphone-ios/liblinphone-sdk/x86_64-apple-darwin.ios/lib/libbctoolbox-tester.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
