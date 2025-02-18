// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CUIExpandableButton",
    platforms: [.iOS(.v15), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CUIExpandableButton",
            targets: ["CUIExpandableButton"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing.git",
            from: "1.9.0"
        ),
        .package(
            name: "CUISeparator",
            url: "https://github.com/robhasacamera/CUISeparator.git",
            from: "0.3.1"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CUIExpandableButton",
            dependencies: ["CUISeparator"]
        ),
        .testTarget(
            name: "CUIExpandableButtonTests",
            dependencies: [
                "CUIExpandableButton",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            exclude: ["__Snapshots__/"]
        )
    ]
)
