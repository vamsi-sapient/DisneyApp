// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppInitializer",
    defaultLocalization: "en",
    platforms: [.iOS("15.0"), .macOS("12.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppInitializer",
            targets: ["AppInitializer"]),
        .library(
            name: "AppInitializerDevelopment",
            targets: ["AppInitializerDevelopment"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../../Dependencies/Core"),
        .package(path: "../../Dependencies/NetworkManager"),
        .package(path: "../../Dependencies/DisneyUIKit"),
        .package(path: "../../Dependencies/SharedDependencies"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppInitializer",
            dependencies: ["Core", "NetworkManager", "DisneyUIKit", "SharedDependencies"],
            resources: [.process("Resources")]
        ),
        .target(
            name: "AppInitializerDevelopment",
            dependencies: ["AppInitializer"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AppInitializerTests",
            dependencies: ["AppInitializer"]),
    ]
)
