// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DisneyCharacters",
    defaultLocalization: "en",
    platforms: [.iOS("15.0"), .macOS("12.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DisneyCharacters",
            targets: ["DisneyCharacters"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../../Dependencies/Core"),
        .package(path: "../../Dependencies/NetworkManager"),
        .package(path: "../../Dependencies/DisneyUIKit"),
        .package(path: "../../Dependencies/SharedDependencies"),
        .package(path: "../../Features/AppInitializer"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.10.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DisneyCharacters",
            dependencies: ["Core", "SharedDependencies", "DisneyUIKit", "NetworkManager", "AppInitializer"],
            resources: [.process("Resources")],
            swiftSettings: [.unsafeFlags(["-enable-testing"])]
        ),
        .testTarget(
            name: "DisneyCharactersTests",
            dependencies: ["DisneyCharacters", .product(name: "SnapshotTesting", package: "swift-snapshot-testing")],
            resources: [.process("MockJSON"), .process("MockAssets")]
        ),
    ]
)
