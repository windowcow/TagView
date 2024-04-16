// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagView",
    platforms: [.iOS(.v16), .macOS(.v13), .macCatalyst(.v13)],
    products: [
        .library(
            name: "TagView",
            targets: ["TagView"]),
    ],
    targets: [
        .target(
            name: "TagView"),
        .testTarget(
            name: "TagViewTests",
            dependencies: ["TagView"]),
    ]
)
