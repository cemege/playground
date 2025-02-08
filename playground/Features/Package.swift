// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let baseDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Network", package: "Network"),
    .product(name: "Router", package: "Router"),
    .product(name: "Extensions", package: "Extensions"),
    .product(name: "Components", package: "Components")
]

let package = Package(
    name: "Features",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "HomeUI", targets: ["HomeUI"]),
        .library(name: "ProfileUI", targets: ["ProfileUI"]),
        .library(name: "SearchUI", targets: ["SearchUI"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Network", path: "../Network"),
        .package(name: "Router", path: "../Router"),
        .package(name: "Extensions", path: "../Extensions"),
        .package(name: "Components", path: "../Components")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HomeUI",
            dependencies: baseDependencies
        ),
        .testTarget(
            name: "HomeUITests",
            dependencies: ["HomeUI"]
        ),
        .target(
            name: "ProfileUI",
            dependencies: baseDependencies
        ),
        .testTarget(
            name: "ProfileUITests",
            dependencies: ["ProfileUI"]
        ),
        .target(
            name: "SearchUI",
            dependencies: baseDependencies
        ),
        .testTarget(
            name: "SearchUITests",
            dependencies: ["ProfileUI"]
        )
    ]
)
