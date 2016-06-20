rm -r build
xcodebuild -workspace GoodWox.xcworkspace -scheme GoodWox -sdk iphoneos -configuration Debug archive -archivePath $PWD/build/myApp.xcarchive

xcodebuild -exportArchive -archivePath $PWD/build/myApp.xcarchive -exportOptionsPlist exportPlist.plist -exportPath $PWD/build