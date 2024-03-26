// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataProvider",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "DataProvider",
            targets: ["DataProvider"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataProvider",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency") // 严格并发检查功能
            ]
        ),
        .testTarget(
            name: "DataProviderTests",
            dependencies: ["DataProvider"]),
    ]
)
