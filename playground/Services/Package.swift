// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let baseDependencies: [PackageDescription.Target.Dependency] = [
    .product(name: "Network", package: "Network"),
    .product(name: "Extensions", package: "Extensions")
]

let package = Package(
    name: "Services",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "MemberService", targets: ["MemberService"]),
        .library(name: "AuthService", targets: ["AuthService"]),
        .library(name: "DummyJsonService", targets: ["DummyJsonService"])
    ],
    dependencies: [
        .package(name: "Network", path: "../Network"),
        .package(name: "Extensions", path: "../Extensions")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MemberService",
            dependencies: baseDependencies
        ),
        .target(
            name: "AuthService",
            dependencies: baseDependencies
        ),
        .target(
            name: "DummyJsonService",
            dependencies: baseDependencies
        )
    ]
)
