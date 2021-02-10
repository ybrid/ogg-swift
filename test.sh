#!/bin/sh

# MIT License

# Copyright (c) 2021 Ybrid®, a Hybrid Dynamic Live Audio Technology

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#
# Test ogg frameworks on different platforms.
#
# Usage: no parameters, settings mostly defined in xcode xcodeworkspace
# 

scheme=ogg-swiftUITests
target=ogg-swiftUITests
testing="-only-testing $target/oggPlatformTests"

# clean up sould not be necessary
#rm -rfd ./DerivedData

platform=iphonesimulator
device="iPhone 11 Pro"
echo "testing on $platform...."
xcodebuild -scheme $scheme -destination "name=$device" -sdk $platform \
 test $testing

platform=macosx
echo "testing on $platform..."
xcodebuild -scheme $scheme -destination='My Mac' -sdk $platform \
  test $testing

# You may run tests on your own connected device
platform=iphoneos
device="Nacamar's iPad Mini" #"Nacamars iPad Air", "Nacamar's iPad Mini"
echo "testing on $platform..."
xcodebuild -scheme $scheme -destination "name=$device" -sdk $platform \
  test $testing
