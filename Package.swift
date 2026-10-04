// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "ObjectOrientedProgramming",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "ObjectOrientedProgramming",
            targets: ["ObjectOrientedProgramming"]
        )
    ],
    targets: [
        .target(
            name: "ObjectOrientedProgramming",
            swiftSettings: [
                .swiftLanguageMode(.v6),
                .enableUpcomingFeature("ExistentialAny"),
            ]
        ),
        .testTarget(
            name: "ObjectOrientedProgrammingTests",
            dependencies: ["ObjectOrientedProgramming"],
            swiftSettings: [
                .swiftLanguageMode(.v6),
                .enableUpcomingFeature("ExistentialAny"),
            ]
        ),
    ]
)
