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
rm -rf libogg* > $logfile

wget $liboggDownload >> $logfile
unzip `basename $liboggDownload` >> $logfile

liboggDir=`basename $liboggDownload | sed "s/\.zip$//"` 
cd $liboggDir
./configure >> $logfile

cd $here

include_dir="include"
source_dir="src"
if [ -d "$include_dir" ]; then rm -Rf $include_dir; fi
mkdir include

if [ -d "$source_dir" ]; then rm -Rf $source_dir; fi
mkdir src


echo "copy sources into ogg-swift.xcodeproj"
# pattern to flatten all ogg includes 
modifyIncludesPattern='s|<ogg\/(.+)>|"\1"|g'
for f in $liboggDir/include/ogg/*.h; do
    file=`basename $f`
    echo "copying $file with flattened ogg includes"
    sed -E $modifyIncludesPattern $f > include/$file

done
for f in $liboggDir/src/*.{h,c}; do
    file=`basename $f`
    echo "copying $file with flattened ogg includes"
    sed -E $modifyIncludesPattern $f > src/$file
    
done
cp $liboggDir/COPYING include
echo "ogg-swift.xcodeproj is ready, check $logfile"