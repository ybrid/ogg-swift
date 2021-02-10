# ogg-swift
A Swift wrapper to use [libogg api](https://www.xiph.org/ogg/doc/libogg/index.html). 

Intension of this project is to support [audio player SDK](https://github.com/ybrid/player-sdk-swift) with a platform independend XCFramework that can be integrated in Swift projects via CocoaPod.

After integration just ```import YbridOgg``` in your Swift code. 

It supports iOS devices and simulators (version 9 to 14) and macOS (versions 10.10 to 11.1).

# Versions
The supported version of libogg API is 1.3.4.

# How to release a new version
A new version of the xcframework can be created and released in the following way.

## requirements
XCode, CocoaPods and Git are installed on your system. The terminal knowns sed.

The private pods repository is on your cocoa installation. Check this with ```pod repo```, if not execute
```pod repo add Private-Cocoapods git@github.com:ybrid/Private-Cocoapods.git``` 

Git clone/pull this project onto your system.

Choose a new version number, let's say ```0.7.0```

## Prepare xcode project
The original C and header files to be compiled will be placed into ogg-swift.xcodeproj
1. by executing  ```./prepare.sh``` in a terminal in the root of the project. 
2. Open the ogg-swift.xcodeproject with XCode. In the properties editor, on target ```ogg-swift``` select ```General``` and change ```Version``` to the new number. Close the project.           

## Part 1: generate an XCFramework
1. In a terminal execute  ```./build.sh```
in the root of the project. It updates YbridOgg.xcframework.

## Part 2. release a new Version
1. In the root directory execute ```./pod_check.sh```. Repair errors if neccassary.
2. Alter the version number in YbridOgg.podspec's source line
3. Commit and push everything
4. On github create a new release with the version number and upload the binary
   - YbridOgg.xcframework.zip and
   - LICENSE
5. execute ```./pod_push.sh``` and stay ready to input your password several times

The new version should be visible in [Private-Cocoapods](https://github.com/ybrid/Private-Cocoapods) after 24 hours.

# Licenses
This project is under MIT license. It makes use of the sources for ogg from [xiph.org](https://xiph.org/downloads/). ogg is licensed under the [New BSD License](https://wiki.xiph.org/XiphWiki:Copyrights).

See the [LICENSE](https://github.com/ybrid/ogg-swift/blob/master/LICENSE) file.