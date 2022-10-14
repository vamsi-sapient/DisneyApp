// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DisneyCharacters",
    platforms: [.iOS("14.0"), .macOS("12.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DisneyCharacters",
            targets: ["DisneyCharacters"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../Core"),
        .package(path: "../SharedDependencies")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DisneyCharacters",
            dependencies: ["Core", "SharedDependencies"]),
        .testTarget(
            name: "DisneyCharactersTests",
            dependencies: ["DisneyCharacters"]),
    ]
)
