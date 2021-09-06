// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.8.0"
let package = Package(
    name: "YbridOgg",
    platforms: [
        .macOS(.v10_10), .iOS(.v9)
    ],
    products: [
        .library(
            name: "YbridOgg",
            targets: ["YbridOgg"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YbridOgg", 
            url: "https://github.com/ybrid/ogg-swift/releases/download/"+version+"/YbridOgg.xcframework.zip",
            checksum: "871547dc18a2c7257dc9711203afa523117c845cc73fc49b0e1fc7d32667f543"
            )
    ]
)
