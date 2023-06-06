// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClockFace",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "ClockFace",
            targets: ["ClockFace"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ClockFace",
            dependencies: []),
        .testTarget(
            name: "ClockFaceTests",
            dependencies: ["ClockFace"]),
    ]
)
