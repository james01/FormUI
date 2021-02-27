// swift-tools-version:5.3

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
            path: "Sources"),
        .testTarget(
            name: "FormUITests",
            dependencies: ["FormUI"]),
    ]
)
