// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FormUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FormUI",
            targets: ["FormUI"]),
    ],
    targets: [
        .target(
            name: "FormUI",
            dependencies: []),
        .testTarget(
            name: "FormUITests",
            dependencies: ["FormUI"]),
    ]
)
