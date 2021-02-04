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
# prepares XCode project with sources from Xiph.org.
# 
# Preconditions: 
# - XCode installed



liboggDownload="https://downloads.xiph.org/releases/ogg/libogg-1.3.4.zip"
here=$(pwd)
logfile="$here/prepare.log"

xcprojPath="Xiph.org"

rm -rf libogg* > $logfile

wget $liboggDownload >> $logfile
unzip `basename $liboggDownload` >> $logfile

liboggDir=`basename $liboggDownload | sed "s/\.zip$//"` 
cd $liboggDir
./configure >> $logfile
 
cd $here
echo "copy sources into ogg-swift.xcodeproj"
cp -v $liboggDir/include/ogg/*.h $xcprojPath/include/ogg
cp -v $liboggDir/src/*.{h,c} $xcprojPath/src

echo "ogg-swift.xcodeproj is prepared, check $logfile"