// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "ObjectOrientedProgramming",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .visionOS(.v2),
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
