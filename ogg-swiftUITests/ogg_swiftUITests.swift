//
// ogg_swiftUITests.swift
// ogg-swiftUITests
//
// Copyright (c) 2021 nacamar GmbH - Ybrid®, a Hybrid Dynamic Live Audio Technology
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
import YbridOgg

class ogg_swiftUITests: XCTestCase {

    func testBundleInfo() throws {
        let oggBundleIdentifier = "io.ybrid.ogg-swift"
        
        guard let bundle = Bundle(identifier: oggBundleIdentifier) else {
            XCTFail("no bundle identifier '\(oggBundleIdentifier)' found")
            return
        }
        guard let info = bundle.infoDictionary else {
            XCTFail("no infoDictionary on bundle '\(oggBundleIdentifier)' found")
            return
        }
        print("-- infoDictionary is '\(info)'")
        
        let version = info["CFBundleShortVersionString"] as! String
        XCTAssertNotNil(version)
        let name = info["CFBundleName"] as! String
        XCTAssertEqual("YbridOgg", name)
        let copyright = info["NSHumanReadableCopyright"] as! String
        XCTAssertTrue(copyright.contains("nacamar"))
        
        let build = info["CFBundleVersion"] as! String
        print("-- version of \(name) is \(version) (build \(build))")
    }
    
    func testOggAvailable() {
        var oggSyncState = ogg_sync_state()
        print("-- ogg_sync_state() is '\(oggSyncState)\'")
        XCTAssertNotNil(oggSyncState)
        XCTAssertEqual(0, oggSyncState.returned)
        ogg_sync_init(&oggSyncState)
        ogg_sync_clear(&oggSyncState)
        print("-- ogg_sync_state() is '\(oggSyncState)\'")
        XCTAssertEqual(0, oggSyncState.returned)
    }
    
}
